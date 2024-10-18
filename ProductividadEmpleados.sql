CREATE VIEW [DWH].[ProductividadEmpleados] AS
SELECT top 100 percent
    e.EmployeeID,
    e.FirstName + ' ' + e.LastName AS Empleado,
    FORMAT(SUM(od.UnitPrice * od.Quantity), 'N2', 'en-US') AS TotalVentas
FROM 
    Employees e
INNER JOIN 
    Orders o ON e.EmployeeID = o.EmployeeID
INNER JOIN 
    [Order Details] od ON o.OrderID = od.OrderID
GROUP BY 
    e.EmployeeID,
    e.FirstName,
    e.LastName
order by
	SUM(od.UnitPrice * od.Quantity) desc;