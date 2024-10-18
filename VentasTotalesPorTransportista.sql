CREATE VIEW [DWH].[VentasTotalesPorTransportista] AS
SELECT top 100 percent  
	s.CompanyName AS Transportista, 
	FORMAT(SUM(od.Quantity * od.UnitPrice), 'N2', 'en-US')  AS TotalVentas
FROM Shippers s
JOIN 
	Orders o ON s.ShipperID = o.ShipVia
JOIN 
	[Order Details] od ON o.OrderID = od.OrderID
GROUP BY 
	s.CompanyNameORDER BY 
	TotalVentas DESC;
