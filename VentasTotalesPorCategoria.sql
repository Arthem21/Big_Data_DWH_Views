CREATE VIEW [DWH].[VentasTotalesPorCategoria] AS
SELECT top 100 percent
    c.CategoryName AS Categoria,
    FORMAT(SUM(od.UnitPrice * od.Quantity), 'N2', 'en-US') AS TotalVentas
FROM 
    Orders o
INNER JOIN 
    [Order Details] od ON o.OrderID = od.OrderID
INNER JOIN 
    Products p ON od.ProductID = p.ProductID
INNER JOIN 
    Categories c ON p.CategoryID = c.CategoryID
GROUP BY 
    c.CategoryName
order by
	TotalVentas desc;
