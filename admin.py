import mysql.connector
import time
import data


# Admin interface
def admin_interface():
    
    while True:
        print("\nWelcome to the admin interface. What would you like to do?")
        print("1. Type SQL commands")
        print("2. Provide path and file name of SQL script file")
        print("3. Exit")
        choice = input("Enter your choice: ")
        if choice == "1":
            # Connect to the database
            username = input("Please enter your MySQL username: ")
            password = input("Please enter your MySQL password: ")
            conn = mysql.connector.connect(
                host="localhost",
                user=username,
                passwd=password,
                database="museum"
            )
            cursor = conn.cursor(buffered=True)
            # Type and execute SQL commands
            command = input("Enter your SQL command: ")
            cursor.execute(command)
            conn.commit()
            # Check result
            result = cursor.fetchall()
            if result:
                print("Result:")
                for row in result:
                    print(row)
            else:
                print("Command executed successfully.")
            # Close the connection
            cursor.close()
            conn.close()
        elif choice == "2":
            # Connect to the database
            username = input("Please enter your MySQL username: ")
            password = input("Please enter your MySQL password: ")
            conn = mysql.connector.connect(
                host="localhost",
                user=username,
                passwd=password,
                database="MUSEUM"
            )
            cursor = conn.cursor()
            # Get file path
            file_path = input("Enter the path and file name of the SQL script file: ")
            # Open and execute the file
            f = open(file_path, 'r')
            sql_file = f.read()
            cursor.execute(sql_file)
            conn.commit()
            # Check result
            result = cursor.fetchall()
            if result:
                print("Result:")
                for row in result:
                    print(row)
            else:
                print("Script executed successfully.")
            # Close the connection
            cursor.close()
            conn.close()
        elif choice == "3":
            print("Exiting...")
            time.sleep(1)
            break
        else:
            print("Invalid choice. Please try again.")

