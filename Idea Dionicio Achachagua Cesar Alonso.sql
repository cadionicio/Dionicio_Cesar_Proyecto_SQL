-- Crear la base de datos si no existe
CREATE DATABASE IF NOT EXISTS LearnOnline;

-- Usar la base de datos LearnOnline
USE LearnOnline;

-- Tabla de Métodos de Pago: Almacena los diferentes métodos de pago disponibles
CREATE TABLE IF NOT EXISTS Metodos_Pago (
    ID_Metodo INT AUTO_INCREMENT PRIMARY KEY, -- Identificador único del método de pago
    Nombre VARCHAR(50) NOT NULL, -- Nombre descriptivo del método de pago
    UNIQUE INDEX (Nombre) -- Asegura que el nombre del método de pago sea único
);

-- Tabla de Categorías de Cursos: Almacena las categorías a las que pueden pertenecer los cursos
CREATE TABLE IF NOT EXISTS Categorias_Cursos (
    ID_Categoria INT AUTO_INCREMENT PRIMARY KEY, -- Identificador único de la categoría de cursos
    Nombre VARCHAR(100) NOT NULL, -- Nombre de la categoría
    Descripcion TEXT, -- Breve descripción de la categoría
    UNIQUE INDEX (Nombre) -- Asegura que el nombre de la categoría sea único
);

-- Tabla de Instructores: Almacena información sobre los instructores
CREATE TABLE IF NOT EXISTS Instructores (
    ID_Instructor INT AUTO_INCREMENT PRIMARY KEY, -- Identificador único del instructor
    Nombre VARCHAR(255) NOT NULL, -- Nombre del instructor
    Apellido VARCHAR(255) NOT NULL, -- Apellido del instructor
    Correo_Electronico VARCHAR(255) UNIQUE NOT NULL, -- Correo electrónico único del instructor
    Especialidad VARCHAR(100) -- Especialidad del instructor
);

-- Tabla de Estudiantes: Almacena información sobre los estudiantes
CREATE TABLE IF NOT EXISTS Estudiantes (
    ID_Estudiante INT AUTO_INCREMENT PRIMARY KEY, -- Identificador único del estudiante
    Nombre VARCHAR(255) NOT NULL, -- Nombre del estudiante
    Apellido_Paterno VARCHAR(255) NOT NULL, -- Apellido paterno del estudiante
    Apellido_Materno VARCHAR(255) NOT NULL, -- Apellido materno del estudiante
    Correo_Electronico VARCHAR(255) UNIQUE NOT NULL, -- Correo electrónico único del estudiante
    Confirmar_Correo_Electronico VARCHAR(255) NOT NULL, -- Confirmación del correo electrónico
    DNI VARCHAR(20) UNIQUE NOT NULL, -- Documento Nacional de Identidad único del estudiante
    Pais_Residencia VARCHAR(100) NOT NULL, -- País de residencia del estudiante
    Departamento_Residencia VARCHAR(100) NOT NULL, -- Departamento de residencia del estudiante
    Provincia_Residencia VARCHAR(100) NOT NULL, -- Provincia de residencia del estudiante
    Distrito_Residencia VARCHAR(100) NOT NULL, -- Distrito de residencia del estudiante
    Telefono VARCHAR(20), -- Teléfono del estudiante
    Celular VARCHAR(20), -- Celular del estudiante
    Fecha_Registro DATE NOT NULL -- Fecha de registro del estudiante
);

-- Tabla de Cursos: Almacena información sobre los cursos
CREATE TABLE IF NOT EXISTS Cursos (
    ID_Curso INT AUTO_INCREMENT PRIMARY KEY, -- Identificador único del curso
    Nombre VARCHAR(255) NOT NULL, -- Nombre del curso
    Descripcion TEXT, -- Descripción detallada del curso
    ID_Instructor INT, -- Identificador del instructor a cargo del curso
    Fecha_Inicio DATE, -- Fecha de inicio del curso
    Fecha_Fin DATE, -- Fecha de finalización del curso
    Precio DECIMAL(10, 2) NOT NULL, -- Precio del curso
    FOREIGN KEY (ID_Instructor) REFERENCES Instructores(ID_Instructor), -- Clave foránea a la tabla Instructores
    UNIQUE INDEX (Nombre, ID_Instructor) -- Asegura que no haya cursos duplicados por el mismo instructor
);

-- Tabla de Comisiones (Ciclos): Almacena información sobre las comisiones o ciclos en los que se ofrecen los cursos
CREATE TABLE IF NOT EXISTS Comisiones (
    ID_Comision INT AUTO_INCREMENT PRIMARY KEY, -- Identificador único de la comisión
    Nombre VARCHAR(255) NOT NULL, -- Nombre de la comisión
    Descripcion TEXT, -- Descripción de la comisión
    Fecha_Inicio DATE NOT NULL, -- Fecha de inicio de la comisión
    Fecha_Fin DATE NOT NULL, -- Fecha de finalización de la comisión
    Modalidad VARCHAR(100) NOT NULL, -- Modalidad de la comisión (presencial, en línea, etc.)
    Duracion VARCHAR(100) NOT NULL, -- Duración de la comisión
    Horarios VARCHAR(255) NOT NULL, -- Horarios de la comisión
    UNIQUE INDEX (Nombre, Fecha_Inicio, Fecha_Fin) -- Asegura que no haya duplicados en comisiones
);

-- Tabla de Matrículas: Almacena información sobre las matrículas de los estudiantes en los cursos
CREATE TABLE IF NOT EXISTS Matriculas (
    ID_Matricula INT AUTO_INCREMENT PRIMARY KEY, -- Identificador único de la matrícula
    ID_Estudiante INT NOT NULL, -- Identificador del estudiante
    ID_Curso INT NOT NULL, -- Identificador del curso
    Fecha_Matricula DATE NOT NULL, -- Fecha en que se realizó la matrícula
    ID_Metodo INT NOT NULL, -- Identificador del método de pago
    ID_Comision INT NOT NULL, -- Identificador de la comisión
    Precio_Pagar DECIMAL(10, 2) NOT NULL, -- Precio a pagar por el ciclo matriculado
    FOREIGN KEY (ID_Estudiante) REFERENCES Estudiantes(ID_Estudiante), -- Clave foránea a la tabla Estudiantes
    FOREIGN KEY (ID_Curso) REFERENCES Cursos(ID_Curso), -- Clave foránea a la tabla Cursos
    FOREIGN KEY (ID_Metodo) REFERENCES Metodos_Pago(ID_Metodo), -- Clave foránea a la tabla Metodos_Pago
    FOREIGN KEY (ID_Comision) REFERENCES Comisiones(ID_Comision), -- Clave foránea a la tabla Comisiones
    UNIQUE INDEX (ID_Estudiante, ID_Curso, ID_Comision) -- Evita duplicados en matrículas del mismo estudiante para el mismo curso y comisión
);

-- Tabla de Calificaciones: Almacena las calificaciones de los estudiantes en los cursos
CREATE TABLE IF NOT EXISTS Calificaciones (
    ID_Calificacion INT AUTO_INCREMENT PRIMARY KEY, -- Identificador único de la calificación
    ID_Estudiante INT NOT NULL, -- Identificador del estudiante
    ID_Curso INT NOT NULL, -- Identificador del curso
    ID_Comision INT NOT NULL, -- Identificador de la comisión
    Calificacion DECIMAL(5, 2) NOT NULL, -- Calificación obtenida por el estudiante
    Fecha_Evaluacion DATE NOT NULL, -- Fecha en que se realizó la evaluación
    FOREIGN KEY (ID_Estudiante) REFERENCES Estudiantes(ID_Estudiante), -- Clave foránea a la tabla Estudiantes
    FOREIGN KEY (ID_Curso) REFERENCES Cursos(ID_Curso), -- Clave foránea a la tabla Cursos
    FOREIGN KEY (ID_Comision) REFERENCES Comisiones(ID_Comision) -- Clave foránea a la tabla Comisiones
);

-- Tabla de Relación Cursos_Categorias: Almacena la relación entre cursos y categorías
CREATE TABLE IF NOT EXISTS Cursos_Categorias (
    ID_Cursos_Categorias INT AUTO_INCREMENT PRIMARY KEY, -- Identificador único de la relación curso-categoría
    ID_Curso INT, -- Identificador del curso
    ID_Categoria INT, -- Identificador de la categoría
    FOREIGN KEY (ID_Curso) REFERENCES Cursos(ID_Curso), -- Clave foránea a la tabla Cursos
    FOREIGN KEY (ID_Categoria) REFERENCES Categorias_Cursos(ID_Categoria), -- Clave foránea a la tabla Categorias_Cursos
    UNIQUE INDEX (ID_Curso, ID_Categoria) -- Evita duplicados en relaciones curso-categoría
);

-- Tabla de Opiniones y Feedback de Estudiantes: Almacena las opiniones y el feedback de los estudiantes sobre los cursos
CREATE TABLE IF NOT EXISTS Opiniones_Estudiantes (
    ID_Opinion INT AUTO_INCREMENT PRIMARY KEY, -- Identificador único de la opinión
    ID_Estudiante INT NOT NULL, -- Identificador del estudiante
    ID_Curso INT NOT NULL, -- Identificador del curso
    ID_Comision INT NOT NULL, -- Identificador de la comisión
    Fecha DATE NOT NULL, -- Fecha en que se dejó la opinión
    Calificacion INT NOT NULL, -- Calificación numérica asignada por el estudiante
    Comentario TEXT, -- Comentario del estudiante sobre su experiencia
    FOREIGN KEY (ID_Estudiante) REFERENCES Estudiantes(ID_Estudiante), -- Clave foránea a la tabla Estudiantes
    FOREIGN KEY (ID_Curso) REFERENCES Cursos(ID_Curso), -- Clave foránea a la tabla Cursos
    FOREIGN KEY (ID_Comision) REFERENCES Comisiones(ID_Comision) -- Clave foránea a la tabla Comisiones
);

-- Tabla de Historial de Estudiantes: Almacena el historial de transacciones realizadas por los estudiantes
CREATE TABLE IF NOT EXISTS Historial_Estudiantes (
    ID_Registro INT AUTO_INCREMENT PRIMARY KEY, -- Identificador único del registro
    ID_Estudiante INT NOT NULL, -- Identificador del estudiante
    Fecha_Transaccion DATE NOT NULL, -- Fecha en que se realizó la transacción
    Tipo_Transaccion VARCHAR(50) NOT NULL, -- Tipo de transacción realizada (matrícula, calificación, opinión)
    Total_Gastado DECIMAL(10, 2), -- Total gastado por el estudiante en la transacción
    FOREIGN KEY (ID_Estudiante) REFERENCES Estudiantes(ID_Estudiante) -- Clave foránea a la tabla Estudiantes
);

-- Tabla de Historial de Precios de Cursos: Almacena el historial de cambios en los precios de los cursos
CREATE TABLE IF NOT EXISTS Historial_Precios_Cursos (
    ID_Historial INT AUTO_INCREMENT PRIMARY KEY, -- Identificador único del historial
    ID_Curso INT NOT NULL, -- Identificador del curso
    Fecha_Cambio DATE NOT NULL, -- Fecha en que se realizó el cambio de precio
    Precio_Anterior DECIMAL(10, 2) NOT NULL, -- Precio anterior del curso
    Precio_Nuevo DECIMAL(10, 2) NOT NULL, -- Nuevo precio del curso
    Razon_Cambio VARCHAR(255), -- Razón por la cual se realizó el cambio de precio
    FOREIGN KEY (ID_Curso) REFERENCES Cursos(ID_Curso) -- Clave foránea a la tabla Cursos
);

-- Tabla de Transacciones de Inscripción: Almacena las transacciones de inscripción y cancelación de inscripción de los estudiantes en los cursos
CREATE TABLE IF NOT EXISTS Transacciones_Inscripcion (
    ID_Transaccion INT AUTO_INCREMENT PRIMARY KEY, -- Identificador único de la transacción
    Tipo_Transaccion VARCHAR(50) NOT NULL, -- Tipo de transacción (inscripción o cancelación de inscripción)
    Fecha DATE NOT NULL, -- Fecha en que se realizó la transacción
    ID_Estudiante INT NOT NULL, -- Identificador del estudiante
    ID_Curso INT NOT NULL, -- Identificador del curso
    Cantidad_Afectada INT NOT NULL, -- Cantidad de cursos inscritos o cancelados
    ID_Empleado INT NOT NULL, -- Identificador del empleado que realizó la transacción
    Motivo VARCHAR(255), -- Razón o motivo de la transacción
    FOREIGN KEY (ID_Estudiante) REFERENCES Estudiantes(ID_Estudiante), -- Clave foránea a la tabla Estudiantes
    FOREIGN KEY (ID_Curso) REFERENCES Cursos(ID_Curso), -- Clave foránea a la tabla Cursos
    FOREIGN KEY (ID_Empleado) REFERENCES Instructores(ID_Instructor) -- Clave foránea a la tabla Instructores
);

