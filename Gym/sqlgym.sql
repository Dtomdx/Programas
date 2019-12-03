
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'dbgim')
BEGIN
CREATE DATABASE [dbventas] ON  PRIMARY 
( NAME = N'dbventas', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\dbventas.mdf' , SIZE = 2304KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'dbventas_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\dbventas_log.LDF' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
END
GO
ALTER DATABASE [dbventas] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [dbventas].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [dbventas] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [dbventas] SET ANSI_NULLS OFF
GO
ALTER DATABASE [dbventas] SET ANSI_PADDING OFF
GO
ALTER DATABASE [dbventas] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [dbventas] SET ARITHABORT OFF
GO
ALTER DATABASE [dbventas] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [dbventas] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [dbventas] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [dbventas] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [dbventas] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [dbventas] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [dbventas] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [dbventas] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [dbventas] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [dbventas] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [dbventas] SET  DISABLE_BROKER
GO
ALTER DATABASE [dbventas] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [dbventas] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [dbventas] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [dbventas] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [dbventas] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [dbventas] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [dbventas] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [dbventas] SET  READ_WRITE
GO
ALTER DATABASE [dbventas] SET RECOVERY FULL
GO
ALTER DATABASE [dbventas] SET  MULTI_USER
GO
ALTER DATABASE [dbventas] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [dbventas] SET DB_CHAINING OFF
GO
USE [dbventas]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[trabajador]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[trabajador](
	[idtrabajador] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](20) NOT NULL,
	[apellidos] [varchar](40) NOT NULL,
	[sexo] [varchar](1) NOT NULL,
	[fecha_nac] [date] NOT NULL,
	[num_documento] [varchar](8) NOT NULL,
	[direccion] [varchar](100) NULL,
	[telefono] [varchar](10) NULL,
	[email] [varchar](50) NULL,
	[acceso] [varchar](20) NOT NULL,
	[usuario] [varchar](20) NOT NULL,
	[password] [varchar](500) NOT NULL,
 CONSTRAINT [PK_trabajador] PRIMARY KEY CLUSTERED 
(
	[idtrabajador] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [AK_PASSWORD] UNIQUE NONCLUSTERED 
(
	[password] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [AK_USUARIO] UNIQUE NONCLUSTERED 
(
	[usuario] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[trabajador] ON
INSERT [dbo].[trabajador] ([idtrabajador], [nombre], [apellidos], [sexo], [fecha_nac], [num_documento], [direccion], [telefono], [email], [acceso], [usuario], [password]) VALUES (1, N'ADMINISTRADOR DEL SI', N'ADMINISTRADOR DEL SISTEMA', N' ', CAST(0xCD3B0B00 AS Date), N'00000000', N'Administrador del sistema', N'(000)000-0', N'', N'Administrador', N'admin', N'$2a$10$dM/Fa/S1KwjSgb63CkUFFuDpu0TIdQTkRSnkTQjAAZCn5xI/sQMeK')
SET IDENTITY_INSERT [dbo].[trabajador] OFF

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spbackup]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROC [dbo].[spbackup]
@ruta varchar(255)
AS
BACKUP DATABASE dbventas
TO DISK = @ruta
WITH FORMAT
' 
END
GO
/****** Object:  Table [dbo].[proveedor]    Script Date: 08/30/2016 17:19:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[proveedor]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[proveedor](
	[idproveedor] [int] IDENTITY(1,1) NOT NULL,
	[razon_social] [varchar](150) NOT NULL,
	[sector_comercial] [varchar](50) NOT NULL,
	[tipo_documento] [varchar](20) NOT NULL,
	[num_documento] [varchar](11) NOT NULL,
	[direccion] [varchar](100) NULL,
	[telefono] [varchar](10) NULL,
	[email] [varchar](50) NULL,
	[url] [varchar](100) NULL,
 CONSTRAINT [PK_proveedor] PRIMARY KEY CLUSTERED 
(
	[idproveedor] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[presentacion]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[presentacion](
	[idpresentacion] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[descripcion] [varchar](256) NULL,
 CONSTRAINT [PK_presentacion] PRIMARY KEY CLUSTERED 
(
	[idpresentacion] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[cliente]    Script Date: 08/30/2016 17:19:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[cliente]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[cliente](
	[idcliente] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[apellidos] [varchar](40) NULL,
	[sexo] [varchar](1) NULL,
	[fecha_nacimiento] [date] NULL,
	[tipo_documento] [varchar](20) NOT NULL,
	[num_documento] [varchar](11) NOT NULL,
	[direccion] [varchar](100) NULL,
	[telefono] [varchar](10) NULL,
	[email] [varchar](50) NULL,
 CONSTRAINT [PK_cliente] PRIMARY KEY CLUSTERED 
(
	[idcliente] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[categoria]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[categoria](
	[idcategoria] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[descripcion] [varchar](256) NULL,
 CONSTRAINT [PK_categoria] PRIMARY KEY CLUSTERED 
(
	[idcategoria] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[venta]    Script Date: 08/30/2016 17:19:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[venta]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[venta](
	[idventa] [int] IDENTITY(1,1) NOT NULL,
	[idcliente] [int] NOT NULL,
	[idtrabajador] [int] NOT NULL,
	[fecha] [date] NOT NULL,
	[tipo_comprobante] [varchar](20) NOT NULL,
	[serie] [varchar](4) NOT NULL,
	[correlativo] [varchar](7) NOT NULL,
	[itbis] [decimal](4, 2) NOT NULL,
 CONSTRAINT [PK_venta] PRIMARY KEY CLUSTERED 
(
	[idventa] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[articulo]    Script Date: 08/30/2016 17:19:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[articulo]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[articulo](
	[idarticulo] [int] IDENTITY(1,1) NOT NULL,
	[codigo] [varchar](50) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[descripcion] [varchar](1024) NULL,
	[imagen] [image] NULL,
	[idcategoria] [int] NOT NULL,
	[idpresentacion] [int] NOT NULL,
 CONSTRAINT [PK_articulo] PRIMARY KEY CLUSTERED 
(
	[idarticulo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ingreso]    Script Date: 08/30/2016 17:19:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ingreso]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ingreso](
	[idingreso] [int] IDENTITY(1,1) NOT NULL,
	[idtrabajador] [int] NOT NULL,
	[idproveedor] [int] NOT NULL,
	[fecha] [date] NOT NULL,
	[tipo_comprobante] [varchar](20) NOT NULL,
	[serie] [varchar](4) NOT NULL,
	[correlativo] [varchar](7) NOT NULL,
	[itbis] [decimal](4, 2) NOT NULL,
	[estado] [varchar](7) NOT NULL,
 CONSTRAINT [PK_ingreso] PRIMARY KEY CLUSTERED 
(
	[idingreso] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[spbuscar_trabajador_num_documento]    Script Date: 08/30/2016 17:19:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spbuscar_trabajador_num_documento]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE proc [dbo].[spbuscar_trabajador_num_documento]
@textobuscar varchar(50)
as
select * from trabajador
where num_documento like ''%'' + @textobuscar + ''%''
order by apellidos asc
' 
END
GO
/****** Object:  StoredProcedure [dbo].[spbuscar_trabajador_nombres]    Script Date: 08/30/2016 17:19:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spbuscar_trabajador_nombres]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE proc [dbo].[spbuscar_trabajador_nombres]
@textobuscar varchar(50)
as
select * from trabajador
where nombre like ''%'' + @textobuscar + ''%''
order by nombre asc
' 
END
GO
/****** Object:  StoredProcedure [dbo].[spbuscar_trabajador_apellidos]    Script Date: 08/30/2016 17:19:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spbuscar_trabajador_apellidos]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE proc [dbo].[spbuscar_trabajador_apellidos]
@textobuscar varchar(50)
as
select * from trabajador
where apellidos like ''%'' + @textobuscar + ''%''
order by apellidos asc
' 
END
GO
/****** Object:  StoredProcedure [dbo].[spbuscar_proveedor_razon_social]    Script Date: 08/30/2016 17:19:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spbuscar_proveedor_razon_social]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE proc [dbo].[spbuscar_proveedor_razon_social]
@textobuscar varchar(50)
as
select * from proveedor
where razon_social like ''%'' + @textobuscar + ''%''
' 
END
GO
/****** Object:  StoredProcedure [dbo].[spbuscar_proveedor_num_documento]    Script Date: 08/30/2016 17:19:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spbuscar_proveedor_num_documento]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE proc [dbo].[spbuscar_proveedor_num_documento]
@textobuscar varchar(20)
as
SELECT * FROM proveedor
where num_documento like ''%'' + @textobuscar + ''%''
' 
END
GO
/****** Object:  StoredProcedure [dbo].[spbuscar_presentacion_nombre]    Script Date: 08/30/2016 17:19:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spbuscar_presentacion_nombre]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE proc [dbo].[spbuscar_presentacion_nombre]
@textobuscar varchar(50)
as
select * from presentacion
where nombre like ''%'' + @textobuscar + ''%''
' 
END
GO
/****** Object:  StoredProcedure [dbo].[spbuscar_cliente_num_documento]    Script Date: 08/30/2016 17:19:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spbuscar_cliente_num_documento]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE proc [dbo].[spbuscar_cliente_num_documento]
@textobuscar varchar(50)
as
select * from cliente
where num_documento like ''%'' + @textobuscar + ''%''
' 
END
GO
/****** Object:  StoredProcedure [dbo].[spbuscar_cliente_nombres]    Script Date: 08/30/2016 17:19:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spbuscar_cliente_nombres]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE proc [dbo].[spbuscar_cliente_nombres]
@textobuscar varchar(50)
as
select * from cliente
where nombre like ''%'' + @textobuscar + ''%''
' 
END
GO
/****** Object:  StoredProcedure [dbo].[spbuscar_cliente_apellidos]    Script Date: 08/30/2016 17:19:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spbuscar_cliente_apellidos]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE proc [dbo].[spbuscar_cliente_apellidos]
@textobuscar varchar(50)
as
select * from cliente
where apellidos like ''%'' + @textobuscar + ''%''
' 
END
GO
/****** Object:  StoredProcedure [dbo].[spbuscar_categoria]    Script Date: 08/30/2016 17:19:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spbuscar_categoria]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE proc [dbo].[spbuscar_categoria]
@textobuscar varchar(50)
as
select * from categoria
where nombre like ''%'' + @textobuscar + ''%''
' 
END
GO
/****** Object:  StoredProcedure [dbo].[speditar_trabajador]    Script Date: 08/30/2016 17:19:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[speditar_trabajador]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE proc [dbo].[speditar_trabajador]
@idtrabajador int,
@nombre varchar(20),
@apellidos varchar(40),
@sexo varchar(1),
@fecha_nacimiento date,
@num_documento varchar(8),
@direccion varchar(100),
@telefono varchar(10),
@email varchar(50),
@acceso varchar(20),
@usuario varchar(20),
@password varchar(500)
as
update trabajador set nombre=@nombre,apellidos=@apellidos,
sexo=@sexo,fecha_nac=@fecha_nacimiento,num_documento=@num_documento,
direccion=@direccion,telefono=@telefono,email=@email,
acceso=@acceso,usuario=@usuario,password=@password
where idtrabajador=@idtrabajador
' 
END
GO
/****** Object:  StoredProcedure [dbo].[speditar_proveedor]    Script Date: 08/30/2016 17:19:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[speditar_proveedor]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'create proc [dbo].[speditar_proveedor]
@idproveedor int,
@razon_social varchar(150),
@sector_comercial varchar(50),
@tipo_documento varchar(20),
@num_documento varchar(11),
@direccion varchar(100),
@telefono varchar(10),
@email varchar(50),
@url varchar(100)
as
update proveedor set razon_social=@razon_social,sector_comercial=@sector_comercial,
tipo_documento=@tipo_documento,num_documento=@num_documento,
direccion=@direccion,telefono=@telefono,email=@email,
url=@url
where idproveedor=@idproveedor
' 
END
GO
/****** Object:  StoredProcedure [dbo].[speditar_presentacion]    Script Date: 08/30/2016 17:19:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[speditar_presentacion]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'create proc [dbo].[speditar_presentacion]
@idpresentacion int,
@nombre varchar(50),
@descripcion varchar(256)
as
update presentacion set nombre=@nombre, descripcion=@descripcion
where idpresentacion=@idpresentacion
' 
END
GO
/****** Object:  StoredProcedure [dbo].[speditar_cliente]    Script Date: 08/30/2016 17:19:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[speditar_cliente]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'create proc [dbo].[speditar_cliente]
@idcliente int,
@nombre varchar(50),
@apellidos varchar(40),
@sexo varchar(1),
@fecha_nacimiento date,
@tipo_documento varchar(20),
@num_documento varchar(11),
@direccion varchar(100),
@telefono varchar(10),
@email varchar(50)
as
update cliente set nombre=@nombre,apellidos=@apellidos,sexo=@sexo,
fecha_nacimiento=@fecha_nacimiento,tipo_documento=@tipo_documento,
num_documento=@num_documento,direccion=@direccion,
telefono=@telefono,email=@email
where idcliente=@idcliente
' 
END
GO
/****** Object:  StoredProcedure [dbo].[speditar_categoria]    Script Date: 08/30/2016 17:19:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[speditar_categoria]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'--Procedimiento Editar
create proc [dbo].[speditar_categoria]
@idcategoria int,
@nombre varchar(50),
@descripcion varchar(256)
as
update categoria set nombre=@nombre,
descripcion=@descripcion
where idcategoria=@idcategoria
' 
END
GO
/****** Object:  StoredProcedure [dbo].[speliminar_trabajador]    Script Date: 08/30/2016 17:19:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[speliminar_trabajador]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'create proc [dbo].[speliminar_trabajador]
@idtrabajador int
as
delete from trabajador
where idtrabajador=@idtrabajador
' 
END
GO
/****** Object:  StoredProcedure [dbo].[speliminar_proveedor]    Script Date: 08/30/2016 17:19:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[speliminar_proveedor]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'create proc [dbo].[speliminar_proveedor]
@idproveedor int
as
delete from proveedor
where idproveedor=@idproveedor
' 
END
GO
/****** Object:  StoredProcedure [dbo].[speliminar_presentacion]    Script Date: 08/30/2016 17:19:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[speliminar_presentacion]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'create proc [dbo].[speliminar_presentacion]
@idpresentacion int
as
delete from presentacion
where idpresentacion=@idpresentacion
' 
END
GO
/****** Object:  StoredProcedure [dbo].[speliminar_cliente]    Script Date: 08/30/2016 17:19:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[speliminar_cliente]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'create proc [dbo].[speliminar_cliente]
@idcliente int
as
delete from cliente
where idcliente=@idcliente
' 
END
GO
/****** Object:  StoredProcedure [dbo].[speliminar_categoria]    Script Date: 08/30/2016 17:19:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[speliminar_categoria]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'--Procedimiento Eliminar
create proc [dbo].[speliminar_categoria]
@idcategoria int
as
delete from categoria
where idcategoria=@idcategoria
' 
END
GO
/****** Object:  StoredProcedure [dbo].[spinsertar_cliente]    Script Date: 08/30/2016 17:19:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spinsertar_cliente]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'create proc [dbo].[spinsertar_cliente]
@idcliente int output,
@nombre varchar(50),
@apellidos varchar(40),
@sexo varchar(1),
@fecha_nacimiento date,
@tipo_documento varchar(20),
@num_documento varchar(11),
@direccion varchar(100),
@telefono varchar(10),
@email varchar(50)
as 
insert into cliente (nombre,apellidos,sexo,fecha_nacimiento,
tipo_documento,num_documento,direccion,telefono,email)
values (@nombre,@apellidos,@sexo,@fecha_nacimiento,
@tipo_documento,@num_documento,@direccion,@telefono,@email)
' 
END
GO
/****** Object:  StoredProcedure [dbo].[spinsertar_categoria]    Script Date: 08/30/2016 17:19:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spinsertar_categoria]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'--Procedimiento Insertar
create proc [dbo].[spinsertar_categoria]
@idcategoria int output,
@nombre varchar(50),
@descripcion varchar(256)
as
insert into categoria (nombre,descripcion)
values (@nombre,@descripcion)
' 
END
GO
/****** Object:  StoredProcedure [dbo].[spmostrar_trabajador]    Script Date: 08/30/2016 17:19:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spmostrar_trabajador]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE proc [dbo].[spmostrar_trabajador]
as
select top 100 idtrabajador,usuario,acceso, nombre, apellidos, sexo,fecha_nac, num_documento, direccion,
telefono, email, password
from trabajador
order by nombre asc
' 
END
GO
/****** Object:  StoredProcedure [dbo].[spmostrar_proveedor]    Script Date: 08/30/2016 17:19:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spmostrar_proveedor]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'create proc [dbo].[spmostrar_proveedor]
as
select top 100 * from proveedor
order by razon_social asc
' 
END
GO
/****** Object:  StoredProcedure [dbo].[spmostrar_presentacion]    Script Date: 08/30/2016 17:19:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spmostrar_presentacion]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'create proc [dbo].[spmostrar_presentacion]
as
select top 100 * from presentacion
order by idpresentacion desc
' 
END
GO
/****** Object:  StoredProcedure [dbo].[spmostrar_cliente]    Script Date: 08/30/2016 17:19:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spmostrar_cliente]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'create proc [dbo].[spmostrar_cliente]
as
select top 100 * from cliente
order by apellidos asc
' 
END
GO
/****** Object:  StoredProcedure [dbo].[spmostrar_categoria]    Script Date: 08/30/2016 17:19:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spmostrar_categoria]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'create proc [dbo].[spmostrar_categoria]
as
select top 200 * from categoria
order by idcategoria desc
' 
END
GO
/****** Object:  StoredProcedure [dbo].[spinsertar_trabajador]    Script Date: 08/30/2016 17:19:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spinsertar_trabajador]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- Insertar
CREATE proc [dbo].[spinsertar_trabajador]
@idtrabajador int output,
@nombre varchar(20),
@apellidos varchar(40),
@sexo varchar(1),
@fecha_nacimiento date,
@num_documento varchar(8),
@direccion varchar(100),
@telefono varchar(10),
@email varchar(50),
@acceso varchar(20),
@usuario varchar(20),
@password varchar(500)
as
insert into trabajador (nombre,apellidos,sexo,fecha_nac,
num_documento,direccion,telefono,email,acceso,usuario,password)
values (@nombre,@apellidos,@sexo,@fecha_nacimiento,
@num_documento,@direccion,@telefono,@email,@acceso,@usuario,
@password)
' 
END
GO
/****** Object:  StoredProcedure [dbo].[spinsertar_proveedor]    Script Date: 08/30/2016 17:19:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spinsertar_proveedor]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'create proc [dbo].[spinsertar_proveedor]
@idproveedor int output,
@razon_social varchar(150),
@sector_comercial varchar(50),
@tipo_documento varchar(20),
@num_documento varchar(11),
@direccion varchar(100),
@telefono varchar(10),
@email varchar(50),
@url varchar(100)
as
insert into proveedor (razon_social,sector_comercial,tipo_documento,
num_documento,direccion,telefono,email,url)
values (@razon_social,@sector_comercial,@tipo_documento,
@num_documento,@direccion,@telefono,@email,@url)
' 
END
GO
/****** Object:  StoredProcedure [dbo].[spinsertar_presentacion]    Script Date: 08/30/2016 17:19:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spinsertar_presentacion]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'create proc [dbo].[spinsertar_presentacion]
@idpresentacion int output,
@nombre varchar(50),
@descripcion varchar(256)
as
insert into presentacion (nombre,descripcion)
values (@nombre,@descripcion)
' 
END
GO
/****** Object:  StoredProcedure [dbo].[splogin]    Script Date: 08/30/2016 17:19:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[splogin]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE proc [dbo].[splogin]
@usuario varchar(20)
as
select idtrabajador,apellidos,nombre,acceso, password
from trabajador
where usuario=@usuario
DELETE FROM trabajador
WHERE idtrabajador = 10
' 
END
GO
/****** Object:  StoredProcedure [dbo].[spinsertar_venta]    Script Date: 08/30/2016 17:19:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spinsertar_venta]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE proc [dbo].[spinsertar_venta]
@idventa int=null output,
@idcliente int,
@idtrabajador int,
@fecha date,
@tipo_comprobante varchar(20),
@serie varchar(4),
@correlativo varchar(7),
@itbis decimal(4,2)
as
insert into venta (idcliente,idtrabajador,fecha,tipo_comprobante,
serie,correlativo,itbis)
values (@idcliente,@idtrabajador,@fecha,@tipo_comprobante,
@serie,@correlativo,@itbis)
--Obtenemos el código autogenerado
set @idventa=@@IDENTITY
' 
END
GO
/****** Object:  StoredProcedure [dbo].[spanular_ingreso]    Script Date: 08/30/2016 17:19:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spanular_ingreso]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'create proc [dbo].[spanular_ingreso]
@idingreso int
as
update ingreso set estado=''ANULADO''
where idingreso=@idingreso
' 
END
GO
/****** Object:  StoredProcedure [dbo].[spinsertar_ingreso]    Script Date: 08/30/2016 17:19:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spinsertar_ingreso]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE proc [dbo].[spinsertar_ingreso]
@idingreso int=null output,
@idtrabajador int,
@idproveedor int,
@fecha date,
@tipo_comprobante varchar(20),
@serie varchar(4),
@correlativo varchar(7),
@itbis decimal(4,2),
@estado varchar(7)
as
insert into ingreso (idtrabajador,idproveedor,fecha,tipo_comprobante,
serie,correlativo,itbis,estado)
values (@idtrabajador,@idproveedor,@fecha,@tipo_comprobante,
@serie,@correlativo,@itbis,@estado)
--Obtener el código autogenerado
SET @idingreso=@@IDENTITY
' 
END
GO
/****** Object:  StoredProcedure [dbo].[spmostrar_articulo]    Script Date: 08/30/2016 17:19:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spmostrar_articulo]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'create proc [dbo].[spmostrar_articulo]
as
SELECT top 100 dbo.articulo.idarticulo, dbo.articulo.codigo, dbo.articulo.nombre,
dbo.articulo.descripcion, dbo.articulo.imagen, dbo.articulo.idcategoria,
dbo.categoria.nombre AS Categoria, dbo.articulo.idpresentacion, 
dbo.presentacion.nombre AS Presentacion
FROM dbo.articulo INNER JOIN dbo.categoria 
ON dbo.articulo.idcategoria = dbo.categoria.idcategoria 
INNER JOIN dbo.presentacion 
ON dbo.articulo.idpresentacion = dbo.presentacion.idpresentacion
order by dbo.articulo.idarticulo desc
' 
END
GO
/****** Object:  StoredProcedure [dbo].[spinsertar_articulo]    Script Date: 08/30/2016 17:19:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spinsertar_articulo]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'create proc [dbo].[spinsertar_articulo]
@idarticulo int output,
@codigo varchar(50),
@nombre varchar(50),
@descripcion varchar(1024),
@imagen image,
@idcategoria int,
@idpresentacion int
as
insert into articulo (codigo,nombre,descripcion,imagen,idcategoria,idpresentacion)
values (@codigo,@nombre,@descripcion,@imagen,@idcategoria,@idpresentacion)
' 
END
GO
/****** Object:  StoredProcedure [dbo].[speliminar_venta]    Script Date: 08/30/2016 17:19:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[speliminar_venta]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'create proc [dbo].[speliminar_venta]
@idventa int
as
delete from venta
where idventa=@idventa
' 
END
GO
/****** Object:  StoredProcedure [dbo].[speliminar_articulo]    Script Date: 08/30/2016 17:19:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[speliminar_articulo]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'create proc [dbo].[speliminar_articulo]
@idarticulo int
as
delete from articulo
where idarticulo=@idarticulo
' 
END
GO
/****** Object:  StoredProcedure [dbo].[speditar_articulo]    Script Date: 08/30/2016 17:19:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[speditar_articulo]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'create proc [dbo].[speditar_articulo]
@idarticulo int,
@codigo varchar(50),
@nombre varchar(50),
@descripcion varchar(1024),
@imagen image,
@idcategoria int,
@idpresentacion int
as
update articulo set codigo=@codigo,nombre=@nombre,descripcion=@descripcion,
imagen=@imagen,idcategoria=@idcategoria,idpresentacion=@idpresentacion
where idarticulo=@idarticulo
' 
END
GO
/****** Object:  Table [dbo].[detalle_ingreso]    Script Date: 08/30/2016 17:19:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[detalle_ingreso]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[detalle_ingreso](
	[iddetalle_ingreso] [int] IDENTITY(1,1) NOT NULL,
	[idingreso] [int] NOT NULL,
	[idarticulo] [int] NOT NULL,
	[precio_compra] [money] NOT NULL,
	[precio_venta] [money] NOT NULL,
	[stock_inicial] [int] NOT NULL,
	[stock_actual] [int] NOT NULL,
	[fecha_produccion] [date] NOT NULL,
	[fecha_vencimiento] [date] NOT NULL,
 CONSTRAINT [PK_detalle_ingreso] PRIMARY KEY CLUSTERED 
(
	[iddetalle_ingreso] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  StoredProcedure [dbo].[spbuscar_articulo_nombre]    Script Date: 08/30/2016 17:19:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spbuscar_articulo_nombre]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE proc [dbo].[spbuscar_articulo_nombre]
@textobuscar varchar(50)
as
SELECT dbo.articulo.idarticulo, dbo.articulo.codigo, dbo.articulo.nombre,
dbo.articulo.descripcion, dbo.articulo.imagen, dbo.articulo.idcategoria,
dbo.categoria.nombre AS Categoria, dbo.articulo.idpresentacion, 
dbo.presentacion.nombre AS Presentacion
FROM dbo.articulo INNER JOIN dbo.categoria 
ON dbo.articulo.idcategoria = dbo.categoria.idcategoria 
INNER JOIN dbo.presentacion 
ON dbo.articulo.idpresentacion = dbo.presentacion.idpresentacion
where dbo.articulo.nombre like ''%'' + @textobuscar + ''%''
order by dbo.articulo.idarticulo desc
' 
END
GO
/****** Object:  Table [dbo].[detalle_venta]    Script Date: 08/30/2016 17:19:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[detalle_venta]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[detalle_venta](
	[iddetalle_venta] [int] IDENTITY(1,1) NOT NULL,
	[idventa] [int] NOT NULL,
	[iddetalle_ingreso] [int] NOT NULL,
	[cantidad] [int] NOT NULL,
	[precio_venta] [money] NOT NULL,
	[descuento] [money] NOT NULL,
 CONSTRAINT [PK_detalle_venta] PRIMARY KEY CLUSTERED 
(
	[iddetalle_venta] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  StoredProcedure [dbo].[spbuscar_ingreso_fecha]    Script Date: 08/30/2016 17:19:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spbuscar_ingreso_fecha]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE proc [dbo].[spbuscar_ingreso_fecha]
@fechaInicio varchar(50),
@fechaFin varchar(50)
as
SELECT ingreso.idingreso,
(trabajador.apellidos +'' ''+ trabajador.nombre) as Trabajador, 
proveedor.razon_social	as proveedor,
ingreso.fecha, ingreso.tipo_comprobante, 
ingreso.serie, ingreso.correlativo,
ingreso.estado, sum(detalle_ingreso.precio_compra*
detalle_ingreso.stock_inicial) as Total,ingreso.itbis as Impuesto
FROM detalle_ingreso INNER JOIN ingreso 
ON detalle_ingreso.idingreso = ingreso.idingreso 
INNER JOIN proveedor 
ON ingreso.idproveedor = proveedor.idproveedor 
INNER JOIN dbo.trabajador 
ON ingreso.idtrabajador = trabajador.idtrabajador
group by
ingreso.idingreso,
trabajador.apellidos +'' ''+ trabajador.nombre, 
proveedor.razon_social,
ingreso.fecha, ingreso.tipo_comprobante, 
ingreso.serie, ingreso.correlativo,
ingreso.estado,ingreso.itbis
having ingreso.fecha>=@fechaInicio and ingreso.fecha<=@fechaFin
' 
END
GO
/****** Object:  StoredProcedure [dbo].[spdisminuir_stock]    Script Date: 08/30/2016 17:19:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spdisminuir_stock]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'create proc [dbo].[spdisminuir_stock]
@iddetalle_ingreso int,
@cantidad int
as
update detalle_ingreso set stock_actual=stock_actual-@cantidad
where iddetalle_ingreso=@iddetalle_ingreso
' 
END
GO
/****** Object:  StoredProcedure [dbo].[spbuscararticulo_venta_nombre]    Script Date: 08/30/2016 17:19:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spbuscararticulo_venta_nombre]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE proc [dbo].[spbuscararticulo_venta_nombre]
@textobuscar varchar(50)
as
select d.iddetalle_ingreso,a.Codigo,a.Nombre,
c.nombre as Categoria,p.nombre as Presentacion,
d.stock_actual,d.precio_compra,d.precio_venta,
d.fecha_vencimiento
from articulo a inner join categoria c
on a.idcategoria = c.idcategoria
inner join presentacion p
on a.idpresentacion = p.idpresentacion
inner join detalle_ingreso d
on a.idarticulo = d.idarticulo
inner join ingreso i
on d.idingreso = i.idingreso
where a.nombre like ''%'' + @textobuscar + ''%''
and d.stock_actual > 0
and i.estado <> ''ANULADO''
' 
END
GO
/****** Object:  StoredProcedure [dbo].[spbuscararticulo_venta_codigo]    Script Date: 08/30/2016 17:19:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spbuscararticulo_venta_codigo]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE proc [dbo].[spbuscararticulo_venta_codigo]
@textobuscar varchar(50)
as
select d.iddetalle_ingreso,a.Codigo,a.Nombre,
c.nombre as Categoria,p.nombre as Presentacion,
d.stock_actual,d.precio_compra,d.precio_venta,
d.fecha_vencimiento
from articulo a inner join categoria c
on a.idcategoria = c.idcategoria
inner join presentacion p
on a.idpresentacion = p.idpresentacion
inner join detalle_ingreso d
on a.idarticulo = d.idarticulo
inner join ingreso i
on d.idingreso = i.idingreso
where a.codigo = ''%'' + @textobuscar + ''%''
and d.stock_actual > 0
and i.estado <> ''ANULADO''
' 
END
GO
/****** Object:  StoredProcedure [dbo].[spmostrar_detalle_ingreso]    Script Date: 08/30/2016 17:19:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spmostrar_detalle_ingreso]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'create proc [dbo].[spmostrar_detalle_ingreso]
@textobuscar int
as
select d.idarticulo,a.nombre as Articulo,d.precio_compra,
d.precio_venta,d.stock_inicial,d.fecha_produccion,
d.fecha_vencimiento,(d.stock_inicial*d.precio_compra) as Subtotal
from detalle_ingreso d inner join articulo a
on d.idarticulo=a.idarticulo
where d.idingreso=@textobuscar
' 
END
GO
/****** Object:  StoredProcedure [dbo].[spinsertar_detalle_ingreso]    Script Date: 08/30/2016 17:19:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spinsertar_detalle_ingreso]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'create proc [dbo].[spinsertar_detalle_ingreso]
@iddetalle_ingreso int output,
@idingreso int,
@idarticulo int,
@precio_compra money,
@precio_venta money,
@stock_inicial int,
@stock_actual int,
@fecha_produccion date,
@fecha_vencimiento date
as
insert into detalle_ingreso (idingreso,idarticulo,precio_compra,
precio_venta,stock_inicial,stock_actual,fecha_produccion,
fecha_vencimiento)
values (@idingreso,@idarticulo,@precio_compra,
@precio_venta,@stock_inicial,@stock_actual,@fecha_produccion,
@fecha_vencimiento)
' 
END
GO
/****** Object:  StoredProcedure [dbo].[spmostrar_ingreso]    Script Date: 08/30/2016 17:19:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spmostrar_ingreso]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE proc [dbo].[spmostrar_ingreso]
as
select top 100 i.idingreso,(t.apellidos+'' ''+t.nombre) as Trabajador,
p.razon_social as Proveedor,i.fecha,i.tipo_comprobante,
i.serie,i.correlativo,i.estado,
sum(d.precio_compra*d.stock_inicial) as Total,i.itbis as Impuesto
from detalle_ingreso d inner join ingreso i
on d.idingreso=i.idingreso
inner join proveedor p
on i.idproveedor=p.idproveedor
inner join trabajador t
on i.idtrabajador=t.idtrabajador
group by
i.idingreso,t.apellidos+'' ''+t.nombre,
p.razon_social,i.fecha,i.tipo_comprobante,
i.serie,i.correlativo,i.estado,i.itbis
order by i.idingreso desc
' 
END
GO
/****** Object:  StoredProcedure [dbo].[spstock_articulos]    Script Date: 08/30/2016 17:19:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spstock_articulos]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'create proc [dbo].[spstock_articulos]
as
SELECT dbo.articulo.codigo, dbo.articulo.nombre,
dbo.categoria.nombre AS Categoria,
sum(dbo.detalle_ingreso.stock_inicial) as Cantidad_Ingreso,
sum(dbo.detalle_ingreso.stock_actual) as Cantidad_Stock,
(sum(dbo.detalle_ingreso.stock_inicial)-
sum(dbo.detalle_ingreso.stock_actual)) as Cantidad_Venta
FROM dbo.articulo INNER JOIN dbo.categoria 
ON dbo.articulo.idcategoria = dbo.categoria.idcategoria 
INNER JOIN dbo.detalle_ingreso 
ON dbo.articulo.idarticulo = dbo.detalle_ingreso.idarticulo 
INNER JOIN dbo.ingreso 
ON dbo.detalle_ingreso.idingreso = dbo.ingreso.idingreso
where ingreso.estado<>''ANULADO''
group by dbo.articulo.codigo, dbo.articulo.nombre,
dbo.categoria.nombre
' 
END
GO
/****** Object:  StoredProcedure [dbo].[spreporte_factura]    Script Date: 08/30/2016 17:19:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spreporte_factura]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE proc [dbo].[spreporte_factura]
@idventa int
as
select 
v.idventa,(t.apellidos+'' ''+t.nombre) as Trabajador,
(c.apellidos+'' ''+c.nombre) as Cliente,
c.direccion,c.telefono,c.num_documento,
v.fecha,v.tipo_comprobante,v.serie,v.correlativo,
v.itbis,a.nombre,dv.precio_venta,dv.cantidad,dv.descuento,
(dv.cantidad*dv.precio_venta-dv.descuento) as Total_Parcial
 from detalle_venta dv inner join detalle_ingreso di
on dv.iddetalle_ingreso=di.iddetalle_ingreso
inner join articulo a
on a.idarticulo=di.idarticulo
inner join venta v
on v.idventa=dv.idventa
inner join cliente c
on v.idcliente=c.idcliente
inner join trabajador t
on t.idtrabajador=v.idtrabajador
where v.idventa=@idventa
' 
END
GO
/****** Object:  StoredProcedure [dbo].[spmostrar_venta]    Script Date: 08/30/2016 17:19:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spmostrar_venta]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE proc [dbo].[spmostrar_venta]
as
select top 100 v.idventa,
(t.apellidos+'' ''+t.nombre) as Trabajador,
(c.apellidos+'' ''+c.nombre) as Cliente,
v.fecha,v.tipo_comprobante,v.serie,v.correlativo,
sum((d.cantidad*d.precio_venta)-d.descuento) as Total,v.itbis as Impuesto
from detalle_venta d inner join venta v
on d.idventa=v.idventa
inner join cliente c
on v.idcliente=c.idcliente
inner join trabajador t
on v.idtrabajador=t.idtrabajador
group by v.idventa,
(t.apellidos+'' ''+t.nombre),
(c.apellidos+'' ''+c.nombre),
v.fecha,v.tipo_comprobante,v.serie,v.correlativo,v.itbis
order by v.idventa desc
' 
END
GO
/****** Object:  StoredProcedure [dbo].[spmostrar_detalle_venta]    Script Date: 08/30/2016 17:19:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spmostrar_detalle_venta]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'create proc [dbo].[spmostrar_detalle_venta]
@textobuscar int
as
select d.iddetalle_ingreso,a.nombre as Artículo,
d.cantidad,d.precio_venta,d.descuento,
((d.precio_venta*d.cantidad)-d.descuento) as Subtotal
from detalle_venta d inner join detalle_ingreso di
on d.iddetalle_ingreso=di.iddetalle_ingreso
inner join articulo a
on di.idarticulo=a.idarticulo
where d.idventa=@textobuscar
' 
END
GO
/****** Object:  StoredProcedure [dbo].[spinsertar_detalle_venta]    Script Date: 08/30/2016 17:19:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spinsertar_detalle_venta]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'create proc [dbo].[spinsertar_detalle_venta]
@iddetalle_venta int output,
@idventa int,
@iddetalle_ingreso int,
@cantidad int,
@precio_venta money,
@descuento money
as
insert into detalle_venta (idventa,iddetalle_ingreso,cantidad,
precio_venta,descuento)
values (@idventa,@iddetalle_ingreso,@cantidad,
@precio_venta,@descuento)
' 
END
GO
/****** Object:  StoredProcedure [dbo].[spbuscar_venta_fecha]    Script Date: 08/30/2016 17:19:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spbuscar_venta_fecha]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE proc [dbo].[spbuscar_venta_fecha]
@fechaInicio varchar(50),
@fechaFin varchar(50)
as
select v.idventa,
(t.apellidos+'' ''+t.nombre) as Trabajador,
(c.apellidos+'' ''+c.nombre) as Cliente,
v.fecha,v.tipo_comprobante,v.serie,v.correlativo,
sum((d.cantidad*d.precio_venta)-d.descuento) as Total,v.itbis as Impuesto
from detalle_venta d inner join venta v
on d.idventa=v.idventa
inner join cliente c
on v.idcliente=c.idcliente
inner join trabajador t
on v.idtrabajador=t.idtrabajador
group by v.idventa,
(t.apellidos+'' ''+t.nombre),
(c.apellidos+'' ''+c.nombre),
v.fecha,v.tipo_comprobante,v.serie,v.correlativo,v.itbis
having v.fecha>=@fechaInicio and v.fecha<=@fechaFin
' 
END
GO
/****** Object:  ForeignKey [FK_venta_cliente]    Script Date: 08/30/2016 17:19:56 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_venta_cliente]') AND parent_object_id = OBJECT_ID(N'[dbo].[venta]'))
ALTER TABLE [dbo].[venta]  WITH CHECK ADD  CONSTRAINT [FK_venta_cliente] FOREIGN KEY([idcliente])
REFERENCES [dbo].[cliente] ([idcliente])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_venta_cliente]') AND parent_object_id = OBJECT_ID(N'[dbo].[venta]'))
ALTER TABLE [dbo].[venta] CHECK CONSTRAINT [FK_venta_cliente]
GO
/****** Object:  ForeignKey [FK_venta_trabajador]    Script Date: 08/30/2016 17:19:56 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_venta_trabajador]') AND parent_object_id = OBJECT_ID(N'[dbo].[venta]'))
ALTER TABLE [dbo].[venta]  WITH CHECK ADD  CONSTRAINT [FK_venta_trabajador] FOREIGN KEY([idtrabajador])
REFERENCES [dbo].[trabajador] ([idtrabajador])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_venta_trabajador]') AND parent_object_id = OBJECT_ID(N'[dbo].[venta]'))
ALTER TABLE [dbo].[venta] CHECK CONSTRAINT [FK_venta_trabajador]
GO
/****** Object:  ForeignKey [FK_articulo_categoria]    Script Date: 08/30/2016 17:19:56 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_articulo_categoria]') AND parent_object_id = OBJECT_ID(N'[dbo].[articulo]'))
ALTER TABLE [dbo].[articulo]  WITH CHECK ADD  CONSTRAINT [FK_articulo_categoria] FOREIGN KEY([idcategoria])
REFERENCES [dbo].[categoria] ([idcategoria])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_articulo_categoria]') AND parent_object_id = OBJECT_ID(N'[dbo].[articulo]'))
ALTER TABLE [dbo].[articulo] CHECK CONSTRAINT [FK_articulo_categoria]
GO
/****** Object:  ForeignKey [FK_articulo_presentacion]    Script Date: 08/30/2016 17:19:56 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_articulo_presentacion]') AND parent_object_id = OBJECT_ID(N'[dbo].[articulo]'))
ALTER TABLE [dbo].[articulo]  WITH CHECK ADD  CONSTRAINT [FK_articulo_presentacion] FOREIGN KEY([idpresentacion])
REFERENCES [dbo].[presentacion] ([idpresentacion])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_articulo_presentacion]') AND parent_object_id = OBJECT_ID(N'[dbo].[articulo]'))
ALTER TABLE [dbo].[articulo] CHECK CONSTRAINT [FK_articulo_presentacion]
GO
/****** Object:  ForeignKey [FK_ingreso_proveedor]    Script Date: 08/30/2016 17:19:56 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ingreso_proveedor]') AND parent_object_id = OBJECT_ID(N'[dbo].[ingreso]'))
ALTER TABLE [dbo].[ingreso]  WITH CHECK ADD  CONSTRAINT [FK_ingreso_proveedor] FOREIGN KEY([idproveedor])
REFERENCES [dbo].[proveedor] ([idproveedor])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ingreso_proveedor]') AND parent_object_id = OBJECT_ID(N'[dbo].[ingreso]'))
ALTER TABLE [dbo].[ingreso] CHECK CONSTRAINT [FK_ingreso_proveedor]
GO
/****** Object:  ForeignKey [FK_ingreso_trabajador]    Script Date: 08/30/2016 17:19:56 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ingreso_trabajador]') AND parent_object_id = OBJECT_ID(N'[dbo].[ingreso]'))
ALTER TABLE [dbo].[ingreso]  WITH CHECK ADD  CONSTRAINT [FK_ingreso_trabajador] FOREIGN KEY([idtrabajador])
REFERENCES [dbo].[trabajador] ([idtrabajador])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ingreso_trabajador]') AND parent_object_id = OBJECT_ID(N'[dbo].[ingreso]'))
ALTER TABLE [dbo].[ingreso] CHECK CONSTRAINT [FK_ingreso_trabajador]
GO
/****** Object:  ForeignKey [FK_detalle_ingreso_articulo]    Script Date: 08/30/2016 17:19:59 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_detalle_ingreso_articulo]') AND parent_object_id = OBJECT_ID(N'[dbo].[detalle_ingreso]'))
ALTER TABLE [dbo].[detalle_ingreso]  WITH CHECK ADD  CONSTRAINT [FK_detalle_ingreso_articulo] FOREIGN KEY([idarticulo])
REFERENCES [dbo].[articulo] ([idarticulo])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_detalle_ingreso_articulo]') AND parent_object_id = OBJECT_ID(N'[dbo].[detalle_ingreso]'))
ALTER TABLE [dbo].[detalle_ingreso] CHECK CONSTRAINT [FK_detalle_ingreso_articulo]
GO
/****** Object:  ForeignKey [FK_detalle_ingreso_ingreso]    Script Date: 08/30/2016 17:19:59 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_detalle_ingreso_ingreso]') AND parent_object_id = OBJECT_ID(N'[dbo].[detalle_ingreso]'))
ALTER TABLE [dbo].[detalle_ingreso]  WITH CHECK ADD  CONSTRAINT [FK_detalle_ingreso_ingreso] FOREIGN KEY([idingreso])
REFERENCES [dbo].[ingreso] ([idingreso])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_detalle_ingreso_ingreso]') AND parent_object_id = OBJECT_ID(N'[dbo].[detalle_ingreso]'))
ALTER TABLE [dbo].[detalle_ingreso] CHECK CONSTRAINT [FK_detalle_ingreso_ingreso]
GO
/****** Object:  ForeignKey [FK_detalle_venta_detalle_ingreso]    Script Date: 08/30/2016 17:19:59 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_detalle_venta_detalle_ingreso]') AND parent_object_id = OBJECT_ID(N'[dbo].[detalle_venta]'))
ALTER TABLE [dbo].[detalle_venta]  WITH CHECK ADD  CONSTRAINT [FK_detalle_venta_detalle_ingreso] FOREIGN KEY([iddetalle_ingreso])
REFERENCES [dbo].[detalle_ingreso] ([iddetalle_ingreso])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_detalle_venta_detalle_ingreso]') AND parent_object_id = OBJECT_ID(N'[dbo].[detalle_venta]'))
ALTER TABLE [dbo].[detalle_venta] CHECK CONSTRAINT [FK_detalle_venta_detalle_ingreso]
GO
/****** Object:  ForeignKey [FK_detalle_venta_venta]    Script Date: 08/30/2016 17:19:59 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_detalle_venta_venta]') AND parent_object_id = OBJECT_ID(N'[dbo].[detalle_venta]'))
ALTER TABLE [dbo].[detalle_venta]  WITH CHECK ADD  CONSTRAINT [FK_detalle_venta_venta] FOREIGN KEY([idventa])
REFERENCES [dbo].[venta] ([idventa])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_detalle_venta_venta]') AND parent_object_id = OBJECT_ID(N'[dbo].[detalle_venta]'))
ALTER TABLE [dbo].[detalle_venta] CHECK CONSTRAINT [FK_detalle_venta_venta]
GO

    © 2019 GitHub, Inc.
    Terms
    Privacy
    Security
    Status
    Help

    Contact GitHub
    Pricing
    API
    Training
    Blog
    About

