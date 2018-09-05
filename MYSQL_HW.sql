show databases;

use sakila;

show tables;

SELECT * FROM actor;
/* 1a. show first and last name */
SELECT first_name, last_name from actor;

/* 1b. Show first and last name in one column with only uppercase letters */
SELECT CONCAT(UCASE(first_name), " ", UCASE(last_name)) as "Actor Name"
FROM actor

/* 	2a. Query to find first name "Joe" and display ID, first name, and last name */
SELECT actor_id, first_name, last_name FROM actor
WHERE first_name = "Joe";

/* 2b. Find actors whose last name contain the letters "GEN" */
SELECT * FROM actor
WHERE last_name LIKE '%gen%';

/* 2c. Find all actors whose last names contain the letters LI. This time, order the rows by last name and first name, in that order: */
Select * FROM actor
WHERE last_name LIKE '%li%'
ORDER BY last_name, first_name;

/* 2d. Using IN, display the country_id and country columns of the following countries: Afghanistan, Bangladesh, and China: */
SELECT * FROM country
WHERE country in ('Afghanistan', 'Bangladesh', 'China');

/* 3a. Add a middle_name column to the table actor. Position it between first_name and last_name. Hint: you will need to specify the data type. */
ALTER TABLE actor
ADD COLUMN middle_name VARCHAR(30) AFTER first_name;

/* 3b. You realize that some of these actors have tremendously long last names. Change the data type of the middle_name column to blobs. */
ALTER TABLE actor MODIFY middle_name BLOB;

/* DESCRIBE actor; */
ALTER TABLE actor DROP middle_name

/* 4a. List the last names of actors, as well as how many actors have that last name. */
SELECT last_name, COUNT(last_name) AS 'Number of Actors' 
FROM actor
GROUP BY last_name;

/* 4b. List last names of actors and the number of actors who have that last name, but only for names that are shared by at least two actors */
SELECT last_name, COUNT(last_name) AS 'Number of Actors' 
FROM actor
GROUP BY last_name
HAVING COUNT(last_name) > 1;

