 -- 1. Do we have actors in the actor table that share the full name and if yes display those shared names.
SELECT * FROM actor;
SELECT first_name, last_name FROM actor;
SELECT COUNT(DISTINCT first_name || last_name) FROM actor;

-- 2. Return the customer IDs of customers who have spent at least $110 with the staff member who has an ID of 2.
SELECT * from payment;
SELECT customer_id FROM payment 
GROUP BY customer_id,staff_id
HAVING SUM(amount)>=110 AND staff_id=2;

--3. How many films begin with the letter J
SELECT COUNT(title) from film
WHERE title LIKE 'J%'

--4 What customer has the highest customer ID number whose name starts with an 'E' and has an address ID lower than 500?
SELECT * from customer
WHERE customer_id=(SELECT MAX(customer_id) FROM customer
WHERE address_id<=500 AND first_name LIKE 'E%');

--5. How many films have the word Truman somewhere in the title
SELECT count (*) from film
WHERE title ILIKE '%truman%'

--6 Display the total amount payed by all customers in the payment table
SELECT sum(amount) from payment

--7 Display the total amount payed by each customer in the payment table.
SELECT customer_id, SUM(amount) from payment
GROUP BY customer_id

--8. What is the highest total_payment done
SELECT customer_id , SUM ( amount )from payment
GROUP BY customer_id
ORDER BY SUM(amount) DESC
LIMIT 1;

--9 Which customers have not rented any movies so far
SELECT* from customer

--10. How many payment transactions were greater than $5.00?
SELECT count (*) from payment
WHERE amount>5
