# Course-MatchUp
Course-MatchUp aims to give Northeastern students a way to view and match with courses based off of their interests and past ratings.
![image](https://user-images.githubusercontent.com/61031840/233179560-a9716881-0c51-49be-9abc-6d2a024cf471.png)
The database consists of a multitude of tables such as Departments, Students, Courses, Sections, and Instructors. These are the main tables used in the application, with other tables serving to connect these main tables via foreign keys, or provide more information about these tables to be used in the queries (such as ratings for a professor or prerequisites for a course).

The two major personas we developed for are administrators and students. As the scope of the project became clearer, we did diverge a bit from our original user personas and stories. Ultimately the administrators routes serve to give admins of the Course-MatchUp a way to seamless update information in the database, keeping course course and professor information up-to-date for students. On the student-side, students are given a means to enter their own interests into the application, as well as search through courses they may be interested in based off of department and ratings.

Eeach blueprint contains the required number of POST, PUT, and DELETE requests. Thorough tests for each route can be found in the thunder-tests folder. 

Here is the link to our video: https://youtu.be/TQYMlIwMZIk

# MySQL + Flask Project

This repo contains a setup for spinning up 3 Docker containers: 
1. A MySQL 8 container
1. A Python Flask container with REST API
1. A Local AppSmith Server

## How to setup and start the containers
**Important** - you need Docker Desktop installed

1. Clone this repository.  
1. Create a file named `db_root_password.txt` in the `secrets/` folder and put inside of it the root password for MySQL. 
1. Create a file named `db_password.txt` in the `secrets/` folder and put inside of it the password you want to use for the a non-root user named webapp. 
1. In a terminal or command prompt, navigate to the folder with the `docker-compose.yml` file.  
1. Build the images with `docker compose build`
1. Start the containers with `docker compose up`.  To run in detached mode, run `docker compose up -d`. 




