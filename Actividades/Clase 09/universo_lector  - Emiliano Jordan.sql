DROP DATABASE IF EXISTS universo_lector;
CREATE DATABASE Universo_Lector;
USE Universo_Lector;

CREATE TABLE Autor(
	codigo INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    nombre VARCHAR(100) NOT NULL
);

CREATE TABLE Editorial (
	codigo INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    razon_social VARCHAR(200) NOT NULL,
    telefono VARCHAR(100) NOT NULL
);

CREATE TABLE Socio (
	codigo INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    dni INT NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    nombres VARCHAR(100) NOT NULL,
    direccion VARCHAR(200) NOT NULL,
    localidad VARCHAR(100)
);

CREATE TABLE Prestamo (
	codigo INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
	fecha DATETIME NOT NULL,
    fecha_devolucion DATE NOT NULL,
    fecha_tope DATE NOT NULL,
    codigo_socio INT NOT NULL,
    FOREIGN KEY (codigo_socio) REFERENCES Socio(codigo)
);

CREATE TABLE Libro (
	codigo INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    isbn VARCHAR(13) NOT NULL,
    titulo VARCHAR(200) NOT NULL,
    anio_escritura DATE NOT NULL,
    anio_edicion DATE NOT NULL,
    codigo_autor INT NOT NULL,
    codigo_editorial INT NOT NULL,
    FOREIGN KEY (codigo_autor) REFERENCES Autor(codigo),
    FOREIGN KEY (codigo_editorial) REFERENCES Editorial(codigo)
);
CREATE TABLE Volumen (
	codigo INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    deteriorado BOOL NOT NULL,
    codigo_libro INT NOT NULL,
    FOREIGN KEY (codigo_libro) REFERENCES Libro(codigo)
);

CREATE TABLE PrestamoxVolumen (
	codigo INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    codigo_prestamo INT NOT NULL,
    codigo_volumen INT NOT NULL,
    FOREIGN KEY (codigo_prestamo) REFERENCES Prestamo(codigo),
    FOREIGN KEY (codigo_volumen) REFERENCES Volumen(codigo)
)



