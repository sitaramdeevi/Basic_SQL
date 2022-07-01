use movies;

# 1) Write a SQL query to find the actors who were cast in the movie 'Annie Hall'. Return actor first name, last name and role.
select act_fname,act_lname,role  from actors 
join movie_cast on actors.act_id = movie_cast.act_id 
join movie  on movie_cast.mov_id = movie.mov_id
where mov_title = 'Annie Hall';

# 2) From the following tables, write a SQL query to find the director who directed a movie that casted a role for 'Eyes Wide Shut'. Return director first name, last name and movie title.
select dir_fname,dir_lname,mov_title from director
join movie_direction on director.dir_id = movie_direction.dir_id
join movie on movie_direction.mov_id = movie.mov_id
join movie_cast on movie.mov_id = movie_cast.mov_id
where mov_title like  'Eyes Wide Shut%';

# 3) Write a SQL query to find who directed a movie that casted a role as ‘Sean Maguire’. Return director first name, last name and movie title.
select dir_fname,dir_lname,mov_title from director
natural join movie_direction
natural join movie
natural join movie_cast
where role like 'Sean Maguire%';

# 4) Write a SQL query to find the actors who have not acted in any movie between1990 and 2000 (Begin and end values are included.). Return actor first name, last name, movie title and release year.
select act_fname,act_lname,mov_title,mov_year from actors 
natural join movie_cast
natural join movie
where mov_year not between 1990 and 2000;

# 5) Write a SQL query to find the directors with number of genres movies. Group the result set on director first name, last name and generic title. Sort the result-set in ascending order by director first name and last name. Return director first name, last name and number of genres movies.
select  dir_fname,dir_lname,gen_title,count(gen_title) from director
natural join movie_direction
natural join movie_genres
natural join genres
group by gen_title
order by dir_fname,dir_lname;

# 6)  Write a SQL query to find the movies with year and genres. Return movie title, movie year and generic title.
select mov_title,mov_year,gen_title from movie
natural join movie_genres
natural join genres;

# 7) Write a SQL query to find all the movies with year, genres, and name of the director. 
select mov_title,mov_year,gen_title,dir_fname,dir_lname from movie
natural join movie_direction
natural join director
natural join movie_genres
natural join genres; 

# 8) Write a SQL query to find the movies released before 1st January 1989. Sort the result-set in descending order by date of release. Return movie title, release year, date of release, duration, and first and last name of the director. 
select mov_title,mov_year,mov_dt_rel,mov_time,dir_fname,dir_lname 
from movie natural join movie_direction
natural join director
where mov_dt_rel < '1989-01-01'
order by mov_dt_rel desc;

# 9) Write a SQL query to compute the average time and count number of movies for each genre. Return genre title, average time and number of movies for each genre.
select gen_title,avg(mov_time),count(mov_title) 
from movie natural join movie_genres
natural join genres
group by gen_title;

# 10) Write a SQL query to find movies with the lowest duration. Return movie title, movie year, director first name, last name, actor first name, last name and role.
select min(mov_time),mov_title,mov_year,dir_fname,dir_lname,act_fname,act_lname,role 
from movie natural join movie_direction
natural join movie_cast
natural join director
natural join actors
where mov_time;




