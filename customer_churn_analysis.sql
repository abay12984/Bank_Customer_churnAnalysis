create database bank_customer;

CREATE TABLE churn_modelling (
    RowNumber INT PRIMARY KEY,
    CustomerId BIGINT UNIQUE NOT NULL,
    Surname VARCHAR(50),
    CreditScore INT,
    Geography VARCHAR(30),
    Gender VARCHAR(10),
    Age INT,
    Tenure INT,
    Balance DECIMAL(12,2),
    NumOfProducts INT,
    HasCrCard BOOLEAN,
    IsActiveMember BOOLEAN,
    EstimatedSalary DECIMAL(12,2),
    Exited BOOLEAN
);

select * from churn_modelling;
--calaculating overall churn rate
select count(*) as total_customers,
sum(case when exited = True then 1 else 0 end) as churned_customers,
ROUND(100.0 *(sum(case when exited = TRUE then 1 ELSE  0 END))/count(*),2) as churn_rate
from churn_modelling;

-- churn rate analysis country wise:

select geography,count(*) as total_customers,sum(case when exited = TRUE then 1 ELSE 0 end) as churned_customers,
ROUND(100.0 * (sum(case when exited = TRUE then 1 ELSE 0 end))/count(*),2) as churn_rate
from churn_modelling
group by geography;

--- In which age group  churn rate is more

select 
case 
	when age between 18 and 25 then '18-25'
	when age between 26 and 31 then '26-31'
    when age between 32 and 40 then '32-40'
    when age between 41 and 59 then '41-59'
    else '60+'
    end as age_group,
    count(*) as total_customers,
     ROUND(
        100.0 * SUM(CASE WHEN Exited = TRUE THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS churn_rate
from churn_modelling
group by case 
	when age between 18 and 25 then '18-25'
	when age between 26 and 31 then '26-31'
    when age between 32 and 40 then '32-40'
    when age between 41 and 59 then '41-59'
    else '60+' 
    end 
order by age_group;

---does credit score affect  churn
select exited,round(avg(creditscore),2) as average_creditScore,count(*) as total_customers
from churn_modelling
group by exited;

-- gender wise churn rate 
select count(*) as total_customers,
gender,sum(exited) as churn_customers,
round(avg(exited) * 100,2) as churn_percetage
from churn_modelling
group by gender;


--customer lifetime value:
select case
when tenure <= 2 then 'newMembers'
when tenure  between 3 and 6 then 'EstablishMembers'
when tenure >6 then 'loyal'
end as customer_value,
count(*) as total_customers,
round(avg(exited)*100.0,2) as churn_rate
from churn_modelling
group by 
case
when tenure <= 2 then 'newMembers'
when tenure  between 3 and 6 then 'EstablishMembers'
when tenure >6 then 'loyal'
end ;

--relation b/w no of products and churn

select numofproducts, 
count(*) as total_customers,sum(exited) as churned,round(avg(exited)*100.0,2) as churn_rate
from churn_modelling
group by numofproducts
order by numofproducts;










