import mysql.connector
import tkinter as tk
import time
import data
    

# Browsing interface
def registered_interface():
    conn = mysql.connector.connect(
            host="localhost",
            user="username",
            passwd="password",
            database="MUSEUM"
        )
    cursor = conn.cursor(buffered=True)

    username = input("Please enter your username: ")
    password = input("Please enter your password: ")

    sql = "SELECT * FROM users WHERE username = %s AND password = %s"
    val = (username, password)

    cursor.execute(sql, val)
    results = cursor.fetchall()

    if len(results) != 0:
        print("Login successful!")
        data_lookup()
    else:
        print("Login failed. Please try again.")

def data_lookup():
    conn = mysql.connector.connect(
            host="localhost",
            user="username",
            passwd="password",
            database="MUSEUM"
        )
    cursor = conn.cursor(buffered=True)
    print("\nWelcome to the browsing interface. What would you like to browse?")
    print("1. Art pieces")
    print("2. Exhibitions")
    print("3. Artists")
    print("4. Paintings")
    print("5. Other")
    print("6. Sculpture Type")
    print("7. Statue")
    print("8. Permanent Collection")
    print("9. Borrowed")
    print("10. Exhibited At")
    print("11. Exit")
    choice = input("Enter your choice: ")

    if choice == "1":
        #create window
        window = tk.Tk()

        #set window title
        window.title("Museum ART OBJECTS")

        #create lebels
        label_id_no = tk.Label(text="ID No")
        label_title = tk.Label(text="Title")
        label_year = tk.Label(text="Year")
        label_origin = tk.Label(text="Origin")
        label_epoch = tk.Label(text="Epoch")
        label_description = tk.Label(text="Description")

        # Create a listbox
        listbox_id_no = tk.Listbox()
        listbox_title = tk.Listbox()
        listbox_year = tk.Listbox()
        listbox_origin = tk.Listbox()
        listbox_epoch = tk.Listbox()
        listbox_description = tk.Listbox()

        # configure window
        label_id_no.grid(row=0, column=0)
        label_title.grid(row=0, column=1)
        label_year.grid(row=0, column=2)
        label_origin.grid(row=0, column=3)
        label_epoch.grid(row=0, column=4)
        label_description.grid(row=0, column=5)

        listbox_id_no.grid(row=1, column=0)
        listbox_title.grid(row=1, column=1)
        listbox_year.grid(row=1, column=2)
        listbox_origin.grid(row=1, column=3)
        listbox_epoch.grid(row=1, column=4)
        listbox_description.grid(row=1, column=5)

        # Execute query
        query = "SELECT * FROM ART_OBJECT"
        cursor.execute(query)

        # Check result
        result = cursor.fetchall()
        if result:
            print("Result:")
            for row in result:
                listbox_id_no.insert(tk.END, row[0])
                listbox_title.insert(tk.END, row[1])
                listbox_year.insert(tk.END, row[2])
                listbox_origin.insert(tk.END, row[3])
                listbox_epoch.insert(tk.END, row[4])
                listbox_description.insert(tk.END, row[5])
                print(row)
        else:
            print("No result found.")
        # Close the connection
        cursor.close()
        conn.close()

    elif choice == "2":
        # Execute query
        query = "SELECT * FROM EXHIBITION"
        cursor.execute(query)
        # Check result
        result = cursor.fetchall()
        if result:
            print("Result:")
            for row in result:
                print(row)
        else:
            print("No result found.")
        result = cursor.fetchall()
        # Close the connection
        cursor.close()
        conn.close()

    elif choice == "3":
        cursor = conn.cursor()
        # Execute query
        query = "SELECT * FROM ARTIST"
        cursor.execute(query)
        # Check result
        result = cursor.fetchall()
        if result:
            print("Result:")
            for row in result:
                print(row)
        else:
            print("No result found.")
        result = cursor.fetchall()
        # Close the connection
        cursor.close()
        conn.close()

    elif choice == "4":
        cursor = conn.cursor()
        # Execute query
        query = "SELECT * FROM PAINTING"
        cursor.execute(query)
        # Check result
        result = cursor.fetchall()
        if result:
            print("Result:")
            for row in result:
                print(row)
        else:
            print("No result found.")
        result = cursor.fetchall()
        # Close the connection
        cursor.close()
        conn.close()

    elif choice == "5":
        cursor = conn.cursor()
        # Execute query
        query = "SELECT * FROM OTHER"
        cursor.execute(query)
        # Check result
        result = cursor.fetchall()
        if result:
            print("Result:")
            for row in result:
                print(row)
        else:
            print("No result found.")
        result = cursor.fetchall()
        # Close the connection
        cursor.close()
        conn.close()

    elif choice == "6":
        cursor = conn.cursor()
        # Execute query
        query = "SELECT * FROM SCULPTURE_TYPE"
        cursor.execute(query)
        # Check result
        result = cursor.fetchall()
        if result:
            print("Result:")
            for row in result:
                print(row)
        else:
            print("No result found.")
        result = cursor.fetchall()
        # Close the connection
        cursor.close()
        conn.close()

    elif choice == "7":
        cursor = conn.cursor()
        # Execute query
        query = "SELECT * FROM STATUE"
        cursor.execute(query)
        # Check result
        result = cursor.fetchall()
        if result:
            print("Result:")
            for row in result:
                print(row)
        else:
            print("No result found.")
        result = cursor.fetchall()
        # Close the connection
        cursor.close()
        conn.close()

    elif choice == "8":
        cursor = conn.cursor()
        # Execute query
        query = "SELECT * FROM PERMANENT_COLLECTION"
        cursor.execute(query)
        # Check result
        result = cursor.fetchall()
        if result:
            print("Result:")
            for row in result:
                print(row)
        else:
            print("No result found.")
        result = cursor.fetchall()
        # Close the connection
        cursor.close()
        conn.close()

    elif choice == "9":
        cursor = conn.cursor()
        # Execute query
        query = "SELECT * FROM BORROWED"
        cursor.execute(query)
        # Check result
        result = cursor.fetchall()
        if result:
            print("Result:")
            for row in result:
                print(row)
        else:
            print("No result found.")
        result = cursor.fetchall()
        # Close the connection
        cursor.close()
        conn.close()

    elif choice == "10":
        cursor = conn.cursor()
        # Execute query
        query = "SELECT * FROM EXHIBITED_AT"
        cursor.execute(query)
        # Check result
        result = cursor.fetchall()
        if result:
            print("Result:")
            for row in result:
                print(row)
        else:
            print("No result found.")
        result = cursor.fetchall()
        # Close the connection
        cursor.close()
        conn.close()


    elif choice == "11":
        exit
    else:
        print("Invalid choice. Please try again.")

