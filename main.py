# Importing modules
import user
import admin
import data
import manageuser
import registered
import signup

# Main program
def main():
    while True:
        # Ask the user to choose what they want to do
        print("Welcome to Museam Exhibition Guide. What do you want to do?\n")
        print("--- ADMIN MENU ---")
        print("1. Login as Admin")
        print("2. User Management Portal\n")
        print("--- VISITOR MENU ---")
        print("3. Login as Guest (no authentication required!)")
        print("4. Sign Up as User")
        print("5. Login as User\n")
        print("--- DATA ENTRY MENU ---")
        print("6. Insert/Modify Data as a Data-Entry User\n")
        print("--- EXIT THE PROGRAM ---")
        print("7. Quit")
        choice = input("Please enter your choice (1-7): ")
       
        # Execute the corresponding functions based on user's choice
        if choice == '1':
            admin.admin_interface()
        elif choice == '2':
            manageuser.manage_users()
        elif choice == '3':
            user.browsing_interface()
        elif choice == '4':
            signup.signup()
        elif choice == '5':
            registered.registered_interface()
        elif choice == '6':
            data.data_entry_interface()
        elif choice == '7':
            break
        else:
            print("Invalid choice. Please try again.\n")
    
    # End of main program
    print("Thank you for using the program.")

# Call the main program
if __name__ == "__main__":
    main()