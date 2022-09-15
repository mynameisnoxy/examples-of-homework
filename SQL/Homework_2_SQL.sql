--1. Создать таблицу employees
-- - id. serial,  primary key,
-- - employee_name. Varchar(50), not null
create table employees(
id serial primary key,
employee_name varchar(50) not null);
--2. Наполнить таблицу employee 70 строками.
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
--3. Создать таблицу salary
-- - id. Serial  primary key,
-- - monthly_salary. Int, not null
create table salary(
id serial primary key,
monthly_salary int not null);
-- 4.Наполнить таблицу salary 15 строками:
insert into salary(monthly_salary)
values(1000),
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
-- 5.Создать таблицу employee_salary
-- - id. Serial  primary key,
-- - employee_id. Int, not null, unique
-- - salary_id. Int, not null
create table employee_salary(
id serial primary key,
employee_id int not null unique,
salary_id int not null);
-- 6.Наполнить таблицу employee_salary 40 строками:
-- - в 10 строк из 40 вставить несуществующие employee_id
insert into employee_salary(employee_id, salary_id)
values(1,1),
      (2,2),
      (3,3),
      (4,4),
      (5,5),
      (6,6),
      (7,7),
      (8,8),
      (9,9),
      (10,10),
      (11,11),
      (12,12),
      (13,13),
      (14,14),
      (15,15),
      (16,15),
      (17,14),
      (18,13),
      (19,12),
      (20,11),
      (21,10),
      (22,9),
      (23,8),
      (24,7),
      (25,6),
      (26,5),
      (27,4),
      (28,3),
      (29,1),
      (30,16),
      (71,1),
      (72,2),
      (73,3),
      (74,4),
      (75,5),
      (76,6),
      (77,7),
      (78,8),
      (79,9),
      (80,10);
--  7. Создать таблицу roles
-- - id. Serial  primary key,
-- - role_name. int, not null, unique
create table roles (
id serial primary key,
role_name int unique not null);
-- 8.Поменять тип столба role_name с int на varchar(30)
alter table roles alter column role_name type varchar(30);
-- 9. Наполнить таблицу roles 20 строками:
insert into roles(role_name)
values('Junior Python developer'),
      ('Middle Python developer'),
      ('Senior Python developer'),
      ('Junior Java developer'),
      ('Middle Java developer'),
      ('Senior Java developer'),
      ('Junior JavaScript developer'),
      ('Middle JavaScript developer'),
      ('Senior JavaScript developer'),
      ('Junior Manual QA engineer'),
      ('Senior Manual QA engineer'),
      ('Project Manager'),
      ('Designer'),
      ('HR'),
      ('CEO'),
      ('Sales manager'),
      ('Junior Automation QA engineer'),
      ('Middle Automation QA engineer'),
      ('Senior Automation QA engineer');
-- 10.Создать таблицу roles_employee
-- - id. Serial  primary key,
-- - employee_id. Int, not null, unique (внешний ключ для таблицы employees, поле id)
-- - role_id. Int, not null (внешний ключ для таблицы roles, поле id)
create table  roles_employee(
id serial primary key,
employee_id int not null unique,
role_id int not null,
foreign key (employee_id)
	references employees(id),
foreign key (role_id)
	references roles(id));
-- 11.Наполнить таблицу roles_employee 40 строками
insert into roles_employee (employee_id, role_id)
	values(2,7),
	      (20,4),
	      (3,9),
	      (5,13),
	      (23,4),
	      (11,2),
	      (10,9),
	      (22,13),
	      (21,3),
	      (34,4),
	      (6,7),
	      (40,5),
	      (47,15),
	      (53,2),
	      (33,3),
	      (38,4),
	      (15,15),
	      (66,4),
	      (31,8),
	      (51,1),
	      (52,16),
	      (27,5),
	      (29,10),
	      (26,11),
	      (67,13),
	      (69,9),
	      (14,14),
	      (28,2),
	      (36,10),
	      (35,2),
	      (63,7),
	      (17,11),
	      (19,8),
	      (1,15),
	      (49,2),
	      (59,13),
	      (18,5),
	      (13,1),
	      (64,7),
	      (12,4);
-- 1. Вывести всех работников чьи зарплаты есть в базе, вместе с зарплатами.
select e.employee_name, s.monthly_salary from employees e
join employee_salary es on e.id = es.employee_id
join salary s on s.id = es.salary_id;
-- 2. Вывести всех работников у которых ЗП меньше 2000.
select e.employee_name, s.monthly_salary from employees e
join employee_salary es on e.id = es.employee_id
join salary s on s.id = es.salary_id
where s.monthly_salary < 2000;
-- 3. Вывести все зарплатные позиции, но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)
select s.monthly_salary from salary s 
left join employee_salary es on s.id = es.salary_id
where es.employee_id is null;
-- 4. Вывести все зарплатные позиции  меньше 2000 но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)
-- 5. Найти всех работников кому не начислена ЗП.
-- 6. Вывести всех работников с названиями их должности.
-- 7. Вывести имена и должность только Java разработчиков.
-- 8. Вывести имена и должность только Python разработчиков.
-- 9. Вывести имена и должность всех QA инженеров.
-- 10. Вывести имена и должность ручных QA инженеров.
-- 11. Вывести имена и должность автоматизаторов QA
-- 12. Вывести имена и зарплаты Junior специалистов
-- 13. Вывести имена и зарплаты Middle специалистов
-- 14. Вывести имена и зарплаты Senior специалистов
-- 15. Вывести зарплаты Java разработчиков
-- 16. Вывести зарплаты Python разработчиков
-- 17. Вывести имена и зарплаты Junior Python разработчиков
-- 18. Вывести имена и зарплаты Middle JS разработчиков
-- 19. Вывести имена и зарплаты Senior Java разработчиков
-- 20. Вывести зарплаты Junior QA инженеров
-- 21. Вывести среднюю зарплату всех Junior специалистов
-- 22. Вывести сумму зарплат JS разработчиков
-- 23. Вывести минимальную ЗП QA инженеров
-- 24. Вывести максимальную ЗП QA инженеров
-- 25. Вывести количество QA инженеров
-- 26. Вывести количество Middle специалистов.
-- 27. Вывести количество разработчиков
-- 28. Вывести фонд (сумму) зарплаты разработчиков.
-- 29. Вывести имена, должности и ЗП всех специалистов по возрастанию
-- 30. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП от 1700 до 2300
-- 31. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП меньше 2300
-- 32. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП равна 1100, 1500, 2000