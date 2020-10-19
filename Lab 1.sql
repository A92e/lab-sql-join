use sakila;


    -- 1- List number of films per category.
    
select category.name, count(film_category.film_id) from film_category
right join category 
on category.category_id=film_category.category_id
group by category.name
order by category.name;
    
    
    
    
    -- 2- Display the first and last names, as well as the address, of each staff member.
    
    
select first_name, last_name ,a.address,a.address2 from staff
left join address as a
on staff.address_id=a.address_id
order by first_name,last_name;  
    
    
    
    
    
    -- 3- Display the total amount rung up by each staff member in August of 2005.
    
select staff.staff_id,first_name,last_name,sum(p.amount),p.payment_date from staff
join payment as p
on staff.staff_id=p.staff_id
and    (p.payment_date >= '2005-08-01') and (p.payment_date <= '2005-08-31')
group by staff.staff_id
order by staff.staff_id;  

       
    
    
    
    -- 4- List each film and the number of actors who are listed for that film.
    
select f.title, count(fa.actor_id) as num_actors from film as f
left join film_actor as fa
on f.film_id=fa.film_id
group by f.title
order by f.title;  
      
    
    
    
    
    
    -- 5- Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.

select first_name,last_name, sum(p.amount) as 'total_money' from customer as c
left join payment as p
on c.customer_id=p.customer_id
group by first_name,last_name
order by last_name;  