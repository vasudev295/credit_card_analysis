CREATE TABLE cust_add (
    Client_Num BIGINT PRIMARY KEY,
    Customer_Age INTEGER,
    Gender VARCHAR(10),
    Dependent_Count INTEGER,
    Education_Level VARCHAR(50),
    Marital_Status VARCHAR(20),
    state_cd VARCHAR(5),
    Zipcode INTEGER,
    Car_Owner VARCHAR(5),
    House_Owner VARCHAR(5),
    Personal_loan VARCHAR(5),
    contact VARCHAR(20),
    Customer_Job VARCHAR(50),
    Income INTEGER,
    Cust_Satisfaction_Score INTEGER
);
select * from cust_add;

CREATE TABLE cc_detail (
    Client_Num INT,
    Card_Category VARCHAR(20),
    Annual_Fees INT,
    Activation_30_Days INT,
    Customer_Acq_Cost INT,
    Week_Start_Date DATE,
    Week_Num VARCHAR(20),
    Qtr VARCHAR(10),
    current_year INT,
    Credit_Limit DECIMAL(10,2),
    Total_Revolving_Bal INT,
    Total_Trans_Amt INT,
    Total_Trans_Ct INT,
    Avg_Utilization_Ratio DECIMAL(10,3),
    Use_Chip VARCHAR(10),
    Exp_Type VARCHAR(50),
    Interest_Earned DECIMAL(10,3),
    Delinquent_Acc VARCHAR(5)
);
select * from cc_detail;

1. Top 5 States by Average Income
select state_cd , avg(income) as avg_income 
from cust_add
group by state_cd 
order by avg_income desc
limit 5;

2. count
select count(*) from cc_detail

3. join both table 
SELECT *
FROM cust_add c
JOIN cc_detail cc ON c.Client_Num = cc.Client_Num;

4. Total Transactions by Gender
SELECT gender, SUM(cc.total_trans_amt) AS total_transaction
FROM cust_add c
JOIN cc_detail cc ON c.Client_Num = cc.Client_Num
GROUP BY gender;

5. Average Credit Limit by Education Level
SELECT c.education_Level, AVG(cc.Credit_Limit) AS avg_credit_limit
FROM cust_add c
JOIN cc_detail cc ON c.Client_Num = cc.Client_Num
GROUP BY c.Education_Level;

6. Top 10 Customers by Interest Earned
SELECT cc.Client_Num, 
       c.Customer_Age, 
       c.Income, 
       cc.Interest_Earned
FROM cust_add c
JOIN cc_detail cc ON c.Client_Num = cc.Client_Num
ORDER BY cc.Interest_Earned DESC
LIMIT 10;

7.Credit Limit vs Income by Job Type
SELECT Customer_Job, AVG(Income) AS avg_income, AVG(Credit_Limit) AS avg_credit_limit
FROM cust_add c
JOIN cc_detail cc ON c.Client_Num = cc.Client_Num
group by customer_job;

8.Total Interest Earned by Expense Type
SELECT Exp_Type, SUM(Interest_Earned) AS total_interest
FROM cc_detail
GROUP BY Exp_Type;

9.Satisfaction Score Distribution by Education Level
SELECT Education_Level, Cust_Satisfaction_Score, COUNT(*) AS count_customers
FROM cust_add
GROUP BY Education_Level, Cust_Satisfaction_Score
ORDER BY Education_Level;

10.Customers with High Utilization Ratio (> 0.8)
SELECT c.Client_Num, Customer_Age, Gender, Avg_Utilization_Ratio
FROM cust_add c
JOIN cc_detail cc ON c.Client_Num = cc.Client_Num
WHERE Avg_Utilization_Ratio > 0.8;





















