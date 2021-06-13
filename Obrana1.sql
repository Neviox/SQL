-----1.
SELECT TerritoryDescription
FROM Territories 
WHERE TerritoryDescription < 'W%'
ORDER BY TerritoryDescription desc

----2.
SELECT ProductName
FROM Products 
WHERE NOT ProductName LIKE  '%y%'

----3.
SELECT sum((o.UnitPrice*o.Discount) * o.Quantity) as Zbroj
FROM [Order Details] o
WHERE o.OrderID = 10450 AND o.Quantity >=3

----4.
SELECT FirstName,OrderID
FROM Employees e , Orders o
WHERE e.EmployeeID=9
ORDER BY e.FirstName ASC



-----5.
SELECT s.CompanyName,count(od.ProductID) as ProdaniProizvodi
FROM Suppliers s INNER JOIN Products p ON
s.SupplierID = p.SupplierID INNER JOIN [Order Details] od ON
p.ProductID = od.ProductID INNER JOIN Orders o ON
od.OrderID = o.OrderID
GROUP BY s.CompanyName
HAVING count(od.ProductID) < 30
ORDER BY count(od.ProductID) DESC

--------6.
SELECT DISTINCT ProductName
FROM [Products] k INNER JOIN Orders o ON
k.ProductID = o.OrderID
WHERE year(o.OrderDate) = 1997
UNION 
SELECT o.OrderID
FROM [Order Details] p INNER JOIN Orders o  ON
p.OrderID = o.OrderID
WHERE year(o.OrderDate) = 1998
ORDER BY ProductName