-- ENSF 300 L02 – 52
-- Group name: My coding can’t be this kawaii
-- Group members: MD Sakil Al Mahmud, MD Touhidul Tonmoy, Saim Shahzad

-- 1) Show all tables and explain how they are related to one another (keys, triggers, etc.)

SELECT * FROM information_schema.tables WHERE table_schema = 'MUSEUM';

-- 2) A basic retrieval query
SELECT * FROM ART_OBJECT;

-- 3) A retrieval query with ordered results
SELECT * FROM ART_OBJECT ORDER BY Year DESC;

-- 4) A nested retrieval query
SELECT Title, Year
FROM art_object
WHERE origin IN (SELECT country_of_origin FROM artist WHERE Epoch = 'Renaissance');

-- 5) A retrieval query using joined tables
SELECT ART_OBJECT.Id_no, ARTIST.Fname, ARTIST.Lname, ART_OBJECT.Title
FROM ART_OBJECT 
INNER JOIN CREATES 
ON ART_OBJECT.Id_no = CREATES.Id_no 
INNER JOIN ARTIST 
ON CREATES.Fname = ARTIST.Fname 
AND CREATES.Minit = ARTIST.Minit 
AND CREATES.Lname = ARTIST.Lname;

-- 6) An update operation with any necessary triggers
DROP TRIGGER IF EXISTS UpdateEpoch;

DELIMITER //
CREATE TRIGGER UpdateEpoch
BEFORE UPDATE ON ARTIST
FOR EACH ROW
BEGIN
    DECLARE epoch VARCHAR(30);
    
    SELECT Epoch FROM EPOCHS
    WHERE Country = NEW.Country_of_origin
    INTO epoch;
    
    SET NEW.Epoch = epoch;
END //
DELIMITER ;

UPDATE MUSEUM.ARTIST
SET Country_of_origin = 'United States'
WHERE Fname = 'John'
AND Minit = 'T'
AND Lname = 'Smith';

-- 7) A deletion operation with any necessary triggers
DROP TRIGGER IF EXISTS DeleteArtObjects;

DELIMITER //
CREATE TRIGGER DeleteArtObjects
BEFORE DELETE ON ARTIST
FOR EACH ROW
BEGIN
    DELETE FROM ART_OBJECT
    WHERE Id_no IN (SELECT Id_no FROM CREATES
                    WHERE Fname = OLD.Fname
                    AND Minit = OLD.Minit
                    AND Lname = OLD.Lname);
END //
DELIMITER ;

DELETE FROM MUSEUM.ARTIST
WHERE Fname = 'Vincent'
AND Minit = 'V'
AND Lname = 'van Gogh';