import mysql.connector
import time
import admin

def manage_users():
    # Connect to the database
    print("\nWelcome to the User Management interface. You must log in as admin to get access to the portal. What would you like to do?")
    username = input("Please enter your MySQL username: ")
    password = input("Please enter your MySQL password: ")
    conn = mysql.connector.connect(
        host="localhost",
        user=username,
        passwd=password,
        database="MUSEUM"
    )
    cursor = conn.cursor(buffered=True)
    
    while True:
        print("\nWhat would you like to do?")
        print("1. Add user")
        print("2. Edit user")
        print("3. Block user")
        print("4. Make changes to database")
        print("5. Exit")
        choice = input("Enter your choice: ")
        if choice == "1":
            # Get user details
            user_name = input("Enter username: ")
            user_email = input("Enter email: ")
            user_password = input("Enter password: ")
            # Insert new user into the database
            cursor.execute("INSERT INTO users (username, email, password) VALUES (%s, %s, %s)", (user_name, user_email, user_password))
            conn.commit()
            print("User successfully added!")
        elif choice == "2":
            # Get user details
            user_id = input("Enter user id: ")
            user_name = input("Enter username: ")
            user_email = input("Enter email: ")
            user_password = input("Enter password: ")
            # Update user details in the database
            cursor.execute("UPDATE users SET username = %s, email = %s, password = %s WHERE id = %s", (user_name, user_email, user_password, user_id))
            conn.commit()
            print("User successfully updated!")
        elif choice == "3":
            # Get user id
            user_id = input("Enter user id: ")
            # Block user
            cursor.execute("UPDATE users SET is_blocked = 1 WHERE id = %s", (user_id))
            conn.commit()
            print("User successfully blocked!")
        elif choice == "4":
            # Get SQL command
            command = input("Enter your SQL command: ")
            # Execute the command
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
        elif choice == "5":
            print("Exiting...")
            time.sleep(1)
            break
        else:
            print("Invalid choice. Please try again.")
    # Close the connection
    cursor.close()
    conn.close()
