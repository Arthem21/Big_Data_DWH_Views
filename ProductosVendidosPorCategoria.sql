CREATE VIEW [DWH].[ProductosVendidosPorCategoria] AS
SELECT top 100 percent  
	c.CategoryName, 
	p.ProductName, 
	FORMAT(SUM(od.Quantity), 'N0', 'en-US') AS TotalCantidadVendida
FROM 
	Categories c
JOIN 
	Products p ON c.CategoryID = p.CategoryID
JOIN 
	[Order Details] od ON p.ProductID = od.ProductID
GROUP BY 
	c.CategoryName, 
	p.ProductName
ORDER BY 
	c.CategoryName, 
	SUM(od.Quantity) DESC;