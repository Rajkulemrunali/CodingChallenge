CREATE DATABASE Payxpert;
CREATE TABLE Employee(
	EmployeeID int Primary Key,
	FirstName varchar(100) not null,
	LastName varchar(100) not null,
	DOB date not null,
	Gender varchar(10) not null,
	Email varchar(100) not null unique,
	PhoneNumber bigint not null,
	Address varchar(250) not null,
	Position varchar(100) not null,
	JoiningDate date not null,
	Termination date 
);
CREATE TABLE Payroll(
	PayrollID int Primary Key,
	EmployeeID int ,
	PayPeriodStartDate date not null,
	PayPeriodEndDate date not null,
	BasicSalary decimal(10, 2)  not null,
    OvertimePay decimal(10, 2) default 0,
    Deductions decimal(10, 2) default 0,
	NetSalary decimal(10,2) ,
	Foreign Key (EmployeeID) references Employee(EmployeeID)
);
CREATE TABLE Tax (
    TaxID int Primary Key,
    EmployeeID int,
    TaxYear int not null,
    TaxableIncome decimal(10, 2) not null,
    TaxAmount decimal(10, 2) not null,
    Foreign Key (EmployeeID) references Employee(EmployeeID)
);
CREATE TABLE FinancialRecord (
    RecordID int Primary Key,
    EmployeeID int,
    RecordDate date not null,
    Description varchar(255) not null,
    Amount decimal(10, 2) not null,
    RecordType varchar(50) not null ,
    Foreign Key (EmployeeID) references Employee(EmployeeID)
);
INSERT INTO Employee (EmployeeID, FirstName, LastName, DOB, Gender, Email, PhoneNumber, Address, Position, JoiningDate, Termination)
VALUES 
(1, 'Rajesh', 'Sharma', '1985-02-15', 'Male', 'rajesh.sharma@gmail.com', 9876543210, 'Mumbai, India', 'Software Engineer', '2015-01-05', NULL),
(2, 'Amit', 'Kumar', '1990-06-23', 'Male', 'amit.kumar@yahoo.com', 9845123476, 'Delhi, India', 'HR Manager', '2013-05-12', '2023-03-10'),
(3, 'Priya', 'Singh', '1987-11-19', 'Female', 'priya.singh@outlook.com', 9834567812, 'Bangalore, India', 'Senior Developer', '2016-06-10', NULL),
(4, 'John', 'Doe', '1992-09-25', 'Male', 'john.doe@gmail.com', 9812345678, 'New York, USA', 'Team Lead', '2018-02-15', NULL),
(5, 'Sara', 'Ali', '1995-03-12', 'Female', 'sara.ali@company.com', 9876501234, 'Hyderabad, India', 'Project Manager', '2017-07-01', '2022-08-31'),
(6, 'Anjali', 'Verma', '1980-01-05', 'Female', 'anjali.verma@hotmail.com', 9876432109, 'Pune, India', 'Marketing Head', '2014-04-10', NULL),
(7, 'David', 'Johnson', '1983-04-15', 'Male', 'david.johnson@company.com', 9801234567, 'California, USA', 'Operations Manager', '2012-12-01', NULL),
(8, 'Suresh', 'Patel', '1990-10-10', 'Male', 'suresh.patel@company.com', 9887654321, 'Ahmedabad, India', 'Finance Executive', '2020-09-15', NULL),
(9, 'Rahul', 'Nair', '1986-12-05', 'Male', 'rahul.nair@company.com', 9898123456, 'Chennai, India', 'QA Analyst', '2019-03-20', NULL),
(10, 'Emily', 'Clark', '1991-08-21', 'Female', 'emily.clark@company.com', 9873412789, 'London, UK', 'Product Manager', '2021-01-10', NULL),
(11, 'Vikram', 'Chauhan', '1993-11-22', 'Male', 'vikram.chauhan@company.com', 9887123456, 'Jaipur, India', 'Sales Manager', '2018-11-18', NULL),
(12, 'Kavita', 'Rao', '1988-07-29', 'Female', 'kavita.rao@company.com', 9845123798, 'Kolkata, India', 'Business Analyst', '2017-08-01', '2021-12-15');

INSERT INTO Payroll (PayrollID, EmployeeID, PayPeriodStartDate, PayPeriodEndDate, BasicSalary, OvertimePay, Deductions, NetSalary)
VALUES 
(1, 1, '2018-09-01', '2018-09-30', 75000, 5000, 2000, 78000),
(2, 2, '2016-08-01', '2016-08-31', 85000, 4000, 3000, 86000),
(3, 3, '2019-07-01', '2019-07-31', 90000, 3000, 2500, 90500),
(4, 4, '2020-05-01', '2020-05-31', 100000, 6000, 4000, 102000),
(5, 5, '2017-11-01', '2017-11-30', 95000, 2000, 1500, 95500),
(6, 6, '2021-09-01', '2021-09-30', 120000, 7000, 5000, 122000),
(7, 7, '2015-09-01', '2015-09-30', 130000, 8000, 6000, 132000),
(8, 8, '2019-03-01', '2019-03-31', 65000, 4000, 1000, 68000),
(9, 9, '2018-04-01', '2018-04-30', 55000, 2000, 1500, 56000),
(10, 10, '2022-07-01', '2022-07-31', 110000, 5000, 3000, 112000),
(11, 11, '2020-08-01', '2020-08-31', 78000, 3000, 1200, 79800),
(12, 12, '2016-06-01', '2016-06-30', 82000, 4000, 2200, 83800);

INSERT INTO Tax (TaxID, EmployeeID, TaxYear, TaxableIncome, TaxAmount)
VALUES 
(1, 1, 2018, 800000, 100000),
(2, 2, 2016, 850000, 105000),
(3, 3, 2019, 900000, 110000),
(4, 4, 2020, 1000000, 125000),
(5, 5, 2017, 950000, 118000),
(6, 6, 2021, 1200000, 150000),
(7, 7, 2015, 1300000, 160000),
(8, 8, 2019, 650000, 80000),
(9, 9, 2018, 600000, 75000),
(10, 10, 2022, 1100000, 140000),
(11, 11, 2020, 780000, 97000),
(12, 12, 2016, 820000, 102000);

INSERT INTO FinancialRecord (RecordID, EmployeeID, RecordDate, Description, Amount, RecordType)
VALUES 
(1, 1, '2018-09-15', 'Salary Payment', 78000, 'Income'),
(2, 2, '2016-08-31', 'Salary Payment', 86000, 'Income'),
(3, 3, '2019-07-30', 'Salary Payment', 90500, 'Income'),
(4, 4, '2020-05-31', 'Salary Payment', 102000, 'Income'),
(5, 5, '2017-11-30', 'Salary Payment', 95500, 'Income'),
(6, 6, '2021-09-30', 'Salary Payment', 122000, 'Income'),
(7, 7, '2015-09-30', 'Salary Payment', 132000, 'Income'),
(8, 8, '2019-03-15', 'Salary Payment', 68000, 'Income'),
(9, 9, '2018-04-15', 'Salary Payment', 56000, 'Income'),
(10, 10, '2022-07-31', 'Salary Payment', 112000, 'Income'),
(11, 11, '2020-08-31', 'Salary Payment', 79800, 'Income'),
(12, 12, '2016-06-30', 'Salary Payment', 83800, 'Income');
