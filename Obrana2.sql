/*CREATE PROCEDURE sp_DeleteProducts(@categoryid INT)
AS
SELECT CategoryID
FROM Categories
BEGIN
DELETE FROM Products WHERE CategoryID=@categoryid
END
EXEC sp_DeleteProducts;
*/
/*
CREATE PROCEDURE sp_InsertEmployee(@employeeid INT,@lastname NVARCHAR(20),@firstname NVARCHAR(10),@title NVARCHAR (30),@titleofcourtesy NVARCHAR(25),@birthdate datetime,@hiredate datetime,@address NVARCHAR(60),@city NVARCHAR(15),@region NVARCHAR(15),@postalcode NVARCHAR(10),@country NVARCHAR(15),@homephone NVARCHAR(24),@extension NVARCHAR(4))
AS
INSERT INTO Employees (FirstName, LastName, Title,TitleOfCourtesy,BirthDate,HireDate,Address,City,Region,PostalCode,Country,HomePhone,Extension)
VALUES (@firstname, @lastname,@title,@titleofcourtesy,@birthdate,@hiredate,@address,@city,@region,@postalcode,@country,@homephone,@extension)
END
EXEC sp_InsertEmployee
*/
/*
CREATE PROCEDURE sp_InsertProducts(@cid INT,@qpu CHAR,@up INT,@uis INT,@uoo INT,@rl INT,@dsc BIT)
AS
SELECT CategoryID from Categories WHERE CategoryID=sp_DeleteProducts.@categoryid
INSERT INTO Products (ProductID, ProductName, SupplierID,CategoryID,QuantityPerUnit,UnitPrice,UnitsInStock,UnitsOnOrder,ReorderLevel,Discontinued)
VALUES (@pid, @pn,@sid,@cid,@qpu,@up,@uis,@uoo,@rl,@dsc)
EXEC sp_InsertProducts
*/
/*
CREATE PROCEDURE sp_UpdateProducts2(@p_num INT)
AS
BEGIN
UPDATE Products SET UnitPrice = UnitPrice * 0.9
FROM Products 
WHERE ProductID=@p_num
END
EXEC sp_UpdateProducts
*/


CREATE FUNCTION fn_EmployeesOrderCount(@p_brojnarudzbi int)
RETURNS @Employees TABLE (EmployeeID INT,
EmployeeName NVARCHAR(40),
BROJNARUDZBI INT)

AS
BEGIN
INSERT INTO @Employees
SELECT P.PRODUCTID, P.PRODUCTNAME, COUNT(OD.ORDERID)
FROM PRODUCTS P INNER JOIN "ORDER DETAILS" OD ON P.PRODUCTID=OD.PRODUCTID
GROUP BY P.ProductID, P.ProductName
HAVING COUNT(OD.ORDERID)>@p_brojnarudzbi;

RETURN
END
SELECT * FROM fn_EmployeesOrderCount (10);
