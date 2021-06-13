/*SELECT *
From Employees
SELECT ContactName,CompanyName,ContactTitle,Phone FROM Customers
SELECT CategoryName,Description FROM Categories ORDER BY CategoryName ASC
SELECT CompanyName, Fax, Phone, HomePage,Country
FROM Suppliers  
ORDER BY Country DESC,CompanyName ASC
SELECT ContactName FROM Customers WHERE City = 'Buenos Aires'
SELECT  ProductName,UnitPrice,QuantityPerUnit FROM Products WHERE UnitsInStock IS NULL
SELECT FirstName,LastName FROM Employees WHERE Country <> 'USA'
SELECT City,CompanyName,ContactName FROM Customers WHERE City LIKE 'A%' OR City LIKE 'B%'
SELECT * FROM Orders WHERE Freight > 500
SELECT CompanyName,ContactName,Fax FROM Customers WHERE Fax IS NOT NULL
SELECT FirstName,LastName FROM Employees WHERE ReportsTo IS NULL
SELECT FirstName,LastName FROM Employees WHERE BirthDate BETWEEN 1950 AND 1959
SELECT ProductName,SupplierID FROM Products WHERE SupplierID = 1 OR SupplierID=3 OR SupplierID = 4 
SELECT ShipPostalCode,OrderID,OrderDate FROM Orders WHERE ShipPostalCode LIKE '0238%'
SELECT ContactName,ContactTitle,CompanyName FROM Customers WHERE ContactTitle NOT LIKE '%Sales%'
SELECT FirstName,LastName,City FROM Employees WHERE City <> 'Seattle' AND Country <> 'Washington'*/