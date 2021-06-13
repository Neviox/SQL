/*SELECT 
	(UnitPrice*Quantity)-((UnitPrice*Quantity)*Discount) as CijenaSPopustom,
	UnitPrice,
	Quantity,
	Discount
FROM dbo.[Order Details]

SELECT
	Firstname + LastName + 'can be reached at ' + Extension as ContactInfo
FROM dbo.[Employees]

SELECT
	DATEDIFF(year,BirthDate,HireDate) as StarostZaposlenja
FROM dbo.[Employees]

SELECT
	UnitsInStock,
	UnitPrice,
	CEILING(UnitsInStock*UnitPrice) as UkupnaCijenaZalihaNiza,
	FLOOR((UnitsInStock*UnitPrice)) as UkupnaCijenaZalihaVisa
FROM dbo.[Products]
WHERE UnitsInStock>0
ORDER BY UnitPrice DESC

SELECT COUNT(DISTINCT OrderID) as RazliciteNarudzbe
FROM [Order Details]

SELECT
	OrderID, SUM(Quantity) AS UkupanBrojStavki
FROM [Order Details]
GROUP BY OrderID

SELECT 
	ProductID,
	AVG(UnitPrice) as ProsjecnaCijena
FROM [Products]
GROUP BY ProductID
HAVING AVG(UnitPrice) > 70

SELECT
	TOP 1 ProductID,
	SUM(Quantity)
FROM [Order Details]
GROUP BY ProductID
ORDER BY 2 DESC

SELECT ProductID,
SUM(Quantity * UnitPrice) AS Umnozak,
SUM(Quantity) AS Sum,
MAX(Quantity) AS MAX,
MIN(Quantity) AS MIN
FROM [Order Details]
GROUP BY ProductID
*/
SELECT
	SUM(ProductID) as UkupanBrojNarudzbiIDa
FROM [Order Details]
WHERE OrderID=11 AND Quantity>50
