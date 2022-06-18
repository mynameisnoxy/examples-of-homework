--Создать таблицу employees
--- id. serial,  primary key,
--- employee_name. Varchar(50), not null

create table employees(
   id serial primary key,
   employee_name varchar(50) not null
);

select * from employees;

--Наполнить таблицу employee 70 строками. 

insert into employees(employee_name)
values ('Andrey'),
       ('Anna'),
       ('Anton'),
       ('Alina'),
       ('Aleksey'),
       ('Boris'),
       ('Artem'),
       ('Tatyana'),
       ('Sergey'),
       ('Valentina'),
       ('Olga'),
       ('Vadim'),
       ('Vlada'),
       ('Vladislav'),
       ('Gleb'),
       ('Daniil'),
       ('Svetlana'),
       ('Albert'),
       ('Aleksandr'),
       ('Vladimir'),
       ('Eugene'),
       ('Stanislav'),
       ('Yuri'),
       ('Roman'),
       ('Fedor'),
       ('Nikolay'),
       ('Stepan'),
       ('Egor'),
       ('Denis'),
       ('Nikita'),
       ('Semen'),
       ('Anatoliy'),
       ('Lev'),
       ('Platon'),
       ('Kirill'),
       ('Pavel'),
       ('Konstantin'),
       ('Oleg'),
       ('Viktor'),
       ('Innokentiy'),
       ('Miron'),
       ('Nikolay'),
       ('Matvey'),
       ('Ruslan'),
       ('Vasiliy'),
       ('Maksim'),
       ('Mark'),
       ('Alla'),
       ('Angelina'),
       ('Zoya'),
       ('Inga'),
       ('Antonina'),
       ('Inna'),
       ('Varvara'),
       ('Karina'),
       ('Oksana'),
       ('Polina'),
       ('Galina'),
       ('Rada'),
       ('Miroslava'),
       ('Yakov'),
       ('Georgiy'),
       ('Zlata'),
       ('Kira'),
       ('Svetlana'),
       ('Yana'),
       ('Nina'),
       ('Vera'),
       ('Nadezhda'),
       ('Lubov');
      
--  Создать таблицу salary
--- id. Serial  primary key,
--- monthly_salary. Int, not null

     create table salary1 (
     id serial primary key,
     monthly_salary int not null
     );
     select * from salary1;
    
--  Наполнить таблицу salary 15 строками:
--- 1000
--- 1100
--- 1200
--- 1300
--- 1400
--- 1500
--- 1600
--- 1700
--- 1800
--- 1900
--- 2000
--- 2100
--- 2200
--- 2300
--- 2400
--- 2500
insert into salary1(monthly_salary)
values (1000),
       (1100),
       (1200),
       (1300),
       (1400),
       (1500),
       (1600),
       (1700),
       (1800),
       (1900),
       (2000),
       (2100),
       (2200),
       (2300),
       (2400),
       (2500);
select * from salary1;

--- Создать таблицу employee_salary
--- id. Serial  primary key,
--- employee_id. Int, not null, unique
--- salary_id. Int, not null
create table employee_salary(
id serial primary key,
employee_id int not null unique,
salary_id int not null
);
select * from employee_salary;
--- Наполнить таблицу employee_salary 40 строками:
--- в 10 строк из 40 вставить несуществующие employee_id
insert into employee_salary(employee_id, salary_id)
values (1, 3),
       (3, 1),
       (5, 6),
       (7, 8),
       (9, 10),
       (11, 12),
       (13, 14),
       (15, 2),
       (17, 4),
       (19, 5),
       (21, 7),
       (23, 9),
       (25, 11),
       (27, 13),
       (29, 15),
       (31, 1),
       (33, 2),
       (35, 3),
       (37, 4),
       (39, 5),
       (41, 6),
       (43, 7),
       (45, 8),
       (47, 9),
       (49, 10),
       (51, 11),
       (53, 12),
       (55, 13),
       (57, 15),
       (59, 3),
       (71, 3),
       (72, 3),
       (73, 3),
       (74, 3),
       (75, 3),
       (76, 3),
       (77, 3),
       (78, 3),
       (79, 3),
       (80, 3);
 select* from employee_salary ;
--- Создать таблицу roles
--- id. Serial  primary key,
--- role_name. int, not null, unique
create table roles1(
   id serial primary key,
   role_name int unique not null
);

select * from roles1;

--Поменять тип столба role_name с int на varchar(30)
alter table roles1
alter column role_name type varchar(30) using role_name::varchar(30);

--Наполнить таблицу roles 20 строками

insert into roles1(role_name)
values ('Junior Python developer'),
	   ('Middle Python developer'),
       ('Senior Python developer'),
       ('Junior Java developer'),
       ('Middle Java developer'),
       ('Senior Java developer'),
       ('Junior JavaScript developer'),
       ('Middle JavaScript developer'),
       ('Senior JavaScript developer'),
       ('Junior Manual QA engineer'),
       ('Middle Manual QA engineer'),
       ('Senior Manual QA engineer'),
       ('Project Manager'),
       ('Designer'),
       ('HR'),
       ('CEO'),
       ('Sales manager'),
       ('Junior Automation QA engineer'),
       ('Middle Automation QA engineer'),
       ('Senior Automation QA engineer');

select * from roles1 order by id ;

--  Создать таблицу roles_employee
--- id. Serial  primary key,
--- employee_id. Int, not null, unique (внешний ключ для таблицы employees, поле id)
--- role_id. Int, not null (внешний ключ для таблицы roles, поле id)

create table roles_employee(
   id serial primary key,
   employee_id int unique not null,
   role_id int not null,
   foreign key (employee_id)
       references employees(id),
   foreign key (role_id)
       references roles1(id)
);

select * from roles_employee;

insert into roles_employee(employee_id, role_id)
values (7, 2),
       (20, 4),
       (3, 9),
       (5, 13),
       (23, 4),
       (11, 2),
       (10, 9),
       (22, 13),
       (21, 3),
       (34, 13),
       (2, 8),
       (4, 10),
       (6, 12),
       (8, 14),
       (12, 1),
       (14, 2),
       (16, 7),
       (18, 3),
       (41, 10),
       (43, 4),
       (44, 5),
       (33, 11),
       (24, 6),
       (26, 9),
       (50, 10),
       (60, 7),
       (49, 3),
       (48, 10),
       (59, 1),
       (62, 2),
       (64, 4),
       (66, 6),
       (45, 10),
       (53, 8),
       (46, 9),
       (52, 4),
       (54, 5),
       (55, 3),
       (69, 2),
       (1, 1);        

