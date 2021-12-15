-- Selezionare tutti gli studenti nati nel 1990 
select *
from students s
where year(date_of_birth) = 1990;


-- Selezionare tutti i corsi che valgono più di 10 crediti
select *
from courses c
where cfu > 10;


-- Selezionare tutti gli studenti che hanno più di 30 anni
select *
from students s
where timestampdiff(year, date_of_birth, curdate()) > 30;


-- Selezionare tutti i corsi di laurea magistrale
select *
from degrees d 
where level = 'magistrale';


-- Da quanti dipartimenti è composta l’università?
select count(id) as num_dipartimenti
from departments;


-- Quanti sono gli insegnanti che non hanno un numero di telefono?
select count(phone is null) 
from teachers t
where phone is null;


-- Contare quanti iscritti ci sono stati ogni anno
select year(enrolment_date), count(id) as num_iscritti 
from students
group by year(enrolment_date);


-- Calcolare la media dei voti di ogni appello d’esame
select es.exam_id as appello_di_esame, avg(vote) as voti
from exam_student es
group by es.exam_id;


-- Contare quanti corsi di laurea ci sono per ogni dipartimento
select department_id, count(id) 
from degrees 
group by department_id;


-- Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia
select s.id, s.name, s.surname, s.degree_id 
from degrees
inner join students s
on degrees.id = s.degree_id 
where degrees.name like '%Economia'
group by s.id ;


-- Selezionare tutti i Corsi di Laurea Magistrale del Dipartimento di Neuroscienze
select  *
from degrees 
where department_id like 7 and level = 'Magistrale'
group by department_id;


-- Selezionare tutti i corsi in cui insegna Fulvio Amato
select ct.course_id as num_corsi, t.name, t.surname 
from teachers t 
inner join course_teacher ct on t.id = ct.teacher_id
where t.name = 'Fulvio' and t.surname = 'Amato'
group by ct.course_id ;


-- Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui sono iscritti e il relativo dipartimento, in ordine alfabetico per cognome e nome
select s.surname, s.name, deg.id, deg.name, deg.`level`, deg.department_id, deg.address, deg.email, deg.website 
from degrees deg
inner join students s on deg.id = s.degree_id
order by s.surname, s.name asc;
