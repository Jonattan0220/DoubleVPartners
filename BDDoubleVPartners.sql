USE [master]
GO
/****** Object:  Database [BDDoubleVPartners]    Script Date: 10/06/2022 23:07:53 ******/
CREATE DATABASE [BDDoubleVPartners]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BDDoubleVPartners', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\BDDoubleVPartners.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BDDoubleVPartners_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\BDDoubleVPartners_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [BDDoubleVPartners] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BDDoubleVPartners].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BDDoubleVPartners] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BDDoubleVPartners] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BDDoubleVPartners] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BDDoubleVPartners] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BDDoubleVPartners] SET ARITHABORT OFF 
GO
ALTER DATABASE [BDDoubleVPartners] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BDDoubleVPartners] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BDDoubleVPartners] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BDDoubleVPartners] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BDDoubleVPartners] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BDDoubleVPartners] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BDDoubleVPartners] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BDDoubleVPartners] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BDDoubleVPartners] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BDDoubleVPartners] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BDDoubleVPartners] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BDDoubleVPartners] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BDDoubleVPartners] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BDDoubleVPartners] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BDDoubleVPartners] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BDDoubleVPartners] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BDDoubleVPartners] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BDDoubleVPartners] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BDDoubleVPartners] SET  MULTI_USER 
GO
ALTER DATABASE [BDDoubleVPartners] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BDDoubleVPartners] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BDDoubleVPartners] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BDDoubleVPartners] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BDDoubleVPartners] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BDDoubleVPartners] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [BDDoubleVPartners] SET QUERY_STORE = OFF
GO
USE [BDDoubleVPartners]
GO
/****** Object:  Table [dbo].[Persona]    Script Date: 10/06/2022 23:07:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Persona](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombres] [varchar](50) NOT NULL,
	[Apellidos] [varchar](50) NOT NULL,
	[NumeroIdentificacion] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[TipoIdentificacion] [varchar](50) NOT NULL,
	[FechaCreacion] [date] NOT NULL,
	[NumTipoIdentificacion]  AS (concat([NumeroIdentificacion],' ',[TipoIdentificacion])),
	[NombresApellidos]  AS (concat([Nombres],' ',[Apellidos])),
 CONSTRAINT [PK_Persona] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 10/06/2022 23:07:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Usuario] [varchar](50) NOT NULL,
	[Pass] [varchar](50) NOT NULL,
	[FechaCreacion] [date] NOT NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Persona] ON 

INSERT [dbo].[Persona] ([Id], [Nombres], [Apellidos], [NumeroIdentificacion], [Email], [TipoIdentificacion], [FechaCreacion]) VALUES (1, N'Alejandra', N'Ramirez', N'3423432423', N'Alejandra@gmail.com', N'Cédula', CAST(N'2022-06-10' AS Date))
SET IDENTITY_INSERT [dbo].[Persona] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuario] ON 

INSERT [dbo].[Usuario] ([Id], [Usuario], [Pass], [FechaCreacion]) VALUES (1, N'Alejandra03', N'dasd', CAST(N'2022-06-10' AS Date))
SET IDENTITY_INSERT [dbo].[Usuario] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [U_Email]    Script Date: 10/06/2022 23:07:53 ******/
ALTER TABLE [dbo].[Persona] ADD  CONSTRAINT [U_Email] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [U_NumeroIdentificacion]    Script Date: 10/06/2022 23:07:53 ******/
ALTER TABLE [dbo].[Persona] ADD  CONSTRAINT [U_NumeroIdentificacion] UNIQUE NONCLUSTERED 
(
	[NumeroIdentificacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [U_Usuario]    Script Date: 10/06/2022 23:07:53 ******/
ALTER TABLE [dbo].[Usuario] ADD  CONSTRAINT [U_Usuario] UNIQUE NONCLUSTERED 
(
	[Usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_Persona] FOREIGN KEY([Id])
REFERENCES [dbo].[Persona] ([Id])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK_Usuario_Persona]
GO
/****** Object:  StoredProcedure [dbo].[prPersonas]    Script Date: 10/06/2022 23:07:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[prPersonas]
				(@DataAction as varchar(1) = 'SELECT',
				 @PersonaId as int = null,
				 @Nombres as varchar(50) = null,
				 @Apellidos as varchar(50) = null,
				 @NumeroIdentificacion as varchar(50) = null,
				 @Email as varchar(50) = null,
				 @TipoIdentificacion as varchar(50) = null,
				 @FechaCreacion as date = null)
AS
BEGIN

	declare @ResultMessage as varchar(max),
	        @ResultCode as int

	--Inicializa las variables de resultado
	set @ResultMessage = ''
	set @ResultCode = 0

	if @DataAction = 'SELECT'
	  select *
	    from Persona as P
	   where (@PersonaId is null or P.PersonaId = @PersonaId)
	     and (@NumeroIdentificacion is null or P.NumeroIdentificacion = @NumeroIdentificacion)
	     and (@TipoIdentificacion is null or P.TipoIdentificacion = @TipoIdentificacion)
	   order by P.FechaCreacion desc
	else

	if @DataAction = 'INSERT'
	   begin try		
		begin tran	
						
			insert into Persona
			select @Nombres,
				   @Apellidos,
				   @NumeroIdentificacion,
				   @Email,
				   @TipoIdentificacion,
				   @FechaCreacion

		commit tran		
	   end try
	   begin catch
			rollback tran
			set @ResultCode = error_number()
			set @ResultMessage = error_message() 
	   end catch

	else
	if @DataAction = 'UPDATE'
	   begin try	
		begin tran	
						
			 update Persona
				set Nombres = @Nombres,
					Apellidos = @Apellidos,
					NumeroIdentificacion = @NumeroIdentificacion,
					Email = @Email,
					TipoIdentificacion = @TipoIdentificacion,
					FechaCreacion = @FechaCreacion
			  where PersonaId = @PersonaId

		commit tran
	   end try
	   begin catch
			rollback tran
			set @ResultCode = error_number()
			set @ResultMessage = error_message() 
	   end catch

	else
	if @DataAction = 'DELETE'
	   begin try
		begin tran	
						
			delete 
				from Persona
				where PersonaId = @PersonaId

		commit tran
	   end try
	   begin catch
			rollback tran
			set @ResultCode = error_number()
			set @ResultMessage = error_message() 
	   end catch

	if charindex(@DataAction,'MDIU') > 0 
		select @ResultCode as ResultCode, @ResultMessage as ResultMessage	

END
GO
USE [master]
GO
ALTER DATABASE [BDDoubleVPartners] SET  READ_WRITE 
GO
