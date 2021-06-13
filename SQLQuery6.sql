INSERT INTO Employees
(LastName,FirstName,Title,TitleOfCourtesy,BirthDate,HireDate,Address,City,Region,PostalCode,Country,HomePhone,Extension)
VALUES ('Tin','Martinic','CEO','Mr','17-Jan-1996','01-Jan-2021','Periciceva','Split','Dalmatia','21000','Croatia','6215621','+385');

INSERT INTO Orders
(CustomerID,EmployeeID,OrderDate,RequiredDate,ShippedDate,ShipVia,Freight,ShipName,ShipAddress,ShipCity,ShipRegion,ShipPostalCode,ShipCountry)
VALUES
('HANAR','10','17-Feb-1996','18-Jan-1997','12-DEC-1996','3','213215','Ante','ZbrdaZdola','Split','Dalmatia','21000','Croatia'),
('HANAR','10','17-Feb-1996','18-Jan-1997','12-DEC-1996','3','213215','Mate','ZbrdaZdola','Split','Dalmatia','21000','Croatia');

UPDATE Employees
SET Photo='Selfie',
	Notes='ma stas pisat',
	ReportsTo='2',
	PhotoPath='www.link.co'
WHERE EmployeeID='10'


INSERT INTO Employees  /*nemoguce mijenjati autonumber (employeeID)  */
SELECT
LastName,FirstName,Title,TitleOfCourtesy,BirthDate,HireDate,Address,City,Region,PostalCode,Country,HomePhone,Extension,Photo,Notes,ReportsTo,PhotoPath
FROM Employees
WHERE EmployeeID=10

DELETE FROM Employees
WHERE EmployeeID IN 
(SELECT ReportsTo FROM [Orders]
WHERE EmployeeID='10')