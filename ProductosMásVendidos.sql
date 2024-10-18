
CREATE VIEW [DWH].[ProductosMásVendidos] AS
SELECT top 100 percent 
	p.ProductName as Producto, 
	FORMAT(SUM(od.Quantity), 'N0', 'en-US') AS VentasTotales
FROM 
	Products p
JOIN 
	[Order Details] od ON p.ProductID = od.ProductID
GROUP BY 
	p.ProductName
ORDER BY 
	SUM(od.Quantity) DESC;