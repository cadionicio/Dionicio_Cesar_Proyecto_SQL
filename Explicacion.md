# LearnOnline Database

Este proyecto consiste en la creación de una base de datos para la plataforma educativa en línea "LearnOnline". La base de datos gestiona información sobre los cursos ofrecidos, los instructores que los imparten, los estudiantes que se inscriben, las matrículas realizadas y las calificaciones obtenidas por los estudiantes. Además, incluye la gestión de métodos de pago, categorías de cursos, comisiones (ciclos) y la retroalimentación de los estudiantes sobre los cursos.

## Descripción de la temática de la base de datos

**LearnOnline** es una plataforma educativa en línea que ofrece cursos en diversas áreas del conocimiento. La base de datos gestiona los siguientes aspectos:

- Cursos ofrecidos
- Instructores que imparten los cursos
- Estudiantes inscritos
- Matrículas realizadas
- Calificaciones obtenidas
- Métodos de pago
- Categorías de cursos
- Comisiones (ciclos)
- Opiniones y feedback de los estudiantes

## Diagrama Entidad-Relación (ER)

![Diagrama ER](file-rQ4GvSiUBvB6mwtwOFrYE6a3)

## Estructura de las tablas

### 1. Métodos de Pago (Metodos_Pago)

- **Descripción**: Almacena los diferentes métodos de pago disponibles.
- **Campos**:
  - ID_Metodo (INT, PK): Identificador único del método de pago.
  - Nombre (VARCHAR): Nombre descriptivo del método de pago.

### 2. Categorías de Cursos (Categorias_Cursos)

- **Descripción**: Almacena las categorías a las que pueden pertenecer los cursos.
- **Campos**:
  - ID_Categoria (INT, PK): Identificador único de la categoría.
  - Nombre (VARCHAR): Nombre de la categoría.
  - Descripcion (TEXT): Breve descripción de la categoría.

### 3. Instructores (Instructores)

- **Descripción**: Almacena información sobre los instructores.
- **Campos**:
  - ID_Instructor (INT, PK): Identificador único del instructor.
  - Nombre (VARCHAR): Nombre del instructor.
  - Apellido (VARCHAR): Apellido del instructor.
  - Correo_Electronico (VARCHAR): Correo electrónico único del instructor.
  - Especialidad (VARCHAR): Especialidad del instructor.

### 4. Estudiantes (Estudiantes)

- **Descripción**: Almacena información sobre los estudiantes.
- **Campos**:
  - ID_Estudiante (INT, PK): Identificador único del estudiante.
  - Nombre (VARCHAR): Nombre del estudiante.
  - Apellido_Paterno (VARCHAR): Apellido paterno del estudiante.
  - Apellido_Materno (VARCHAR): Apellido materno del estudiante.
  - Correo_Electronico (VARCHAR): Correo electrónico único del estudiante.
  - Confirmar_Correo_Electronico (VARCHAR): Confirmación del correo electrónico.
  - DNI (VARCHAR): Documento Nacional de Identidad único del estudiante.
  - Pais_Residencia (VARCHAR): País de residencia del estudiante.
  - Departamento_Residencia (VARCHAR): Departamento de residencia del estudiante.
  - Provincia_Residencia (VARCHAR): Provincia de residencia del estudiante.
  - Distrito_Residencia (VARCHAR): Distrito de residencia del estudiante.
  - Telefono (VARCHAR): Teléfono del estudiante.
  - Celular (VARCHAR): Celular del estudiante.
  - Fecha_Registro (DATE): Fecha de registro del estudiante.

### 5. Cursos (Cursos)

- **Descripción**: Almacena información sobre los cursos.
- **Campos**:
  - ID_Curso (INT, PK): Identificador único del curso.
  - Nombre (VARCHAR): Nombre del curso.
  - Descripcion (TEXT): Descripción detallada del curso.
  - ID_Instructor (INT, FK): Identificador del instructor a cargo del curso.
  - Fecha_Inicio (DATE): Fecha de inicio del curso.
  - Fecha_Fin (DATE): Fecha de finalización del curso.
  - Precio (DECIMAL): Precio del curso.

### 6. Comisiones (Ciclos) (Comisiones)

- **Descripción**: Almacena información sobre las comisiones o ciclos en los que se ofrecen los cursos.
- **Campos**:
  - ID_Comision (INT, PK): Identificador único de la comisión.
  - Nombre (VARCHAR): Nombre de la comisión.
  - Descripcion (TEXT): Descripción de la comisión.
  - Fecha_Inicio (DATE): Fecha de inicio de la comisión.
  - Fecha_Fin (DATE): Fecha de finalización de la comisión.
  - Modalidad (VARCHAR): Modalidad de la comisión.
  - Duracion (VARCHAR): Duración de la comisión.
  - Horarios (VARCHAR): Horarios de la comisión.

### 7. Matrículas (Matriculas)

- **Descripción**: Almacena información sobre las matrículas de los estudiantes en los cursos.
- **Campos**:
  - ID_Matricula (INT, PK): Identificador único de la matrícula.
  - ID_Estudiante (INT, FK): Identificador del estudiante.
  - ID_Curso (INT, FK): Identificador del curso.
  - Fecha_Matricula (DATE): Fecha en que se realizó la matrícula.
  - ID_Metodo (INT, FK): Identificador del método de pago.
  - ID_Comision (INT, FK): Identificador de la comisión.
  - Precio_Pagar (DECIMAL): Precio a pagar por el ciclo matriculado.

### 8. Calificaciones (Calificaciones)

- **Descripción**: Almacena las calificaciones de los estudiantes en los cursos.
- **Campos**:
  - ID_Calificacion (INT, PK): Identificador único de la calificación.
  - ID_Estudiante (INT, FK): Identificador del estudiante.
  - ID_Curso (INT, FK): Identificador del curso.
  - ID_Comision (INT, FK): Identificador de la comisión.
  - Calificacion (DECIMAL): Calificación obtenida por el estudiante.
  - Fecha_Evaluacion (DATE): Fecha en que se realizó la evaluación.

### 9. Relación Cursos_Categorias (Cursos_Categorias)

- **Descripción**: Almacena la relación entre cursos y categorías.
- **Campos**:
  - ID_Cursos_Categorias (INT, PK): Identificador único de la relación curso-categoría.
  - ID_Curso (INT, FK): Identificador del curso.
  - ID_Categoria (INT, FK): Identificador de la categoría.

### 10. Opiniones y Feedback de Estudiantes (Opiniones_Estudiantes)

- **Descripción**: Almacena las opiniones y el feedback de los estudiantes sobre los cursos.
- **Campos**:
  - ID_Opinion (INT, PK): Identificador único de la opinión.
  - ID_Estudiante (INT, FK): Identificador del estudiante.
  - ID_Curso (INT, FK): Identificador del curso.
  - ID_Comision (INT, FK): Identificador de la comisión.
  - Fecha (DATE): Fecha en que se dejó la opinión.
  - Calificacion (INT): Calificación numérica asignada por el estudiante.
  - Comentario (TEXT): Comentario del estudiante sobre su experiencia.

### 11. Historial de Estudiantes (Historial_Estudiantes)

- **Descripción**: Almacena el historial de transacciones realizadas por los estudiantes.
- **Campos**:
  - ID_Registro (INT, PK): Identificador único del registro.
  - ID_Estudiante (INT, FK): Identificador del estudiante.
  - Fecha_Transaccion (DATE): Fecha en que se realizó la transacción.
  - Tipo_Transaccion (VARCHAR): Tipo de transacción realizada (matrícula, calificación, opinión).
  - Total_Gastado (DECIMAL): Total gastado por el estudiante en la transacción.

### 12. Historial de Precios de Cursos (Historial_Precios_Cursos)

- **Descripción**: Almacena el historial de cambios en los precios de los cursos.
- **Campos**:
  - ID_Historial (INT, PK): Identificador único del historial.
  - ID_Curso (INT, FK): Identificador del curso.
  - Fecha_Cambio (DATE): Fecha en que se realizó el cambio de precio.
  - Precio_Anterior (DECIMAL): Precio anterior del curso.
  - Precio_Nuevo (DECIMAL): Nuevo precio del curso.
  - Razon_Cambio (VARCHAR): Razón por la cual se realizó el cambio de precio.

### 13. Transacciones de Inscripción (Transacciones_Inscripcion)

- **Descripción**: Almacena las transacciones de inscripción y cancelación de inscripción de los estudiantes en los cursos.
- **Campos**:
  - ID_Transaccion (INT, PK): Identificador único de la transacción.
  - Tipo_Transaccion (VARCHAR): Tipo de transacción (inscripción o cancelación de inscripción).
  - Fecha (DATE): Fecha en que se realizó la transacción.
  - ID_Estudiante (INT, FK): Identificador del estudiante.
  - ID_Curso (INT, FK): Identificador del curso.
  - Cantidad_Afectada (INT): Cantidad de cursos inscritos o cancelados.
  - ID_Empleado (INT, FK): Identificador del empleado que realizó la transacción.
  - Motivo (VARCHAR): Razón o motivo de la transacción.

## Relaciones entre Entidades

1. **Estudiantes y Matrículas**: Cada estudiante puede tener múltiples matrículas (Matriculas.ID_Estudiante referencia a Estudiantes.ID_Estudiante).
2. **Cursos y Matrículas**: Cada curso puede tener múltiples matrículas (Matriculas.ID_Curso referencia a Cursos.ID_Curso).
3. **Métodos de Pago y Matrículas**: Cada matrícula utiliza un método de pago (Matriculas.ID_Metodo referencia a Metodos_Pago.ID_Metodo).
4. **Comisiones y Matrículas**: Cada matrícula está asociada a una comisión (Matriculas.ID_Comision referencia a Comisiones.ID_Comision).
5. **Instructores y Cursos**: Cada curso está asociado a un instructor (Cursos.ID_Instructor referencia a Instructores.ID_Instructor).
6. **Cursos y Categorías**: Relación muchos a muchos entre cursos y categorías (Cursos_Categorias.ID_Curso referencia a Cursos.ID_Curso y Cursos_Categorias.ID_Categoria referencia a Categorias_Cursos.ID_Categoria).
7. **Estudiantes y Calificaciones**: Cada estudiante puede tener múltiples calificaciones (Calificaciones.ID_Estudiante referencia a Estudiantes.ID_Estudiante).
8. **Cursos y Calificaciones**: Cada curso puede tener múltiples calificaciones (Calificaciones.ID_Curso referencia a Cursos.ID_Curso).
9. **Comisiones y Calificaciones**: Cada calificación está asociada a una comisión (Calificaciones.ID_Comision referencia a Comisiones.ID_Comision).
10. **Estudiantes y Opiniones**: Cada estudiante puede dejar múltiples opiniones (Opiniones_Estudiantes.ID_Estudiante referencia a Estudiantes.ID_Estudiante).
11. **Cursos y Opiniones**: Cada curso puede tener múltiples opiniones (Opiniones_Estudiantes.ID_Curso referencia a Cursos.ID_Curso).
12. **Comisiones y Opiniones**: Cada opinión está asociada a una comisión (Opiniones_Estudiantes.ID_Comision referencia a Comisiones.ID_Comision).
13. **Estudiantes y Historial de Estudiantes**: Cada estudiante puede tener múltiples registros en su historial (Historial_Estudiantes.ID_Estudiante referencia a Estudiantes.ID_Estudiante).
14. **Cursos y Historial de Precios**: Cada curso puede tener múltiples registros en su historial de precios (Historial_Precios_Cursos.ID_Curso referencia a Cursos.ID_Curso).
15. **Estudiantes y Transacciones de Inscripción**: Cada estudiante puede tener múltiples transacciones de inscripción (Transacciones_Inscripcion.ID_Estudiante referencia a Estudiantes.ID_Estudiante).
16. **Cursos y Transacciones de Inscripción**: Cada curso puede tener múltiples transacciones de inscripción (Transacciones_Inscripcion.ID_Curso referencia a Cursos.ID_Curso).
17. **Instructores y Transacciones de Inscripción**: Cada transacción de inscripción puede ser realizada por un empleado (Transacciones_Inscripcion.ID_Empleado referencia a Instructores.ID_Instructor).
