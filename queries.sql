-- write your queries here

--Part One: Getting Started


--Join the two tables so that every column and 
--record appears, regardless of if there is not an owner_id

select o.id, first_name, last_name, v.id, make, model, year, price, v.owner_Id
from vehicles v FULL OUTER JOIN owners o 
on v.owner_Id = o.id

--Count the number of cars for each owner. Display the owners first_name, 
--last_name and count of vehicles. The first_name should be ordered in 
--ascending order.

select o.first_name, o.last_name, count(v.model) as vehicle_count
from owners o 
right join vehicles v
on o.id = v.owner_id
group by v.owner_id, o.first_name, o.last_name
Order By vehicle_count ASC


-- Count the number of cars for each owner and display the average price 
-- for each of the cars as integers. Display the owners first_name , last_name, 
-- average price and count of vehicles. The first_name should be ordered in descending order. 
-- Only display results with more than one vehicle and an average price greater than 10000. 

select o.first_name, o.last_name, Round(avg(price)) as average_price, count(v.owner_id)
from owners o 
full outer join vehicles v
on o.id = v.owner_id
Group by o.first_name, o.last_name, v.owner_id
having (Round(avg(price)) > 10000 AND v.owner_id >1)
Order By first_name DESC

--Part 2: 
--steps 6 from https://sqlzoo.net/
-- List the dates of the matches and the name of the team in which 'Fernando Santos' was the team1 coach.
SELECT mdate, teamname
FROM goal go 
left join game ga
on go.matchid = ga.id
right join eteam e
on go.teamid = e.id

--step 7 from https://sqlzoo.net/
--List the player for every goal scored in a game where the stadium was 'National Stadium, Warsaw'
SELECT player
FROM goal go 
left join game ga
on go.matchid = ga.id
where stadium ='National Stadium, Warsaw'