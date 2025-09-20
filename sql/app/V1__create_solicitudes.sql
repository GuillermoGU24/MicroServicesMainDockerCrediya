-- =========================
-- Tabla de estados
-- =========================
CREATE TABLE estados (
    id_estado SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT
);

-- =========================
-- Tabla de tipos de préstamo
-- =========================
CREATE TABLE tipo_prestamo (
    id_tipo_prestamo SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    monto_minimo NUMERIC(12,2) NOT NULL,
    monto_maximo NUMERIC(12,2) NOT NULL,
    tasa_interes NUMERIC(5,2) NOT NULL, -- Ejemplo: 12.50 (%)
    validacion_automatica BOOLEAN DEFAULT false
);

-- =========================
-- Tabla de solicitudes
-- =========================
CREATE TABLE solicitud (
    id_solicitud SERIAL PRIMARY KEY,
    monto NUMERIC(12,2) NOT NULL,
    plazo INT NOT NULL,
    id_estado INT NOT NULL,
    id_tipo_prestamo INT NOT NULL,
    documento VARCHAR(50) NOT NULL,
    CONSTRAINT fk_solicitud_estado FOREIGN KEY (id_estado) REFERENCES estados(id_estado),
    CONSTRAINT fk_solicitud_tipo FOREIGN KEY (id_tipo_prestamo) REFERENCES tipo_prestamo(id_tipo_prestamo)
);

-- =========================
-- INSERT para la tabla estados
-- =========================
INSERT INTO estados (id_estado, nombre, descripcion) VALUES 
(1, 'Pendiente de revisión', 'La solicitud fue registrada pero aún no evaluada'),
(2, 'Aprobado', 'La solicitud fue evaluada y aprobada'),
(3, 'Rechazado', 'La solicitud fue evaluada y rechazada');


-- =========================
-- INSERT para la tabla tipo_prestamo
-- =========================
INSERT INTO tipo_prestamo (
    id_tipo_prestamo, 
    nombre, 
    monto_minimo, 
    monto_maximo, 
    tasa_interes, 
    validacion_automatica
) VALUES 
(1, 'Libre Inversión', 1000000.00, 50000000.00, 18.50, true),
(2, 'Hipotecario', 20000000.00, 500000000.00, 12.00, false),
(3, 'Educativo', 500000.00, 10000000.00, 10.50, true),
(4, 'Vehículo', 10000000.00, 100000000.00, 14.00, false);


