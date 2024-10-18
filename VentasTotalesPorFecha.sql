CREATE VIEW [DWH].[VentasTotalesPorFecha] AS
SELECT top 100 percent
    df.Año,
    df.NombreMes AS Mes,
    FORMAT(SUM(od.UnitPrice * od.Quantity), 'N2', 'en-US') AS TotalVentas
FROM 
    Orders o
INNER JOIN 
    [Order Details] od ON o.OrderID = od.OrderID
INNER JOIN 
    DimFecha df ON o.OrderDate = df.Fecha
GROUP BY 
    df.Año,
    df.NombreMes
ORDER BY 
    df.Año, 
    df.NombreMes;