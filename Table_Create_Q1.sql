CREATE TABLE sql_intv_q_1 (
   Food varchar(100) not null,
   Date timestamp not null,
   Revenue float not null
);

INSERT INTO sql_intv_q_1(Food,Date,Revenue)
VALUES ('Sushi','01/01/2022',50),
       ('Sushi','02/01/2022',100),
       ('Pizza','03/01/2022',70),
       ('Pasta','04/01/2022',20),
       ('Tofu','01/01/2022',10),
       ('Pasta','05/01/2022',90),
       ('Pasta','06/01/2022',80),
       ('Pasta','07/01/2022',80);
	   
	   
SELECT * FROM sql_intv_q_1