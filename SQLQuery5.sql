/*
SELECT OrderID,
	Quantity,
	(SELECT MAX(Quantity) FROM [Order Details]) AS MaksimalnaKolicina
FROM [Order Details]
WHERE ProductID = 23

SELECT Quantity FROM [Order Details]
order by Quantity desc


SELECT ProductID,ProductName,SupplierID
FROM Products 
WHERE SupplierID IN (SELECT SupplierID
FROM Suppliers
WHERE CompanyName IN  ('Exotic Liquids' , 'Tokyo Traders'))


SELECT ProductID,ProductName,UnitPrice
FROM Products
WHERE UnitPrice = (SELECT UnitPrice FROM Products
WHERE ProductName='Longlife Tofu')


SELECT CustomerID,OrderDate
FROM Orders
WHERE OrderDate IN (SELECT OrderDate FROM Orders)
ORDER BY OrderDate desc


SELECT ProductID,ProductName
FROM Products
WHERE ProductID not in (SELECT ProductID FROM [Order Details])
ORDER BY ProductName
*/
SELECT CustomerID
FROM Customers 
WHERE EXISTS (SELECT [ShipCountry] FROM Orders WHERE [ShipCountry]='France')

