This guide will tell you how to get our app working by hosting a local server, setting up the required databases, configuring the server to your set up and then how to use the app.

1. Install XAMPP. This will differ based on your OS and you can find download links at: https://www.apachefriends.org/download.html
Make sure to take note of the location of the install on your machine.

2. After XAMPP has been installed use your file manager or similar software to navigate to the XAMPP install location and open the folder called 'htdocs'.

3. Extract the project folder into the htdocs folder making sure that the folder cos221prac appears in the htdocs folder directly.

4. Launch XAMPP and start all servers. The GUI differs from OS to OS, so just make sure to change the default port of each server to one that is open if they do not start.

5. Now that XAMPP has launched the database service, open your preferred browser and go to http://localhost/phpmyadmin/

6. Create a user other than root if you to but if you do make sure to create a database called 'schema' and give that user access to it. If you are just using root, just create the database.

7. Use phpMyAdmin's import function to import the file schema.sql into the schema database.

8. Update the server's config.php file which can be found at htdocs/cos221prac/PA5/config/config.php to reflect the phpMyAdmin user that you want to use with the app. Only change the username and password variables to match and leave the rest as is.

9. You can now access the app at localhost/cos221prac/PA5/index.php in your browser.

10. To access admin features, you will need to create the admin account using the register page, then using phpMyAdmin delete that users entry in the 'customers' table and create an entry for them in the 'admin' table. You only need to do this once because now it can be done through the frontend using an admin account.