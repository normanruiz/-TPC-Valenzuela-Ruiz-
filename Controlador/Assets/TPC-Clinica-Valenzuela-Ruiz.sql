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

/****** Object:  Table [dbo].[horarios]    Script Date: 10/11/2022 15:50:08 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[horarios](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[dia] varchar(9) NOT NULL,
	[horaInicio] [int] NOT NULL,
	[horaFin] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--  Creacion de la tabla [dbo].[personas]
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

USE [TPC-Clinica-Valenzuela-Ruiz]
GO

/****** Object:  Table [dbo].[personas]    Script Date: 8/11/2022 09:14:09 ******/
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
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[dni] ASC
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
	[fechaNacimiento] [date] NOT NULL,
	[direccion] [varchar](100) NOT NULL,
	[telefono] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
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

/****** Object:  Table [dbo].[turnos]    Script Date: 23/11/2022 09:49:19 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[turnos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[numero] [varchar](4) NOT NULL,
	[idPaciente] [int] NOT NULL,
	[idEspecialidad] [int] NOT NULL,
	[idMedico] [int] NOT NULL,
	[idHorario] [int] NOT NULL,
	[horainicio] [int] NOT NULL,
	[fecha] [datetime] NOT NULL,
	[idEstado] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

--CREATE TABLE [dbo].[turnos](
--	[id] [int] IDENTITY(1,1) NOT NULL primary key,
--	[numero] varchar(4) not null,
--	[ipPaciente] [int] NOT NULL,
--	[idEspecialidad] [int] NOT NULL,
--	[idMedico] [int] NOT NULL,
--	[idHorario] [int] NOT NULL,
--	[horainicio] [int] not null,
--	[fecha] [datetime] NOT NULL,
--	[idEstado] [int] NOT NULL,
--	)

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--  Creacion de la tabla intermnedia [dbo].[MedicoXEspecialidad] 
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

USE [TPC-Clinica-Valenzuela-Ruiz]
GO

/****** Object:  Table [dbo].[MedicoXEspecialidad]    Script Date: 11/11/2022 11:24:11 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[MedicoXEspecialidad](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idMedico] [int] NOT NULL,
	[idEspecialidad] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idMedico] ASC,
	[idEspecialidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[MedicoXEspecialidad]  WITH CHECK ADD FOREIGN KEY([idEspecialidad])
REFERENCES [dbo].[especialidades] ([id])
GO

ALTER TABLE [dbo].[MedicoXEspecialidad]  WITH CHECK ADD FOREIGN KEY([idMedico])
REFERENCES [dbo].[medicos] ([id])
GO

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--  Creacion de la tabla intermnedia [dbo].[MedicoXHorario] 
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

USE [TPC-Clinica-Valenzuela-Ruiz]
GO

/****** Object:  Table [dbo].[MedicoXHorario]    Script Date: 11/11/2022 11:25:48 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[MedicoXHorario](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idMedico] [int] NOT NULL,
	[idHorario] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idMedico] ASC,
	[idHorario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[MedicoXHorario]  WITH CHECK ADD FOREIGN KEY([idHorario])
REFERENCES [dbo].[horarios] ([id])
GO

ALTER TABLE [dbo].[MedicoXHorario]  WITH CHECK ADD FOREIGN KEY([idMedico])
REFERENCES [dbo].[medicos] ([id])
GO

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--  Creacion de la tabla intermnedia [dbo].[ObservacionesXTurno] 
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

USE [TPC-Clinica-Valenzuela-Ruiz]
GO

/****** Object:  Table [dbo].[ObservacionesXTurno]    Script Date: 24/11/2022 22:28:16 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ObservacionesXTurno](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idTurno] [int] NOT NULL,
	[observacion] [varchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[ObservacionesXTurno]  WITH CHECK ADD FOREIGN KEY([idTurno])
REFERENCES [dbo].[turnos] ([id])
GO

-- ====================================================================================================================
--  Fin script creacion base de datos Trabajo Practico Cuatrimestral Valenzuela Ruiz
-- ####################################################################################################################

-- ####################################################################################################################
--  Set de datos basicos
-- ====================================================================================================================
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--  Datos [dbo].[perfiles]
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

INSERT INTO [TPC-Clinica-Valenzuela-Ruiz].[dbo].[horarios] ([dia], [horaInicio], [horaFin])
       VALUES ('Lunes', 13, 22),
	          ('Martes', 08, 13),
	          ('Miercoles', 13, 22),
	          ('Jueves', 08, 13),
	          ('Viernes', 13, 22);
GO


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

INSERT INTO [TPC-Clinica-Valenzuela-Ruiz].[dbo].[medicos] ([idPersona])
       VALUES (5),
	          (6),
	          (7),
	          (8);
GO

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--  Datos [dbo].[pacientes]
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

INSERT INTO [TPC-Clinica-Valenzuela-Ruiz].[dbo].[pacientes] ([idPersona], [fechaNacimiento], [direccion], [telefono])
       VALUES (13, '1983-02-23', 'Reino Unido', 'N/D'),
	          (14, '1976-12-18', 'Japon', 'N/D'),
	          (15, '1966-11-17', 'Francia', 'N/D'),
	          (16, '1974-08-20', 'EEUU', 'N/D');
GO

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--  Datos [dbo].[MedicoXEspecialidad] 
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

INSERT INTO [TPC-Clinica-Valenzuela-Ruiz].[dbo].[MedicoXEspecialidad] ([idMedico], [idEspecialidad])
     VALUES (1, 2),
	        (2, 4),
	        (3, 6),
	        (4, 8);
GO

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--  Datos [dbo].[MedicoXHorario] 
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

INSERT INTO [TPC-Clinica-Valenzuela-Ruiz].[dbo].[MedicoXHorario] ([idMedico], [idHorario])
       VALUES (1, 8),
	          (1, 3),
	          (1, 9);
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

-- --------------------------------------------------------------------------------------------------------------------
--  Buscar con id
-- --------------------------------------------------------------------------------------------------------------------

SELECT e.[id]
      ,e.[descripcion] 
	   FROM [TPC-Clinica-Valenzuela-Ruiz].[dbo].[estados] AS e WITH (NOLOCK)
	   WHERE e.[id] = 1;
GO

-- --------------------------------------------------------------------------------------------------------------------
--  Alta
-- --------------------------------------------------------------------------------------------------------------------

INSERT INTO [TPC-Clinica-Valenzuela-Ruiz].[dbo].[estados] ([descripcion])
       VALUES ('Pruebas insert');
GO

-- --------------------------------------------------------------------------------------------------------------------
--  Baja
-- --------------------------------------------------------------------------------------------------------------------

DELETE FROM [TPC-Clinica-Valenzuela-Ruiz].[dbo].[estados]
       WHERE [id] = 6;
GO

-- --------------------------------------------------------------------------------------------------------------------
--  Modificacion
-- --------------------------------------------------------------------------------------------------------------------

UPDATE [TPC-Clinica-Valenzuela-Ruiz].[dbo].[estados]
       SET [descripcion] = 'Pruebas update'
       WHERE [id] = 6;
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
--  Listar con medico
-- --------------------------------------------------------------------------------------------------------------------

SELECT e.[id]
      ,e.[nombre]
       FROM [TPC-Clinica-Valenzuela-Ruiz].[dbo].[especialidades] AS e WITH (NOLOCK)
			INNER JOIN [TPC-Clinica-Valenzuela-Ruiz].[dbo].[MedicoXEspecialidad] AS mxe WITH (NOLOCK)
			      ON e.[id] = mxe.[idEspecialidad]
	   WHERE mxe.[idMedico] = 1005;
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
      ,h.[dia]
      ,h.[horaInicio]
	  ,h.[horaFin]
       FROM [TPC-Clinica-Valenzuela-Ruiz].[dbo].[horarios] AS h WITH (NOLOCK);
GO

-- --------------------------------------------------------------------------------------------------------------------
--  Buscar por id
-- --------------------------------------------------------------------------------------------------------------------

SELECT h.[id]
      ,h.[dia]
      ,h.[horaInicio]
	  ,h.[horaFin]
       FROM [TPC-Clinica-Valenzuela-Ruiz].[dbo].[horarios] AS h WITH (NOLOCK)
	   WHERE h.[id] = 1;
GO

-- --------------------------------------------------------------------------------------------------------------------
--  Listar con medico
-- --------------------------------------------------------------------------------------------------------------------

SELECT h.[id]
      ,h.[dia]
      ,h.[horaInicio]
	  ,h.[horaFin]
       FROM [TPC-Clinica-Valenzuela-Ruiz].[dbo].[horarios] AS h WITH (NOLOCK)
			INNER JOIN [TPC-Clinica-Valenzuela-Ruiz].[dbo].[MedicoXHorario] AS mxh WITH (NOLOCK)
			      ON h.[id] = mxh.[idHorario]
				     AND mxH.[idMedico] = 1012;
GO

-- --------------------------------------------------------------------------------------------------------------------
-- Buscar proximo para medico
-- --------------------------------------------------------------------------------------------------------------------

SELECT top 1 h.[id]
      ,h.[dia]
      ,h.[horaInicio]
	  ,h.[horaFin]
       FROM [TPC-Clinica-Valenzuela-Ruiz].[dbo].[horarios] AS h WITH (NOLOCK)
			INNER JOIN [TPC-Clinica-Valenzuela-Ruiz].[dbo].[MedicoXHorario] AS mxh WITH (NOLOCK)
			      ON h.[id] = mxh.[idHorario]
				     AND mxH.[idMedico] = 3
					 AND CASE h.[dia]
							WHEN 'Domingo' THEN 1
							WHEN 'Lunes' THEN 2
							WHEN 'Martes' THEN 3
							WHEN 'Miercoles' THEN 4
							WHEN 'Jueves' THEN 5
							WHEN 'Viernes' THEN 6
							WHEN 'Sabado' THEN 7
						 END >= DATEPART(dw, GETDATE());
GO

-- --------------------------------------------------------------------------------------------------------------------
-- Buscar proximo para dia
-- --------------------------------------------------------------------------------------------------------------------

SELECT h.[horainicio]
       FROM [TPC-Clinica-Valenzuela-Ruiz].[dbo].[turnos] AS h WITH (NOLOCK)
	        INNER JOIN [TPC-Clinica-Valenzuela-Ruiz].[dbo].[MedicoXHorario] AS mxh WITH (NOLOCK)
			      ON h.[id] = mxh.[idHorario]
				     AND mxh.[idMedico] = 1
					 AND mxh.[idHorario] = 5
	   WHERE CONVERT(DATE, h.[fecha]) >= CONVERT(DATE, GETDATE());

GO

-- --------------------------------------------------------------------------------------------------------------------
--  existe
-- --------------------------------------------------------------------------------------------------------------------

SELECT h.[id]
      ,h.[dia]
      ,h.[horaInicio]
      ,h.[horaFin]
       FROM [TPC-Clinica-Valenzuela-Ruiz].[dbo].[horarios] AS h WITH (NOLOCK)
	   WHERE h.[dia] = 'Lunes'
	         AND h.[horaInicio] = 8
			 AND h.[horaFin] = 3;
GO

-- --------------------------------------------------------------------------------------------------------------------
--  Alta
-- --------------------------------------------------------------------------------------------------------------------

INSERT INTO [TPC-Clinica-Valenzuela-Ruiz].[dbo].[horarios] ([dia], [horaInicio], [horaFin])
       VALUES ('Prueinser', 0, 1);
GO

-- --------------------------------------------------------------------------------------------------------------------
--  Baja
-- --------------------------------------------------------------------------------------------------------------------

DELETE FROM [TPC-Clinica-Valenzuela-Ruiz].[dbo].[horarios]
       WHERE [id] = 7;
GO

-- --------------------------------------------------------------------------------------------------------------------
--  Modificacion
-- --------------------------------------------------------------------------------------------------------------------

UPDATE [TPC-Clinica-Valenzuela-Ruiz].[dbo].[horarios]
       SET [dia] = 'PrueUpdat'
          ,[horaInicio] = 1
          ,[horaFin] = 2
       WHERE [id] = 1;
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
--  Buscar con dni
-- --------------------------------------------------------------------------------------------------------------------

SELECT p.[id]
      ,p.[dni]
      ,p.[nombre]
      ,p.[apellido]
      ,p.[email]
      ,p.[idUsuario]
       FROM [TPC-Clinica-Valenzuela-Ruiz].[dbo].[personas] AS p WITH (NOLOCK)
	   WHERE p.[dni] = '27846268';
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
       SET [dni] = '22222222'
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

SELECT m.[id]
      ,m.[idPersona]
       FROM [TPC-Clinica-Valenzuela-Ruiz].[dbo].[medicos] AS m WITH (NOLOCK);
GO

-- --------------------------------------------------------------------------------------------------------------------
--  Buscar con id
-- --------------------------------------------------------------------------------------------------------------------

SELECT m.[id]
      ,m.[idPersona]
       FROM [TPC-Clinica-Valenzuela-Ruiz].[dbo].[medicos] AS m WITH (NOLOCK)
	   WHERE m.[id] = 17;
GO

-- --------------------------------------------------------------------------------------------------------------------
--  Buscar con dni
-- --------------------------------------------------------------------------------------------------------------------

SELECT m.[id]
      ,m.[idPersona]
       FROM [TPC-Clinica-Valenzuela-Ruiz].[dbo].[medicos] AS m WITH (NOLOCK)
	        INNER JOIN [TPC-Clinica-Valenzuela-Ruiz].[dbo].[PERSONAS] AS P WITH (NOLOCK)
			      ON m.[idPersona] = p.[id]
	   WHERE p.[dni] = '27846268';
GO

-- --------------------------------------------------------------------------------------------------------------------
--  Buscar con especialidades
-- --------------------------------------------------------------------------------------------------------------------

SELECT m.[id]
      ,m.[idPersona]
       FROM [TPC-Clinica-Valenzuela-Ruiz].[dbo].[medicos] AS m WITH (NOLOCK)
	        INNER JOIN [TPC-Clinica-Valenzuela-Ruiz].[dbo].[MedicoXEspecialidad] AS mxe WITH (NOLOCK)
			      ON m.[id] = mxe.[idMedico]
					 AND mxe.[idEspecialidad] = 17;
GO

-- --------------------------------------------------------------------------------------------------------------------
--  Buscar Horarios
-- --------------------------------------------------------------------------------------------------------------------

-- --------------------------------------------------------------------------------------------------------------------
--  Alta
-- --------------------------------------------------------------------------------------------------------------------

INSERT INTO [TPC-Clinica-Valenzuela-Ruiz].[dbo].[medicos] ([idPersona])
       VALUES (1);
GO

-- --------------------------------------------------------------------------------------------------------------------
--  Baja
-- --------------------------------------------------------------------------------------------------------------------

DELETE FROM [TPC-Clinica-Valenzuela-Ruiz].[dbo].[medicos]
       WHERE [id] = 1005;
GO

-- --------------------------------------------------------------------------------------------------------------------
--  Modificacion
-- --------------------------------------------------------------------------------------------------------------------

-- --------------------------------------------------------------------------------------------------------------------
--  Asignar especialidad
-- --------------------------------------------------------------------------------------------------------------------

INSERT INTO [TPC-Clinica-Valenzuela-Ruiz].[dbo].[MedicoXEspecialidad] ([idMedico], [idEspecialidad])
       VALUES (1, 2);
GO

-- --------------------------------------------------------------------------------------------------------------------
--  Desaignar especialidad
-- --------------------------------------------------------------------------------------------------------------------

DELETE FROM [TPC-Clinica-Valenzuela-Ruiz].[dbo].[MedicoXEspecialidad] 
       WHERE [idMedico] = 1 AND [idEspecialidad] = 2;
GO

-- --------------------------------------------------------------------------------------------------------------------
--  Asignar horario
-- --------------------------------------------------------------------------------------------------------------------

INSERT INTO [TPC-Clinica-Valenzuela-Ruiz].[dbo].[MedicoXHorario] ([idMedico], [idHorario])
       VALUES (1, 2);
GO

-- --------------------------------------------------------------------------------------------------------------------
--  Desaignar horario
-- --------------------------------------------------------------------------------------------------------------------

DELETE FROM [TPC-Clinica-Valenzuela-Ruiz].[dbo].[MedicoXHorario]
       WHERE [idMedico] = 1 AND [idHorario] = 2;
GO

-- --------------------------------------------------------------------------------------------------------------------
--  Quitar especialidades
-- --------------------------------------------------------------------------------------------------------------------

DELETE FROM [TPC-Clinica-Valenzuela-Ruiz].[dbo].[MedicoXEspecialidad]
       WHERE [idMedico] = 1;
GO

-- --------------------------------------------------------------------------------------------------------------------
--  Quitar horarios
-- --------------------------------------------------------------------------------------------------------------------

DELETE FROM [TPC-Clinica-Valenzuela-Ruiz].[dbo].[MedicoXHorario]
       WHERE [idMedico] = 1;
GO

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--  CRUDs [dbo].[pacientes]
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- --------------------------------------------------------------------------------------------------------------------
--  Listado
-- --------------------------------------------------------------------------------------------------------------------

SELECT p.[id]
      ,p.[idPersona]
      ,p.[fechaNacimiento]
      ,p.[direccion]
      ,p.[telefono]
       FROM [TPC-Clinica-Valenzuela-Ruiz].[dbo].[pacientes] AS p WITH (NOLOCK);
GO

-- --------------------------------------------------------------------------------------------------------------------
--  Buscar con id
-- --------------------------------------------------------------------------------------------------------------------
SELECT p.[id]
      ,p.[idPersona]
      ,p.[fechaNacimiento]
      ,p.[direccion]
      ,p.[telefono]
       FROM [TPC-Clinica-Valenzuela-Ruiz].[dbo].[pacientes] AS p WITH (NOLOCK)
	   WHERE p.[id] = 1;
GO



SELECT pa.[id]
      ,pa.[idPersona]
      ,pa.[fechaNacimiento]
      ,pa.[direccion]
      ,pa.[telefono]
       FROM [TPC-Clinica-Valenzuela-Ruiz].[dbo].[pacientes] AS pa WITH (NOLOCK)
	        INNER JOIN [TPC-Clinica-Valenzuela-Ruiz].[dbo].[personas] AS pe WITH (NOLOCK)
			      on pa.[idPersona] = pe.[id]
				     AND pe.[dni] = '27846268';
GO




-- --------------------------------------------------------------------------------------------------------------------
--  Alta
-- --------------------------------------------------------------------------------------------------------------------

INSERT INTO [TPC-Clinica-Valenzuela-Ruiz].[dbo].[pacientes] ([idPersona], [fechaNacimiento], [direccion], [telefono])
       VALUES (17, '01/01/2023', 'Pruebas inset','pruebas inset');
GO

-- --------------------------------------------------------------------------------------------------------------------
--  Baja
-- --------------------------------------------------------------------------------------------------------------------

DELETE FROM [TPC-Clinica-Valenzuela-Ruiz].[dbo].[pacientes]
       WHERE [id] = 5;
GO

-- --------------------------------------------------------------------------------------------------------------------
--  Modificacion
-- --------------------------------------------------------------------------------------------------------------------

UPDATE [TPC-Clinica-Valenzuela-Ruiz].[dbo].[pacientes]
       SET [idPersona] = 17
          ,[fechaNacimiento] = '02/22/2022'
          ,[direccion] = 'Pruebas update'
          ,[telefono] = 'Pruebas update'
       WHERE [id] = 5;
GO

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--  CRUDs [dbo].[turnos]
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- --------------------------------------------------------------------------------------------------------------------
--  Listado
-- --------------------------------------------------------------------------------------------------------------------

SELECT t.[id]
      ,t.[numero]
      ,t.[ipPaciente]
      ,t.[idEspecialidad]
      ,t.[idMedico]
      ,t.[idHorario]
      ,t.[horainicio]
      ,t.[fecha]
      ,t.[idEstado]
       FROM [TPC-Clinica-Valenzuela-Ruiz].[dbo].[turnos] AS t WITH (NOLOCK);
GO

-- --------------------------------------------------------------------------------------------------------------------
--  Generar numero
-- --------------------------------------------------------------------------------------------------------------------

SELECT COUNT(t.[id]) AS 'contador'
       FROM [TPC-Clinica-Valenzuela-Ruiz].[dbo].[turnos] AS t WITH (NOLOCK)
				INNER JOIN [TPC-Clinica-Valenzuela-Ruiz].[dbo].[especialidades] AS e WITH (NOLOCK)
				      ON T.idEspecialidad = e.id
	   WHERE CONVERT(DATE, t.[fecha]) = CONVERT(DATE, '2022-11-23')
	         AND t.[idEspecialidad] = 1;

GO

-- --------------------------------------------------------------------------------------------------------------------
--  Alta
-- --------------------------------------------------------------------------------------------------------------------

INSERT INTO [TPC-Clinica-Valenzuela-Ruiz].[dbo].[turnos] ([numero], [idPaciente], [idEspecialidad], [idMedico], [idHorario], [horainicio], [fecha], [idEstado])
     VALUES ( 'A001', 23, 1, 1, 1, 2, getdate(), 1 )
GO



-- ====================================================================================================================
--  Fin Querys y nonquerys para los CRUDs
-- ####################################################################################################################

create table ObservacionesXTurno(
	id int not null identity(1,1) primary key,
	idTurno int not null foreign key references turnos(id),
	observacion varchar(max) not null
);

SELECT t.[id]
       FROM [TPC-Clinica-Valenzuela-Ruiz].[dbo].[turnos] AS t WITH (NOLOCK)
	   WHERE t.[numero] = @numero
       AND t.[idPaciente] = @idPaciente
       AND t.[idEspecialidad] = @idEspecialidad
       AND t.[idEspecialidad] = @idEspecialidad
       AND t.[idHorario] = @idHorario
       AND t.[horainicio] = @horainicio
       AND t.[fecha] = @fecha
       AND t.[idEstado] = @idEstado;
GO



INSERT INTO [TPC-Clinica-Valenzuela-Ruiz].[dbo].[ObservacionesXTurno] ([idTurno], [observacion])
       VALUES (,);
GO


DELETE FROM [TPC-Clinica-Valenzuela-Ruiz].[dbo].[ObservacionesXTurno]
       WHERE [idTurno] = 1;
GO

USE [TPC-Clinica-Valenzuela-Ruiz]
GO

DELETE FROM [TPC-Clinica-Valenzuela-Ruiz].[dbo].[turnos]
       WHERE [id] = 1;
GO





