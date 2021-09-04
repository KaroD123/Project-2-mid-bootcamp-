# Project-2 (mid-bootcamp) - Classification

![photo](https://creazilla-store.fra1.digitaloceanspaces.com/cliparts/9108/bank-clipart-md.png)

## Background & Objectiv
**Background**: You are working as a risk analyst with a bank. Apart from the other banking and loan services, the bank also provides credit card services which is a very important source of revenue for the bank. The bank wants to understand the demographics and other characteristics of its customers that accept a credit card offer and that do not accept a credit card.
Usually the observational data for these kinds of problems is somewhat limited in that often the company sees only those who respond to an offer. To get around this, the bank designs a focused marketing study, with 18,000 current bank customers. This focused approach allows the bank to know who does and does not respond to the offer, and to use existing demographic data that is already available on each customer.


**Objective**: Performing an end-to-end analysis putting into practice what I have learned so far. Get a model to predict wether the offer will be accepted or not. Additional playing with the data in MySQL and Tableau.

To organize myself, I used the Kanban methode from the "Projects" section of Github.


## Questions
The project is splitted into three parts which should be worked on in different environments:
  1. MySQL Workbench
  2. Python
  3. Tableau

For every part there are different Questions that should be answerd. They can be found in the coresponding solution files.

### Main Objectiv for Python:
The task is to build a model that will provide insight into why some bank customers accept credit card offers. There are also other potential areas of opportunities that the bank wants to understand from the data.
Your senior management has also posted these other questions that will help them better understand their customers.

## Dataset 
In this project, I used the provided [**creditcardmarketing**](https://github.com/Ironhack-Data-0621-Remote/mid-bootcamp-project/tree/master/classification/data) dataset.

**Data**: The data set consists of information on 18,000 current bank customers in the study. These are the definitions of data points provided:

- **Customer Number**: A sequential number assigned to the customers (this column is hidden and excluded – this unique identifier will not be used directly).
- **Offer Accepted**: Did the customer accept (Yes) or reject (No) the offer. 
- **Reward:** The type of reward program offered for the card.
- **Mailer Type**: Letter or postcard.
- **Income Level**: Low, Medium or High.
- **#Bank Accounts Open**: How many non-credit-card accounts are held by the customer.
- **Overdraft Protection**: Does the customer have overdraft protection on their checking account(s) (Yes or No).
- **Credit Rating**: Low, Medium or High.
- **#Credit Cards Held**: The number of credit cards held at the bank.
- **#Homes Owned**: The number of homes owned by the customer.
- **Household Size**: Number of individuals in the family.
- **Own Your Home**: Does the customer own their home? (Yes or No).
- **Average Balance**: Average account balance (across all accounts over time). **Q1, Q2, Q3 and Q4**
- **Balance**: Average balance for each quarter in the last year

## Workflow
After expolring the structur of the dataset in MySQL Workbench to get an understanding of the data, I stared answering the questions that you also can find in the SQL Solution File.

From there I went on with the Python part. After importing all nesessary libraries and loading the data from SQL, I did some more data exploration. After I get a feel for it, I did some data cleaning: droping duplicates (there were none), renaming the columns, droping unesessary columns, searching for null values (there were none), changing outliers in numerical columns etc.
After that, I tried differten classifiers:
- Logistic Regression (simple, with balanced class_weight and a specific class_weight)
- Repeat the point above with a SMOTE database
- KNNClassifier with different n_neighbors and with SMOTE data
- DecisionTreeClassifier with differen class weights

The last step was answering the Tableau Questions and creating the diagramms.

## Conclusion
For the Python part:
If you are only interessted in the best True Yes rate, than you should use LogisticRegression with specific weights and SMOTE for the train set. But keep in mind that you also get a high False No rate.


## Libraries
pymysql

sqlalchemy import create_engine

pandas

numpy

getpass

matplotlib.pyplot

seaborn

scipy.stats

os

statsmodels.api
