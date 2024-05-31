USE PROYECTOBDA;

-------------------------TABLA MECANICO
CREATE TABLE tb_mecanico(
    id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    nombre VARCHAR(300) NOT NULL,
    cedula VARCHAR(10) NOT NULL,
    celular numeric(10) NOT NULL,
    correo VARCHAR(100) NOT NULL
);
select * from tb_mecanico;

insert into tb_mecanico(nombre, cedula, celular, correo)
values('Juan Andres Mendoza Acosta', '0902658950', 0987654321,'juan@gmail.com');
insert into tb_mecanico(nombre, cedula, celular, correo)
values('Luis Mateo Parrales Anchundia', '0945968522', 0563226698,'luis2mateo@hotmail.com');

--PROCEDIMIENTO ALMACENADO
GO
CREATE PROCEDURE SP_GET_MECANICO AS
  SELECT * FROM tb_mecanico
GO
EXEC SP_GET_MECANICO;


GO
CREATE PROCEDURE SP_CREA_MECANICO
  @nombre varchar(300),
  @cedula varchar(10),
  @celular numeric(10),
  @correo varchar(100)
AS
  INSERT INTO tb_mecanico(nombre, cedula, celular, correo)
  VALUES(@nombre, @cedula, @celular, @correo);
GO
EXEC SP_CREA_MECANICO 'Monica Lucia Torres Zambrano', '0945369855', 0963586692,'mon.lucia@hotmail.com';
SELECT * FROM tb_mecanico


GO
CREATE PROCEDURE SP_ACTUALIZA_MECANICO
  @id int,
  @nombre varchar(300),
  @cedula varchar(10),
  @celular numeric(10),
  @correo varchar(100)
AS
  UPDATE tb_mecanico
  SET nombre = @nombre,
  cedula = @cedula,
  celular = @celular,
  correo = @correo
  WHERE id = @id;
GO
SELECT * FROM tb_mecanico

GO
CREATE PROCEDURE SP_ELIMINA_MECANICO
  @IdMecanico int
AS
  DELETE FROM tb_mecanico WHERE id = @IdMecanico;
GO
EXEC SP_ELIMINA_MECANICO 5;




-------------------------TABLA CLIENTE
CREATE TABLE tb_cliente_vehiculo(
    id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    nombre VARCHAR(300) NOT NULL,
    edad numeric(2) NOT NULL,    
    cedula VARCHAR(10) NOT NULL,
    celular numeric(10) NOT NULL,
    correo VARCHAR(100) NOT NULL,
    vehiculo VARCHAR(100) NOT NULL
);
select * from tb_cliente_vehiculo

insert into tb_cliente_vehiculo(nombre, edad, cedula, celular, correo, vehiculo)
values('Michael Andres Mora Acosta','25', '0902658950', 0987654321,'michael@gmail.com', 'Chevrolet Honda City Negro');
insert into tb_cliente_vehiculo(nombre, edad, cedula, celular, correo, vehiculo)
values('Luis Miguel Parras Acosta', '36', '0945968522', 0563226698,'luismi@hotmail.com', 'Chevrolet Corvette Z06 2023 Negro');

--PROCEDIMIENTO ALMACENADO
GO
CREATE PROCEDURE SP_GET_CLIENTE_VEHICULO AS
  SELECT * FROM tb_cliente_vehiculo
GO
EXEC SP_GET_CLIENTE_VEHICULO;


GO
CREATE PROCEDURE SP_CREA_CLIENTE_VEHICULO
  @nombre varchar(300),
  @edad numeric(2),
  @cedula varchar(10),
  @celular numeric(10),
  @correo varchar(100),
  @vehiculo varchar(100)
AS
  INSERT INTO tb_cliente_vehiculo(nombre, edad, cedula, celular, correo, vehiculo)
  VALUES(@nombre, @edad, @cedula, @celular, @correo, @vehiculo);
GO
EXEC SP_CREA_CLIENTE_VEHICULO 'Maria Lucia Toala Zambrano', '42', '0945369855', 0963586692, 'mon.lucia@hotmail.com', 'Jeep Avenger Amarillo' ;
SELECT * FROM tb_cliente_vehiculo


GO
CREATE PROCEDURE SP_ACTUALIZA_CLIENTE_VEHICULO
  @id int,
  @nombre varchar(300),
  @edad varchar(100),
  @cedula varchar(10),
  @celular numeric(10),
  @correo varchar(100),
  @vehiculo varchar(100)
AS
  UPDATE tb_cliente_vehiculo
  SET nombre = @nombre,
  edad = @edad,
  cedula = @cedula,
  celular = @celular,
  correo = @correo,
  vehiculo = @vehiculo
  WHERE id = @id;
GO
SELECT * FROM tb_cliente_vehiculo


GO
CREATE PROCEDURE SP_ELIMINA_CLIENTE_VEHICULO
  @IdClienteVehiculo int
AS
  DELETE FROM tb_cliente_vehiculo WHERE id = @IdClienteVehiculo;
GO
EXEC SP_ELIMINA_CLIENTE_VEHICULO 5;




-------------------------TABLA INVENTARIO REPUESTOS
CREATE TABLE tb_inventario_repuestos (
    id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    nombre_repuesto VARCHAR(100),
    precio FLOAT NOT NULL,
    cantidad numeric NOT NULL
);
select * from tb_inventario_repuestos;

insert into tb_inventario_repuestos (nombre_repuesto, precio, cantidad)
values('Discos de Frenos', 45.99, 100);
insert into tb_inventario_repuestos (nombre_repuesto, precio, cantidad)
values('Batería', 89.99, 90);

---PROCEDIMIENTO ALMACENADO
GO
CREATE PROCEDURE SP_GET_INVENTARIO_REPUESTO AS
  SELECT * FROM tb_inventario_repuestos
GO
EXEC SP_GET_INVENTARIO_REPUESTO;


GO
CREATE PROCEDURE SP_CREA_INVENTARIO_REPUESTO
  @nombre_repuesto varchar(100),
  @precio FLOAT,
  @cantidad numeric
AS
  INSERT INTO tb_inventario_repuestos(nombre_repuesto, precio, cantidad)
  VALUES(@nombre_repuesto, @precio, @cantidad);
GO
SELECT * FROM tb_inventario_repuestos;


GO
CREATE PROCEDURE SP_ACTUALIZA_INVENTARIO_REPUESTO
	@id int,
	@nombre_repuesto varchar(100),
	@precio FLOAT,
    @cantidad numeric
AS
	UPDATE tb_inventario_repuestos
	SET nombre_repuesto = @nombre_repuesto,
	precio = @precio,
    cantidad =@cantidad
	WHERE id = @id;
GO
SELECT * FROM tb_inventario_repuestos


GO
CREATE PROCEDURE SP_ELIMINA_INVENTARIO_REPUESTO
	@IdInventarioRepuesto int
AS
	DELETE FROM tb_inventario_repuestos WHERE id = @IdInventarioRepuesto;
GO




-------------------------TABLA SERVICIOS ADICIONALES
CREATE TABLE tb_servicios (
    id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    nombre VARCHAR(1000) NOT NULL,
    precio FLOAT NOT NULL
);
select * from tb_servicios;

insert into tb_servicios (nombre, precio)
values('Alineacion', 400);
insert into tb_servicios (nombre, precio)
values('Cambio de aceite', 45);
insert into tb_servicios (nombre, precio)
values('Cambio de bateria', 350);
insert into tb_servicios (nombre, precio)
values('Lavado', 30);
insert into tb_servicios (nombre, precio)
values('Reemplazo de luces', 100);

---PROCEDIMIENTO ALMACENADO
GO
CREATE PROCEDURE SP_GET_SERVICIOS AS
  SELECT * FROM tb_servicios
GO
EXEC SP_GET_SERVICIOS;


GO
CREATE PROCEDURE SP_CREA_SERVICIOS
  @nombre varchar(100),
  @precio numeric(3)
AS
  INSERT INTO tb_servicios(nombre, precio)
  VALUES(@nombre, @precio);
GO
SELECT * FROM tb_servicios


GO
CREATE PROCEDURE SP_ACTUALIZA_SERVICIOS
	@id int,
	@nombre varchar(100),
	@precio numeric(3)
AS
	UPDATE tb_servicios
	SET nombre = @nombre,
	precio = @precio
	WHERE id = @id;
GO
SELECT * FROM tb_servicios


GO
CREATE PROCEDURE SP_ELIMINA_SERVICIOS
	@IdServicio int
AS
	DELETE FROM tb_servicios WHERE id = @IdServicio;
GO



