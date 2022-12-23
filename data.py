import mysql.connector
import time
import admin

# Data entry interface
def data_entry_interface():
    while True:
        print("\nWelcome to the data entry interface. What would you like to do?")
        print("1. Lookup information")
        print("2. Insert new tuples")
        print("3. Update and delete tuples")
        print("4. Exit")
        choice = input("Enter your choice: ")
        if choice == "1":
            username = input("Please enter your MySQL username: ")
            password = input("Please enter your MySQL password: ")
            # Connect to the database
            conn = mysql.connector.connect(
                host="localhost",
                user=username,
                passwd=password,
                database="MUSEUM"
            )
            cursor = conn.cursor()
            # Get search field values
            field_name = input("Enter the name of the field you want to search: ")
            field_value = input("Enter the value of the field you want to search: ")
            # Execute query
            query = "SELECT * FROM ART_OBJECT WHERE " + field_name + " = '" + field_value + "'"
            cursor.execute(query)
            # Check result
            result = cursor.fetchall()
            if result:
                print("Result:")
                for row in result:
                    print(row)
            else:
                print("No result found.")
            # Close the connection
            cursor.close()
            conn.close()
        elif choice == "2":
            username = input("Please enter your MySQL username: ")
            password = input("Please enter your MySQL password: ")
            # Connect to the database
            conn = mysql.connector.connect(
                host="localhost",
                user=username,
                passwd=password,
                database="MUSEUM"
            )
            cursor = conn.cursor()
            # Get table name
            table_name = input("Enter the name of the table you want to insert into: ")
            # Get data
            file_or_prompt = input("Do you want to enter data from a file (F) or through detailed prompts (P)? ")
            if file_or_prompt.lower() == "f":
                # Get file path
                file_path = input("Enter the path and file name of the file with information line separated: ")
                # Open and execute the file
                f = open(file_path, 'r')
                data = f.read().split("\n")
                for line in data:
                    query = "INSERT INTO " + table_name + " VALUES (" + line + ")"
                    cursor.execute(query)
                    conn.commit()
            elif file_or_prompt.lower() == "p":
                # Get data
                data = []
                num_fields = int(input("Enter the number of fields: "))
                for i in range(num_fields):
                    field_name = input("Enter the name of field {}: ".format(i + 1))
                    field_value = input("Enter the value of field {}: ".format(i + 1))
                    data.append(field_value)
                # Execute query
                query = "INSERT INTO " + table_name + " VALUES ("
                for value in data[:-1]:
                    query += "'" + value + "', "
                query += "'" + data[-1] + "')"
                cursor.execute(query)
                conn.commit()
            else:
                print("Invalid choice. Please try again.")
            # Check result
            result = cursor.fetchall()
            if result:
                print("Result:")
                for row in result:
                    print(row)
            else:
                print("Tuple inserted successfully.")
            # Close the connection
            cursor.close()
            conn.close()
        elif choice == "3":
            username = input("Please enter your MySQL username: ")
            password = input("Please enter your MySQL password: ")
            # Connect to the database
            conn = mysql.connector.connect(
                host="localhost",
                user=username,
                passwd=password,
                database="MUSEUM"
            )
            cursor = conn.cursor()
            # Get table name
            table_name = input("Enter the name of the table you want to update or delete from: ")
            # Get action
            action = input("Do you want to update (U) or delete (D)? ")
            if action.lower() == "u":
                # Get search field values
                field_name = input("Enter the name of the field you want to search: ")
                field_value = input("Enter the value of the field you want to search: ")
                # Get data
                data = []
                num_fields = int(input("Enter the number of fields to update: "))
                for i in range(num_fields):
                    field_name = input("Enter the name of field {}: ".format(i + 1))
                    field_value = input("Enter the new value of field {}: ".format(i + 1))
                    data.append(field_name + " = '" + field_value + "'")
                # Execute query
                query = "UPDATE " + table_name + " SET "
                for value in data[:-1]:
                    query += value + ", "
                query += data[-1] + " WHERE " + field_name + " = '" + field_value + "'"
                cursor.execute(query)
                conn.commit()
            elif action.lower() == "d":
                # Get search field values
                field_name = input("Enter the name of the field you want to search: ")
                field_value = input("Enter the value of the field you want to search: ")
                # Execute query
                query = "DELETE FROM " + table_name + " WHERE " + field_name + " = '" + field_value + "'"
                cursor.execute(query)
                conn.commit()
            else:
                print("Invalid choice. Please try again.")
            # Check result
            result = cursor.fetchall()
            if result:
                print("Result:")
                for row in result:
                    print(row)
            else:
                print("Tuple updated or deleted successfully.")
            # Close the connection
            cursor.close()
            conn.close()
        elif choice == "4":
            break
        else:
            print("Invalid choice. Please try again.")

