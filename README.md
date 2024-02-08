# Digipedia

## Web application similar to Wikipedia

The Digipedia project was created at the faculty as a project for construction exercises in the subject **Server-Side Web Programming** and **Scripting Programming Languages**.

The project's theme was to create a program that would serve as an informative portal similar to Wikipedia, with user authentication. The program should include categories, articles, and sub-articles that are accessible to everyone, as well as an administrative interface for the admin to manage everything on the website.

The website showcases knowledge about the following web technologies: **AngularJs v1.6.9** with **jQuery 3.2.1**, **PHP 7**, and **Bootstrap 3.3.7** was used for design. **MySQL** was used as the database.

[![My Skills](https://skills.thijs.gg/icons?i=angular,jquery,php,bootstrap,mysql)](https://skills.thijs.gg)

---

### The website contains 3 types of views:

1. For regular site visitors who can access all articles on the website, and everything is read-only for them.
1. For logged-in users who can add articles and sub-articles, and rate all articles. They also have full control over their articles and sub-articles as they can edit and delete them.
1. For logged-in admins who can manage all users, categories, and articles, which means they can add, edit, and delete them. They also have access to the editing history of articles, where they can see who edited which article and when.

---

### Running the project

You need to install [XAMPP](https://www.apachefriends.org) and then run **Apache** and **MySQL** through it.

Next, copy the **Digipedia** folder to `C:\xampp\htdocs\`.

Link to access the database: [http://localhost/phpmyadmin/index.php](http://localhost/phpmyadmin/index.php).

Then, in **phpmyadmin**, create a database called `wikipedia` (Character Set should be **Collation**), and then import `wikipedia.sql`, which is located in the project's root.

Link to access the application: [http://localhost/digipedia/index.php#!/](http://localhost/digipedia/index.php#!/).
