/*
SELECT Employees.EmployeeID, Employees.FirstName,
Employees.LastName, Orders.OrderID, Orders.ShippedDate
FROM Employees INNER JOIN Orders ON
Employees.EmployeeID = Orders.EmployeeID
WHERE Orders.ShippedDate > Orders.RequiredDate

SELECT Products.ProductID,
Products.ProductName,[Order Details].Quantity
FROM [Order Details] INNER JOIN Products ON
[Order Details].ProductID = Products.ProductID
GROUP BY Products.ProductID, Products.ProductName,
[Order Details].Quantity
HAVING SUM([Order Details].Quantity) < 200
ORDER BY Products.ProductName

SELECT ordy.OrderID,ordy.OrderDate,
empl.FirstName,empl.LastName,
cust.CustomerID,cust.CompanyName,
cust.ContactName
FROM Employees empl INNER JOIN Orders ordy ON
empl.EmployeeID = ordy.EmployeeID
INNER JOIN Customers cust ON
ordy.CustomerID = cust.CustomerID
ORDER BY ordy.OrderDate

SELECT Products.ProductID,Products.ProductName,COUNT(*)
FROM Products LEFT JOIN [Order Details] ON Products.ProductID=[Order Details].ProductID
GROUP BY Products.ProductID,Products.ProductName,[Order Details].Quantity
ORDER BY Products.ProductName

SELECT Orders.ShipCountry,COUNT(Orders.OrderID) AS BrojNarudzbi,COUNT(Distinct Orders.EmployeeID) AS EmployeeID
FROM Orders  FULL JOIN Employees
ON Orders.ShipCountry=Employees.Country
GROUP BY Orders.ShipCountry,Orders.ShipCountry,Employees.Country

SELECT CompanyName, ContactName, Address,City,
Country,Phone
FROM Customers 
UNION 
SELECT CompanyName, ContactName, Address,City,
Country,Phone 
FROM Suppliers
*/

SELECT e.EmployeeID, e.FirstName, e.LastName
FROM Employees e INNER JOIN Orders
ON e.EmployeeID = Orders.EmployeeID
INNER JOIN Customers ON 
Orders.CustomerID = Customers.CustomerID
WHERE Customers.CustomerID = 'ALFKI'
EXCEPT
SELECT e.EmployeeID, e.FirstName, e.LastName
FROM Employees e INNER JOIN Orders
ON e.EmployeeID = Orders.EmployeeID
INNER JOIN Customers ON 
Orders.CustomerID = Customers.CustomerID
WHERE Customers.CustomerID = 'ROMEY'

SELECT Orders.ShipCity
FROM Orders
INTERSECT
SELECT Suppliers.City
FROM Suppliers