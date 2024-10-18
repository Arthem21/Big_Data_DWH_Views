CREATE VIEW [DWH].[ClientesAtendidosPorEmpleado] AS
SELECT top 100 percent
    e.EmployeeID,
    e.FirstName+' '+ e.LastName AS Empleado,
    FORMAT(COUNT(DISTINCT o.CustomerID) , 'N0', 'en-US') AS CantidadClientesUnicos
FROM 
    Employees e
INNER JOIN 
    Orders o ON e.EmployeeID = o.EmployeeID
GROUP BY 
    e.EmployeeID,
    e.FirstName,
    e.LastName
order by
	CantidadClientesUnicos desc;