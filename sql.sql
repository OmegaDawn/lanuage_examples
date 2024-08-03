-- Create a table for users
CREATE TABLE Users (
    UserID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100) UNIQUE,
    DateOfBirth DATE
);

-- Insert some sample data into the Users table
INSERT INTO Users (FirstName, LastName, Email, DateOfBirth)
VALUES
    ('Alice', 'Smith', 'alice.smith@example.com', '1985-05-15'),
    ('Bob', 'Johnson', 'bob.johnson@example.com', '1990-08-22'),
    ('Carol', 'White', 'carol.white@example.com', '1978-11-30');

-- Query to select all users
SELECT * FROM Users;

-- Query to select a specific user by LastName
SELECT * FROM Users
WHERE LastName = 'Smith';

-- Update email for a specific user
UPDATE Users
SET Email = 'alice.newemail@example.com'
WHERE UserID = 1;

-- Delete a user by ID
DELETE FROM Users
WHERE UserID = 3;

-- Create an index on the Email column for faster searches
CREATE INDEX idx_email ON Users (Email);
