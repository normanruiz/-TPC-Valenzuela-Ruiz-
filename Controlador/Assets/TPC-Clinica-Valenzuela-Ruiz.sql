-- ####################################################################################################################
--  Inicio script creacion base de datos Trabajo Practico Cuatrimestral Valenzuela Ruiz
-- ====================================================================================================================
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--  Creacion de la base de datos
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

USE [master]
GO

/****** Object:  Database [TPC-Clinica-Valenzuela-Ruiz]    Script Date: 26/10/2022 19:25:03 ******/
CREATE DATABASE [TPC-Clinica-Valenzuela-Ruiz]
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TPC-Clinica-Valenzuela-Ruiz].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [TPC-Clinica-Valenzuela-Ruiz] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [TPC-Clinica-Valenzuela-Ruiz] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [TPC-Clinica-Valenzuela-Ruiz] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [TPC-Clinica-Valenzuela-Ruiz] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [TPC-Clinica-Valenzuela-Ruiz] SET ARITHABORT OFF 
GO

ALTER DATABASE [TPC-Clinica-Valenzuela-Ruiz] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [TPC-Clinica-Valenzuela-Ruiz] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [TPC-Clinica-Valenzuela-Ruiz] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [TPC-Clinica-Valenzuela-Ruiz] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [TPC-Clinica-Valenzuela-Ruiz] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [TPC-Clinica-Valenzuela-Ruiz] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [TPC-Clinica-Valenzuela-Ruiz] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [TPC-Clinica-Valenzuela-Ruiz] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [TPC-Clinica-Valenzuela-Ruiz] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [TPC-Clinica-Valenzuela-Ruiz] SET  DISABLE_BROKER 
GO

ALTER DATABASE [TPC-Clinica-Valenzuela-Ruiz] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [TPC-Clinica-Valenzuela-Ruiz] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [TPC-Clinica-Valenzuela-Ruiz] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [TPC-Clinica-Valenzuela-Ruiz] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [TPC-Clinica-Valenzuela-Ruiz] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [TPC-Clinica-Valenzuela-Ruiz] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [TPC-Clinica-Valenzuela-Ruiz] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [TPC-Clinica-Valenzuela-Ruiz] SET RECOVERY FULL 
GO

ALTER DATABASE [TPC-Clinica-Valenzuela-Ruiz] SET  MULTI_USER 
GO

ALTER DATABASE [TPC-Clinica-Valenzuela-Ruiz] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [TPC-Clinica-Valenzuela-Ruiz] SET DB_CHAINING OFF 
GO

ALTER DATABASE [TPC-Clinica-Valenzuela-Ruiz] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO

ALTER DATABASE [TPC-Clinica-Valenzuela-Ruiz] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO

ALTER DATABASE [TPC-Clinica-Valenzuela-Ruiz] SET DELAYED_DURABILITY = DISABLED 
GO

ALTER DATABASE [TPC-Clinica-Valenzuela-Ruiz] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO

ALTER DATABASE [TPC-Clinica-Valenzuela-Ruiz] SET QUERY_STORE = OFF
GO

ALTER DATABASE [TPC-Clinica-Valenzuela-Ruiz] SET  READ_WRITE 
GO

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--  Creacion de la tabla [dbo].[perfiles]
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

USE [TPC-Clinica-Valenzuela-Ruiz]
GO

/****** Object:  Table [dbo].[perfiles]    Script Date: 5/11/2022 15:11:41 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[perfiles](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[tipo] [varchar](40) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[tipo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO



-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--  Creacion de la tabla [dbo].[usuarios]
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

USE [TPC-Clinica-Valenzuela-Ruiz]
GO

/****** Object:  Table [dbo].[usuarios]    Script Date: 29/10/2022 14:34:34 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[usuarios](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](60) NOT NULL,
	[contrasenia] [varchar](60) NOT NULL,
	[idPerfil] int NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[usuarios]  WITH CHECK ADD FOREIGN KEY([idPerfil])
REFERENCES [dbo].[perfiles] ([id])
GO

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--  Creacion de la tabla [dbo].[estados]
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

USE [TPC-Clinica-Valenzuela-Ruiz]
GO

/****** Object:  Table [dbo].[estados]    Script Date: 26/10/2022 19:40:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[estados](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](40) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[descripcion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--  Creacion de la tabla [dbo].[especialidades]
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

USE [TPC-Clinica-Valenzuela-Ruiz]
GO

/****** Object:  Table [dbo].[especialidades]    Script Date: 27/10/2022 06:39:21 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[especialidades](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](40) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--  Creacion de la tabla [dbo].[horarios]
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

USE [TPC-Clinica-Valenzuela-Ruiz]
GO

/****** Object:  Table [dbo].[horarios]    Script Date: 27/10/2022 09:14:05 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[horarios](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[rango] [varchar](40) NOT NULL,
	[fecha] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[rango] ASC,
	[fecha] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--  Creacion de la tabla [dbo].[personas]
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

USE [TPC-Clinica-Valenzuela-Ruiz]
GO

/****** Object:  Table [dbo].[personas]    Script Date: 7/11/2022 10:14:57 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[personas](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[dni] [varchar](10) NOT NULL,
	[nombre] [varchar](60) NOT NULL,
	[apellido] [varchar](60) NOT NULL,
	[email] [varchar](100) NOT NULL,
	[idUsuario] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[dni] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[personas]  WITH CHECK ADD FOREIGN KEY([idUsuario])
REFERENCES [dbo].[usuarios] ([id])
GO

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--  Creacion de la tabla [dbo].[medicos]
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

USE [TPC-Clinica-Valenzuela-Ruiz]
GO

/****** Object:  Table [dbo].[medicos]    Script Date: 27/10/2022 08:41:21 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[medicos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idPersona] [int] NOT NULL,
	[idEspecialidad] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[idpersona] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[medicos]  WITH CHECK ADD FOREIGN KEY([idpersona])
REFERENCES [dbo].[personas] ([id])
GO

ALTER TABLE [dbo].[medicos]  WITH CHECK ADD FOREIGN KEY([idEspecialidad])
REFERENCES [dbo].[especialidades] ([id])
GO

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--  Creacion de la tabla [dbo].[pacientes]
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

USE [TPC-Clinica-Valenzuela-Ruiz]
GO

/****** Object:  Table [dbo].[pacientes]    Script Date: 29/10/2022 20:28:36 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[pacientes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idPersona] [int] NOT NULL,
	[dni] [varchar](8) NOT NULL,
	[fechaNacimiento] [date] NOT NULL,
	[direccion] [varchar](100) NOT NULL,
	[telefono] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[dni] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[idPersona] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[pacientes]  WITH CHECK ADD FOREIGN KEY([idPersona])
REFERENCES [dbo].[personas] ([id])
GO

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--  Creacion de la tabla [dbo].[turnos]
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

USE [TPC-Clinica-Valenzuela-Ruiz]
GO

/****** Object:  Table [dbo].[turnos]    Script Date: 27/10/2022 08:41:43 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[turnos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ipPaciente] [int] NOT NULL,
	[idEspecialidad] [int] NOT NULL,
	[idHorario] [int] NOT NULL,
	[idMedico] [int] NOT NULL,
	[idEstado] [int] NOT NULL,
	[fechaCreacion] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[ipPaciente] ASC,
	[idHorario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[idMedico] ASC,
	[idHorario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[turnos]  WITH CHECK ADD FOREIGN KEY([idEspecialidad])
REFERENCES [dbo].[especialidades] ([id])
GO

ALTER TABLE [dbo].[turnos]  WITH CHECK ADD FOREIGN KEY([idEstado])
REFERENCES [dbo].[estados] ([id])
GO

ALTER TABLE [dbo].[turnos]  WITH CHECK ADD FOREIGN KEY([idHorario])
REFERENCES [dbo].[horarios] ([id])
GO

ALTER TABLE [dbo].[turnos]  WITH CHECK ADD FOREIGN KEY([idMedico])
REFERENCES [dbo].[medicos] ([id])
GO

ALTER TABLE [dbo].[turnos]  WITH CHECK ADD FOREIGN KEY([ipPaciente])
REFERENCES [dbo].[pacientes] ([id])
GO

-- ====================================================================================================================
--  Fin script creacion base de datos Trabajo Practico Cuatrimestral Valenzuela Ruiz
-- ####################################################################################################################

-- ####################################################################################################################
--  Set de datos basicos
-- ====================================================================================================================
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--  Datos [dbo].[estados]
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

INSERT INTO [TPC-Clinica-Valenzuela-Ruiz].[dbo].[perfiles] ([tipo])
       VALUES ('Administrador'),
	          ('Recepcionista'),
	          ('Medico');
GO


-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--  Datos [dbo].[estados]
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

INSERT INTO [TPC-Clinica-Valenzuela-Ruiz].[dbo].[estados] ([descripcion])
       VALUES ('Nuevo'), 
	          ('Reprogramado'), 
			  ('Cancelado'), 
			  ('Asistió'), 
			  ('Cerrado');
GO

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--  Datos [dbo].[especialidades]
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

INSERT INTO [TPC-Clinica-Valenzuela-Ruiz].[dbo].[especialidades] ([nombre])
       VALUES ('Neurofisiología'),
              ('Neurología'),
              ('Obstetricia'),
              ('Odontología'),
              ('Oftalmología'),
              ('Otorrinolaringología'),
              ('Pediatría'),
              ('Podología'),
              ('Psicología'),
              ('Psiquiatría'),
              ('Radiología'),
              ('Rehabilitación'),
              ('Traumatología'),
              ('Urología'),
              ('Venereología'),
              ('Aparato Digestivo'),
              ('Alergología'),
              ('Cardiología'),
              ('Cirugía Vascular'),
              ('Cirugía General'),
              ('Dermatología Clínica'),
              ('Dermatología Estética'),
              ('Enfermería'),
              ('Fisioterapia'),
              ('Ginecología'),
              ('Medicina Estétic'),
              ('Medicina Familiar y Comunitaria'),
              ('Medicina Interna'),
              ('Médico Rehabilitador'),
              ('Neumología');
GO

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--  Datos [dbo].[horarios]
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--  Datos [dbo].[usuario]
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

INSERT INTO [TPC-Clinica-Valenzuela-Ruiz].[dbo].[usuarios] ([nombre], [contrasenia], [idPerfil])
       VALUES ('nruiz', 'Nruiz1234', 1),
	          ('mvalenzuela', 'Mvalenzuela1234', 1),
	          ('mfernandez', 'Mfernandez1234', 1),
	          ('rgoncalves', 'Rgoncalves1234', 1),
	          ('ykikuchi', 'Ykikuchi1234', 3),
	          ('kannHu', 'KannHu1234', 3),
	          ('salexander', 'Salexander1234', 3),
	          ('ksackhoff', 'Ksackhoff1234', 3),
	          ('avikander', 'Avikander1234', 2),
	          ('ocockburn', 'Ocockburn1234', 2),
	          ('kstewart ', 'Kstewart 1234', 2),
	          ('kscodelario', 'Kscodelario1234', 2);
GO

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--  Datos [dbo].[personas]
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

INSERT INTO [TPC-Clinica-Valenzuela-Ruiz].[dbo].[personas] ([dni], [nombre], [apellido], [email], [idUsuario])
       VALUES ('27846268', 'Norman', 'Ruiz', 'norman.ruiz@outlook.com.ar', 1),
	          ('99999901', 'Macarena Aldana', 'Valenzuela', 'correo1@hotmail.com', 2),
			  ('99999902', 'Maximiliano', 'Sar Fernandez', 'correo2@hotmail.com', 3),
			  ('99999903', 'Regina', 'Laurentino Goncalves', 'correo3@hotmail.com', 4),
			  ('99999904', 'Yuriko', 'Kikuchi', 'correo4@hotmail.com', 5),
			  ('99999905', 'Kelly', 'Ann Hu', 'correo5@hotmail.com', 6),
			  ('99999906', 'Sasha', 'Alexander', 'correo6@hotmail.com', 7),
			  ('99999907', 'Kathryn Ann', 'Sackhoff', 'correo7@hotmail.com', 8),
			  ('99999908', 'Alicia Amanda', 'Vikander', 'correo8@hotmail.com', 9),
			  ('99999909', 'Olivia Jane', 'Cockburn', 'correo9@hotmail.com', 10),
			  ('99999910', 'Kristen Jaymes', 'Stewart', 'correo10@hotmail.com', 11),
			  ('99999911', 'Kaya Rose', 'Humphrey Scodelario', 'correo11@hotmail.com', 12),
			  ('99999912', 'Emily Olivia', 'Leah Blunt', 'correo12@hotmail.com', null),
			  ('99999913', 'Koyuki', 'Kato', 'correo13@hotmail.com', null),
			  ('99999914', 'Sophie Daniele', 'Sylvie Maupu', 'correo14@hotmail.com', null),
			  ('99999915', 'Amy Lou', 'Adams', 'correo15@hotmail.com', null);
GO

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--  Datos [dbo].[medicos]
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

INSERT INTO [TPC-Clinica-Valenzuela-Ruiz].[dbo].[medicos] ([idPersona], [idEspecialidad])
       VALUES (5, 2),
	          (6, 4),
	          (7, 8),
	          (8, 12);
GO

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--  Datos [dbo].[pacientes]
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

INSERT INTO [TPC-Clinica-Valenzuela-Ruiz].[dbo].[pacientes] ([idPersona], [dni], [fechaNacimiento], [direccion], [telefono])
       VALUES (13, '11111111', '1983-02-23', 'Reino Unido', 'N/D'),
	          (14, '22222222', '1976-12-18', 'Japon', 'N/D'),
	          (15, '33333333', '1966-11-17', 'Francia', 'N/D'),
	          (16, '44444444', '1974-08-20', 'EEUU', 'N/D');
GO

-- ====================================================================================================================
--  Fin script creacion base de datos Trabajo Practico Cuatrimestral Valenzuela Ruiz
-- ####################################################################################################################

-- ####################################################################################################################
--  Querys y nonquerys para los CRUDs
-- ====================================================================================================================
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--  CRUDs [dbo].[perfiles]
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- --------------------------------------------------------------------------------------------------------------------
--  Listado
-- --------------------------------------------------------------------------------------------------------------------

SELECT p.[id]
      ,p.[tipo]
       FROM [TPC-Clinica-Valenzuela-Ruiz].[dbo].[perfiles] AS p WITH (NOLOCK);
GO

-- --------------------------------------------------------------------------------------------------------------------
--  Buscar con id
-- --------------------------------------------------------------------------------------------------------------------

SELECT p.[id]
      ,p.[tipo]
       FROM [TPC-Clinica-Valenzuela-Ruiz].[dbo].[perfiles] AS p WITH (NOLOCK)
	   WHERE p.[id] = 1;
GO

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--  CRUDs [dbo].[estados]
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- --------------------------------------------------------------------------------------------------------------------
--  Listado
-- --------------------------------------------------------------------------------------------------------------------

SELECT e.[id]
      ,e.[descripcion] 
	   FROM [TPC-Clinica-Valenzuela-Ruiz].[dbo].[estados] AS e WITH (NOLOCK);
GO

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--  CRUDs [dbo].[especialidades]
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- --------------------------------------------------------------------------------------------------------------------
--  Listado
-- --------------------------------------------------------------------------------------------------------------------

SELECT e.[id]
      ,e.[nombre]
       FROM [TPC-Clinica-Valenzuela-Ruiz].[dbo].[especialidades] AS e WITH (NOLOCK);

GO

-- --------------------------------------------------------------------------------------------------------------------
--  Buscar con id
-- --------------------------------------------------------------------------------------------------------------------

SELECT e.[id]
      ,e.[nombre]
       FROM [TPC-Clinica-Valenzuela-Ruiz].[dbo].[especialidades] AS e WITH (NOLOCK)
	   WHERE e.[id] = 31;

GO

-- --------------------------------------------------------------------------------------------------------------------
--  Alta
-- --------------------------------------------------------------------------------------------------------------------

INSERT INTO [TPC-Clinica-Valenzuela-Ruiz].[dbo].[especialidades] ([nombre])
       VALUES ('Pruebas alta');

-- --------------------------------------------------------------------------------------------------------------------
--  Modificacion
-- --------------------------------------------------------------------------------------------------------------------

UPDATE [TPC-Clinica-Valenzuela-Ruiz].[dbo].[especialidades]
       SET [nombre] = 'Pruebas modificacion'
       WHERE [id] = 31;
GO

-- --------------------------------------------------------------------------------------------------------------------
--  Baja
-- --------------------------------------------------------------------------------------------------------------------

DELETE FROM [TPC-Clinica-Valenzuela-Ruiz].[dbo].[especialidades]
       WHERE [id] = 31;
GO

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--  CRUDs [dbo].[horarios]
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- --------------------------------------------------------------------------------------------------------------------
--  Listado
-- --------------------------------------------------------------------------------------------------------------------

SELECT h.[id]
      ,h.[rango]
      ,h.[fecha]
       FROM [TPC-Clinica-Valenzuela-Ruiz].[dbo].[horarios] AS h WITH (NOLOCK);

GO

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--  CRUDs [dbo].[usuarios]
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- --------------------------------------------------------------------------------------------------------------------
--  Listado
-- --------------------------------------------------------------------------------------------------------------------

SELECT u.[id]
      ,u.[nombre]
      ,u.[contrasenia]
      ,u.[idPerfil]
       FROM [TPC-Clinica-Valenzuela-Ruiz].[dbo].[usuarios] AS u WITH (NOLOCK);
GO

-- --------------------------------------------------------------------------------------------------------------------
--  Buscar con id
-- --------------------------------------------------------------------------------------------------------------------

SELECT u.[id]
      ,u.[nombre]
      ,u.[contrasenia]
      ,u.[idPerfil]
       FROM [TPC-Clinica-Valenzuela-Ruiz].[dbo].[usuarios] AS u WITH (NOLOCK)
	   WHERE u.[id] = 1;
GO

-- --------------------------------------------------------------------------------------------------------------------
--  Buscar con nombre
-- --------------------------------------------------------------------------------------------------------------------

SELECT u.[id]
     , u.[nombre]
     , u.[contrasenia]
     , u.[idPerfil] 
       FROM [TPC-Clinica-Valenzuela-Ruiz].[dbo].[usuarios] AS u WITH (NOLOCK) 
	   WHERE u.[nombre] = 'nruiz';
GO

-- --------------------------------------------------------------------------------------------------------------------
--  Alta
-- --------------------------------------------------------------------------------------------------------------------

INSERT INTO [TPC-Clinica-Valenzuela-Ruiz].[dbo].[usuarios] ([nombre], [contrasenia], [IdPerfil])
       VALUES ('Pruebas insert', 'Pruebas insert', 3);
GO

-- --------------------------------------------------------------------------------------------------------------------
--  Modificacion
-- --------------------------------------------------------------------------------------------------------------------

UPDATE [TPC-Clinica-Valenzuela-Ruiz].[dbo].[usuarios]
       SET [nombre] = 'Pruebas modificacion'
          ,[contrasenia] = 'Pruebas modificacion'
          ,[idPerfil] = 3
       WHERE [id] = 13;
GO

-- --------------------------------------------------------------------------------------------------------------------
--  Baja
-- --------------------------------------------------------------------------------------------------------------------

DELETE FROM [TPC-Clinica-Valenzuela-Ruiz].[dbo].[usuarios]
       WHERE [id] = 13;
GO

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--  CRUDs [dbo].[personas]
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- --------------------------------------------------------------------------------------------------------------------
--  Listado
-- --------------------------------------------------------------------------------------------------------------------

SELECT p.[id]
	  ,p.[dni]
      ,p.[nombre]
      ,p.[apellido]
      ,p.[email]
      ,p.[idUsuario]
       FROM [TPC-Clinica-Valenzuela-Ruiz].[dbo].[personas] AS p WITH (NOLOCK);
GO

-- --------------------------------------------------------------------------------------------------------------------
--  Buscar con id
-- --------------------------------------------------------------------------------------------------------------------

SELECT p.[id]
      ,p.[dni]
      ,p.[nombre]
      ,p.[apellido]
      ,p.[email]
      ,p.[idUsuario]
       FROM [TPC-Clinica-Valenzuela-Ruiz].[dbo].[personas] AS p WITH (NOLOCK)
	   WHERE p.[id] = 1;
GO

-- --------------------------------------------------------------------------------------------------------------------
--  Alta
-- --------------------------------------------------------------------------------------------------------------------

INSERT INTO [TPC-Clinica-Valenzuela-Ruiz].[dbo].[personas] ([dni], [nombre], [apellido], [email], [idUsuario])
       VALUES ('987654321', 'Pruebas insert', 'Pruebas insert', 'pruebasinsert@yahoo.com.ar', NULL);
GO

-- --------------------------------------------------------------------------------------------------------------------
--  Modificacion
-- --------------------------------------------------------------------------------------------------------------------

UPDATE [TPC-Clinica-Valenzuela-Ruiz].[dbo].[personas]
       SET [dni] = '123456789'
	      ,[nombre] = 'Pruebas update'
          ,[apellido] = 'Pruebas update'
          ,[email] = 'pruebasupdate@hotmail.com.ar'
          ,[idUsuario] = NULL
       WHERE [id] = 17;
GO

-- --------------------------------------------------------------------------------------------------------------------
--  Baja
-- --------------------------------------------------------------------------------------------------------------------

DELETE FROM [TPC-Clinica-Valenzuela-Ruiz].[dbo].[personas]
       WHERE [id] = 17;
GO

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--  CRUDs [dbo].[medicos]
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- --------------------------------------------------------------------------------------------------------------------
--  Listado
-- --------------------------------------------------------------------------------------------------------------------



-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--  CRUDs [dbo].[pacientes]
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- --------------------------------------------------------------------------------------------------------------------
--  Listado
-- --------------------------------------------------------------------------------------------------------------------

SELECT p.[id]
      ,p.[idPersona]
      ,p.[dni]
      ,p.[fechaNacimiento]
      ,p.[direccion]
      ,p.[telefono]
       FROM [TPC-Clinica-Valenzuela-Ruiz].[dbo].[pacientes] AS p WITH (NOLOCK);

GO

-- ====================================================================================================================
--  Fin Querys y nonquerys para los CRUDs
-- ####################################################################################################################
