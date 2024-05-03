create database Task_manag_sys;

use task_manag_sys;

-- Create Users table to store user data
CREATE TABLE Users (
    UserID INT PRIMARY KEY,
    Username NVARCHAR(255),
    Email NVARCHAR(255),
    Password NVARCHAR(255)
);

ALTER TABLE Users
ADD PhoneNumber NVARCHAR(20);


-- Create Tasks table to store task information
CREATE TABLE Tasks (
    TaskID INT IDENTITY(1,1) PRIMARY KEY,
    Title NVARCHAR(255),
    Assignee NVARCHAR(255),
    DueDate DATE,
    Completed BIT,
    ManagerID INT,
    FOREIGN KEY (ManagerID) REFERENCES Users(UserID)
);

-- Create TaskAssignment table to store task assignments
CREATE TABLE TaskAssignment (
    AssignmentID INT PRIMARY KEY,
    TaskID INT,
    UserID INT,
    FOREIGN KEY (TaskID) REFERENCES Tasks(TaskID),
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

-- Create stored procedure to retrieve task information along with assigned users
CREATE PROCEDURE GetTaskInfoWithUsers
AS
BEGIN
    SELECT 
        t.TaskID,
        t.Title,
        t.Assignee,
        t.DueDate,
        t.Completed,
        u.Username AS AssignedUser
    FROM 
        Tasks t
    LEFT JOIN 
        Users u ON t.Assignee = u.UserID;
END;

INSERT INTO Users 
(UserID, Username, Email, Password) 
VALUES 
(1, 'Ritika', 'ritika@gmail.com', 'ritika@123');
INSERT INTO Users 
(UserID, Username, Email, Password) 
VALUES 
(2, 'Riyaa', 'riyaa@gmail.com', 'riyaa@123'),
(3, 'Sunny', 'sunny@gmail.com', 'sunny@123'),
(4, 'sakshi', 'sakshi@gmail.com', 'sakshi@123'),
(5, 'Vikas', 'vikas@gmail.com', 'vikas@123'),
(6, 'monika', 'monika@gmail.com', 'monika@123'),
(7, 'annu', 'annu@gmail.com', 'annu@123'),
(8, 'ranjana', 'ranjanaa@gmail.com', 'ranjana@123'),
(9, 'abhi', 'abhi@gmail.com', 'abhi@123');

USE task_manag_sys;

GO

-- Create a stored procedure to retrieve task information along with assigned users
CREATE PROCEDURE GetTaskInfoWithUsers
AS
BEGIN
    SELECT 
        t.TaskID,
        t.Title,
        t.Assignee,
        t.DueDate,
        t.Completed,
        u.Username AS AssignedUser
    FROM 
        Tasks t
    LEFT JOIN 
        Users u ON t.Assignee = u.UserID;
END;
GO


select * from Users;
select * from Tasks;
select * from TaskAssignment;

SELECT *
FROM TaskAssignment;
-- Drop stored procedure
DROP PROCEDURE IF EXISTS GetTaskInfoWithUsers;

-- Drop TaskAssignment table
DROP TABLE IF EXISTS TaskAssignment;

-- Drop Tasks table
DROP TABLE IF EXISTS Tasks;

-- Drop Users table
DROP TABLE IF EXISTS Users;
-------------------------------------------------------------------------------------------------


CREATE DATABASE task_manag_sys;
USE task_manag_sys;

-- Create Users table to store user data
CREATE TABLE Users (
    UserID INT PRIMARY KEY IDENTITY(1,1),
    Username NVARCHAR(255),
    Email NVARCHAR(255),
    Password NVARCHAR(255)
);

-- Create Tasks table to store task information
CREATE TABLE Tasks (
    TaskID INT PRIMARY KEY IDENTITY(1,1),
    Title NVARCHAR(255),
    Assignee NVARCHAR(255),
    DueDate DATE,
    Completed BIT
);


CREATE PROCEDURE GetTaskInfoWithUsers
AS
BEGIN
    SELECT 
        t.TaskID,
        t.Title,
        t.Assignee,
        t.DueDate,
        t.Completed,
        u.Username AS AssignedUser
    FROM 
        Tasks t
    LEFT JOIN 
        Users u ON t.Assignee = u.UserID;
END;

-- Insert sample data into the Users table
INSERT INTO Users (Username, Email, Password) 
VALUES 
('Ritika', 'ritika@gmail.com', 'ritika@123'),
('Riyaa', 'riyaa@gmail.com', 'riyaa@123'),
('Sunny', 'sunny@gmail.com', 'sunny@123'),
('Sakshi', 'sakshi@gmail.com', 'sakshi@123'),
('Vikas', 'vikas@gmail.com', 'vikas@123');

-- Insert sample data into the Tasks table
INSERT INTO Tasks (Title, Assignee, DueDate, Completed)
VALUES 
('pyhton', 'Ritika', '2024-05-10', 0),
('java', 'Riyaa', '2024-05-15', 0),
('C', 'Sunny', '2024-05-20', 1),
('C++', NULL, '2024-05-25', 0),
('html', 'Sakshi', '2024-05-30', 0);

-- Check the data in the Users table
SELECT * FROM Users;

-- Check the data in the Tasks table
SELECT * FROM Tasks;
