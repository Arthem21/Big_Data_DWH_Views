
CREATE VIEW [DWH].[VentasPorRegionPais]  AS
SELECT top 100 percent
    o.ShipCountry AS Pais,
    o.ShipRegion AS Region,
    FORMAT(SUM(od.UnitPrice * od.Quantity), 'N2', 'en-US') AS TotalVentas
FROM 
    Orders o
INNER JOIN 
    [Order Details] od ON o.OrderID = od.OrderID
GROUP BY 
    o.ShipCountry, 
    o.ShipRegion
order BY 
    o.ShipCountry, 
    o.ShipRegion;