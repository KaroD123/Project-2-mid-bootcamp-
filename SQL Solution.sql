use credit_card_classification;

-- 4. Select all the data from table credit_card_data to check if the data was imported correctly.
select * from creditcardmarketing;

-- 5. Use the alter table command to drop the column q4_balance from the database, as we would not use it in the analysis with SQL. Select all the data from the table to verify if the command worked. Limit your returned results to 10.
alter table creditcardmarketing drop `Q4 Balance`;
select * from creditcardmarketing
limit 10;

-- 6. Use sql query to find how many rows of data you have.
select count(*) from creditcardmarketing;

-- 7. Now we will try to find the unique values in some of the categorical columns:
select distinct `Offer Accepted`, Reward
from creditcardmarketing;

select distinct Reward
from creditcardmarketing;

select distinct `Mailer Type`
from creditcardmarketing;

select distinct `# Credit Cards Held`
from creditcardmarketing;

select distinct `Household Size`
from creditcardmarketing;

-- 8. Arrange the data in a decreasing order by the average_balance of the house. Return only the customer_number of the top 10 customers with the highest average_balances in your data.
select CustomerNumber 
from creditcardmarketing
order by `Average Balance`desc
limit 10;

-- 9. What is the average balance of all the customers in your data?
select avg(`Average Balance`) from creditcardmarketing;

-- 10. In this exercise we will use group by to check the properties of some of the categorical variables in our data. 
-- What is the average balance of the customers grouped by `Income Level`? The returned result should have only two columns, income level and `Average balance` of the customers. Use an alias to change the name of the second column.
select avg(`Average Balance`) as avg_balance, `Income Level` 
from creditcardmarketing
group by `Income Level`;

-- What is the average balance of the customers grouped by `number_of_bank_accounts_open`? The returned result should have only two columns, `number_of_bank_accounts_open` and `Average balance` of the customers. Use an alias to change the name of the second column.
select avg(`Average Balance`) as avg_balance, `# Bank Accounts Open`
from creditcardmarketing
group by `# Bank Accounts Open`;

-- What is the average number of credit cards held by customers for each of the credit card ratings? The returned result should have only two columns, rating and average number of credit cards held. Use an alias to change the name of the second column.
select avg(`# Credit Cards Held`), `Credit Rating`
from creditcardmarketing
group by `Credit Rating`;

-- Is there any correlation between the columns `credit_cards_held` and `number_of_bank_accounts_open`? You can analyse this by grouping the data by one of the variables and then aggregating the results of the other column. Visually check if there is a positive correlation or negative correlation or no correlation between the variables.
select `# Credit Cards Held`, count(`# Bank Accounts Open`)
from creditcardmarketing
group by `# Credit Cards Held` 
order by `# Credit Cards Held`asc;

select `# Bank Accounts Open`, count(`# Credit Cards Held`)
from creditcardmarketing
group by `# Bank Accounts Open` 
order by `# Bank Accounts Open` asc;

-- 11. Your managers are only interested in the customers with the following properties:
select * from creditcardmarketing
where `Credit Rating` in ('medium', 'high') and
`# Credit Cards Held` <3 and
`Own Your Home`='Yes' and
`Household Size`>2 ;

-- 12. Your managers want to find out the list of customers whose average balance is less than the average balance of all the customers in the database. Write a query to show them the list of such customers. 
select * from creditcardmarketing
where `Average Balance` < (select avg(`Average Balance`) from creditcardmarketing);

-- 13. Since this is something that the senior management is regularly interested in, create a view called Customers__Balance_View1 of the same query.
create view Customers__Balance_View1 as
select * from creditcardmarketing
where `Average Balance` < (select avg(`Average Balance`) from creditcardmarketing);

select * from Customers__Balance_View1;

-- 14. What is the number of people who accepted the offer vs number of people who did not?
select count(*) from creditcardmarketing
where `Offer Accepted` = 'Yes';
-- 1021
select count(*) from creditcardmarketing
where `Offer Accepted` = 'No';
-- 16955

-- 15. What is the difference in average balances of the customers with high credit card rating and low credit card rate?
select (select avg(`Average Balance`) 
from creditcardmarketing
where `Credit Rating`='high') -
(select avg(`Average Balance`) 
from creditcardmarketing
where `Credit Rating`='low')
from creditcardmarketing;
-- 4,0508

-- 16. In the database, which all types of communication (mailer_type) were used and with how many customers?
select count(CustomerNumber), `Mailer Type`
from creditcardmarketing
group by `Mailer Type`;

-- 17. Provide the details of the customer that is the 11th least Q1_balance in your database.
select * from (select *, dense_rank() over (order by `Q1 Balance` asc) as r
from creditcardmarketing) as t
where r =11;
