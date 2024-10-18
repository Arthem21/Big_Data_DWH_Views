
CREATE VIEW [DWH].[NumeroPedidosPorEmpleado] AS
SELECT top 100 percent
    e.EmployeeID,
    e.FirstName + ' ' + e.LastName AS Empleado,
    FORMAT(COUNT(o.OrderID), 'N0', 'en-US') AS PedidosAtendidos
FROM 
    Employees e
INNER JOIN 
    Orders o ON e.EmployeeID = o.EmployeeID
GROUP BY 
    e.EmployeeID,
    e.FirstName,
    e.LastName
order by COUNT(o.OrderID) desc;