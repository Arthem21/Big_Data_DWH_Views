
CREATE INDEX idx_Fechas ON Orders (OrderDate);

CREATE INDEX idx_CategoriaIDs ON Products (CategoryID);

CREATE INDEX idx_Regiones ON Customers (Region);

CREATE INDEX idx_Paises ON Customers (Country);

CREATE INDEX idx_EmpleadosID ON Orders (EmployeeID);

CREATE INDEX idx_ProductosID ON [Order Details] (ProductID);

CREATE INDEX idx_ProveedoresID ON Orders (ShipVia);

CREATE INDEX idx_ClientesID ON Orders (CustomerID);
