--List of Actors in a Specific Film
--Write an SQL query to list all actors (first name and last name) who appeared in the film titled "ACADEMY DINOSAUR".
SELECT a.first_name, a.last_name FROM film AS f, actor AS a JOIN film_actor ON film_actor.actor_id = a.actor_id WHERE f.film_id = film_actor.film_id AND f.title = "ACADEMY DINOSAUR";


--Count of Films in Each Category
--Create an SQL query to count how many films there are in each category. Display the category name and the count of films.
SELECT category.name, Count(film_category.category_id) AS count FROM `film_category`, category WHERE category.category_id = film_category.category_id GROUP BY film_category.category_id;


--Average Rental Duration for Each Rating
--Construct an SQL query to find the average rental duration of films for each rating category (G, PG, etc.). Display the rating and the average rental duration.
SELECT Sum(film.rental_duration) / COUNT(rental_duration) AS Average, rating FROM film WHERE 1 GROUP BY rating


--Total Number of Rentals for Each Customer
--Develop an SQL query to count the total number of rentals made by each customer. Include the customer's first name, last name, and the count of their rentals.
SELECT c.first_name, c.last_name, COUNT(r.rental_id) AS total_rentals FROM customer c JOIN rental r ON c.customer_id = r.customer_id GROUP BYc.customer_id, c.first_name, c.last_name;


--Stores with the Highest Number of Rentals
--Write an SQL query to find which store has the highest number of rentals. Display the store ID and the count of rentals.
SELECT store_id, COUNT(inventory_id) AS total_rentals FROM inventory GROUP BY store_id ORDER BY total_rentals DESC LIMIT 1;


--Most Popular Film Category Among Customers
--Formulate an SQL query to find the most popular film category among customers based on rental data. Display the category name and the count of rentals.
SELECT c.name, COUNT(r.rental_id) AS total_rentals FROM rental r JOIN inventory i ON r.inventory_id = i.inventory_id JOIN film_category fc ON i.film_id = fc.film_id JOIN category c ON fc.category_id = c.category_id GROUP BY c.category_id, c.name ORDER BY total_rentals DESC LIMIT 1;


--Average Rental Cost of Films by Category
--Create an SQL query to calculate the average rental cost (rental_rate) of films within each category. Display the category name and the average rental rate.
SELECT fc.category_id, AVG(f.rental_rate) AS average_rental_rate FROM film f JOIN inventory i ON f.film_id = i.film_id JOIN rental r ONi.inventory_id = r.inventory_id JOIN film_category fc ON f.film_id = fc.film_id GROUP BY fc.category_id;


--List of Films Not Rented in the Last Month (which will be all of them)
--....Display the film title and the last rental date, if available.
SELECT f.title, MAX(rental.rental_date) AS rental_date FROM film AS f LEFT JOIN inventory ON f.film_id = inventory.film_id LEFT JOIN rental ON inventory.inventory_id = rental.inventory_id WHERE (rental.rental_date > '2006-01-14' OR rental.rental_date IS NULL) AND rental.rental_date IS NOT NULL GROUP BY f.title ORDER BY `rental_date` DESC

--Customer Spending on Rentals
--Construct an SQL query to calculate the total amount spent by each customer on rentals. Display the customer's name and their total spending.
SELECT c.first_name, c.last_name , Sum(p.amount) FROM customer AS c, payment AS p WHERE p.customer_id = c.customer_id GROUP BY c.customer_id;


--Average Length of Films in Each Language
--Develop an SQL query to find the average length of films for each language. Display the language and the average length of the films.
SELECT l.name, Sum(length) / Count(f.language_id) FROM language AS l, film AS f WHERE f.language_id = l.language_id GROUP BY f.language_id
