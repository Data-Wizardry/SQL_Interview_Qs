CREATE TABLE sql_intv_q_1 (
   FoodId varchar(100) not null,
   Food varchar(100) not null,
   Date timestamp not null,
   Revenue float not null
);

INSERT INTO sql_intv_q_1(FoodId,Food,Date,Revenue)
VALUES ('123','Sushi','01/01/2022',50),
       ('123','Sushi','02/01/2022',100),
       ('456','Pizza','03/01/2022',70),
       ('789','Pasta','04/01/2022',20),
       ('111','Tofu','01/01/2022',10),
       ('789','Pasta','05/01/2022',90),
       ('789','Pasta','06/01/2022',80),
       ('789','Pasta','07/01/2022',80);
	   
-----------------------------------------------------------
-- Want to see the answer?
-- Think through it first, then scroll down for the solution!
-----------------------------------------------------------
	   
	   
	   
















-----------------------------------
-- A little further
-----------------------------------












----------------
-- Solution 1 --
----------------

with main as
(
   select foodId,
	      food,
          date,
	      revenue
   from sql_intv_q_1
   where 1=1
),

reduction as
(
    select foodId, 
    max(revenue) as max_revenue
    from main
    group by foodId  
)

select t1.*
from main as t1
inner join reduction as t2
  on t1.foodid = t2.foodid
 and t1.revenue = t2.max_revenue
 
-------------------- 
-- Solution 2 --
--------------------

with main as
(
   select foodId,
	      food,
          date,
	      revenue
   from sql_intv_q_1
   where 1=1
)

select foodid,
       food,
	   date,
	   revenue
from
(
  select foodid,
	     food,
	     date,
	     revenue,
         max(revenue) over (partition by foodid) as max_rev
  from main
) t1	
where 1=1
  and max_rev = revenue
