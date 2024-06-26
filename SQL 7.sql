## Q1......In the table actor, which are the actors whose last names are not repeated? 

Use sakila;
select first_name, last_name from actor
where last_name in (
select last_name
from Actor
group by last_name
having count(*) = 1
order by last_name desc);

## 2 Which last names appear more than once?
select first_name, last_name from actor
where last_name in (
select last_name
from Actor
group by last_name
having count(*) > 1
order by last_name ASC);

## 3 Using the rental table, find out how many rentals were processed by each employee
select staff_id,count(*) as rental_count
from rental
group by staff_id
order by rental_count desc;

## 4 Using the film table, find out how many films were released each year.
Select release_year, count(*) as released_films_yearly
from film
group by release_year
order by released_films_yearly asc;

## 5 Using the film table, find out for each rating how many films were there.

Select rating, count(*) as film_ratings
from film 
group by rating 
order by rating ;

## 6 What is the mean length of the film for each rating type. Round off the average lengths to two decimal places

Select rating, round (avg(length),2) as mean_length
from film 
group by rating 
order by rating ;

## 7 Which kind of movies (rating) have a mean duration of more than two hours?
select rating 
from film
group by rating
having avg(length) > 120;
