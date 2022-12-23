import mysql.connector
import time
import admin

def signup():
    # Connect to the database
    print("\nWelcome to the User Management interface. Fill up the information below to sign up.")
    conn = mysql.connector.connect(
        host="localhost",
        user="username",
        passwd="password",
        database="MUSEUM"
    )
    cursor = conn.cursor(buffered=True)

    user_name = input("Enter username: ")
    user_email = input("Enter email: ")
    user_password = input("Enter password: ")
    # Insert new user into the database
    cursor.execute("INSERT INTO users (username, email, password) VALUES (%s, %s, %s)", (user_name, user_email, user_password))
    conn.commit()
    print("Registration Successful!")