select staff.first_name as mananger_firstname, staff.last_name as manager_lastname, 
address, district, city.city, country.country  from address 
inner join store on store.address_id = address.address_id
inner join city on city.city_id = address.city_id
inner join country on city.country_id = country.country_id
inner join staff on staff.store_id = store.store_id;



select inventory_id, store_id, film.title, film.rating, film.rental_rate, film.replacement_cost from inventory
inner join film on inventory.film_id = film.film_id;

select store_id, film.rating, count(inventory_id) from inventory
inner join film on inventory.film_id = film.film_id
group by store_id, rating;


select inventory.store_id, category.name, count(film.title) as films, avg(replacement_cost) as avg_replacementcost, 
sum(replacement_cost) as total_replacementcost from film
inner join film_category on film_category.film_id = film.film_id
inner join category on category.category_id = film_category.category_id
inner join inventory on film.film_id = inventory.film_id
group by inventory.store_id, category.name











select store_id,category,film,avg_replacemengt_cost, total_replacement_cost





