CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    Email NVARCHAR(100),
    City NVARCHAR(50)
);

INSERT INTO Customers (CustomerID, FirstName, LastName, Email, City) VALUES
(1, 'Rajesh', 'Kumar', 'rajesh.kumar@example.com', 'Chennai'),
(2, 'Anita', 'Sharma', 'anita.sharma@example.com', 'Bangalore'),
(3, 'Vikram', 'Reddy', 'vikram.reddy@example.com', 'Hyderabad');
