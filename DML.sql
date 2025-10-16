USE ObligatorioDB;
SET DATEFORMAT DMY;

-- Tabla Departamento
INSERT INTO Departamento (nombreDepartamento) VALUES 
('Montevideo'), 
('Canelones'), 
('Maldonado'), 
('Colonia');

-- Tabla Terminal
INSERT INTO Terminal (nombreTerminal, idDepartamento) VALUES 
('Terminal Tres Cruces', 1), 
('Terminal de Canelones', 2), 
('Terminal de Maldonado', 3), 
('Terminal de Colonia', 4);

-- Tabla Bus
INSERT INTO Bus (marca, tipo, capacidad) VALUES 
('Mercedes Benz', 'Semi-Cama', 42), 
('Volvo', 'Cama', 50), 
('Scania', 'Leito', 38), 
('Volkswagen', 'Económico', 30), 
('Toyota', 'Premium', 45);

-- Tabla Asiento
INSERT INTO Asiento (numeroDeFila, letra, idBus) VALUES 
(1, 'A', 1), (1, 'B', 1), (2, 'A', 1), (2, 'B', 1),
(1, 'A', 2), (1, 'B', 2), (2, 'A', 2), (2, 'B', 2),
(1, 'A', 3), (1, 'B', 3), (2, 'A', 3), (2, 'B', 3),
(1, 'A', 4), (1, 'B', 4), (2, 'A', 4), (2, 'B', 4),
(1, 'A', 5), (1, 'B', 5), (2, 'A', 5), (2, 'B', 5);

-- Tabla Viaje
INSERT INTO Viaje (importe, fechaSalida, hora, duracionViaje, descripcion, idBus, idAsiento, idOrigen, idDestino) VALUES 
(750.00, '2024-11-15', '08:00', '05:30', 'Montevideo a Colonia', 1, 1, 1, 4),
(850.00, '2024-11-15', '14:00', '06:00', 'Canelones a Maldonado', 2, 2, 2, 3),
(900.00, '2024-11-16', '09:30', '04:45', 'Montevideo a Maldonado', 3, 3, 1, 3),
(950.00, '2024-11-16', '18:00', '03:30', 'Colonia a Montevideo', 4, 4, 4, 1),
(1100.00, '2024-11-17', '10:00', '02:30', 'Canelones a Montevideo', 5, 5, 2, 1),
(800.00, '2024-09-10', '12:00', '03:00', 'Montevideo a Colonia', 2, 2, 1, 4),
(850.00, '2024-09-15', '15:00', '02:30', 'Montevideo a Maldonado', 3, 3, 1, 3); 

-- Para poder hacer la consulta 4
SET IDENTITY_INSERT Viaje ON  -- Permite que se pueda ingresar un id especifico
INSERT INTO Viaje (idViaje, importe, fechaSalida, hora, duracionViaje, descripcion, idBus, idAsiento, idOrigen, idDestino) VALUES 
(255, 800.00, '2024-09-10', '12:00', '03:00', 'Montevideo a Colonia', 2, 2, 1, 4);
SET IDENTITY_INSERT Viaje OFF

-- Insertar datos en la tabla Funcionario (modificado para evitar duplicados)
INSERT INTO Funcionario (nombre, tipoDocumento, nDocumento) VALUES 
('Juan Perez', 'CI', '12345678'), 
('Maria Gonzalez', 'Pasaporte', 'A9876543'), 
('Carlos Lopez', 'CI', '87654321');

-- Tabla Cliente
INSERT INTO Cliente (nombre, apellido1, apellido2, tipoDocumento, nDocumento, fechaNacimiento, correo, contrasena) VALUES 
('Luis', 'Martinez', 'Perez', 'CI', '53217890', '1990-05-15', 'luis.martinez2024@gmail.com', 'password123'),
('Ana', 'Suarez', NULL, 'Pasaporte', 'B9876543', '1985-08-21', 'ana.suarez@gmail.com', 'securepass'), 
('Jorge', 'Gomez', 'Fernandez', 'CI', '64213789', '1992-12-12', 'jorge.gomez@gmail.com', 'mypassword'), 
('Sofia', 'Rodriguez', 'Diaz', 'CI', '73214567', '1995-03-07', 'soyturista@gmail.com', 'travel1234');

-- Tabla ClienteTel
INSERT INTO ClienteTel (idCliente, telCliente) VALUES 
(1, '099123457'), 
(2, '098765432'), 
(3, '091234567'), 
(4, '092345678');

-- Tabla NoMercosur
INSERT INTO NoMercosur (idCliente) VALUES 
(2), 
(3);

-- Tabla Mercosur
INSERT INTO Mercosur (idCliente) VALUES 
(1), 
(4);

-- Tabla Beneficio
INSERT INTO Beneficio (descripcion) VALUES 
('Descuento 10%'), 
('2x1 en pasajes'), 
('Puntos acumulables'), 
('Acceso a sala VIP');

-- Tabla Pasaje
INSERT INTO Pasaje (estado, fechaDeCompra, idViaje) VALUES 
('Confirmado', '2017-09-01', 6),
('Confirmado', '2017-09-05', 7),
('Confirmado', '2024-11-01', 1), 
('Confirmado', '2024-11-02', 2), 
('Confirmado', '2024-11-03', 3), 
('Confirmado', '2024-11-04', 4),
('Confirmado', '2024-11-05', 5), 
('Confirmado', '2024-11-06', 3), 
('Confirmado', '2024-11-07', 4), 
('Confirmado', '2024-11-08', 1);

INSERT INTO Pasaje (estado, fechaDeCompra, idViaje) 
VALUES ('Confirmado', '2024-11-12', 255);

INSERT INTO Compra (idCliente, idPasaje) VALUES 
(3, 11);

-- Tabla Compra 
INSERT INTO Compra (idCliente, idPasaje) VALUES 
(1, 3), (1, 4), (1, 5), (1, 6), (1, 7), (1, 8), -- Cliente 1 con 6 pasajes
(2, 9), (2, 10), 
(3, 4), 
(4, 1), (4, 2);

-- Tabla Recibe
INSERT INTO Recibe (idCliente, idBeneficio) VALUES 
(1, 1), 
(1, 2), 
(4, 1), 
(4, 3);


