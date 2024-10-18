CREATE VIEW [DWH].[OrdenesEnviadasPorTransportista] AS
SELECT top 100 percent
	s.CompanyName AS Transportista, 
	COUNT(o.OrderID)  AS OrdenesEnviadas
FROM 
	Shippers s
JOIN 
	Orders o ON s.ShipperID = o.ShipVia
GROUP BY 
	s.CompanyName
ORDER BY 
	OrdenesEnviadas DESC;
