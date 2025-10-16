
CREATE DATABASE ObligatorioDB;

USE ObligatorioDB;
SET DATEFORMAT DMY;

-- Tabla Departamento
CREATE TABLE Departamento (
    idDepartamento INT IDENTITY(1,1) PRIMARY KEY,
    nombreDepartamento VARCHAR(100) NOT NULL
);

-- Tabla Terminal
CREATE TABLE Terminal (
    idTerminal INT IDENTITY(1,1) PRIMARY KEY,
    nombreTerminal VARCHAR(100) NOT NULL,
    idDepartamento INT,
    FOREIGN KEY (idDepartamento) REFERENCES Departamento(idDepartamento)
);

-- Tabla Bus
CREATE TABLE Bus (
    idBus INT IDENTITY(1,1) PRIMARY KEY,
    marca VARCHAR(50) NOT NULL,
    tipo VARCHAR(50) NOT NULL,
    capacidad INT NOT NULL
);

-- Tabla Asiento
CREATE TABLE Asiento (
    idAsiento INT IDENTITY(1,1) PRIMARY KEY, 
    numeroDeFila INT NOT NULL,
    letra CHAR(1) NOT NULL,
    idBus INT,
    FOREIGN KEY (idBus) REFERENCES Bus(idBus)
);

-- Tabla Viaje
CREATE TABLE Viaje (
    idViaje INT IDENTITY(1,1) PRIMARY KEY,
    importe DECIMAL(10, 2) NOT NULL,
    fechaSalida DATE NOT NULL,
    hora TIME NOT NULL,
    duracionViaje TIME,
    descripcion VARCHAR(255),
    idBus INT,
    idAsiento INT,
    idOrigen INT,
    idDestino INT,
    FOREIGN KEY (idBus) REFERENCES Bus(idBus),
    FOREIGN KEY (idAsiento) REFERENCES Asiento(idAsiento),
    FOREIGN KEY (idOrigen) REFERENCES Terminal(idTerminal),
    FOREIGN KEY (idDestino) REFERENCES Terminal(idTerminal)
);

-- Tabla Funcionario
CREATE TABLE Funcionario (
    idFuncionario INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(30) NOT NULL,
    tipoDocumento VARCHAR(30) NOT NULL,
    nDocumento VARCHAR(30) UNIQUE NOT NULL
);

-- Tabla Cliente
CREATE TABLE Cliente (
    idCliente INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(30) NOT NULL,
    apellido1 VARCHAR(30) NOT NULL,
    apellido2 VARCHAR(30),
    tipoDocumento VARCHAR(20) NOT NULL DEFAULT 'CI' CHECK (tipoDocumento IN ('CI', 'Pasaporte')),
    nDocumento VARCHAR(30) NOT NULL,
    fechaNacimiento DATE NOT NULL,
    correo VARCHAR(100) UNIQUE NOT NULL,
    contrasena VARCHAR(20) CHECK (LEN(contrasena) BETWEEN 8 AND 20) 
);

-- Tabla ClienteTel
CREATE TABLE ClienteTel (
    idCliente INT,
    telCliente VARCHAR(20),
    PRIMARY KEY (idCliente, telCliente),
    FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente)
);

-- Tabla NoMercosur
CREATE TABLE NoMercosur (
    idCliente INT PRIMARY KEY,
    FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente)
);

-- Tabla Mercosur
CREATE TABLE Mercosur (
    idCliente INT PRIMARY KEY,
    FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente)
);

-- Tabla Beneficio
CREATE TABLE Beneficio (
    idBeneficio INT IDENTITY(1,1) PRIMARY KEY,
    descripcion VARCHAR(255) NOT NULL
);

-- Tabla Pasaje
CREATE TABLE Pasaje (
    idPasaje INT IDENTITY(1,1) PRIMARY KEY,
    estado VARCHAR(50) NOT NULL,
    fechaDeCompra DATE NOT NULL,
    idViaje INT,
    FOREIGN KEY (idViaje) REFERENCES Viaje(idViaje)
);

-- Tabla Registra
CREATE TABLE Registra (
    idFuncionario INT,
    idCliente INT,
    PRIMARY KEY (idFuncionario, idCliente),
    FOREIGN KEY (idFuncionario) REFERENCES Funcionario(idFuncionario),
    FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente)
);

-- Tabla Compra
CREATE TABLE Compra (
    idCliente INT,
    idPasaje INT,
    PRIMARY KEY (idCliente, idPasaje),
    FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente),
    FOREIGN KEY (idPasaje) REFERENCES Pasaje(idPasaje)
);

-- Tabla Recibe
CREATE TABLE Recibe (
    idCliente INT,
    idBeneficio INT,
    PRIMARY KEY (idCliente, idBeneficio),
    FOREIGN KEY (idCliente) REFERENCES Mercosur(idCliente),
    FOREIGN KEY (idBeneficio) REFERENCES Beneficio(idBeneficio)
);

