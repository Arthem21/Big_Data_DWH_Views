CREATE VIEW [DWH].[VentasPorCliente] AS
SELECT top 100 percent 
	c.CustomerID, c.CompanyName, 
	FORMAT(SUM(od.Quantity * od.UnitPrice), 'N2', 'en-US') AS TotalVentas
FROM
	Customers c
JOIN 
	Orders o ON c.CustomerID = o.CustomerID
JOIN 
	[Order Details] od ON o.OrderID = od.OrderID
GROUP BY 
	c.CustomerID, 
	c.CompanyName
ORDER BY 
	SUM(od.Quantity * od.UnitPrice) DESC;