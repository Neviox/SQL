/*Kreirajte sljede�e korisni�ke funkcije, te SELECT izraz koji ih poziva.*/

/*1. Funkciju fnIznosStavke koja ra�una iznos stavke narud�be.
Ispi�ite sve stavke narud�bi te ukupan iznos svake od njih kori�tenjem prethodno definirane funkcije.*/

CREATE FUNCTION fnIznosStavke
(
	@UnitPrice MONEY,
	@Quantity SMALLINT,
	@Dicount REAL
)

RETURNS MONEY
AS
BEGIN

	RETURN	((@UnitPrice * @Quantity) - (@UnitPrice * @Quantity * @Dicount))

END

/* primjer sa koristenjem tmp varijable
RETURNS Money
AS
BEGIN
	DECLARE @tmpTotalPriceWithDiscount Money
	SET @tmpTotalPriceWithDiscount = ((@UnitPrice * @Quantity) - (@UnitPrice * @Quantity * @Dicount))
RETURN tmpTotalPriceWithDiscount
END*/

SELECT *, dbo.fnIznosStavke(UnitPrice, Quantity, Discount) AS TotalPrice

FROM [Order Details]


/*2. Funkciju koja vra�a one stavke narud�bi �iji je ukupan iznos ve�i od vrijednosti proslije�ene
kao argument funkcije. Napravite SELECT izraz koji poziva tako definiranu funkciju.*/

CREATE FUNCTION fnParametar
(
	@nIznos INT
)

RETURNS TABLE

AS
RETURN

	SELECT	*, dbo.fnIznosStavke (UnitPrice, Quantity, Discount) AS Total
	FROM	[Order Details]
	WHERE	dbo.fnIznosStavke (UnitPrice, Quantity, Discount) > @nIznos

GO

SELECT * 

FROM	fnParametar(10000)

/*3. Napi�ite SQL izraze koji bri�u prethodno kreirane objekte*/

DROP FUNCTION dbo.fnIznosStavke
DROP FUNCTION dbo.fnParametar



/*Izradite sljede�e pohranjene procedure, te pozive procedura:*/

/*1. Proceduru spSelectAllProducts koja ispisuje sadr�aj tablice Products*/

CREATE PROCEDURE spSelectAllProducts

AS

	SELECT	*
	FROM	Products

GO



EXEC spSelectAllProducts


/*2. Proceduru spSelectProduct koja ispisuje podatke o artiklu, za to�no odre�eni artikl. Id artikla
treba proslijediti kao parametar procedure.*/CREATE PROCEDURE spSelectProduct 
(
	@pID INT
)

AS

	SELECT	*
	FROM	Products
	WHERE	@pID = ProductID

GOEXEC spSelectProduct @pID = 2/*3. Proceduru UpdateProductPrice koja odre�enom artiklu mijenja cijene u novu vrijednosti.*/CREATE PROCEDURE spUpdateProductPrice 
(
	@pID INT, 
	@pUnitPrice MONEY
)

AS
	UPDATE	Products
	SET		UnitPrice = @pUnitPrice
	WHERE	ProductID = @pID

GOEXEC spUpdateProductPrice @pID=2, @pUnitPrice=1950.00SELECT *FROM Products/*4. Proceduru spSalesReport koja daje ime, prezime broj narud�bi i ukupan iznos narud�bi
odre�enog zaposlenika unutar odre�enog vremenskog perioda.
	Procedura prima 4 parametra
	 @startOrderDate
	 @endOrderDate
	 @firstName
	 @lastName*/

CREATE PROCEDURE spSalesReport
(
	@StartOrderDate DATETIME,
	@endOrderDate	DATETIME,
	@firstName		NVARCHAR(15),
	@lastName		NVARCHAR(15)
)

AS

SELECT	FirstName, LastName, Count(*)

FROM Orders o INNER JOIN Employees e
	ON o.EmployeeID = e.EmployeeID

WHERE		FirstName = @firstName
		AND	LastName = @lastName
		AND	OrderDate BETWEEN @StartOrderDate AND @endOrderDate
GROUP BY FirstName, LastName


EXEC spSalesReport @startOrderDate='1996-07-17 00:00:00.000', @endOrderDate='1997-10-07 00:00:00.000', @firstName=Nancy, @lastName=Davolio



/*5. Napi�ite SQL izraze koji bri�u prethodno kreirane pohranjene procedure.*/

DROP PROCEDURE spSelectAllProducts
DROP PROCEDURE spSelectProduct
DROP PROCEDURE spUpdateProductPrice
DROP PROCEDURE spSalesReport