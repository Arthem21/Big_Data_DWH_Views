CREATE VIEW [DWH].[NumeroOrdenesPorCliente] AS
SELECT top 100 percent 
	c.CustomerID, 
	c.CompanyName, 
	FORMAT(COUNT(o.OrderID), 'N0', 'en-US') AS NumeroOrdenes
FROM 
	Customers c
JOIN 
	Orders o ON c.CustomerID = o.CustomerID
GROUP BY 
	c.CustomerID, 
	c.CompanyName
ORDER BY 
	COUNT(o.OrderID) DESC;