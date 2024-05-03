use Task_management;

-- Table for users
CREATE TABLE users (
    id INT PRIMARY KEY IDENTITY(1,1),
    name VARCHAR(255) ,
    email VARCHAR(255),
    phone_number VARCHAR(20) 
);

-- Table for tasks
CREATE TABLE tasks (
    id INT PRIMARY KEY IDENTITY(1,1),
    task_title VARCHAR(255)
);

-- Table for assignments
CREATE TABLE assignments (
    id INT PRIMARY KEY IDENTITY(1,1),
    user_id INT ,
    task_id INT ,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (task_id) REFERENCES tasks(id)
);



-- Insert data into the tasks table
INSERT INTO tasks (task_title)
VALUES
    ('Python'),
    ('Java'),
    ('SQL'),
    ('HTML'),
    ('CSS'),
    ('C'),
    ('C++'),
    ('.NET'),
    ('Ruby'),
    ('Docker'),
    ('Git'),
    ('Linux'),
    ('Golang'),
    ('iOS');



USE Task_management;
GO

-- Add the assignee column to the tasks table

-- Stored Procedure to Assign a Task
CREATE PROCEDURE AssignTask
    @task_title VARCHAR(255),
    @assignee VARCHAR(255)
AS
BEGIN
    UPDATE tasks
    SET assignee = @assignee
    WHERE task_title = @task_title;
END;
GO


select * from users;
select * from tasks;
select * from assignments;

