-- Tabla de roles
CREATE TABLE rol (
    id_rol SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT
);

-- Tabla de usuarios
CREATE TABLE usuario (
    id_usuario SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    documento_identidad VARCHAR(50) NOT NULL UNIQUE,
    telefono VARCHAR(50),
    id_rol INT NOT NULL,
    salario_base NUMERIC(12,2),
    fecha_nacimiento DATE,
    direccion TEXT,
    clave_hash VARCHAR(255) NOT NULL,
    CONSTRAINT fk_usuario_rol FOREIGN KEY (id_rol) REFERENCES rol(id_rol)
);


INSERT INTO rol (id_rol, nombre, descripcion) VALUES 
(1, 'ADMIN', 'Administrador del sistema'),
(2, 'ASESOR', 'Asesor que gestiona solicitudes'),
(3, 'CLIENTE', 'Cliente que registra sus propias solicitudes');


INSERT INTO usuario (
    nombre, 
    apellido, 
    email, 
    documento_identidad, 
    telefono, 
    id_rol, 
    salario_base, 
    fecha_nacimiento, 
    direccion, 
    clave_hash
) VALUES (
    'Guillermo',
    'Gil',
    'guillermo@gmail.com',
    '777777777',
    '+573001112233',
    1, -- ADMIN
    3500000.00,
    '1995-08-15',
    'Calle 123 #45-67, Bogotá',
    '$2a$12$F0izmVsZZbvKYCqwW88IpOrppn0DNJ5njQSyHgXSVwGjZCkqBzDAO'
);
