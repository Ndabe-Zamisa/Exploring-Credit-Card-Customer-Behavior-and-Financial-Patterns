/*Average Age of Customers*/
SELECT AVG(Customer_Age) as Average_Customer_Age
FROM BankChurners;

/*What is the average credit limit for customers in each income category*/
SELECT ROUND(AVG(Credit_Limit),0) as AVG_Credit_Limit, Income_Category
FROM BankChurners
GROUP BY Income_Category
ORDER BY AVG_Credit_Limit DESC;

/*Correlation between the total relationship count and 
the number of months a customer has been inactive (Months_Inactive_12_mon)*/
SELECT (
        (COUNT(*) * SUM([Total_Relationship_Count] * [Months_Inactive_12_mon]) - SUM([Total_Relationship_Count]) * SUM([Months_Inactive_12_mon]))
        /
        (SQRT((COUNT(*) * SUM([Total_Relationship_Count] * [Total_Relationship_Count]) - (SUM([Total_Relationship_Count]) * SUM([Total_Relationship_Count]))) * (COUNT(*) * SUM( [Months_Inactive_12_mon] *  [Months_Inactive_12_mon]) - (SUM( [Months_Inactive_12_mon]) * SUM( [Months_Inactive_12_mon]))))
    )) AS correlation_coefficient
FROM BankChurners;
/*Answer= negative correlation*/

/*Is there any correlation between the total transaction amount (Total_Trans_Amt) 
and the total number of transactions (Total_Trans_Ct) for each customer*/
SELECT [CLIENTNUM],
       (
        NULLIF((COUNT(*) * SUM([Total_Trans_Amt] * [Total_Trans_Ct]) - SUM([Total_Trans_Amt]) * SUM( [Total_Trans_Ct])),0)
        /
        (SQRT((COUNT(*) * SUM([Total_Trans_Amt] * [Total_Trans_Amt]) - (SUM([Total_Trans_Amt]) * SUM([Total_Trans_Amt]))) * (COUNT(*) * SUM( [Total_Trans_Ct] *  [Total_Trans_Ct]) - (SUM( [Total_Trans_Ct]) * SUM( [Total_Trans_Ct]))))
    )) AS correlation_coefficient
FROM BankChurners
GROUP BY [CLIENTNUM];
/*Answer = There is no correlation*/

/*the average utilization ratio (Avg_Utilization_Ratio) based on the card category and customer age*/
SELECT [Customer_Age],[Card_Category], [Avg_Utilization_Ratio]
FROM BankChurners
ORDER BY  [Avg_Utilization_Ratio] DESC; 

