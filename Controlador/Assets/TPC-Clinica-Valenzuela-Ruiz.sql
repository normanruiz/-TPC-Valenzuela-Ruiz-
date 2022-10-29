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
	[perfil] [varchar](20) NOT NULL,
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

/****** Object:  Table [dbo].[personas]    Script Date: 29/10/2022 14:51:43 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[personas](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](60) NOT NULL,
	[apellido] [varchar](60) NOT NULL,
	[email] [varchar](20) NOT NULL,
	[idUsuario] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[nombre] ASC
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
	[idpersona] [int] NOT NULL,
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
--  Querys y nonquerys para los CRUDs
-- ====================================================================================================================
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--  CRUDs [dbo].[estados]
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

SELECT e.[id]
      ,e.[descripcion] 
	   FROM [TPC-Clinica-Valenzuela-Ruiz].[dbo].[estados] AS e WITH (NOLOCK);
GO

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--  CRUDs [dbo].[estados]
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

SELECT e.[id]
      ,e.[nombre]
       FROM [TPC-Clinica-Valenzuela-Ruiz].[dbo].[especialidades] AS e WITH (NOLOCK);

GO

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--  CRUDs [dbo].[personas]
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

SELECT p.[id]
      ,p.[nombre]
      ,p.[apellido]
      ,p.[email]
      ,p.[idUsuario]
	  ,u.[nombre] AS 'usuario'
      ,u.[contrasenia]
      ,u.[perfil]
       FROM [TPC-Clinica-Valenzuela-Ruiz].[dbo].[personas] AS p WITH (NOLOCK)
	        INNER JOIN [TPC-Clinica-Valenzuela-Ruiz].[dbo].[usuarios] AS u WITH (NOLOCK)
			      ON p.[idUsuario] = U.[id];

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--  CRUDs [dbo].[usuarios]
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

SELECT u.[id]
      ,u.[nombre]
      ,u.[contrasenia]
      ,u.[perfil]
       FROM [TPC-Clinica-Valenzuela-Ruiz].[dbo].[usuarios] AS u WITH (NOLOCK);

GO

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--  CRUDs [dbo].[medicos] !!!Imcompleto¡¡¡
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

SELECT m.[id]
      ,m.[idpersona]
      ,m.[idEspecialidad]
	  ,e.[nombre] AS 'especialidad'
       FROM [TPC-Clinica-Valenzuela-Ruiz].[dbo].[medicos] AS m WITH (NOLOCK)
	        INNER JOIN [TPC-Clinica-Valenzuela-Ruiz].[dbo].[personas] AS p WITH (NOLOCK)
			      ON m.[idpersona] = p.[id]
		    INNER JOIN [TPC-Clinica-Valenzuela-Ruiz].[dbo].[especialidades] AS e WITH (NOLOCK)
			      ON m.[idEspecialidad] = e.[id];

GO



-- ====================================================================================================================
--  Fin Querys y nonquerys para los CRUDs
-- ####################################################################################################################





/*

create table personas(
	id int not null identity(1,1) primary key,
	nombre varchar(60) not null unique,
	apellido varchar(60) not null,
	email varchar(20) not null unique,
	idUsuario int foreign key references usuarios(id),
);
go


create table usuarios(
	id int not null identity(1,1) primary key,
	nombre varchar(60) not null unique,
	contrasenia varchar(60) not null,
	perfil varchar(20) not null,
);
go

create table horarios(
	id int not null identity(1,1) primary key,
	rango varchar(40) not null ,
	fecha date not null ,
	asignado bit not null default 0,
	unique(rango, fecha)
);
go

create table turnos(
	id int not null identity(1,1) primary key,
	ipPaciente int not null foreign key references pacientes(id),
	idEspecialidad int not null foreign key references especialidades(id),
	idHorario int not null foreign key references horarios(id),
	idMedico int not null foreign key references medicos(id),
	idEstado int not null foreign key references estados(id),
	fechaCreacion datetime not null
	unique(ipPaciente,idHorario),
	unique(idMedico, idHorario)
);
go

create table pacientes(
	id int not null identity(1,1) primary key
);
go

create table personas(
	id int not null identity(1,1) primary key
);
go

create table medicos(
	id int not null identity(1,1) primary key,
	idpersona int not null foreign key references personas(id) unique
);
go




create table especialidades(
	id int not null identity(1,1) primary key,
	nombre varchar(40) not null unique
);
go

create table estados(
	id int not null identity(1,1) primary key,
	descripcion varchar(40) not null unique
);
go

/*