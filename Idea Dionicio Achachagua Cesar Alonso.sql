CREATE DATABASE IF NOT EXISTS OnlineCourses;

-- Usar la base de datos OnlineCourses
USE OnlineCourses;

-- Tabla de Rol de Usuario: Almacena los diferentes roles de usuarios en la plataforma
CREATE TABLE IF NOT EXISTS Rol_Usuario (
    ID_Rol_Usuario INT AUTO_INCREMENT PRIMARY KEY, -- Identificador único del rol
    Nombre VARCHAR(50) UNIQUE NOT NULL, -- Nombre del rol
    Descripcion TEXT -- Descripción del rol
);

-- Tabla de Usuario: Almacena información general de los usuarios
CREATE TABLE IF NOT EXISTS Usuario (
    ID_Usuario INT AUTO_INCREMENT PRIMARY KEY, -- Identificador único del usuario
    Nombre VARCHAR(255) NOT NULL, -- Nombre del usuario
    Apellido VARCHAR(255) NOT NULL, -- Apellido del usuario
    Correo_Electronico VARCHAR(255) UNIQUE NOT NULL, -- Correo electrónico único del usuario
    Contrasena VARCHAR(255) NOT NULL, -- Contraseña del usuario
    ID_Rol_Usuario INT NOT NULL, -- Identificador del rol del usuario
    Fecha_Creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Fecha de creación del registro
    Fecha_Modificacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, -- Fecha de modificación del registro
    FOREIGN KEY (ID_Rol_Usuario) REFERENCES Rol_Usuario(ID_Rol_Usuario) -- Clave foránea a la tabla Rol_Usuario
);

-- Tabla de Método de Pago: Almacena los diferentes métodos de pago disponibles
CREATE TABLE IF NOT EXISTS Metodo_Pago (
    ID_Metodo_Pago INT AUTO_INCREMENT PRIMARY KEY, -- Identificador único del método de pago
    Nombre VARCHAR(50) NOT NULL, -- Nombre descriptivo del método de pago
    Descripcion TEXT, -- Descripción del método de pago
    Estado BOOLEAN NOT NULL, -- Estado del método de pago (disponible o no)
    Fecha_Creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Fecha de creación del registro
    Fecha_Modificacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, -- Fecha de modificación del registro
    ID_Usuario_Creador INT NOT NULL, -- Identificador del usuario que creó el registro
    FOREIGN KEY (ID_Usuario_Creador) REFERENCES Usuario(ID_Usuario),
    UNIQUE INDEX (Nombre) -- Asegura que el nombre del método de pago sea único
);

-- Tabla de Categoría de Curso: Almacena las categorías a las que pueden pertenecer los cursos
CREATE TABLE IF NOT EXISTS Categoria_Curso (
    ID_Categoria_Curso INT AUTO_INCREMENT PRIMARY KEY, -- Identificador único de la categoría de curso
    Nombre VARCHAR(100) NOT NULL, -- Nombre de la categoría
    Descripcion TEXT, -- Breve descripción de la categoría
    Fecha_Creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Fecha de creación del registro
    Fecha_Modificacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, -- Fecha de modificación del registro
    ID_Usuario_Creador INT NOT NULL, -- Identificador del usuario que creó el registro
    FOREIGN KEY (ID_Usuario_Creador) REFERENCES Usuario(ID_Usuario),
    UNIQUE INDEX (Nombre) -- Asegura que el nombre de la categoría sea único
);

-- Tabla de Profesor: Almacena información sobre los profesores
CREATE TABLE IF NOT EXISTS Profesor (
    ID_Profesor INT AUTO_INCREMENT PRIMARY KEY, -- Identificador único del profesor
    Nombre VARCHAR(255) NOT NULL, -- Nombre del profesor
    Apellido VARCHAR(255) NOT NULL, -- Apellido del profesor
    Correo_Electronico VARCHAR(255) UNIQUE NOT NULL, -- Correo electrónico único del profesor
    Especialidad VARCHAR(100), -- Especialidad del profesor
    Fecha_Creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Fecha de creación del registro
    Fecha_Modificacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, -- Fecha de modificación del registro
    ID_Usuario_Creador INT NOT NULL, -- Identificador del usuario que creó el registro
    FOREIGN KEY (ID_Usuario_Creador) REFERENCES Usuario(ID_Usuario)
);

-- Tabla de Estudiante: Almacena información sobre los estudiantes
CREATE TABLE IF NOT EXISTS Estudiante (
    ID_Estudiante INT AUTO_INCREMENT PRIMARY KEY, -- Identificador único del estudiante
    Nombre VARCHAR(255) NOT NULL, -- Nombre del estudiante
    Apellido_Paterno VARCHAR(255) NOT NULL, -- Apellido paterno del estudiante
    Apellido_Materno VARCHAR(255) NOT NULL, -- Apellido materno del estudiante
    Correo_Electronico VARCHAR(255) UNIQUE NOT NULL, -- Correo electrónico único del estudiante
    DNI VARCHAR(20) UNIQUE NOT NULL, -- Documento Nacional de Identidad único del estudiante
    Pais_Residencia VARCHAR(100) NOT NULL, -- País de residencia del estudiante
    Fecha_Registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Fecha de registro del estudiante
    Fecha_Modificacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, -- Fecha de modificación del registro
    ID_Usuario_Creador INT NOT NULL, -- Identificador del usuario que creó el registro
    FOREIGN KEY (ID_Usuario_Creador) REFERENCES Usuario(ID_Usuario)
);

-- Tabla de Curso: Almacena información sobre los cursos
CREATE TABLE IF NOT EXISTS Curso (
    ID_Curso INT AUTO_INCREMENT PRIMARY KEY, -- Identificador único del curso
    Nombre VARCHAR(255) NOT NULL, -- Nombre del curso
    Descripcion TEXT, -- Descripción detallada del curso
    ID_Profesor INT, -- Identificador del profesor a cargo del curso
    Fecha_Inicio DATE, -- Fecha de inicio del curso
    Fecha_Fin DATE, -- Fecha de finalización del curso
    Precio DECIMAL(10, 2) NOT NULL, -- Precio del curso
    Fecha_Creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Fecha de creación del registro
    Fecha_Modificacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, -- Fecha de modificación del registro
    ID_Usuario_Creador INT NOT NULL, -- Identificador del usuario que creó el registro
    FOREIGN KEY (ID_Profesor) REFERENCES Profesor(ID_Profesor), -- Clave foránea a la tabla Profesor
    FOREIGN KEY (ID_Usuario_Creador) REFERENCES Usuario(ID_Usuario),
    UNIQUE INDEX (Nombre, ID_Profesor) -- Asegura que no haya cursos duplicados por el mismo profesor
);

-- Tabla de Comisión (Ciclo): Almacena información sobre las comisiones o ciclos en los que se ofrecen los cursos
CREATE TABLE IF NOT EXISTS Comision (
    ID_Comision INT AUTO_INCREMENT PRIMARY KEY, -- Identificador único de la comisión
    Nombre VARCHAR(255) NOT NULL, -- Nombre de la comisión
    Descripcion TEXT, -- Descripción de la comisión
    Fecha_Inicio DATE NOT NULL, -- Fecha de inicio de la comisión
    Fecha_Fin DATE NOT NULL, -- Fecha de finalización de la comisión
    Modalidad VARCHAR(100) NOT NULL, -- Modalidad de la comisión (presencial, en línea, etc.)
    Duracion VARCHAR(100) NOT NULL, -- Duración de la comisión
    Horarios VARCHAR(255) NOT NULL, -- Horarios de la comisión
    Fecha_Creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Fecha de creación del registro
    Fecha_Modificacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, -- Fecha de modificación del registro
    ID_Usuario_Creador INT NOT NULL, -- Identificador del usuario que creó el registro
    FOREIGN KEY (ID_Usuario_Creador) REFERENCES Usuario(ID_Usuario),
    UNIQUE INDEX (Nombre, Fecha_Inicio, Fecha_Fin) -- Asegura que no haya duplicados en comisiones
);

-- Tabla de Matrícula: Almacena información sobre las matrículas de los estudiantes en los cursos
CREATE TABLE IF NOT EXISTS Matricula (
    ID_Matricula INT AUTO_INCREMENT PRIMARY KEY, -- Identificador único de la matrícula
    ID_Estudiante INT NOT NULL, -- Identificador del estudiante
    ID_Curso INT NOT NULL, -- Identificador del curso
    Fecha_Matricula DATE NOT NULL, -- Fecha en que se realizó la matrícula
    ID_Metodo_Pago INT NOT NULL, -- Identificador del método de pago
    ID_Comision INT NOT NULL, -- Identificador de la comisión
    Precio_Pagar DECIMAL(10, 2) NOT NULL, -- Precio a pagar por el ciclo matriculado
    Fecha_Creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Fecha de creación del registro
    Fecha_Modificacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, -- Fecha de modificación del registro
    ID_Usuario_Creador INT NOT NULL, -- Identificador del usuario que creó el registro
    FOREIGN KEY (ID_Estudiante) REFERENCES Estudiante(ID_Estudiante), -- Clave foránea a la tabla Estudiante
    FOREIGN KEY (ID_Curso) REFERENCES Curso(ID_Curso), -- Clave foránea a la tabla Curso
    FOREIGN KEY (ID_Metodo_Pago) REFERENCES Metodo_Pago(ID_Metodo_Pago), -- Clave foránea a la tabla Metodo_Pago
    FOREIGN KEY (ID_Comision) REFERENCES Comision(ID_Comision), -- Clave foránea a la tabla Comision
    FOREIGN KEY (ID_Usuario_Creador) REFERENCES Usuario(ID_Usuario),
    UNIQUE INDEX (ID_Estudiante, ID_Curso, ID_Comision) -- Evita duplicados en matrículas del mismo estudiante para el mismo curso y comisión
);

-- Tabla de Calificación: Almacena las calificaciones de los estudiantes en los cursos
CREATE TABLE IF NOT EXISTS Calificacion (
    ID_Calificacion INT AUTO_INCREMENT PRIMARY KEY, -- Identificador único de la calificación
    ID_Estudiante INT NOT NULL, -- Identificador del estudiante
    ID_Curso INT NOT NULL, -- Identificador del curso
    ID_Comision INT NOT NULL, -- Identificador de la comisión
    Calificacion DECIMAL(5, 2) NOT NULL, -- Calificación obtenida por el estudiante
    Fecha_Evaluacion DATE NOT NULL, -- Fecha en que se realizó la evaluación
    Fecha_Creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Fecha de creación del registro
    Fecha_Modificacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, -- Fecha de modificación del registro
    ID_Usuario_Creador INT NOT NULL, -- Identificador del usuario que creó el registro
    FOREIGN KEY (ID_Estudiante) REFERENCES Estudiante(ID_Estudiante), -- Clave foránea a la tabla Estudiante
    FOREIGN KEY (ID_Curso) REFERENCES Curso(ID_Curso), -- Clave foránea a la tabla Curso
    FOREIGN KEY (ID_Comision) REFERENCES Comision(ID_Comision), -- Clave foránea a la tabla Comision
    FOREIGN KEY (ID_Usuario_Creador) REFERENCES Usuario(ID_Usuario)
);

-- Tabla de Relación Curso_Categoria: Almacena la relación entre cursos y categorías
CREATE TABLE IF NOT EXISTS Curso_Categoria (
    ID_Curso_Categoria INT AUTO_INCREMENT PRIMARY KEY, -- Identificador único de la relación curso-categoría
    ID_Curso INT, -- Identificador del curso
    ID_Categoria_Curso INT, -- Identificador de la categoría
    Fecha_Creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Fecha de creación del registro
    Fecha_Modificacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, -- Fecha de modificación del registro
    ID_Usuario_Creador INT NOT NULL, -- Identificador del usuario que creó el registro
    FOREIGN KEY (ID_Curso) REFERENCES Curso(ID_Curso), -- Clave foránea a la tabla Curso
    FOREIGN KEY (ID_Categoria_Curso) REFERENCES Categoria_Curso(ID_Categoria_Curso), -- Clave foránea a la tabla Categoria_Curso
    FOREIGN KEY (ID_Usuario_Creador) REFERENCES Usuario(ID_Usuario),
    UNIQUE INDEX (ID_Curso, ID_Categoria_Curso) -- Evita duplicados en relaciones curso-categoría
);

-- Tabla de Opinión de Estudiante: Almacena las opiniones y el feedback de los estudiantes sobre los cursos
CREATE TABLE IF NOT EXISTS Opinion_Estudiante (
    ID_Opinion_Estudiante INT AUTO_INCREMENT PRIMARY KEY, -- Identificador único de la opinión
    ID_Estudiante INT NOT NULL, -- Identificador del estudiante
    ID_Curso INT NOT NULL, -- Identificador del curso
    ID_Comision INT NOT NULL, -- Identificador de la comisión
    Fecha DATE NOT NULL, -- Fecha en que se dejó la opinión
    Calificacion INT NOT NULL, -- Calificación numérica asignada por el estudiante
    Comentario TEXT, -- Comentario del estudiante sobre su experiencia
    Fecha_Creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Fecha de creación del registro
    Fecha_Modificacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, -- Fecha de modificación del registro
    ID_Usuario_Creador INT NOT NULL, -- Identificador del usuario que creó el registro
    FOREIGN KEY (ID_Estudiante) REFERENCES Estudiante(ID_Estudiante), -- Clave foránea a la tabla Estudiante
    FOREIGN KEY (ID_Curso) REFERENCES Curso(ID_Curso), -- Clave foránea a la tabla Curso
    FOREIGN KEY (ID_Comision) REFERENCES Comision(ID_Comision), -- Clave foránea a la tabla Comision
    FOREIGN KEY (ID_Usuario_Creador) REFERENCES Usuario(ID_Usuario)
);

-- Tabla de Historial de Estudiante: Almacena el historial de transacciones realizadas por los estudiantes
CREATE TABLE IF NOT EXISTS Historial_Estudiante (
    ID_Historial_Estudiante INT AUTO_INCREMENT PRIMARY KEY, -- Identificador único del registro
    ID_Estudiante INT NOT NULL, -- Identificador del estudiante
    Fecha_Transaccion DATE NOT NULL, -- Fecha en que se realizó la transacción
    Tipo_Transaccion VARCHAR(50) NOT NULL, -- Tipo de transacción realizada (matrícula, calificación, opinión)
    Total_Gastado DECIMAL(10, 2), -- Total gastado por el estudiante en la transacción
    Fecha_Creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Fecha de creación del registro
    Fecha_Modificacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, -- Fecha de modificación del registro
    ID_Usuario_Creador INT NOT NULL, -- Identificador del usuario que creó el registro
    FOREIGN KEY (ID_Estudiante) REFERENCES Estudiante(ID_Estudiante), -- Clave foránea a la tabla Estudiante
    FOREIGN KEY (ID_Usuario_Creador) REFERENCES Usuario(ID_Usuario)
);

-- Tabla de Historial de Precio de Curso: Almacena el historial de cambios en los precios de los cursos
CREATE TABLE IF NOT EXISTS Historial_Precio_Curso (
    ID_Historial_Precio_Curso INT AUTO_INCREMENT PRIMARY KEY, -- Identificador único del historial
    ID_Curso INT NOT NULL, -- Identificador del curso
    Fecha_Cambio DATE NOT NULL, -- Fecha en que se realizó el cambio de precio
    Precio_Anterior DECIMAL(10, 2) NOT NULL, -- Precio anterior del curso
    Precio_Nuevo DECIMAL(10, 2) NOT NULL, -- Nuevo precio del curso
    Razon_Cambio VARCHAR(255), -- Razón por la cual se realizó el cambio de precio
    Fecha_Creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Fecha de creación del registro
    Fecha_Modificacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, -- Fecha de modificación del registro
    ID_Usuario_Creador INT NOT NULL, -- Identificador del usuario que creó el registro
    FOREIGN KEY (ID_Curso) REFERENCES Curso(ID_Curso),
    FOREIGN KEY (ID_Usuario_Creador) REFERENCES Usuario(ID_Usuario)
);

-- Tabla de Transacción de Inscripción: Almacena las transacciones de inscripción y cancelación de inscripción de los estudiantes en los cursos
CREATE TABLE IF NOT EXISTS Transaccion_Inscripcion (
    ID_Transaccion_Inscripcion INT AUTO_INCREMENT PRIMARY KEY, -- Identificador único de la transacción
    Tipo_Transaccion VARCHAR(50) NOT NULL, -- Tipo de transacción (inscripción o cancelación de inscripción)
    Fecha DATE NOT NULL, -- Fecha en que se realizó la transacción
    ID_Estudiante INT NOT NULL, -- Identificador del estudiante
    ID_Curso INT NOT NULL, -- Identificador del curso
    Cantidad_Afectada INT NOT NULL, -- Cantidad de cursos inscritos o cancelados
    ID_Empleado INT NOT NULL, -- Identificador del empleado que realizó la transacción
    Motivo VARCHAR(255), -- Razón o motivo de la transacción
    Fecha_Creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Fecha de creación del registro
    Fecha_Modificacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, -- Fecha de modificación del registro
    ID_Usuario_Creador INT NOT NULL, -- Identificador del usuario que creó el registro
    FOREIGN KEY (ID_Estudiante) REFERENCES Estudiante(ID_Estudiante),
    FOREIGN KEY (ID_Curso) REFERENCES Curso(ID_Curso),
    FOREIGN KEY (ID_Empleado) REFERENCES Profesor(ID_Profesor),
    FOREIGN KEY (ID_Usuario_Creador) REFERENCES Usuario(ID_Usuario)
);

-- Tabla de Movimiento: Almacena todas las operaciones realizadas
CREATE TABLE IF NOT EXISTS Movimiento (
    ID_Movimiento INT AUTO_INCREMENT PRIMARY KEY, -- Identificador único del movimiento
    Tipo_Movimiento VARCHAR(50) NOT NULL, -- Tipo de movimiento realizado (creación, actualización, eliminación)
    Tabla VARCHAR(50) NOT NULL, -- Nombre de la tabla en la que se realizó el movimiento
    ID_Registro INT NOT NULL, -- Identificador del registro afectado
    Fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Fecha y hora en que se realizó el movimiento
    ID_Usuario INT NOT NULL, -- Identificador del usuario que realizó el movimiento
    FOREIGN KEY (ID_Usuario) REFERENCES Usuario(ID_Usuario)
);


