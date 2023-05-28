--Week 5 - Thursday Questions
--
--1.Create a Stored Procedure that will insert a new film into the film table with the
---following arguments: title, description, release_year, language_id, rental_duration,
---rental_rate, length, replace_cost, rating

select NOW();


insert film (title, description, release_year, language_id, rental_duration, rental_rate, replacement_cost, rating)
values ('Titanic', 'Some description', '1997', '1', '3', '3.99', '10.99', 'PG-13');

create function add_film(title VARCHAR, description VARCHAR, release_year VARCHAR, language_id VARCHAR, rental_duration VARCHAR, rental_rate VARCHAR, replacement_cost VARCHAR, rating VARCHAR)
  returns VOID AS $$
begin
  insert new_film (title, description, release_year, language_id, rental_duration, rental_rate, replacement_cost, rating)
  values (title, description, release_year, language_id, rental_duration, rental_rate, replacement_cost, rating);
end;
$$ LANGUAGE plpgsql;

--2. Create a Stored Function that will take in a category_id and return the number of
--films in that category

select COUNT(*)
from film_category;

create or replace function get_film_count(category_id integer)
returns integer
language plpgsql
as $$
	declare film_count integer;
begin 
	select count(*) into film_count
	from film_category
	where film_category.category_id = category_id
	group by film_category.category_id ;
	return film_count;
end;
$$;

select get film_count(15);

drop function get_film_count;
	
