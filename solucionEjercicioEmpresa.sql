CREATE DATABASE ServipaqueteLTDA;

USE ServipaqueteLTDA;

CREATE TABLE Centro (
    codigo VARCHAR(20) PRIMARY KEY,
    direccion VARCHAR(100) NOT NULL
);

CREATE TABLE Empleado (
    id VARCHAR(20) PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    salario DECIMAL(10, 2) NOT NULL,
    fecha_ingreso DATE NOT NULL,
    rol VARCHAR(20) NOT NULL,
    codigo_centro VARCHAR(20),
    FOREIGN KEY (codigo_centro) REFERENCES Centro(codigo)
);

CREATE TABLE Cliente (
    id VARCHAR(20) PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);

CREATE TABLE Solicitud (
    numero_seguimiento VARCHAR(20) PRIMARY KEY,
    fecha DATE NOT NULL,
    peso DECIMAL(10, 2) NOT NULL,
    costo DECIMAL(10, 2) NOT NULL,
    estado VARCHAR(20) NOT NULL,
    id_cliente VARCHAR(20),
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id)
);

CREATE TABLE Paquete (
    id VARCHAR(20) PRIMARY KEY,
    estado VARCHAR(20) NOT NULL,
    fecha_registro DATE NOT NULL,
    hora_registro TIME NOT NULL,
    numero_seguimiento VARCHAR(20),
    id_empleado VARCHAR(20),
    codigo_centro VARCHAR(20),
    FOREIGN KEY (numero_seguimiento) REFERENCES Solicitud(numero_seguimiento),
    FOREIGN KEY (id_empleado) REFERENCES Empleado(id),
    FOREIGN KEY (codigo_centro) REFERENCES Centro(codigo)
);
