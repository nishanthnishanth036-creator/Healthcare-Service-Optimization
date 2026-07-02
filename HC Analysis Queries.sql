create database Healthcare;
use healthcare;
select count(*) from healthcare;
select * from healthcare;

select month
(admission_date) as month,
count(*) as total_admissions
from healthcare
group by month
order by month;

select hospital_name,
sum(treatment_cost) as total_revenue
from healthcare
group by hospital_name
order by total_revenue desc;

select diagnosis,
round(avg(treatment_cost),2) as avg_cost
from healthcare
group by diagnosis
order by avg_cost desc;

select case
when age < 30 then 'young'
when age between 30 and 60 then 'adult'
else 'senior'
end as age_group,
count(*) as total_patients
from healthcare
group by age_group;

select patient_name, hospital_name, length_of_stay
from healthcare
where length_of_stay > 15
order by length_of_stay desc;

select patient_name, diagnosis, treatment_cost
from healthcare
where treatment_cost > 50000
order by treatment_cost desc;

select diagnosis,
count(*) as total_cases
from healthcare
group by diagnosis
order by total_cases desc;

select * from healthcare;

select hospital_name,
round(avg(length_of_stay),2) as avg_stay
from healthcare
group by hospital_name
order by avg_stay desc;

select gender,
round(avg(treatment_cost),2) as avg_cost
from healthcare
group by gender;

create table patients as select distinct
patient_id, patient_name, age, gender
from healthcare;
create table hospital as select distinct
hospital_id, hospital_name, city
from healthcare;
create table admissions as select
patient_id, hospital_id, diagnosis, admission_date, discharge_date, length_of_stay
from healthcare; 
create table treatments as select
patient_id, treatment_type, treatment_cost
from healthcare;

select 
p.patient_name, h.hospital_name, a.diagnosis, a.length_of_stay
from patients p
join admissions a on p.patient_id = a.patient_id
join hospital h on a.hospital_id = h.hospital_id;

select 
p.patient_name, h.hospital_name, t.treatment_type, t.treatment_cost
from patients p
join treatments t on p.patient_id = t.patient_id
join admissions a on p.patient_id = a.patient_id
join hospital h on a.hospital_id = h.hospital_id
where t.treatment_cost > 50000
order by t.treatment_cost desc;

select h.hospital_name,
count(distinct a.patient_id) as total_patients,
sum(t.treatment_cost) as total_revenue
from hospital h
join admissions a on h.hospital_id = a.hospital_id
join treatments t on a.patient_id = t.patient_id
group by h.hospital_name
order by total_revenue desc;

show databases;






