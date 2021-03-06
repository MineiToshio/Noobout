USE [master]
GO
/****** Object:  Database [TuImportasShop]    Script Date: 13/05/2018 12:52:51 a. m. ******/
CREATE DATABASE [TuImportasShop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TuImportasShop', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS2016\MSSQL\DATA\TuImportasShop.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'TuImportasShop_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS2016\MSSQL\DATA\TuImportasShop_log.ldf' , SIZE = 4672KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [TuImportasShop] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TuImportasShop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TuImportasShop] SET ANSI_NULL_DEFAULT ON 
GO
ALTER DATABASE [TuImportasShop] SET ANSI_NULLS ON 
GO
ALTER DATABASE [TuImportasShop] SET ANSI_PADDING ON 
GO
ALTER DATABASE [TuImportasShop] SET ANSI_WARNINGS ON 
GO
ALTER DATABASE [TuImportasShop] SET ARITHABORT ON 
GO
ALTER DATABASE [TuImportasShop] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TuImportasShop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TuImportasShop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TuImportasShop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TuImportasShop] SET CURSOR_DEFAULT  LOCAL 
GO
ALTER DATABASE [TuImportasShop] SET CONCAT_NULL_YIELDS_NULL ON 
GO
ALTER DATABASE [TuImportasShop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TuImportasShop] SET QUOTED_IDENTIFIER ON 
GO
ALTER DATABASE [TuImportasShop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TuImportasShop] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TuImportasShop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TuImportasShop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TuImportasShop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TuImportasShop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TuImportasShop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TuImportasShop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TuImportasShop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TuImportasShop] SET RECOVERY FULL 
GO
ALTER DATABASE [TuImportasShop] SET  MULTI_USER 
GO
ALTER DATABASE [TuImportasShop] SET PAGE_VERIFY NONE  
GO
ALTER DATABASE [TuImportasShop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TuImportasShop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TuImportasShop] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [TuImportasShop] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TuImportasShop] SET QUERY_STORE = OFF
GO
USE [TuImportasShop]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [TuImportasShop]
GO
/****** Object:  Table [dbo].[Atributo]    Script Date: 13/05/2018 12:52:52 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Atributo](
	[id_atributo] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](200) NOT NULL,
	[descripcion] [varchar](500) NULL,
 CONSTRAINT [PK_Atributo] PRIMARY KEY CLUSTERED 
(
	[id_atributo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Boton_Inicio]    Script Date: 13/05/2018 12:52:52 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Boton_Inicio](
	[id_boton_inicio] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](100) NOT NULL,
	[descripcion] [varchar](500) NOT NULL,
	[url] [varchar](500) NOT NULL,
 CONSTRAINT [PK_Boton_Inicio] PRIMARY KEY CLUSTERED 
(
	[id_boton_inicio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Carrito]    Script Date: 13/05/2018 12:52:52 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Carrito](
	[id_carrito] [int] IDENTITY(1,1) NOT NULL,
	[total] [decimal](10, 2) NOT NULL,
	[id_usuario] [int] NOT NULL,
	[id_direccion_envio] [int] NULL,
	[id_direccion_facturacion] [int] NULL,
	[id_forma_pago] [int] NULL,
 CONSTRAINT [PK_Carrito] PRIMARY KEY CLUSTERED 
(
	[id_carrito] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Carrito_Producto]    Script Date: 13/05/2018 12:52:52 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Carrito_Producto](
	[id_carrito_producto] [int] IDENTITY(1,1) NOT NULL,
	[id_producto] [int] NOT NULL,
	[id_carrito] [int] NOT NULL,
	[cantidad] [int] NOT NULL,
	[id_color] [int] NULL,
 CONSTRAINT [PK_Carrito_Producto] PRIMARY KEY CLUSTERED 
(
	[id_carrito_producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Carrito_Producto_Elemento_Atributo]    Script Date: 13/05/2018 12:52:52 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Carrito_Producto_Elemento_Atributo](
	[id_carrito_producto] [int] NOT NULL,
	[id_elemento_atributo] [int] NOT NULL,
 CONSTRAINT [PK_Carrito_Producto_Elemento_Atributo] PRIMARY KEY CLUSTERED 
(
	[id_carrito_producto] ASC,
	[id_elemento_atributo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categoria]    Script Date: 13/05/2018 12:52:52 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categoria](
	[id_categoria] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](100) NOT NULL,
	[descripcion] [varchar](1000) NULL,
	[id_padre] [int] NULL,
 CONSTRAINT [PK_Categoria] PRIMARY KEY CLUSTERED 
(
	[id_categoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Color]    Script Date: 13/05/2018 12:52:52 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Color](
	[id_color] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](200) NOT NULL,
	[descripcion] [varchar](2000) NULL,
 CONSTRAINT [PK_Color] PRIMARY KEY CLUSTERED 
(
	[id_color] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Devolucion]    Script Date: 13/05/2018 12:52:52 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Devolucion](
	[id_devolucion] [int] IDENTITY(1,1) NOT NULL,
	[motivo] [varchar](1000) NOT NULL,
	[id_pedido] [int] NOT NULL,
	[id_producto] [int] NOT NULL,
 CONSTRAINT [PK_Devolucion] PRIMARY KEY CLUSTERED 
(
	[id_devolucion] ASC,
	[id_pedido] ASC,
	[id_producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Direccion]    Script Date: 13/05/2018 12:52:52 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Direccion](
	[id_direccion] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](500) NOT NULL,
	[id_departamento] [varchar](2) NOT NULL,
	[id_provincia] [varchar](2) NOT NULL,
	[id_distrito] [varchar](2) NOT NULL,
	[referencia] [varchar](500) NOT NULL,
	[direccion] [varchar](500) NOT NULL,
	[id_usuario] [int] NOT NULL,
 CONSTRAINT [PK_Direccion] PRIMARY KEY CLUSTERED 
(
	[id_direccion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Elemento_Atributo]    Script Date: 13/05/2018 12:52:52 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Elemento_Atributo](
	[id_elemento_atributo] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](200) NOT NULL,
	[id_atributo] [int] NOT NULL,
 CONSTRAINT [PK_Elemento_Atributo] PRIMARY KEY CLUSTERED 
(
	[id_elemento_atributo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Forma_Pago]    Script Date: 13/05/2018 12:52:52 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Forma_Pago](
	[id_forma_pago] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](200) NOT NULL,
	[descripcion] [varchar](1000) NULL,
 CONSTRAINT [PK_Forma_Pago] PRIMARY KEY CLUSTERED 
(
	[id_forma_pago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Imagen_Producto]    Script Date: 13/05/2018 12:52:52 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Imagen_Producto](
	[id_imagen] [int] IDENTITY(1,1) NOT NULL,
	[id_producto] [int] NOT NULL,
	[nombre] [varchar](100) NOT NULL,
	[mostrar_primero] [bit] NOT NULL,
 CONSTRAINT [PK_Imagen_Producto] PRIMARY KEY CLUSTERED 
(
	[id_imagen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Operador_Logistico]    Script Date: 13/05/2018 12:52:52 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Operador_Logistico](
	[Id_Operador] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Costo_Lima] [decimal](5, 2) NOT NULL,
	[Costo_Provincia] [decimal](5, 2) NOT NULL,
	[Tiempo_Entrega] [varchar](100) NOT NULL,
	[Habilitado] [bit] NOT NULL,
 CONSTRAINT [PK_Operador_Logistico] PRIMARY KEY CLUSTERED 
(
	[Id_Operador] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pedido]    Script Date: 13/05/2018 12:52:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pedido](
	[id_pedido] [int] IDENTITY(1,1) NOT NULL,
	[id_usuario] [int] NOT NULL,
	[total] [decimal](10, 2) NOT NULL,
	[fecha_compra] [datetime] NOT NULL,
	[id_forma_pago] [int] NOT NULL,
	[precio_envio] [decimal](5, 2) NOT NULL,
	[subtotal] [decimal](10, 2) NOT NULL,
	[id_tipo_recibo] [int] NOT NULL,
	[razon_social] [varchar](100) NULL,
	[ruc] [varchar](15) NULL,
	[operador_logistico] [varchar](50) NOT NULL,
	[tiempo_entrega] [varchar](100) NOT NULL,
	[estado] [int] NOT NULL,
	[cip] [varchar](15) NULL,
 CONSTRAINT [PK_Pedido] PRIMARY KEY CLUSTERED 
(
	[id_pedido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pedido_Direccion]    Script Date: 13/05/2018 12:52:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pedido_Direccion](
	[id_pedido_direccion] [int] IDENTITY(1,1) NOT NULL,
	[departamento] [varchar](50) NOT NULL,
	[distrito] [varchar](50) NOT NULL,
	[provincia] [varchar](50) NOT NULL,
	[referencia] [varchar](500) NOT NULL,
	[direccion] [varchar](500) NOT NULL,
	[id_pedido] [int] NOT NULL,
	[id_tipo_direccion] [int] NOT NULL,
 CONSTRAINT [PK_Pedido_Direccion] PRIMARY KEY CLUSTERED 
(
	[id_pedido_direccion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pedido_Producto]    Script Date: 13/05/2018 12:52:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pedido_Producto](
	[id_pedido] [int] NOT NULL,
	[id_producto] [int] NOT NULL,
	[precio] [decimal](7, 2) NOT NULL,
	[cantidad] [int] NOT NULL,
	[id_pedido_producto] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Pedido_Producto_1] PRIMARY KEY CLUSTERED 
(
	[id_pedido_producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pedido_Producto_Elemento_Atributo]    Script Date: 13/05/2018 12:52:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pedido_Producto_Elemento_Atributo](
	[id_pedido_producto_elemento_atributo] [int] IDENTITY(1,1) NOT NULL,
	[id_pedido_producto] [int] NOT NULL,
	[atributo] [varchar](200) NOT NULL,
	[element] [varchar](200) NOT NULL,
 CONSTRAINT [PK_Pedido_Producto_Elemento_Atributo] PRIMARY KEY CLUSTERED 
(
	[id_pedido_producto_elemento_atributo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Producto]    Script Date: 13/05/2018 12:52:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producto](
	[id_producto] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](200) NOT NULL,
	[descripcion] [varchar](2500) NOT NULL,
	[detalle] [varchar](5000) NOT NULL,
	[precio] [decimal](7, 2) NOT NULL,
	[descuento] [decimal](7, 2) NULL,
	[activo] [bit] NOT NULL,
	[fecha_creacion] [datetime] NOT NULL,
	[id_usuario_creacion] [int] NOT NULL,
	[fecha_modificacion] [datetime] NOT NULL,
	[id_usuario_modificacion] [int] NOT NULL,
	[destacado] [bit] NOT NULL,
	[cantidad_vendidos] [int] NOT NULL,
	[descripcion_corta] [varchar](1000) NOT NULL,
	[escoger_color] [bit] NOT NULL,
	[caracteristica_tecnica] [varchar](5000) NOT NULL,
	[youtube] [varchar](50) NULL,
 CONSTRAINT [PK_Producto] PRIMARY KEY CLUSTERED 
(
	[id_producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Producto_Categoria]    Script Date: 13/05/2018 12:52:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producto_Categoria](
	[id_producto] [int] NOT NULL,
	[id_categoria] [int] NOT NULL,
 CONSTRAINT [PK_Producto_Categoria] PRIMARY KEY CLUSTERED 
(
	[id_producto] ASC,
	[id_categoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Producto_Color]    Script Date: 13/05/2018 12:52:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producto_Color](
	[id_color] [int] NOT NULL,
	[id_producto] [int] NOT NULL,
 CONSTRAINT [PK_Producto_Color] PRIMARY KEY CLUSTERED 
(
	[id_color] ASC,
	[id_producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Producto_Elemento_Atributo]    Script Date: 13/05/2018 12:52:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producto_Elemento_Atributo](
	[id_elemento_atributo] [int] NOT NULL,
	[id_producto] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rol]    Script Date: 13/05/2018 12:52:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rol](
	[id_rol] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](100) NOT NULL,
	[descripcion] [varchar](100) NULL,
 CONSTRAINT [PK_Rol] PRIMARY KEY CLUSTERED 
(
	[id_rol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Slider]    Script Date: 13/05/2018 12:52:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Slider](
	[id_slider] [int] IDENTITY(1,1) NOT NULL,
	[background] [varchar](200) NOT NULL,
	[nombre] [varchar](100) NOT NULL,
	[descripcion] [varchar](150) NOT NULL,
	[boton] [varchar](50) NOT NULL,
	[url] [varchar](100) NOT NULL,
	[imagen] [varchar](200) NOT NULL,
	[orden] [int] NOT NULL,
 CONSTRAINT [PK_Slider] PRIMARY KEY CLUSTERED 
(
	[id_slider] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ubigeo]    Script Date: 13/05/2018 12:52:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ubigeo](
	[CodDpto] [varchar](2) NOT NULL,
	[CodProv] [varchar](2) NOT NULL,
	[CodDist] [varchar](2) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[precio] [decimal](5, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 13/05/2018 12:52:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[id_usuario] [int] IDENTITY(1,1) NOT NULL,
	[usuario] [varchar](150) NOT NULL,
	[password] [varchar](max) NOT NULL,
	[nombre] [varchar](200) NOT NULL,
	[apellido_paterno] [varchar](200) NOT NULL,
	[apellido_materno] [varchar](200) NULL,
	[fecha_nacimiento] [datetime] NULL,
	[dni] [varchar](10) NOT NULL,
	[email] [varchar](250) NOT NULL,
	[id_rol] [int] NOT NULL,
	[celular] [varchar](15) NULL,
	[telefono] [varchar](15) NULL,
	[activo] [bit] NOT NULL,
	[fecha_creacion] [datetime] NOT NULL,
	[activo_correo] [bit] NOT NULL,
	[token_correo] [varchar](20) NULL,
	[token_recuperacion] [varchar](20) NULL,
	[fecha_ultima_recuperacion] [datetime] NULL,
 CONSTRAINT [PK__Usuario__63C76BE2199CEF6B] PRIMARY KEY CLUSTERED 
(
	[id_usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Whishlist]    Script Date: 13/05/2018 12:52:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Whishlist](
	[id_whishlist] [int] IDENTITY(1,1) NOT NULL,
	[id_producto] [int] NOT NULL,
	[id_usuario] [int] NOT NULL,
	[fecha_creacion] [datetime] NOT NULL,
 CONSTRAINT [PK_Whishlist] PRIMARY KEY CLUSTERED 
(
	[id_whishlist] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Atributo] ON 
GO
INSERT [dbo].[Atributo] ([id_atributo], [nombre], [descripcion]) VALUES (4, N'Color', N'Color de un producto')
GO
INSERT [dbo].[Atributo] ([id_atributo], [nombre], [descripcion]) VALUES (5, N'Talla', N'Tamaño de la vestimenta')
GO
INSERT [dbo].[Atributo] ([id_atributo], [nombre], [descripcion]) VALUES (6, N'Diametro', N'')
GO
SET IDENTITY_INSERT [dbo].[Atributo] OFF
GO
SET IDENTITY_INSERT [dbo].[Boton_Inicio] ON 
GO
INSERT [dbo].[Boton_Inicio] ([id_boton_inicio], [nombre], [descripcion], [url]) VALUES (1, N'OFERTAS <span class="light">DE LA SEMANA</span>', N'en digital/prepago y merchandising', N'#')
GO
INSERT [dbo].[Boton_Inicio] ([id_boton_inicio], [nombre], [descripcion], [url]) VALUES (2, N'MODOS DE <span class="light">ENVÍOS</span>', N'elige el modo de envío que te convenga', N'#formaEnvioModal')
GO
INSERT [dbo].[Boton_Inicio] ([id_boton_inicio], [nombre], [descripcion], [url]) VALUES (3, N'PRODUCTOS <span class="light">NUEVOS</span>', N'mira las últimas novedades en nuestro catálogo', N'#')
GO
SET IDENTITY_INSERT [dbo].[Boton_Inicio] OFF
GO
SET IDENTITY_INSERT [dbo].[Categoria] ON 
GO
INSERT [dbo].[Categoria] ([id_categoria], [nombre], [descripcion], [id_padre]) VALUES (1, N'Juegos', NULL, NULL)
GO
INSERT [dbo].[Categoria] ([id_categoria], [nombre], [descripcion], [id_padre]) VALUES (2, N'Digital/Prepago', NULL, NULL)
GO
INSERT [dbo].[Categoria] ([id_categoria], [nombre], [descripcion], [id_padre]) VALUES (3, N'Accesorios', NULL, NULL)
GO
INSERT [dbo].[Categoria] ([id_categoria], [nombre], [descripcion], [id_padre]) VALUES (4, N'Merchan', NULL, NULL)
GO
INSERT [dbo].[Categoria] ([id_categoria], [nombre], [descripcion], [id_padre]) VALUES (5, N'Smartphones', NULL, NULL)
GO
INSERT [dbo].[Categoria] ([id_categoria], [nombre], [descripcion], [id_padre]) VALUES (1002, N'Tablet', NULL, NULL)
GO
INSERT [dbo].[Categoria] ([id_categoria], [nombre], [descripcion], [id_padre]) VALUES (1003, N'Consolas', NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Categoria] OFF
GO
SET IDENTITY_INSERT [dbo].[Color] ON 
GO
INSERT [dbo].[Color] ([id_color], [nombre], [descripcion]) VALUES (1, N'Negro', NULL)
GO
INSERT [dbo].[Color] ([id_color], [nombre], [descripcion]) VALUES (2, N'Rojo', NULL)
GO
INSERT [dbo].[Color] ([id_color], [nombre], [descripcion]) VALUES (3, N'Azul', NULL)
GO
INSERT [dbo].[Color] ([id_color], [nombre], [descripcion]) VALUES (4, N'Amarillo', NULL)
GO
INSERT [dbo].[Color] ([id_color], [nombre], [descripcion]) VALUES (5, N'Blanco', NULL)
GO
INSERT [dbo].[Color] ([id_color], [nombre], [descripcion]) VALUES (6, N'Verde', NULL)
GO
INSERT [dbo].[Color] ([id_color], [nombre], [descripcion]) VALUES (7, N'Naranja', NULL)
GO
INSERT [dbo].[Color] ([id_color], [nombre], [descripcion]) VALUES (8, N'Turquesa', NULL)
GO
SET IDENTITY_INSERT [dbo].[Color] OFF
GO
SET IDENTITY_INSERT [dbo].[Direccion] ON 
GO
INSERT [dbo].[Direccion] ([id_direccion], [nombre], [id_departamento], [id_provincia], [id_distrito], [referencia], [direccion], [id_usuario]) VALUES (1, N'Trabajo', N'15', N'01', N'40', N'Por Velasco con Benavides. Al costado del banco continental', N'Calle Los Antares 320, Torre B, Oficina 406', 2)
GO
INSERT [dbo].[Direccion] ([id_direccion], [nombre], [id_departamento], [id_provincia], [id_distrito], [referencia], [direccion], [id_usuario]) VALUES (6, N'Casa', N'04', N'05', N'05', N'Detrás del kfc ', N'Av. Los Montes 732', 2)
GO
INSERT [dbo].[Direccion] ([id_direccion], [nombre], [id_departamento], [id_provincia], [id_distrito], [referencia], [direccion], [id_usuario]) VALUES (11, N'Casa de Playa', N'03', N'03', N'04', N'Al costado de la polleria el Pollito Frito', N'Av. Arena Grande 363', 2)
GO
INSERT [dbo].[Direccion] ([id_direccion], [nombre], [id_departamento], [id_provincia], [id_distrito], [referencia], [direccion], [id_usuario]) VALUES (15, N'Casa', N'03', N'02', N'13', N'Detrás de la pollería el Buen Carbón', N'Los Pollito Sancochados 9243', 3)
GO
SET IDENTITY_INSERT [dbo].[Direccion] OFF
GO
SET IDENTITY_INSERT [dbo].[Elemento_Atributo] ON 
GO
INSERT [dbo].[Elemento_Atributo] ([id_elemento_atributo], [nombre], [id_atributo]) VALUES (8, N'Verde', 4)
GO
INSERT [dbo].[Elemento_Atributo] ([id_elemento_atributo], [nombre], [id_atributo]) VALUES (9, N'Azul', 4)
GO
INSERT [dbo].[Elemento_Atributo] ([id_elemento_atributo], [nombre], [id_atributo]) VALUES (10, N'Amarillo', 4)
GO
INSERT [dbo].[Elemento_Atributo] ([id_elemento_atributo], [nombre], [id_atributo]) VALUES (11, N'Blanco', 4)
GO
INSERT [dbo].[Elemento_Atributo] ([id_elemento_atributo], [nombre], [id_atributo]) VALUES (12, N'Negro', 4)
GO
INSERT [dbo].[Elemento_Atributo] ([id_elemento_atributo], [nombre], [id_atributo]) VALUES (13, N'Small', 5)
GO
INSERT [dbo].[Elemento_Atributo] ([id_elemento_atributo], [nombre], [id_atributo]) VALUES (14, N'Medium', 5)
GO
INSERT [dbo].[Elemento_Atributo] ([id_elemento_atributo], [nombre], [id_atributo]) VALUES (15, N'Large', 5)
GO
INSERT [dbo].[Elemento_Atributo] ([id_elemento_atributo], [nombre], [id_atributo]) VALUES (16, N'20cm', 6)
GO
INSERT [dbo].[Elemento_Atributo] ([id_elemento_atributo], [nombre], [id_atributo]) VALUES (17, N'50cm', 6)
GO
INSERT [dbo].[Elemento_Atributo] ([id_elemento_atributo], [nombre], [id_atributo]) VALUES (18, N'80cm', 6)
GO
INSERT [dbo].[Elemento_Atributo] ([id_elemento_atributo], [nombre], [id_atributo]) VALUES (19, N'100cm', 6)
GO
SET IDENTITY_INSERT [dbo].[Elemento_Atributo] OFF
GO
SET IDENTITY_INSERT [dbo].[Forma_Pago] ON 
GO
INSERT [dbo].[Forma_Pago] ([id_forma_pago], [nombre], [descripcion]) VALUES (1, N'Pago Efectivo', NULL)
GO
INSERT [dbo].[Forma_Pago] ([id_forma_pago], [nombre], [descripcion]) VALUES (2, N'Paypal', NULL)
GO
SET IDENTITY_INSERT [dbo].[Forma_Pago] OFF
GO
SET IDENTITY_INSERT [dbo].[Imagen_Producto] ON 
GO
INSERT [dbo].[Imagen_Producto] ([id_imagen], [id_producto], [nombre], [mostrar_primero]) VALUES (2, 3, N'2.png', 1)
GO
INSERT [dbo].[Imagen_Producto] ([id_imagen], [id_producto], [nombre], [mostrar_primero]) VALUES (3, 3, N'3.jpg', 0)
GO
INSERT [dbo].[Imagen_Producto] ([id_imagen], [id_producto], [nombre], [mostrar_primero]) VALUES (4, 8, N'4.png', 1)
GO
INSERT [dbo].[Imagen_Producto] ([id_imagen], [id_producto], [nombre], [mostrar_primero]) VALUES (5, 10, N'5.png', 1)
GO
INSERT [dbo].[Imagen_Producto] ([id_imagen], [id_producto], [nombre], [mostrar_primero]) VALUES (6, 11, N'6.png', 1)
GO
INSERT [dbo].[Imagen_Producto] ([id_imagen], [id_producto], [nombre], [mostrar_primero]) VALUES (7, 12, N'7.png', 1)
GO
INSERT [dbo].[Imagen_Producto] ([id_imagen], [id_producto], [nombre], [mostrar_primero]) VALUES (8, 13, N'8.png', 1)
GO
INSERT [dbo].[Imagen_Producto] ([id_imagen], [id_producto], [nombre], [mostrar_primero]) VALUES (9, 14, N'9.png', 1)
GO
INSERT [dbo].[Imagen_Producto] ([id_imagen], [id_producto], [nombre], [mostrar_primero]) VALUES (24, 18, N'24.png', 0)
GO
INSERT [dbo].[Imagen_Producto] ([id_imagen], [id_producto], [nombre], [mostrar_primero]) VALUES (28, 18, N'28.png', 1)
GO
INSERT [dbo].[Imagen_Producto] ([id_imagen], [id_producto], [nombre], [mostrar_primero]) VALUES (29, 18, N'29.png', 0)
GO
INSERT [dbo].[Imagen_Producto] ([id_imagen], [id_producto], [nombre], [mostrar_primero]) VALUES (30, 19, N'30.png', 1)
GO
INSERT [dbo].[Imagen_Producto] ([id_imagen], [id_producto], [nombre], [mostrar_primero]) VALUES (31, 20, N'31.png', 1)
GO
SET IDENTITY_INSERT [dbo].[Imagen_Producto] OFF
GO
SET IDENTITY_INSERT [dbo].[Operador_Logistico] ON 
GO
INSERT [dbo].[Operador_Logistico] ([Id_Operador], [Nombre], [Costo_Lima], [Costo_Provincia], [Tiempo_Entrega], [Habilitado]) VALUES (1, N'OLVA COURIER', CAST(9.00 AS Decimal(5, 2)), CAST(12.00 AS Decimal(5, 2)), N'Entre 5 a 9 días', 1)
GO
INSERT [dbo].[Operador_Logistico] ([Id_Operador], [Nombre], [Costo_Lima], [Costo_Provincia], [Tiempo_Entrega], [Habilitado]) VALUES (2, N'SMP COURIER', CAST(12.00 AS Decimal(5, 2)), CAST(23.00 AS Decimal(5, 2)), N'Entre 2 a 3 días', 1)
GO
INSERT [dbo].[Operador_Logistico] ([Id_Operador], [Nombre], [Costo_Lima], [Costo_Provincia], [Tiempo_Entrega], [Habilitado]) VALUES (3, N'SERVIENTREGA', CAST(9.50 AS Decimal(5, 2)), CAST(15.00 AS Decimal(5, 2)), N'Entre 5 a 7 días', 1)
GO
SET IDENTITY_INSERT [dbo].[Operador_Logistico] OFF
GO
SET IDENTITY_INSERT [dbo].[Pedido] ON 
GO
INSERT [dbo].[Pedido] ([id_pedido], [id_usuario], [total], [fecha_compra], [id_forma_pago], [precio_envio], [subtotal], [id_tipo_recibo], [razon_social], [ruc], [operador_logistico], [tiempo_entrega], [estado], [cip]) VALUES (38, 3, CAST(7321.20 AS Decimal(10, 2)), CAST(N'2014-09-04T03:09:53.987' AS DateTime), 1, CAST(12.00 AS Decimal(5, 2)), CAST(7309.20 AS Decimal(10, 2)), 1, NULL, NULL, N'OLVA COURIER', N'Entre 5 a 9 días', 1, NULL)
GO
INSERT [dbo].[Pedido] ([id_pedido], [id_usuario], [total], [fecha_compra], [id_forma_pago], [precio_envio], [subtotal], [id_tipo_recibo], [razon_social], [ruc], [operador_logistico], [tiempo_entrega], [estado], [cip]) VALUES (39, 3, CAST(5198.00 AS Decimal(10, 2)), CAST(N'2014-09-04T10:33:30.557' AS DateTime), 1, CAST(12.00 AS Decimal(5, 2)), CAST(5186.00 AS Decimal(10, 2)), 1, NULL, NULL, N'OLVA COURIER', N'Entre 5 a 9 días', 1, N'00000001083024')
GO
INSERT [dbo].[Pedido] ([id_pedido], [id_usuario], [total], [fecha_compra], [id_forma_pago], [precio_envio], [subtotal], [id_tipo_recibo], [razon_social], [ruc], [operador_logistico], [tiempo_entrega], [estado], [cip]) VALUES (40, 3, CAST(4653.20 AS Decimal(10, 2)), CAST(N'2014-09-04T10:35:55.460' AS DateTime), 1, CAST(12.00 AS Decimal(5, 2)), CAST(4641.20 AS Decimal(10, 2)), 1, NULL, NULL, N'OLVA COURIER', N'Entre 5 a 9 días', 1, N'00000001083025')
GO
INSERT [dbo].[Pedido] ([id_pedido], [id_usuario], [total], [fecha_compra], [id_forma_pago], [precio_envio], [subtotal], [id_tipo_recibo], [razon_social], [ruc], [operador_logistico], [tiempo_entrega], [estado], [cip]) VALUES (41, 3, CAST(4653.20 AS Decimal(10, 2)), CAST(N'2014-09-04T10:56:37.057' AS DateTime), 1, CAST(12.00 AS Decimal(5, 2)), CAST(4641.20 AS Decimal(10, 2)), 2, N'Linnso', N'432426435432432', N'OLVA COURIER', N'Entre 5 a 9 días', 1, N'00000001083026')
GO
INSERT [dbo].[Pedido] ([id_pedido], [id_usuario], [total], [fecha_compra], [id_forma_pago], [precio_envio], [subtotal], [id_tipo_recibo], [razon_social], [ruc], [operador_logistico], [tiempo_entrega], [estado], [cip]) VALUES (42, 3, CAST(11440.00 AS Decimal(10, 2)), CAST(N'2014-09-09T10:31:07.750' AS DateTime), 1, CAST(12.00 AS Decimal(5, 2)), CAST(11428.00 AS Decimal(10, 2)), 1, NULL, NULL, N'OLVA COURIER', N'Entre 5 a 9 días', 1, N'00000001083225')
GO
SET IDENTITY_INSERT [dbo].[Pedido] OFF
GO
SET IDENTITY_INSERT [dbo].[Pedido_Direccion] ON 
GO
INSERT [dbo].[Pedido_Direccion] ([id_pedido_direccion], [departamento], [distrito], [provincia], [referencia], [direccion], [id_pedido], [id_tipo_direccion]) VALUES (69, N'APURIMAC', N'SAN JERONIMO', N'APURIMAC', N'Detrás de la pollería el Buen Carbón', N'Los Pollito Sancochados 9243', 38, 1)
GO
INSERT [dbo].[Pedido_Direccion] ([id_pedido_direccion], [departamento], [distrito], [provincia], [referencia], [direccion], [id_pedido], [id_tipo_direccion]) VALUES (70, N'APURIMAC', N'SAN JERONIMO', N'APURIMAC', N'Detrás de la pollería el Buen Carbón', N'Los Pollito Sancochados 9243', 38, 2)
GO
INSERT [dbo].[Pedido_Direccion] ([id_pedido_direccion], [departamento], [distrito], [provincia], [referencia], [direccion], [id_pedido], [id_tipo_direccion]) VALUES (71, N'APURIMAC', N'SAN JERONIMO', N'APURIMAC', N'Detrás de la pollería el Buen Carbón', N'Los Pollito Sancochados 9243', 39, 1)
GO
INSERT [dbo].[Pedido_Direccion] ([id_pedido_direccion], [departamento], [distrito], [provincia], [referencia], [direccion], [id_pedido], [id_tipo_direccion]) VALUES (72, N'APURIMAC', N'SAN JERONIMO', N'APURIMAC', N'Detrás de la pollería el Buen Carbón', N'Los Pollito Sancochados 9243', 39, 2)
GO
INSERT [dbo].[Pedido_Direccion] ([id_pedido_direccion], [departamento], [distrito], [provincia], [referencia], [direccion], [id_pedido], [id_tipo_direccion]) VALUES (73, N'APURIMAC', N'SAN JERONIMO', N'APURIMAC', N'Detrás de la pollería el Buen Carbón', N'Los Pollito Sancochados 9243', 40, 1)
GO
INSERT [dbo].[Pedido_Direccion] ([id_pedido_direccion], [departamento], [distrito], [provincia], [referencia], [direccion], [id_pedido], [id_tipo_direccion]) VALUES (74, N'APURIMAC', N'SAN JERONIMO', N'APURIMAC', N'Detrás de la pollería el Buen Carbón', N'Los Pollito Sancochados 9243', 40, 2)
GO
INSERT [dbo].[Pedido_Direccion] ([id_pedido_direccion], [departamento], [distrito], [provincia], [referencia], [direccion], [id_pedido], [id_tipo_direccion]) VALUES (75, N'APURIMAC', N'SAN JERONIMO', N'APURIMAC', N'Detrás de la pollería el Buen Carbón', N'Los Pollito Sancochados 9243', 41, 1)
GO
INSERT [dbo].[Pedido_Direccion] ([id_pedido_direccion], [departamento], [distrito], [provincia], [referencia], [direccion], [id_pedido], [id_tipo_direccion]) VALUES (76, N'APURIMAC', N'SAN JERONIMO', N'APURIMAC', N'Detrás de la pollería el Buen Carbón', N'Los Pollito Sancochados 9243', 41, 2)
GO
INSERT [dbo].[Pedido_Direccion] ([id_pedido_direccion], [departamento], [distrito], [provincia], [referencia], [direccion], [id_pedido], [id_tipo_direccion]) VALUES (77, N'APURIMAC', N'SAN JERONIMO', N'APURIMAC', N'Detrás de la pollería el Buen Carbón', N'Los Pollito Sancochados 9243', 42, 1)
GO
INSERT [dbo].[Pedido_Direccion] ([id_pedido_direccion], [departamento], [distrito], [provincia], [referencia], [direccion], [id_pedido], [id_tipo_direccion]) VALUES (78, N'APURIMAC', N'SAN JERONIMO', N'APURIMAC', N'Detrás de la pollería el Buen Carbón', N'Los Pollito Sancochados 9243', 42, 2)
GO
SET IDENTITY_INSERT [dbo].[Pedido_Direccion] OFF
GO
SET IDENTITY_INSERT [dbo].[Pedido_Producto] ON 
GO
INSERT [dbo].[Pedido_Producto] ([id_pedido], [id_producto], [precio], [cantidad], [id_pedido_producto]) VALUES (38, 13, CAST(343.00 AS Decimal(7, 2)), 1, 71)
GO
INSERT [dbo].[Pedido_Producto] ([id_pedido], [id_producto], [precio], [cantidad], [id_pedido_producto]) VALUES (38, 14, CAST(1343.00 AS Decimal(7, 2)), 2, 72)
GO
INSERT [dbo].[Pedido_Producto] ([id_pedido], [id_producto], [precio], [cantidad], [id_pedido_producto]) VALUES (38, 12, CAST(232.00 AS Decimal(7, 2)), 3, 73)
GO
INSERT [dbo].[Pedido_Producto] ([id_pedido], [id_producto], [precio], [cantidad], [id_pedido_producto]) VALUES (38, 18, CAST(5.05 AS Decimal(7, 2)), 4, 74)
GO
INSERT [dbo].[Pedido_Producto] ([id_pedido], [id_producto], [precio], [cantidad], [id_pedido_producto]) VALUES (38, 19, CAST(324.00 AS Decimal(7, 2)), 5, 75)
GO
INSERT [dbo].[Pedido_Producto] ([id_pedido], [id_producto], [precio], [cantidad], [id_pedido_producto]) VALUES (38, 19, CAST(324.00 AS Decimal(7, 2)), 6, 76)
GO
INSERT [dbo].[Pedido_Producto] ([id_pedido], [id_producto], [precio], [cantidad], [id_pedido_producto]) VALUES (39, 12, CAST(232.00 AS Decimal(7, 2)), 1, 77)
GO
INSERT [dbo].[Pedido_Producto] ([id_pedido], [id_producto], [precio], [cantidad], [id_pedido_producto]) VALUES (39, 14, CAST(1343.00 AS Decimal(7, 2)), 2, 78)
GO
INSERT [dbo].[Pedido_Producto] ([id_pedido], [id_producto], [precio], [cantidad], [id_pedido_producto]) VALUES (39, 19, CAST(324.00 AS Decimal(7, 2)), 3, 79)
GO
INSERT [dbo].[Pedido_Producto] ([id_pedido], [id_producto], [precio], [cantidad], [id_pedido_producto]) VALUES (39, 19, CAST(324.00 AS Decimal(7, 2)), 4, 80)
GO
INSERT [dbo].[Pedido_Producto] ([id_pedido], [id_producto], [precio], [cantidad], [id_pedido_producto]) VALUES (40, 14, CAST(1343.00 AS Decimal(7, 2)), 1, 81)
GO
INSERT [dbo].[Pedido_Producto] ([id_pedido], [id_producto], [precio], [cantidad], [id_pedido_producto]) VALUES (40, 13, CAST(343.00 AS Decimal(7, 2)), 2, 82)
GO
INSERT [dbo].[Pedido_Producto] ([id_pedido], [id_producto], [precio], [cantidad], [id_pedido_producto]) VALUES (40, 19, CAST(324.00 AS Decimal(7, 2)), 3, 83)
GO
INSERT [dbo].[Pedido_Producto] ([id_pedido], [id_producto], [precio], [cantidad], [id_pedido_producto]) VALUES (40, 18, CAST(5.05 AS Decimal(7, 2)), 4, 84)
GO
INSERT [dbo].[Pedido_Producto] ([id_pedido], [id_producto], [precio], [cantidad], [id_pedido_producto]) VALUES (40, 19, CAST(324.00 AS Decimal(7, 2)), 5, 85)
GO
INSERT [dbo].[Pedido_Producto] ([id_pedido], [id_producto], [precio], [cantidad], [id_pedido_producto]) VALUES (41, 14, CAST(1343.00 AS Decimal(7, 2)), 1, 86)
GO
INSERT [dbo].[Pedido_Producto] ([id_pedido], [id_producto], [precio], [cantidad], [id_pedido_producto]) VALUES (41, 13, CAST(343.00 AS Decimal(7, 2)), 2, 87)
GO
INSERT [dbo].[Pedido_Producto] ([id_pedido], [id_producto], [precio], [cantidad], [id_pedido_producto]) VALUES (41, 19, CAST(324.00 AS Decimal(7, 2)), 3, 88)
GO
INSERT [dbo].[Pedido_Producto] ([id_pedido], [id_producto], [precio], [cantidad], [id_pedido_producto]) VALUES (41, 18, CAST(5.05 AS Decimal(7, 2)), 4, 89)
GO
INSERT [dbo].[Pedido_Producto] ([id_pedido], [id_producto], [precio], [cantidad], [id_pedido_producto]) VALUES (41, 19, CAST(324.00 AS Decimal(7, 2)), 5, 90)
GO
INSERT [dbo].[Pedido_Producto] ([id_pedido], [id_producto], [precio], [cantidad], [id_pedido_producto]) VALUES (42, 3, CAST(999.00 AS Decimal(7, 2)), 1, 91)
GO
INSERT [dbo].[Pedido_Producto] ([id_pedido], [id_producto], [precio], [cantidad], [id_pedido_producto]) VALUES (42, 12, CAST(232.00 AS Decimal(7, 2)), 2, 92)
GO
INSERT [dbo].[Pedido_Producto] ([id_pedido], [id_producto], [precio], [cantidad], [id_pedido_producto]) VALUES (42, 13, CAST(343.00 AS Decimal(7, 2)), 3, 93)
GO
INSERT [dbo].[Pedido_Producto] ([id_pedido], [id_producto], [precio], [cantidad], [id_pedido_producto]) VALUES (42, 14, CAST(1343.00 AS Decimal(7, 2)), 4, 94)
GO
INSERT [dbo].[Pedido_Producto] ([id_pedido], [id_producto], [precio], [cantidad], [id_pedido_producto]) VALUES (42, 19, CAST(324.00 AS Decimal(7, 2)), 5, 95)
GO
INSERT [dbo].[Pedido_Producto] ([id_pedido], [id_producto], [precio], [cantidad], [id_pedido_producto]) VALUES (42, 19, CAST(324.00 AS Decimal(7, 2)), 6, 96)
GO
SET IDENTITY_INSERT [dbo].[Pedido_Producto] OFF
GO
SET IDENTITY_INSERT [dbo].[Pedido_Producto_Elemento_Atributo] ON 
GO
INSERT [dbo].[Pedido_Producto_Elemento_Atributo] ([id_pedido_producto_elemento_atributo], [id_pedido_producto], [atributo], [element]) VALUES (33, 74, N'Color', N'Amarillo')
GO
INSERT [dbo].[Pedido_Producto_Elemento_Atributo] ([id_pedido_producto_elemento_atributo], [id_pedido_producto], [atributo], [element]) VALUES (34, 74, N'Diametro', N'100cm')
GO
INSERT [dbo].[Pedido_Producto_Elemento_Atributo] ([id_pedido_producto_elemento_atributo], [id_pedido_producto], [atributo], [element]) VALUES (35, 75, N'Color', N'Azul')
GO
INSERT [dbo].[Pedido_Producto_Elemento_Atributo] ([id_pedido_producto_elemento_atributo], [id_pedido_producto], [atributo], [element]) VALUES (36, 75, N'Talla', N'Small')
GO
INSERT [dbo].[Pedido_Producto_Elemento_Atributo] ([id_pedido_producto_elemento_atributo], [id_pedido_producto], [atributo], [element]) VALUES (37, 75, N'Diametro', N'20cm')
GO
INSERT [dbo].[Pedido_Producto_Elemento_Atributo] ([id_pedido_producto_elemento_atributo], [id_pedido_producto], [atributo], [element]) VALUES (38, 76, N'Color', N'Azul')
GO
INSERT [dbo].[Pedido_Producto_Elemento_Atributo] ([id_pedido_producto_elemento_atributo], [id_pedido_producto], [atributo], [element]) VALUES (39, 76, N'Talla', N'Medium')
GO
INSERT [dbo].[Pedido_Producto_Elemento_Atributo] ([id_pedido_producto_elemento_atributo], [id_pedido_producto], [atributo], [element]) VALUES (40, 76, N'Diametro', N'100cm')
GO
INSERT [dbo].[Pedido_Producto_Elemento_Atributo] ([id_pedido_producto_elemento_atributo], [id_pedido_producto], [atributo], [element]) VALUES (41, 79, N'Color', N'Azul')
GO
INSERT [dbo].[Pedido_Producto_Elemento_Atributo] ([id_pedido_producto_elemento_atributo], [id_pedido_producto], [atributo], [element]) VALUES (42, 79, N'Talla', N'Medium')
GO
INSERT [dbo].[Pedido_Producto_Elemento_Atributo] ([id_pedido_producto_elemento_atributo], [id_pedido_producto], [atributo], [element]) VALUES (43, 79, N'Diametro', N'100cm')
GO
INSERT [dbo].[Pedido_Producto_Elemento_Atributo] ([id_pedido_producto_elemento_atributo], [id_pedido_producto], [atributo], [element]) VALUES (44, 80, N'Color', N'Negro')
GO
INSERT [dbo].[Pedido_Producto_Elemento_Atributo] ([id_pedido_producto_elemento_atributo], [id_pedido_producto], [atributo], [element]) VALUES (45, 80, N'Talla', N'Small')
GO
INSERT [dbo].[Pedido_Producto_Elemento_Atributo] ([id_pedido_producto_elemento_atributo], [id_pedido_producto], [atributo], [element]) VALUES (46, 80, N'Diametro', N'20cm')
GO
INSERT [dbo].[Pedido_Producto_Elemento_Atributo] ([id_pedido_producto_elemento_atributo], [id_pedido_producto], [atributo], [element]) VALUES (47, 83, N'Color', N'Azul')
GO
INSERT [dbo].[Pedido_Producto_Elemento_Atributo] ([id_pedido_producto_elemento_atributo], [id_pedido_producto], [atributo], [element]) VALUES (48, 83, N'Talla', N'Medium')
GO
INSERT [dbo].[Pedido_Producto_Elemento_Atributo] ([id_pedido_producto_elemento_atributo], [id_pedido_producto], [atributo], [element]) VALUES (49, 83, N'Diametro', N'100cm')
GO
INSERT [dbo].[Pedido_Producto_Elemento_Atributo] ([id_pedido_producto_elemento_atributo], [id_pedido_producto], [atributo], [element]) VALUES (50, 84, N'Color', N'Blanco')
GO
INSERT [dbo].[Pedido_Producto_Elemento_Atributo] ([id_pedido_producto_elemento_atributo], [id_pedido_producto], [atributo], [element]) VALUES (51, 84, N'Diametro', N'50cm')
GO
INSERT [dbo].[Pedido_Producto_Elemento_Atributo] ([id_pedido_producto_elemento_atributo], [id_pedido_producto], [atributo], [element]) VALUES (52, 85, N'Color', N'Verde')
GO
INSERT [dbo].[Pedido_Producto_Elemento_Atributo] ([id_pedido_producto_elemento_atributo], [id_pedido_producto], [atributo], [element]) VALUES (53, 85, N'Talla', N'Small')
GO
INSERT [dbo].[Pedido_Producto_Elemento_Atributo] ([id_pedido_producto_elemento_atributo], [id_pedido_producto], [atributo], [element]) VALUES (54, 85, N'Diametro', N'20cm')
GO
INSERT [dbo].[Pedido_Producto_Elemento_Atributo] ([id_pedido_producto_elemento_atributo], [id_pedido_producto], [atributo], [element]) VALUES (55, 88, N'Color', N'Azul')
GO
INSERT [dbo].[Pedido_Producto_Elemento_Atributo] ([id_pedido_producto_elemento_atributo], [id_pedido_producto], [atributo], [element]) VALUES (56, 88, N'Talla', N'Small')
GO
INSERT [dbo].[Pedido_Producto_Elemento_Atributo] ([id_pedido_producto_elemento_atributo], [id_pedido_producto], [atributo], [element]) VALUES (57, 88, N'Diametro', N'100cm')
GO
INSERT [dbo].[Pedido_Producto_Elemento_Atributo] ([id_pedido_producto_elemento_atributo], [id_pedido_producto], [atributo], [element]) VALUES (58, 89, N'Color', N'Blanco')
GO
INSERT [dbo].[Pedido_Producto_Elemento_Atributo] ([id_pedido_producto_elemento_atributo], [id_pedido_producto], [atributo], [element]) VALUES (59, 89, N'Diametro', N'80cm')
GO
INSERT [dbo].[Pedido_Producto_Elemento_Atributo] ([id_pedido_producto_elemento_atributo], [id_pedido_producto], [atributo], [element]) VALUES (60, 90, N'Color', N'Negro')
GO
INSERT [dbo].[Pedido_Producto_Elemento_Atributo] ([id_pedido_producto_elemento_atributo], [id_pedido_producto], [atributo], [element]) VALUES (61, 90, N'Talla', N'Medium')
GO
INSERT [dbo].[Pedido_Producto_Elemento_Atributo] ([id_pedido_producto_elemento_atributo], [id_pedido_producto], [atributo], [element]) VALUES (62, 90, N'Diametro', N'100cm')
GO
INSERT [dbo].[Pedido_Producto_Elemento_Atributo] ([id_pedido_producto_elemento_atributo], [id_pedido_producto], [atributo], [element]) VALUES (63, 95, N'Color', N'Negro')
GO
INSERT [dbo].[Pedido_Producto_Elemento_Atributo] ([id_pedido_producto_elemento_atributo], [id_pedido_producto], [atributo], [element]) VALUES (64, 95, N'Talla', N'Small')
GO
INSERT [dbo].[Pedido_Producto_Elemento_Atributo] ([id_pedido_producto_elemento_atributo], [id_pedido_producto], [atributo], [element]) VALUES (65, 95, N'Diametro', N'20cm')
GO
INSERT [dbo].[Pedido_Producto_Elemento_Atributo] ([id_pedido_producto_elemento_atributo], [id_pedido_producto], [atributo], [element]) VALUES (66, 96, N'Color', N'Negro')
GO
INSERT [dbo].[Pedido_Producto_Elemento_Atributo] ([id_pedido_producto_elemento_atributo], [id_pedido_producto], [atributo], [element]) VALUES (67, 96, N'Talla', N'Medium')
GO
INSERT [dbo].[Pedido_Producto_Elemento_Atributo] ([id_pedido_producto_elemento_atributo], [id_pedido_producto], [atributo], [element]) VALUES (68, 96, N'Diametro', N'20cm')
GO
SET IDENTITY_INSERT [dbo].[Pedido_Producto_Elemento_Atributo] OFF
GO
SET IDENTITY_INSERT [dbo].[Producto] ON 
GO
INSERT [dbo].[Producto] ([id_producto], [nombre], [descripcion], [detalle], [precio], [descuento], [activo], [fecha_creacion], [id_usuario_creacion], [fecha_modificacion], [id_usuario_modificacion], [destacado], [cantidad_vendidos], [descripcion_corta], [escoger_color], [caracteristica_tecnica], [youtube]) VALUES (3, N'LG - Tablet G Pad 8.3'''' Wi-Fi Android 4.2.2 y Estuche Blanco', N'59% Cotton Lorem Ipsum Dolor Sit Amet esed ultrices sapien nunc nam frignila59% Cotton Lorem Ipsum Dolor Sit Amet esed ultrices sapien nunc nam frignila59% Cotton Lorem Ipsum Dolor Sit Amet esed ultrices sapien nunc nam frignila59% Cotton Lorem Ipsum Dolor Sit Amet esed ultrices sapien nunc nam frignila59% Cotton Lorem Ipsum Dolor Sit Amet esed ultrices sapien nunc nam frignila', N'<h3>Descripción del Producto</h3>
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus dui ante, vulputate at pellentesque eget, viverra ac dolor. Morbi interdum tortor non leo aliquam ac aliquet nulla porta. Morbi id dolor massa, ut ornare augue. Morbi tincidunt magna bibendum enim tristique tristique. Quisque a massa tellus, ac tempor magna. Sed eget ligula tellus, nec pellentesque dolor. Phasellus dictum, mauris non mollis ornare, turpis libero faucibus orci, at fringilla urna leo sodales libero. Aliquam nec lectus mauris. Morbi lectus quam, convallis vel euismod a, auctor non dui. Etiam a nisi risus.</p>
                            <p>Phasellus velit quam, ultrices et hendrerit vitae, suscipit nec dui. Sed at ligula vitae ligula pellentesque dictum. Duis lobortis auctor ipsum vel placerat. Phasellus nisi odio, ornare eget faucibus et, accumsan nec mauris. per conubia nostra, per inceptos himenaeos. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus dui ante, vulputate at pellentesque eget, viverra ac dolor.Etiam a nisi risus.</p>
                            <h1>Heading H1 30px</h1>
                            <h2>Heading H2 26px</h2>
                            <h3>Heading H3 20px</h3>
                            <h4>Heading H4 18px</h4>
                            <h5>Heading H5 15px</h5>
                            <p>Phasellus velit quam, ultrices et hendrerit vitae, suscipit nec dui. Sed at ligula vitae ligula pellentesque dictum. Duis lobortis auctor ipsum vel placerat. Phasellus nisi odio, ornare eget faucibus et, accumsan nec mauris. per conubia nostra, per inceptos himenaeos.</p>', CAST(999.00 AS Decimal(7, 2)), NULL, 1, CAST(N'2014-01-12T00:00:00.000' AS DateTime), 2, CAST(N'2014-01-12T00:00:00.000' AS DateTime), 1, 1, 8, N'59% Cotton Lorem Ipsum Dolor Sit Amet esed ultrices sapien nunc nam frignila', 1, N'59% Cotton Lorem Ipsum Dolor Sit Amet esed ultrices sapien nunc nam frignila59% Cotton Lorem Ipsum Dolor Sit Amet esed ultrices sapien nunc nam frignila', N'U6ceAQMIRx4')
GO
INSERT [dbo].[Producto] ([id_producto], [nombre], [descripcion], [detalle], [precio], [descuento], [activo], [fecha_creacion], [id_usuario_creacion], [fecha_modificacion], [id_usuario_modificacion], [destacado], [cantidad_vendidos], [descripcion_corta], [escoger_color], [caracteristica_tecnica], [youtube]) VALUES (8, N'Quo - Tablet QD-700-BK 7'''' Wi-Fi Android 4.1 8GB - Negro', N'59% Cotton Lorem Ipsum Dolor Sit Amet esed ultrices sapien nunc nam frignila59% Cotton Lorem Ipsum Dolor Sit Amet esed ultrices sapien nunc nam frignila59% Cotton Lorem Ipsum Dolor Sit Amet esed ultrices sapien nunc nam frignila59% Cotton Lorem Ipsum Dolor Sit Amet esed ultrices sapien nunc nam frignila59% Cotton Lorem Ipsum Dolor Sit Amet esed ultrices sapien nunc nam frignila', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus dui ante, vulputate at pellentesque eget, viverra ac dolor. Morbi interdum tortor non leo aliquam ac aliquet nulla porta. Morbi id dolor massa, ut ornare augue. Morbi tincidunt magna bibendum enim tristique tristique. Quisque a massa tellus, ac tempor magna. Sed eget ligula tellus, nec pellentesque dolor. Phasellus dictum, mauris non mollis ornare, turpis libero faucibus orci, at fringilla urna leo sodales libero. Aliquam nec lectus mauris. Morbi lectus quam, convallis vel euismod a, auctor non dui. Etiam a nisi risus.

Phasellus velit quam, ultrices et hendrerit vitae, suscipit nec dui. Sed at ligula vitae ligula pellentesque dictum. Duis lobortis auctor ipsum vel placerat. Phasellus nisi odio, ornare eget faucibus et, accumsan nec mauris. per conubia nostra, per inceptos himenaeos. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus dui ante, vulputate at pellentesque eget, viverra ac dolor.Etiam a nisi risus.', CAST(319.00 AS Decimal(7, 2)), NULL, 1, CAST(N'2014-01-12T00:00:00.000' AS DateTime), 2, CAST(N'2014-01-12T00:00:00.000' AS DateTime), 1, 1, 10, N'59% Cotton Lorem Ipsum Dolor Sit Amet esed ultrices sapien nunc nam frignila', 1, N'59% Cotton Lorem Ipsum Dolor Sit Amet esed ultrices sapien nunc nam frignila59% Cotton Lorem Ipsum Dolor Sit Amet esed ultrices sapien nunc nam frignila', N'7V6s2rFSEwU')
GO
INSERT [dbo].[Producto] ([id_producto], [nombre], [descripcion], [detalle], [precio], [descuento], [activo], [fecha_creacion], [id_usuario_creacion], [fecha_modificacion], [id_usuario_modificacion], [destacado], [cantidad_vendidos], [descripcion_corta], [escoger_color], [caracteristica_tecnica], [youtube]) VALUES (10, N'SAMSUNG TV SLIM LED SMART 3D FULL HD 46', N'59% Cotton Lorem Ipsum Dolor Sit Amet esed ultrices sapien nunc nam frignila59% Cotton Lorem Ipsum Dolor Sit Amet esed ultrices sapien nunc nam frignila59% Cotton Lorem Ipsum Dolor Sit Amet esed ultrices sapien nunc nam frignila59% Cotton Lorem Ipsum Dolor Sit Amet esed ultrices sapien nunc nam frignila', N'59% Cotton Lorem Ipsum Dolor Sit Amet esed ultrices sapien nunc nam frignila59% Cotton Lorem Ipsum Dolor Sit Amet esed ultrices sapien nunc nam frignila', CAST(2221.00 AS Decimal(7, 2)), NULL, 1, CAST(N'2014-01-12T00:00:00.000' AS DateTime), 2, CAST(N'2014-01-12T00:00:00.000' AS DateTime), 1, 1, 5, N'59% Cotton Lorem Ipsum Dolor Sit Amet esed ultrices sapien nunc nam frignila', 1, N'59% Cotton Lorem Ipsum Dolor Sit Amet esed ultrices sapien nunc nam frignila59% Cotton Lorem Ipsum Dolor Sit Amet esed ultrices sapien nunc nam frignila', N'3UM7YMmuMvU')
GO
INSERT [dbo].[Producto] ([id_producto], [nombre], [descripcion], [detalle], [precio], [descuento], [activo], [fecha_creacion], [id_usuario_creacion], [fecha_modificacion], [id_usuario_modificacion], [destacado], [cantidad_vendidos], [descripcion_corta], [escoger_color], [caracteristica_tecnica], [youtube]) VALUES (11, N'Reproductor Blu-Ray Full HD BDP-S1100', N'59% Cotton Lorem Ipsum Dolor Sit Amet esed ultrices sapien nunc nam frignila59% Cotton Lorem Ipsum Dolor Sit Amet esed ultrices sapien nunc nam frignila59% Cotton Lorem Ipsum Dolor Sit Amet esed ultrices sapien nunc nam frignila59% Cotton Lorem Ipsum Dolor Sit Amet esed ultrices sapien nunc nam frignila59% Cotton Lorem Ipsum Dolor Sit Amet esed ultrices sapien nunc nam frignila', N'59% Cotton Lorem Ipsum Dolor Sit Amet esed ultrices sapien nunc nam frignila59% Cotton Lorem Ipsum Dolor Sit Amet esed ultrices sapien nunc nam frignila', CAST(324.00 AS Decimal(7, 2)), NULL, 1, CAST(N'2014-02-12T15:21:26.100' AS DateTime), 2, CAST(N'2014-02-12T15:21:26.100' AS DateTime), 1, 1, 4, N'59% Cotton Lorem Ipsum Dolor Sit Amet esed ultrices sapien nunc nam frignila', 1, N'59% Cotton Lorem Ipsum Dolor Sit Amet esed ultrices sapien nunc nam frignila59% Cotton Lorem Ipsum Dolor Sit Amet esed ultrices sapien nunc nam frignila', N'SKAK0J4F9Sk')
GO
INSERT [dbo].[Producto] ([id_producto], [nombre], [descripcion], [detalle], [precio], [descuento], [activo], [fecha_creacion], [id_usuario_creacion], [fecha_modificacion], [id_usuario_modificacion], [destacado], [cantidad_vendidos], [descripcion_corta], [escoger_color], [caracteristica_tecnica], [youtube]) VALUES (12, N'TV Cinema 3D Smart TV 42', N'59% Cotton Lorem Ipsum Dolor Sit Amet esed ultrices sapien nunc nam frignila59% Cotton Lorem Ipsum Dolor Sit Amet esed ultrices sapien nunc nam frignila59% Cotton Lorem Ipsum Dolor Sit Amet esed ultrices sapien nunc nam frignila59% Cotton Lorem Ipsum Dolor Sit Amet esed ultrices sapien nunc nam frignila59% Cotton Lorem Ipsum Dolor Sit Amet esed ultrices sapien nunc nam frignila', N'59% Cotton Lorem Ipsum Dolor Sit Amet esed ultrices sapien nunc nam frignila59% Cotton Lorem Ipsum Dolor Sit Amet esed ultrices sapien nunc nam frignila59% Cotton Lorem Ipsum Dolor Sit Amet esed ultrices sapien nunc nam frignila59% Cotton Lorem Ipsum Dolor Sit Amet esed ultrices sapien nunc nam frignila', CAST(232.00 AS Decimal(7, 2)), NULL, 1, CAST(N'2014-02-12T15:25:06.840' AS DateTime), 2, CAST(N'2014-02-12T15:25:06.840' AS DateTime), 2, 1, 33, N'59% Cotton Lorem Ipsum Dolor Sit Amet esed ultrices sapien nunc nam frignila', 1, N'59% Cotton Lorem Ipsum Dolor Sit Amet esed ultrices sapien nunc nam frignila59% Cotton Lorem Ipsum Dolor Sit Amet esed ultrices sapien nunc nam frignila', N'5upTJFpc5j8')
GO
INSERT [dbo].[Producto] ([id_producto], [nombre], [descripcion], [detalle], [precio], [descuento], [activo], [fecha_creacion], [id_usuario_creacion], [fecha_modificacion], [id_usuario_modificacion], [destacado], [cantidad_vendidos], [descripcion_corta], [escoger_color], [caracteristica_tecnica], [youtube]) VALUES (13, N'PlayStation 3 128Gb', N'59% Cotton Lorem Ipsum Dolor Sit Amet esed ultrices sapien nunc nam frignila59% Cotton Lorem Ipsum Dolor Sit Amet esed ultrices sapien nunc nam frignila59% Cotton Lorem Ipsum Dolor Sit Amet esed ultrices sapien nunc nam frignila59% Cotton Lorem Ipsum Dolor Sit Amet esed ultrices sapien nunc nam frignila59% Cotton Lorem Ipsum Dolor Sit Amet esed ultrices sapien nunc nam frignila', N'59% Cotton Lorem Ipsum Dolor Sit Amet esed ultrices sapien nunc nam frignila59% Cotton Lorem Ipsum Dolor Sit Amet esed ultrices sapien nunc nam frignila', CAST(343.00 AS Decimal(7, 2)), NULL, 1, CAST(N'2014-02-12T15:27:14.153' AS DateTime), 2, CAST(N'2014-02-12T15:27:14.153' AS DateTime), 2, 1, 38, N'59% Cotton Lorem Ipsum Dolor Sit Amet esed ultrices sapien nunc nam frignila', 1, N'59% Cotton Lorem Ipsum Dolor Sit Amet esed ultrices sapien nunc nam frignila59% Cotton Lorem Ipsum Dolor Sit Amet esed ultrices sapien nunc nam frignila', N'koRHYqrR9yM')
GO
INSERT [dbo].[Producto] ([id_producto], [nombre], [descripcion], [detalle], [precio], [descuento], [activo], [fecha_creacion], [id_usuario_creacion], [fecha_modificacion], [id_usuario_modificacion], [destacado], [cantidad_vendidos], [descripcion_corta], [escoger_color], [caracteristica_tecnica], [youtube]) VALUES (14, N'XBox 360', N'59% Cotton Lorem Ipsum Dolor Sit Amet esed ultrices sapien nunc nam frignila59% Cotton Lorem Ipsum Dolor Sit Amet esed ultrices sapien nunc nam frignila59% Cotton Lorem Ipsum Dolor Sit Amet esed ultrices sapien nunc nam frignila59% Cotton Lorem Ipsum Dolor Sit Amet esed ultrices sapien nunc nam frignila59% Cotton Lorem Ipsum Dolor Sit Amet esed ultrices sapien nunc nam frignila', N'59% Cotton Lorem Ipsum Dolor Sit Amet esed ultrices sapien nunc nam frignila59% Cotton Lorem Ipsum Dolor Sit Amet esed ultrices sapien nunc nam frignila', CAST(1343.00 AS Decimal(7, 2)), NULL, 1, CAST(N'2014-02-12T15:27:31.970' AS DateTime), 2, CAST(N'2014-02-12T15:27:31.970' AS DateTime), 2, 1, 21, N'59% Cotton Lorem Ipsum Dolor Sit Amet esed ultrices sapien nunc nam frignila', 1, N'59% Cotton Lorem Ipsum Dolor Sit Amet esed ultrices sapien nunc nam frignila59% Cotton Lorem Ipsum Dolor Sit Amet esed ultrices sapien nunc nam frignila', N'p2qlHoxPioM')
GO
INSERT [dbo].[Producto] ([id_producto], [nombre], [descripcion], [detalle], [precio], [descuento], [activo], [fecha_creacion], [id_usuario_creacion], [fecha_modificacion], [id_usuario_modificacion], [destacado], [cantidad_vendidos], [descripcion_corta], [escoger_color], [caracteristica_tecnica], [youtube]) VALUES (18, N'PlayStation 4', N'rew sads as djasdgashsdh skdk dgeqiqgdueqduyqgd qd iuqwgd igwd uiw dug uiwgd wugd uiqwd uiwgd iuqwuidgwuidgu dgwqudg wqugd wuqgd iuwgd uwgdwuqgdwud gui gdui', N'<p><s>re ere re re e e 2</s></p>', CAST(5.05 AS Decimal(7, 2)), NULL, 1, CAST(N'2014-04-22T16:23:25.360' AS DateTime), 3, CAST(N'2014-08-29T14:15:52.893' AS DateTime), 3, 0, 30, N'lalalalalalalalalalal lal lal lal lal lal la lal lallalalalalala', 1, N'<blockquote>
<p>rer qewe3gsfd &nbsp;d hj jhhdajh ajd sad sd a 2</p>
</blockquote>', N'3QzKVvwr35g')
GO
INSERT [dbo].[Producto] ([id_producto], [nombre], [descripcion], [detalle], [precio], [descuento], [activo], [fecha_creacion], [id_usuario_creacion], [fecha_modificacion], [id_usuario_modificacion], [destacado], [cantidad_vendidos], [descripcion_corta], [escoger_color], [caracteristica_tecnica], [youtube]) VALUES (19, N'Samsung S5', N'dsf dsfh dsfh dsfjd fh sdh af hdjk h djkgh dfjk dhfkjash dkj hdksajdh asjkhd sajdh sajkdh sajdh sajkhd asjkhd  ashd jfh auhadifgsiofuaepguwpurq9ugwrifua u fai fiods fodai fsdof aoifu aiodu soidu soidu siodu saoud aoidu siaud ois jd', N'<p><strong><em>dbfg fss fsf d sd</em></strong></p>', CAST(324.00 AS Decimal(7, 2)), NULL, 1, CAST(N'2014-08-26T15:34:56.203' AS DateTime), 3, CAST(N'2014-08-26T15:34:56.203' AS DateTime), 3, 0, 74, N'Que waaaaaaaaaa!!!', 1, N'<h2>mjghgdsfdgfgf hggdfdgf jhgfd thfjhfg ktuyiut ywt sr ftu drg s sf sdf</h2>', N'ovbuWTjQDp8')
GO
INSERT [dbo].[Producto] ([id_producto], [nombre], [descripcion], [detalle], [precio], [descuento], [activo], [fecha_creacion], [id_usuario_creacion], [fecha_modificacion], [id_usuario_modificacion], [destacado], [cantidad_vendidos], [descripcion_corta], [escoger_color], [caracteristica_tecnica], [youtube]) VALUES (20, N'Huawei Mate ', N'afk asdlj salkjd asl jdlkasj dklasj dlaskj dsakjldkljsdl asdqwdj d jj das', N'<p>efd fd as</p>', CAST(432.00 AS Decimal(7, 2)), NULL, 1, CAST(N'2014-09-09T00:06:47.820' AS DateTime), 3, CAST(N'2014-09-09T00:06:47.820' AS DateTime), 3, 0, 0, N'as  adlkasj kljdsfk jdkj asflkjalkf sdkld dlkjf alfj aa', 1, N'<p>d sa das&nbsp;</p>', N'5W66FfqFgiA')
GO
SET IDENTITY_INSERT [dbo].[Producto] OFF
GO
INSERT [dbo].[Producto_Categoria] ([id_producto], [id_categoria]) VALUES (3, 1)
GO
INSERT [dbo].[Producto_Categoria] ([id_producto], [id_categoria]) VALUES (3, 1002)
GO
INSERT [dbo].[Producto_Categoria] ([id_producto], [id_categoria]) VALUES (8, 1)
GO
INSERT [dbo].[Producto_Categoria] ([id_producto], [id_categoria]) VALUES (8, 1002)
GO
INSERT [dbo].[Producto_Categoria] ([id_producto], [id_categoria]) VALUES (10, 1)
GO
INSERT [dbo].[Producto_Categoria] ([id_producto], [id_categoria]) VALUES (10, 2)
GO
INSERT [dbo].[Producto_Categoria] ([id_producto], [id_categoria]) VALUES (11, 1)
GO
INSERT [dbo].[Producto_Categoria] ([id_producto], [id_categoria]) VALUES (12, 1)
GO
INSERT [dbo].[Producto_Categoria] ([id_producto], [id_categoria]) VALUES (12, 2)
GO
INSERT [dbo].[Producto_Categoria] ([id_producto], [id_categoria]) VALUES (13, 1)
GO
INSERT [dbo].[Producto_Categoria] ([id_producto], [id_categoria]) VALUES (13, 5)
GO
INSERT [dbo].[Producto_Categoria] ([id_producto], [id_categoria]) VALUES (14, 1)
GO
INSERT [dbo].[Producto_Categoria] ([id_producto], [id_categoria]) VALUES (14, 5)
GO
INSERT [dbo].[Producto_Categoria] ([id_producto], [id_categoria]) VALUES (18, 1)
GO
INSERT [dbo].[Producto_Categoria] ([id_producto], [id_categoria]) VALUES (19, 1)
GO
INSERT [dbo].[Producto_Categoria] ([id_producto], [id_categoria]) VALUES (20, 1003)
GO
INSERT [dbo].[Producto_Color] ([id_color], [id_producto]) VALUES (1, 3)
GO
INSERT [dbo].[Producto_Color] ([id_color], [id_producto]) VALUES (1, 8)
GO
INSERT [dbo].[Producto_Color] ([id_color], [id_producto]) VALUES (1, 10)
GO
INSERT [dbo].[Producto_Color] ([id_color], [id_producto]) VALUES (1, 11)
GO
INSERT [dbo].[Producto_Color] ([id_color], [id_producto]) VALUES (1, 14)
GO
INSERT [dbo].[Producto_Color] ([id_color], [id_producto]) VALUES (2, 3)
GO
INSERT [dbo].[Producto_Color] ([id_color], [id_producto]) VALUES (2, 10)
GO
INSERT [dbo].[Producto_Color] ([id_color], [id_producto]) VALUES (2, 12)
GO
INSERT [dbo].[Producto_Color] ([id_color], [id_producto]) VALUES (2, 13)
GO
INSERT [dbo].[Producto_Color] ([id_color], [id_producto]) VALUES (2, 14)
GO
INSERT [dbo].[Producto_Color] ([id_color], [id_producto]) VALUES (3, 8)
GO
INSERT [dbo].[Producto_Color] ([id_color], [id_producto]) VALUES (4, 3)
GO
INSERT [dbo].[Producto_Color] ([id_color], [id_producto]) VALUES (4, 10)
GO
INSERT [dbo].[Producto_Color] ([id_color], [id_producto]) VALUES (5, 12)
GO
INSERT [dbo].[Producto_Color] ([id_color], [id_producto]) VALUES (6, 11)
GO
INSERT [dbo].[Producto_Elemento_Atributo] ([id_elemento_atributo], [id_producto]) VALUES (10, 18)
GO
INSERT [dbo].[Producto_Elemento_Atributo] ([id_elemento_atributo], [id_producto]) VALUES (9, 18)
GO
INSERT [dbo].[Producto_Elemento_Atributo] ([id_elemento_atributo], [id_producto]) VALUES (11, 18)
GO
INSERT [dbo].[Producto_Elemento_Atributo] ([id_elemento_atributo], [id_producto]) VALUES (12, 18)
GO
INSERT [dbo].[Producto_Elemento_Atributo] ([id_elemento_atributo], [id_producto]) VALUES (19, 18)
GO
INSERT [dbo].[Producto_Elemento_Atributo] ([id_elemento_atributo], [id_producto]) VALUES (17, 18)
GO
INSERT [dbo].[Producto_Elemento_Atributo] ([id_elemento_atributo], [id_producto]) VALUES (18, 18)
GO
INSERT [dbo].[Producto_Elemento_Atributo] ([id_elemento_atributo], [id_producto]) VALUES (9, 19)
GO
INSERT [dbo].[Producto_Elemento_Atributo] ([id_elemento_atributo], [id_producto]) VALUES (12, 19)
GO
INSERT [dbo].[Producto_Elemento_Atributo] ([id_elemento_atributo], [id_producto]) VALUES (8, 19)
GO
INSERT [dbo].[Producto_Elemento_Atributo] ([id_elemento_atributo], [id_producto]) VALUES (19, 19)
GO
INSERT [dbo].[Producto_Elemento_Atributo] ([id_elemento_atributo], [id_producto]) VALUES (16, 19)
GO
INSERT [dbo].[Producto_Elemento_Atributo] ([id_elemento_atributo], [id_producto]) VALUES (14, 19)
GO
INSERT [dbo].[Producto_Elemento_Atributo] ([id_elemento_atributo], [id_producto]) VALUES (13, 19)
GO
SET IDENTITY_INSERT [dbo].[Rol] ON 
GO
INSERT [dbo].[Rol] ([id_rol], [nombre], [descripcion]) VALUES (1, N'Admin', NULL)
GO
INSERT [dbo].[Rol] ([id_rol], [nombre], [descripcion]) VALUES (2, N'Usuario', NULL)
GO
SET IDENTITY_INSERT [dbo].[Rol] OFF
GO
SET IDENTITY_INSERT [dbo].[Slider] ON 
GO
INSERT [dbo].[Slider] ([id_slider], [background], [nombre], [descripcion], [boton], [url], [imagen], [orden]) VALUES (1, N'1.jpg', N'Buenas ofertas con la mejor calidad', N'Ofrecemos la mejor experiencia de compra de videojuegos en toda Latinoamérica', N'¡Compra YA!', N'#', N'img1.png', 2)
GO
INSERT [dbo].[Slider] ([id_slider], [background], [nombre], [descripcion], [boton], [url], [imagen], [orden]) VALUES (3, N'3.jpg', N'Los mejores juegos del mercado', N'Tenemos un catálogo con más de 1000 juegos para PS4, X-Box, Nintendo Wii y PC', N'Quiero buscar', N'#', N'img3.png', 1)
GO
SET IDENTITY_INSERT [dbo].[Slider] OFF
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'01', N'00', N'00', N'AMAZONAS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'01', N'01', N'00', N'CHACHAPOYAS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'01', N'01', N'01', N'CHACHAPOYAS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'01', N'01', N'02', N'ASUNCION', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'01', N'01', N'03', N'BALSAS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'01', N'01', N'04', N'CHETO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'01', N'01', N'05', N'CHILIQUIN', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'01', N'01', N'06', N'CHUQUIBAMBA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'01', N'01', N'07', N'GRANADA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'01', N'01', N'08', N'HUANCAS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'01', N'01', N'09', N'LA JALCA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'01', N'01', N'10', N'LEIMEBAMBA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'01', N'01', N'11', N'LEVANTO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'01', N'01', N'12', N'MAGDALENA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'01', N'01', N'13', N'MARISCAL CASTILLA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'01', N'01', N'14', N'MOLINOPAMPA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'01', N'01', N'15', N'MONTEVIDEO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'01', N'01', N'16', N'OLLEROS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'01', N'01', N'17', N'QUINJALCA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'01', N'01', N'18', N'SAN FRANCISCO DE DAGUAS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'01', N'01', N'19', N'SAN ISIDRO DE MAINO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'01', N'01', N'20', N'SOLOCO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'01', N'01', N'21', N'SONCHE', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'01', N'02', N'00', N'BAGUA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'01', N'02', N'01', N'BAGUA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'01', N'02', N'02', N'ARAMANGO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'01', N'02', N'03', N'COPALLIN', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'01', N'02', N'04', N'EL PARCO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'01', N'02', N'05', N'IMAZA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'01', N'02', N'06', N'LA PECA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'01', N'03', N'00', N'BONGARA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'01', N'03', N'01', N'JUMBILLA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'01', N'03', N'02', N'CHISQUILLA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'01', N'03', N'03', N'CHURUJA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'01', N'03', N'04', N'COROSHA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'01', N'03', N'05', N'CUISPES', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'01', N'03', N'06', N'FLORIDA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'01', N'03', N'07', N'JAZAN', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'01', N'03', N'08', N'RECTA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'01', N'03', N'09', N'SAN CARLOS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'01', N'03', N'10', N'SHIPASBAMBA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'01', N'03', N'11', N'VALERA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'01', N'03', N'12', N'YAMBRASBAMBA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'01', N'04', N'00', N'CONDORCANQUI', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'01', N'04', N'01', N'NIEVA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'01', N'04', N'02', N'EL CENEPA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'01', N'04', N'03', N'RIO SANTIAGO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'01', N'05', N'00', N'LUYA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'01', N'05', N'01', N'LAMUD', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'01', N'05', N'02', N'CAMPORREDONDO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'01', N'05', N'03', N'COCABAMBA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'01', N'05', N'04', N'COLCAMAR', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'01', N'05', N'05', N'CONILA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'01', N'05', N'06', N'INGUILPATA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'01', N'05', N'07', N'LONGUITA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'01', N'05', N'08', N'LONYA CHICO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'01', N'05', N'09', N'LUYA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'01', N'05', N'10', N'LUYA VIEJO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'01', N'05', N'11', N'MARIA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'01', N'05', N'12', N'OCALLI', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'01', N'05', N'13', N'OCUMAL', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'01', N'05', N'14', N'PISUQUIA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'01', N'05', N'15', N'PROVIDENCIA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'01', N'05', N'16', N'SAN CRISTOBAL', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'01', N'05', N'17', N'SAN FRANCISCO DEL YESO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'01', N'05', N'18', N'SAN JERONIMO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'01', N'05', N'19', N'SAN JUAN DE LOPECANCHA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'01', N'05', N'20', N'SANTA CATALINA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'01', N'05', N'21', N'SANTO TOMAS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'01', N'05', N'22', N'TINGO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'01', N'05', N'23', N'TRITA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'01', N'06', N'00', N'RODRIGUEZ DE MENDOZA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'01', N'06', N'01', N'SAN NICOLAS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'01', N'06', N'02', N'CHIRIMOTO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'01', N'06', N'03', N'COCHAMAL', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'01', N'06', N'04', N'HUAMBO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'01', N'06', N'05', N'LIMABAMBA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'01', N'06', N'06', N'LONGAR', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'01', N'06', N'07', N'MARISCAL BENAVIDES', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'01', N'06', N'08', N'MILPUC', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'01', N'06', N'09', N'OMIA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'01', N'06', N'10', N'SANTA ROSA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'01', N'06', N'11', N'TOTORA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'01', N'06', N'12', N'VISTA ALEGRE', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'01', N'07', N'00', N'UTCUBAMBA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'01', N'07', N'01', N'BAGUA GRANDE', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'01', N'07', N'02', N'CAJARURO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'01', N'07', N'03', N'CUMBA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'01', N'07', N'04', N'EL MILAGRO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'01', N'07', N'05', N'JAMALCA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'01', N'07', N'06', N'LONYA GRANDE', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'01', N'07', N'07', N'YAMON', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'00', N'00', N'ANCASH', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'01', N'00', N'HUARAZ', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'01', N'01', N'HUARAZ', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'01', N'02', N'COCHABAMBA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'01', N'03', N'COLCABAMBA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'01', N'04', N'HUANCHAY', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'01', N'05', N'INDEPENDENCIA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'01', N'06', N'JANGAS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'01', N'07', N'LA LIBERTAD', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'01', N'08', N'OLLEROS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'01', N'09', N'PAMPAS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'01', N'10', N'PARIACOTO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'01', N'11', N'PIRA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'01', N'12', N'TARICA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'02', N'00', N'AIJA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'02', N'01', N'AIJA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'02', N'02', N'CORIS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'02', N'03', N'HUACLLAN', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'02', N'04', N'LA MERCED', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'02', N'05', N'SUCCHA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'03', N'00', N'ANTONIO RAYMONDI', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'03', N'01', N'LLAMELLIN', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'03', N'02', N'ACZO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'03', N'03', N'CHACCHO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'03', N'04', N'CHINGAS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'03', N'05', N'MIRGAS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'03', N'06', N'SAN JUAN DE RONTOY', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'04', N'00', N'ASUNCION', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'04', N'01', N'CHACAS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'04', N'02', N'ACOCHACA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'05', N'00', N'BOLOGNESI', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'05', N'01', N'CHIQUIAN', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'05', N'02', N'ABELARDO PARDO LEZAMETA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'05', N'03', N'ANTONIO RAYMONDI', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'05', N'04', N'AQUIA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'05', N'05', N'CAJACAY', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'05', N'06', N'CANIS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'05', N'07', N'COLQUIOC', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'05', N'08', N'HUALLANCA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'05', N'09', N'HUASTA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'05', N'10', N'HUAYLLACAYAN', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'05', N'11', N'LA PRIMAVERA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'05', N'12', N'MANGAS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'05', N'13', N'PACLLON', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'05', N'14', N'SAN MIGUEL DE CORPANQUI', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'05', N'15', N'TICLLOS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'06', N'00', N'CARHUAZ', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'06', N'01', N'CARHUAZ', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'06', N'02', N'ACOPAMPA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'06', N'03', N'AMASHCA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'06', N'04', N'ANTA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'06', N'05', N'ATAQUERO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'06', N'06', N'MARCARA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'06', N'07', N'PARIAHUANCA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'06', N'08', N'SAN MIGUEL DE ACO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'06', N'09', N'SHILLA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'06', N'10', N'TINCO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'06', N'11', N'YUNGAR', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'07', N'00', N'CARLOS FERMIN FITZCARRALD', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'07', N'01', N'SAN LUIS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'07', N'02', N'SAN NICOLAS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'07', N'03', N'YAUYA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'08', N'00', N'CASMA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'08', N'01', N'CASMA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'08', N'02', N'BUENA VISTA ALTA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'08', N'03', N'COMANDANTE NOEL', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'08', N'04', N'YAUTAN', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'09', N'00', N'CORONGO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'09', N'01', N'CORONGO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'09', N'02', N'ACO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'09', N'03', N'BAMBAS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'09', N'04', N'CUSCA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'09', N'05', N'LA PAMPA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'09', N'06', N'YANAC', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'09', N'07', N'YUPAN', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'10', N'00', N'HUARI', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'10', N'01', N'HUARI', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'10', N'02', N'ANRA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'10', N'03', N'CAJAY', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'10', N'04', N'CHAVIN DE HUANTAR', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'10', N'05', N'HUACACHI', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'10', N'06', N'HUACCHIS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'10', N'07', N'HUACHIS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'10', N'08', N'HUANTAR', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'10', N'09', N'MASIN', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'10', N'10', N'PAUCAS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'10', N'11', N'PONTO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'10', N'12', N'RAHUAPAMPA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'10', N'13', N'RAPAYAN', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'10', N'14', N'SAN MARCOS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'10', N'15', N'SAN PEDRO DE CHANA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'10', N'16', N'UCO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'11', N'00', N'HUARMEY', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'11', N'01', N'HUARMEY', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'11', N'02', N'COCHAPETI', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'11', N'03', N'CULEBRAS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'11', N'04', N'HUAYAN', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'11', N'05', N'MALVAS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'12', N'00', N'HUAYLAS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'12', N'01', N'CARAZ', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'12', N'02', N'HUALLANCA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'12', N'03', N'HUATA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'12', N'04', N'HUAYLAS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'12', N'05', N'MATO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'12', N'06', N'PAMPAROMAS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'12', N'07', N'PUEBLO LIBRE', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'12', N'08', N'SANTA CRUZ', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'12', N'09', N'SANTO TORIBIO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'12', N'10', N'YURACMARCA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'13', N'00', N'MARISCAL LUZURIAGA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'13', N'01', N'PISCOBAMBA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'13', N'02', N'CASCA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'13', N'03', N'ELEAZAR GUZMAN BARRON', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'13', N'04', N'FIDEL OLIVAS ESCUDERO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'13', N'05', N'LLAMA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'13', N'06', N'LLUMPA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'13', N'07', N'LUCMA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'13', N'08', N'MUSGA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'14', N'00', N'OCROS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'14', N'01', N'OCROS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'14', N'02', N'ACAS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'14', N'03', N'CAJAMARQUILLA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'14', N'04', N'CARHUAPAMPA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'14', N'05', N'COCHAS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'14', N'06', N'CONGAS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'14', N'07', N'LLIPA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'14', N'08', N'SAN CRISTOBAL DE RAJAN', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'14', N'09', N'SAN PEDRO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'14', N'10', N'SANTIAGO DE CHILCAS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'15', N'00', N'PALLASCA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'15', N'01', N'CABANA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'15', N'02', N'BOLOGNESI', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'15', N'03', N'CONCHUCOS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'15', N'04', N'HUACASCHUQUE', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'15', N'05', N'HUANDOVAL', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'15', N'06', N'LACABAMBA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'15', N'07', N'LLAPO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'15', N'08', N'PALLASCA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'15', N'09', N'PAMPAS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'15', N'10', N'SANTA ROSA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'15', N'11', N'TAUCA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'16', N'00', N'POMABAMBA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'16', N'01', N'POMABAMBA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'16', N'02', N'HUAYLLAN', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'16', N'03', N'PAROBAMBA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'16', N'04', N'QUINUABAMBA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'17', N'00', N'RECUAY', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'17', N'01', N'RECUAY', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'17', N'02', N'CATAC', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'17', N'03', N'COTAPARACO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'17', N'04', N'HUAYLLAPAMPA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'17', N'05', N'LLACLLIN', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'17', N'06', N'MARCA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'17', N'07', N'PAMPAS CHICO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'17', N'08', N'PARARIN', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'17', N'09', N'TAPACOCHA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'17', N'10', N'TICAPAMPA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'18', N'00', N'SANTA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'18', N'01', N'CHIMBOTE', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'18', N'02', N'CACERES DEL PERU', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'18', N'03', N'COISHCO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'18', N'04', N'MACATE', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'18', N'05', N'MORO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'18', N'06', N'NEPEÑA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'18', N'07', N'SAMANCO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'18', N'08', N'SANTA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'18', N'09', N'NUEVO CHIMBOTE', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'19', N'00', N'SIHUAS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'19', N'01', N'SIHUAS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'19', N'02', N'ACOBAMBA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'19', N'03', N'ALFONSO UGARTE', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'19', N'04', N'CASHAPAMPA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'19', N'05', N'CHINGALPO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'19', N'06', N'HUAYLLABAMBA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'19', N'07', N'QUICHES', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'19', N'08', N'RAGASH', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'19', N'09', N'SAN JUAN', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'19', N'10', N'SICSIBAMBA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'20', N'00', N'YUNGAY', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'20', N'01', N'YUNGAY', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'20', N'02', N'CASCAPARA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'20', N'03', N'MANCOS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'20', N'04', N'MATACOTO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'20', N'05', N'QUILLO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'20', N'06', N'RANRAHIRCA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'20', N'07', N'SHUPLUY', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'02', N'20', N'08', N'YANAMA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'03', N'00', N'00', N'APURIMAC', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'03', N'01', N'00', N'ABANCAY', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'03', N'01', N'01', N'ABANCAY', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'03', N'01', N'02', N'CHACOCHE', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'03', N'01', N'03', N'CIRCA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'03', N'01', N'04', N'CURAHUASI', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'03', N'01', N'05', N'HUANIPACA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'03', N'01', N'06', N'LAMBRAMA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'03', N'01', N'07', N'PICHIRHUA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'03', N'01', N'08', N'SAN PEDRO DE CACHORA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'03', N'01', N'09', N'TAMBURCO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'03', N'02', N'00', N'ANDAHUAYLAS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'03', N'02', N'01', N'ANDAHUAYLAS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'03', N'02', N'02', N'ANDARAPA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'03', N'02', N'03', N'CHIARA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'03', N'02', N'04', N'HUANCARAMA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'03', N'02', N'05', N'HUANCARAY', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'03', N'02', N'06', N'HUAYANA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'03', N'02', N'07', N'KISHUARA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'03', N'02', N'08', N'PACOBAMBA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'03', N'02', N'09', N'PACUCHA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'03', N'02', N'10', N'PAMPACHIRI', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'03', N'02', N'11', N'POMACOCHA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'03', N'02', N'12', N'SAN ANTONIO DE CACHI', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'03', N'02', N'13', N'SAN JERONIMO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'03', N'02', N'14', N'SAN MIGUEL DE CHACCRAMPA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'03', N'02', N'15', N'SANTA MARIA DE CHICMO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'03', N'02', N'16', N'TALAVERA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'03', N'02', N'17', N'TUMAY HUARACA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'03', N'02', N'18', N'TURPO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'03', N'02', N'19', N'KAQUIABAMBA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'03', N'03', N'00', N'ANTABAMBA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'03', N'03', N'01', N'ANTABAMBA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'03', N'03', N'02', N'EL ORO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'03', N'03', N'03', N'HUAQUIRCA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'03', N'03', N'04', N'JUAN ESPINOZA MEDRANO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'03', N'03', N'05', N'OROPESA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'03', N'03', N'06', N'PACHACONAS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'03', N'03', N'07', N'SABAINO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'03', N'04', N'00', N'AYMARAES', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'03', N'04', N'01', N'CHALHUANCA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'03', N'04', N'02', N'CAPAYA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'03', N'04', N'03', N'CARAYBAMBA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'03', N'04', N'04', N'CHAPIMARCA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'03', N'04', N'05', N'COLCABAMBA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'03', N'04', N'06', N'COTARUSE', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'03', N'04', N'07', N'HUAYLLO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'03', N'04', N'08', N'JUSTO APU SAHUARAURA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'03', N'04', N'09', N'LUCRE', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'03', N'04', N'10', N'POCOHUANCA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'03', N'04', N'11', N'SAN JUAN DE CHACÑA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'03', N'04', N'12', N'SAÑAYCA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'03', N'04', N'13', N'SORAYA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'03', N'04', N'14', N'TAPAIRIHUA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'03', N'04', N'15', N'TINTAY', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'03', N'04', N'16', N'TORAYA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'03', N'04', N'17', N'YANACA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'03', N'05', N'00', N'COTABAMBAS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'03', N'05', N'01', N'TAMBOBAMBA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'03', N'05', N'02', N'COTABAMBAS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'03', N'05', N'03', N'COYLLURQUI', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'03', N'05', N'04', N'HAQUIRA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'03', N'05', N'05', N'MARA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'03', N'05', N'06', N'CHALLHUAHUACHO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'03', N'06', N'00', N'CHINCHEROS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'03', N'06', N'01', N'CHINCHEROS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'03', N'06', N'02', N'ANCO_HUALLO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'03', N'06', N'03', N'COCHARCAS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'03', N'06', N'04', N'HUACCANA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'03', N'06', N'05', N'OCOBAMBA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'03', N'06', N'06', N'ONGOY', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'03', N'06', N'07', N'URANMARCA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'03', N'06', N'08', N'RANRACANCHA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'03', N'07', N'00', N'GRAU', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'03', N'07', N'01', N'CHUQUIBAMBILLA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'03', N'07', N'02', N'CURPAHUASI', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'03', N'07', N'03', N'GAMARRA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'03', N'07', N'04', N'HUAYLLATI', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'03', N'07', N'05', N'MAMARA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'03', N'07', N'06', N'MICAELA BASTIDAS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'03', N'07', N'07', N'PATAYPAMPA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'03', N'07', N'08', N'PROGRESO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'03', N'07', N'09', N'SAN ANTONIO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'03', N'07', N'10', N'SANTA ROSA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'03', N'07', N'11', N'TURPAY', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'03', N'07', N'12', N'VILCABAMBA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'03', N'07', N'13', N'VIRUNDO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'03', N'07', N'14', N'CURASCO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'04', N'00', N'00', N'AREQUIPA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'04', N'01', N'00', N'AREQUIPA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'04', N'01', N'01', N'AREQUIPA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'04', N'01', N'02', N'ALTO SELVA ALEGRE', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'04', N'01', N'03', N'CAYMA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'04', N'01', N'04', N'CERRO COLORADO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'04', N'01', N'05', N'CHARACATO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'04', N'01', N'06', N'CHIGUATA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'04', N'01', N'07', N'JACOBO HUNTER', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'04', N'01', N'08', N'LA JOYA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'04', N'01', N'09', N'MARIANO MELGAR', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'04', N'01', N'10', N'MIRAFLORES', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'04', N'01', N'11', N'MOLLEBAYA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'04', N'01', N'12', N'PAUCARPATA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'04', N'01', N'13', N'POCSI', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'04', N'01', N'14', N'POLOBAYA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'04', N'01', N'15', N'QUEQUEÑA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'04', N'01', N'16', N'SABANDIA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'04', N'01', N'17', N'SACHACA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'04', N'01', N'18', N'SAN JUAN DE SIGUAS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'04', N'01', N'19', N'SAN JUAN DE TARUCANI', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'04', N'01', N'20', N'SANTA ISABEL DE SIGUAS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'04', N'01', N'21', N'SANTA RITA DE SIGUAS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'04', N'01', N'22', N'SOCABAYA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'04', N'01', N'23', N'TIABAYA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'04', N'01', N'24', N'UCHUMAYO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'04', N'01', N'25', N'VITOR', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'04', N'01', N'26', N'YANAHUARA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'04', N'01', N'27', N'YARABAMBA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'04', N'01', N'28', N'YURA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'04', N'01', N'29', N'JOSE LUIS BUSTAMANTE Y RIVERO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'04', N'02', N'00', N'CAMANA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'04', N'02', N'01', N'CAMANA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'04', N'02', N'02', N'JOSE MARIA QUIMPER', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'04', N'02', N'03', N'MARIANO NICOLAS VALCARCEL', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'04', N'02', N'04', N'MARISCAL CACERES', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'04', N'02', N'05', N'NICOLAS DE PIEROLA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'04', N'02', N'06', N'OCOÑA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'04', N'02', N'07', N'QUILCA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'04', N'02', N'08', N'SAMUEL PASTOR', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'04', N'03', N'00', N'CARAVELI', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'04', N'03', N'01', N'CARAVELI', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'04', N'03', N'02', N'ACARI', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'04', N'03', N'03', N'ATICO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'04', N'03', N'04', N'ATIQUIPA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'04', N'03', N'05', N'BELLA UNION', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'04', N'03', N'06', N'CAHUACHO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'04', N'03', N'07', N'CHALA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'04', N'03', N'08', N'CHAPARRA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'04', N'03', N'09', N'HUANUHUANU', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'04', N'03', N'10', N'JAQUI', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'04', N'03', N'11', N'LOMAS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'04', N'03', N'12', N'QUICACHA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'04', N'03', N'13', N'YAUCA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'04', N'04', N'00', N'CASTILLA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'04', N'04', N'01', N'APLAO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'04', N'04', N'02', N'ANDAGUA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'04', N'04', N'03', N'AYO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'04', N'04', N'04', N'CHACHAS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'04', N'04', N'05', N'CHILCAYMARCA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'04', N'04', N'06', N'CHOCO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'04', N'04', N'07', N'HUANCARQUI', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'04', N'04', N'08', N'MACHAGUAY', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'04', N'04', N'09', N'ORCOPAMPA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'04', N'04', N'10', N'PAMPACOLCA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'04', N'04', N'11', N'TIPAN', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'04', N'04', N'12', N'UÑON', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'04', N'04', N'13', N'URACA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'04', N'04', N'14', N'VIRACO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'04', N'05', N'00', N'CAYLLOMA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'04', N'05', N'01', N'CHIVAY', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'04', N'05', N'02', N'ACHOMA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'04', N'05', N'03', N'CABANACONDE', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'04', N'05', N'04', N'CALLALLI', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'04', N'05', N'05', N'CAYLLOMA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'04', N'05', N'06', N'COPORAQUE', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'04', N'05', N'07', N'HUAMBO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'04', N'05', N'08', N'HUANCA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'04', N'05', N'09', N'ICHUPAMPA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'04', N'05', N'10', N'LARI', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'04', N'05', N'11', N'LLUTA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'04', N'05', N'12', N'MACA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'04', N'05', N'13', N'MADRIGAL', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'04', N'05', N'14', N'SAN ANTONIO DE CHUCA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'04', N'05', N'15', N'SIBAYO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'04', N'05', N'16', N'TAPAY', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'04', N'05', N'17', N'TISCO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'04', N'05', N'18', N'TUTI', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'04', N'05', N'19', N'YANQUE', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'04', N'05', N'20', N'MAJES', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'04', N'06', N'00', N'CONDESUYOS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'04', N'06', N'01', N'CHUQUIBAMBA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'04', N'06', N'02', N'ANDARAY', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'04', N'06', N'03', N'CAYARANI', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'04', N'06', N'04', N'CHICHAS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'04', N'06', N'05', N'IRAY', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'04', N'06', N'06', N'RIO GRANDE', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'04', N'06', N'07', N'SALAMANCA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'04', N'06', N'08', N'YANAQUIHUA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'04', N'07', N'00', N'ISLAY', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'04', N'07', N'01', N'MOLLENDO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'04', N'07', N'02', N'COCACHACRA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'04', N'07', N'03', N'DEAN VALDIVIA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'04', N'07', N'04', N'ISLAY', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'04', N'07', N'05', N'MEJIA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'04', N'07', N'06', N'PUNTA DE BOMBON', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'04', N'08', N'00', N'LA UNION', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'04', N'08', N'01', N'COTAHUASI', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'04', N'08', N'02', N'ALCA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'04', N'08', N'03', N'CHARCANA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'04', N'08', N'04', N'HUAYNACOTAS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'04', N'08', N'05', N'PAMPAMARCA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'04', N'08', N'06', N'PUYCA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'04', N'08', N'07', N'QUECHUALLA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'04', N'08', N'08', N'SAYLA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'04', N'08', N'09', N'TAURIA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'04', N'08', N'10', N'TOMEPAMPA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'04', N'08', N'11', N'TORO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'05', N'00', N'00', N'AYACUCHO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'05', N'01', N'00', N'HUAMANGA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'05', N'01', N'01', N'AYACUCHO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'05', N'01', N'02', N'ACOCRO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'05', N'01', N'03', N'ACOS VINCHOS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'05', N'01', N'04', N'CARMEN ALTO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'05', N'01', N'05', N'CHIARA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'05', N'01', N'06', N'OCROS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'05', N'01', N'07', N'PACAYCASA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'05', N'01', N'08', N'QUINUA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'05', N'01', N'09', N'SAN JOSE DE TICLLAS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'05', N'01', N'10', N'SAN JUAN BAUTISTA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'05', N'01', N'11', N'SANTIAGO DE PISCHA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'05', N'01', N'12', N'SOCOS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'05', N'01', N'13', N'TAMBILLO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'05', N'01', N'14', N'VINCHOS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'05', N'01', N'15', N'JESUS NAZARENO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'05', N'02', N'00', N'CANGALLO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'05', N'02', N'01', N'CANGALLO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'05', N'02', N'02', N'CHUSCHI', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'05', N'02', N'03', N'LOS MOROCHUCOS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'05', N'02', N'04', N'MARIA PARADO DE BELLIDO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'05', N'02', N'05', N'PARAS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'05', N'02', N'06', N'TOTOS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'05', N'03', N'00', N'HUANCA SANCOS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'05', N'03', N'01', N'SANCOS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'05', N'03', N'02', N'CARAPO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'05', N'03', N'03', N'SACSAMARCA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'05', N'03', N'04', N'SANTIAGO DE LUCANAMARCA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'05', N'04', N'00', N'HUANTA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'05', N'04', N'01', N'HUANTA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'05', N'04', N'02', N'AYAHUANCO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'05', N'04', N'03', N'HUAMANGUILLA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'05', N'04', N'04', N'IGUAIN', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'05', N'04', N'05', N'LURICOCHA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'05', N'04', N'06', N'SANTILLANA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'05', N'04', N'07', N'SIVIA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'05', N'04', N'08', N'LLOCHEGUA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'05', N'05', N'00', N'LA MAR', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'05', N'05', N'01', N'SAN MIGUEL', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'05', N'05', N'02', N'ANCO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'05', N'05', N'03', N'AYNA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'05', N'05', N'04', N'CHILCAS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'05', N'05', N'05', N'CHUNGUI', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'05', N'05', N'06', N'LUIS CARRANZA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'05', N'05', N'07', N'SANTA ROSA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'05', N'05', N'08', N'TAMBO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'05', N'05', N'09', N'SAMUGARI', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'05', N'06', N'00', N'LUCANAS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'05', N'06', N'01', N'PUQUIO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'05', N'06', N'02', N'AUCARA', CAST(45.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'05', N'06', N'03', N'CABANA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'05', N'06', N'04', N'CARMEN SALCEDO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'05', N'06', N'05', N'CHAVIÑA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'05', N'06', N'06', N'CHIPAO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'05', N'06', N'07', N'HUAC-HUAS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'05', N'06', N'08', N'LARAMATE', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'05', N'06', N'09', N'LEONCIO PRADO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'05', N'06', N'10', N'LLAUTA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'05', N'06', N'11', N'LUCANAS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'05', N'06', N'12', N'OCAÑA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'05', N'06', N'13', N'OTOCA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'05', N'06', N'14', N'SAISA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'05', N'06', N'15', N'SAN CRISTOBAL', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'05', N'06', N'16', N'SAN JUAN', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'05', N'06', N'17', N'SAN PEDRO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'05', N'06', N'18', N'SAN PEDRO DE PALCO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'05', N'06', N'19', N'SANCOS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'05', N'06', N'20', N'SANTA ANA DE HUAYCAHUACHO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'05', N'06', N'21', N'SANTA LUCIA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'05', N'07', N'00', N'PARINACOCHAS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'05', N'07', N'01', N'CORACORA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'05', N'07', N'02', N'CHUMPI', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'05', N'07', N'03', N'CORONEL CASTAÑEDA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'05', N'07', N'04', N'PACAPAUSA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'05', N'07', N'05', N'PULLO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'05', N'07', N'06', N'PUYUSCA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'05', N'07', N'07', N'SAN FRANCISCO DE RAVACAYCO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'05', N'07', N'08', N'UPAHUACHO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'05', N'08', N'00', N'PAUCAR DEL SARA SARA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'05', N'08', N'01', N'PAUSA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'05', N'08', N'02', N'COLTA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'05', N'08', N'03', N'CORCULLA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'05', N'08', N'04', N'LAMPA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'05', N'08', N'05', N'MARCABAMBA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'05', N'08', N'06', N'OYOLO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'05', N'08', N'07', N'PARARCA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'05', N'08', N'08', N'SAN JAVIER DE ALPABAMBA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'05', N'08', N'09', N'SAN JOSE DE USHUA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'05', N'08', N'10', N'SARA SARA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'05', N'09', N'00', N'SUCRE', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'05', N'09', N'01', N'QUEROBAMBA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'05', N'09', N'02', N'BELEN', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'05', N'09', N'03', N'CHALCOS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'05', N'09', N'04', N'CHILCAYOC', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'05', N'09', N'05', N'HUACAÑA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'05', N'09', N'06', N'MORCOLLA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'05', N'09', N'07', N'PAICO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'05', N'09', N'08', N'SAN PEDRO DE LARCAY', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'05', N'09', N'09', N'SAN SALVADOR DE QUIJE', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'05', N'09', N'10', N'SANTIAGO DE PAUCARAY', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'05', N'09', N'11', N'SORAS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'05', N'10', N'00', N'VICTOR FAJARDO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'05', N'10', N'01', N'HUANCAPI', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'05', N'10', N'02', N'ALCAMENCA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'05', N'10', N'03', N'APONGO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'05', N'10', N'04', N'ASQUIPATA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'05', N'10', N'05', N'CANARIA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'05', N'10', N'06', N'CAYARA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'05', N'10', N'07', N'COLCA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'05', N'10', N'08', N'HUAMANQUIQUIA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'05', N'10', N'09', N'HUANCARAYLLA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'05', N'10', N'10', N'HUAYA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'05', N'10', N'11', N'SARHUA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'05', N'10', N'12', N'VILCANCHOS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'05', N'11', N'00', N'VILCAS HUAMAN', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'05', N'11', N'01', N'VILCAS HUAMAN', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'05', N'11', N'02', N'ACCOMARCA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'05', N'11', N'03', N'CARHUANCA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'05', N'11', N'04', N'CONCEPCION', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'05', N'11', N'05', N'HUAMBALPA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'05', N'11', N'06', N'INDEPENDENCIA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'05', N'11', N'07', N'SAURAMA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'05', N'11', N'08', N'VISCHONGO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'06', N'00', N'00', N'CAJAMARCA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'06', N'01', N'00', N'CAJAMARCA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'06', N'01', N'01', N'CAJAMARCA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'06', N'01', N'02', N'ASUNCION', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'06', N'01', N'03', N'CHETILLA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'06', N'01', N'04', N'COSPAN', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'06', N'01', N'05', N'ENCAÑADA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'06', N'01', N'06', N'JESUS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'06', N'01', N'07', N'LLACANORA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'06', N'01', N'08', N'LOS BAÑOS DEL INCA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'06', N'01', N'09', N'MAGDALENA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'06', N'01', N'10', N'MATARA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'06', N'01', N'11', N'NAMORA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'06', N'01', N'12', N'SAN JUAN', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'06', N'02', N'00', N'CAJABAMBA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'06', N'02', N'01', N'CAJABAMBA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'06', N'02', N'02', N'CACHACHI', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'06', N'02', N'03', N'CONDEBAMBA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'06', N'02', N'04', N'SITACOCHA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'06', N'03', N'00', N'CELENDIN', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'06', N'03', N'01', N'CELENDIN', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'06', N'03', N'02', N'CHUMUCH', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'06', N'03', N'03', N'CORTEGANA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'06', N'03', N'04', N'HUASMIN', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'06', N'03', N'05', N'JORGE CHAVEZ', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'06', N'03', N'06', N'JOSE GALVEZ', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'06', N'03', N'07', N'MIGUEL IGLESIAS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'06', N'03', N'08', N'OXAMARCA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'06', N'03', N'09', N'SOROCHUCO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'06', N'03', N'10', N'SUCRE', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'06', N'03', N'11', N'UTCO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'06', N'03', N'12', N'LA LIBERTAD DE PALLAN', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'06', N'04', N'00', N'CHOTA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'06', N'04', N'01', N'CHOTA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'06', N'04', N'02', N'ANGUIA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'06', N'04', N'03', N'CHADIN', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'06', N'04', N'04', N'CHIGUIRIP', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'06', N'04', N'05', N'CHIMBAN', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'06', N'04', N'06', N'CHOROPAMPA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'06', N'04', N'07', N'COCHABAMBA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'06', N'04', N'08', N'CONCHAN', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'06', N'04', N'09', N'HUAMBOS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'06', N'04', N'10', N'LAJAS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'06', N'04', N'11', N'LLAMA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'06', N'04', N'12', N'MIRACOSTA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'06', N'04', N'13', N'PACCHA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'06', N'04', N'14', N'PION', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'06', N'04', N'15', N'QUEROCOTO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'06', N'04', N'16', N'SAN JUAN DE LICUPIS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'06', N'04', N'17', N'TACABAMBA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'06', N'04', N'18', N'TOCMOCHE', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'06', N'04', N'19', N'CHALAMARCA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'06', N'05', N'00', N'CONTUMAZA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'06', N'05', N'01', N'CONTUMAZA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'06', N'05', N'02', N'CHILETE', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'06', N'05', N'03', N'CUPISNIQUE', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'06', N'05', N'04', N'GUZMANGO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'06', N'05', N'05', N'SAN BENITO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'06', N'05', N'06', N'SANTA CRUZ DE TOLED', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'06', N'05', N'07', N'TANTARICA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'06', N'05', N'08', N'YONAN', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'06', N'06', N'00', N'CUTERVO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'06', N'06', N'01', N'CUTERVO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'06', N'06', N'02', N'CALLAYUC', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'06', N'06', N'03', N'CHOROS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'06', N'06', N'04', N'CUJILLO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'06', N'06', N'05', N'LA RAMADA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'06', N'06', N'06', N'PIMPINGOS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'06', N'06', N'07', N'QUEROCOTILLO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'06', N'06', N'08', N'SAN ANDRES DE CUTERVO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'06', N'06', N'09', N'SAN JUAN DE CUTERVO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'06', N'06', N'10', N'SAN LUIS DE LUCMA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'06', N'06', N'11', N'SANTA CRUZ', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'06', N'06', N'12', N'SANTO DOMINGO DE LA CAPILLA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'06', N'06', N'13', N'SANTO TOMAS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'06', N'06', N'14', N'SOCOTA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'06', N'06', N'15', N'TORIBIO CASANOVA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'06', N'07', N'00', N'HUALGAYOC', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'06', N'07', N'01', N'BAMBAMARCA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'06', N'07', N'02', N'CHUGUR', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'06', N'07', N'03', N'HUALGAYOC', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'06', N'08', N'00', N'JAEN', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'06', N'08', N'01', N'JAEN', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'06', N'08', N'02', N'BELLAVISTA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'06', N'08', N'03', N'CHONTALI', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'06', N'08', N'04', N'COLASAY', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'06', N'08', N'05', N'HUABAL', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'06', N'08', N'06', N'LAS PIRIAS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'06', N'08', N'07', N'POMAHUACA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'06', N'08', N'08', N'PUCARA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'06', N'08', N'09', N'SALLIQUE', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'06', N'08', N'10', N'SAN FELIPE', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'06', N'08', N'11', N'SAN JOSE DEL ALTO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'06', N'08', N'12', N'SANTA ROSA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'06', N'09', N'00', N'SAN IGNACIO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'06', N'09', N'01', N'SAN IGNACIO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'06', N'09', N'02', N'CHIRINOS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'06', N'09', N'03', N'HUARANGO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'06', N'09', N'04', N'LA COIPA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'06', N'09', N'05', N'NAMBALLE', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'06', N'09', N'06', N'SAN JOSE DE LOURDES', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'06', N'09', N'07', N'TABACONAS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'06', N'10', N'00', N'SAN MARCOS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'06', N'10', N'01', N'PEDRO GALVEZ', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'06', N'10', N'02', N'CHANCAY', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'06', N'10', N'03', N'EDUARDO VILLANUEVA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'06', N'10', N'04', N'GREGORIO PITA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'06', N'10', N'05', N'ICHOCAN', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'06', N'10', N'06', N'JOSE MANUEL QUIROZ', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'06', N'10', N'07', N'JOSE SABOGAL', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'06', N'11', N'00', N'SAN MIGUEL', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'06', N'11', N'01', N'SAN MIGUEL', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'06', N'11', N'02', N'BOLIVAR', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'06', N'11', N'03', N'CALQUIS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'06', N'11', N'04', N'CATILLUC', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'06', N'11', N'05', N'EL PRADO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'06', N'11', N'06', N'LA FLORIDA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'06', N'11', N'07', N'LLAPA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'06', N'11', N'08', N'NANCHOC', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'06', N'11', N'09', N'NIEPOS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'06', N'11', N'10', N'SAN GREGORIO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'06', N'11', N'11', N'SAN SILVESTRE DE COCHAN', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'06', N'11', N'12', N'TONGOD', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'06', N'11', N'13', N'UNION AGUA BLANCA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'06', N'12', N'00', N'SAN PABLO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'06', N'12', N'01', N'SAN PABLO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'06', N'12', N'02', N'SAN BERNARDINO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'06', N'12', N'03', N'SAN LUIS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'06', N'12', N'04', N'TUMBADEN', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'06', N'13', N'00', N'SANTA CRUZ', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'06', N'13', N'01', N'SANTA CRUZ', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'06', N'13', N'02', N'ANDABAMBA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'06', N'13', N'03', N'CATACHE', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'06', N'13', N'04', N'CHANCAYBAÑOS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'06', N'13', N'05', N'LA ESPERANZA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'06', N'13', N'06', N'NINABAMBA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'06', N'13', N'07', N'PULAN', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'06', N'13', N'08', N'SAUCEPAMPA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'06', N'13', N'09', N'SEXI', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'06', N'13', N'10', N'UTICYACU', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'06', N'13', N'11', N'YAUYUCAN', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'07', N'00', N'00', N'CALLAO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'07', N'01', N'00', N'CALLAO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'07', N'01', N'01', N'CALLAO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'07', N'01', N'02', N'BELLAVISTA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'07', N'01', N'03', N'CARMEN DE LA LEGUA REYNOSO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'07', N'01', N'04', N'LA PERLA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'07', N'01', N'05', N'LA PUNTA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'07', N'01', N'06', N'VENTANILLA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'08', N'00', N'00', N'CUSCO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'08', N'01', N'00', N'CUSCO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'08', N'01', N'01', N'CUSCO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'08', N'01', N'02', N'CCORCA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'08', N'01', N'03', N'POROY', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'08', N'01', N'04', N'SAN JERONIMO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'08', N'01', N'05', N'SAN SEBASTIAN', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'08', N'01', N'06', N'SANTIAGO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'08', N'01', N'07', N'SAYLLA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'08', N'01', N'08', N'WANCHAQ', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'08', N'02', N'00', N'ACOMAYO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'08', N'02', N'01', N'ACOMAYO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'08', N'02', N'02', N'ACOPIA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'08', N'02', N'03', N'ACOS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'08', N'02', N'04', N'MOSOC LLACTA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'08', N'02', N'05', N'POMACANCHI', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'08', N'02', N'06', N'RONDOCAN', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'08', N'02', N'07', N'SANGARARA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'08', N'03', N'00', N'ANTA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'08', N'03', N'01', N'ANTA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'08', N'03', N'02', N'ANCAHUASI', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'08', N'03', N'03', N'CACHIMAYO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'08', N'03', N'04', N'CHINCHAYPUJIO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'08', N'03', N'05', N'HUAROCONDO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'08', N'03', N'06', N'LIMATAMBO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'08', N'03', N'07', N'MOLLEPATA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'08', N'03', N'08', N'PUCYURA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'08', N'03', N'09', N'ZURITE', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'08', N'04', N'00', N'CALCA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'08', N'04', N'01', N'CALCA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'08', N'04', N'02', N'COYA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'08', N'04', N'03', N'LAMAY', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'08', N'04', N'04', N'LARES', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'08', N'04', N'05', N'PISAC', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'08', N'04', N'06', N'SAN SALVADOR', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'08', N'04', N'07', N'TARAY', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'08', N'04', N'08', N'YANATILE', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'08', N'05', N'00', N'CANAS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'08', N'05', N'01', N'YANAOCA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'08', N'05', N'02', N'CHECCA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'08', N'05', N'03', N'KUNTURKANKI', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'08', N'05', N'04', N'LANGUI', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'08', N'05', N'05', N'LAYO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'08', N'05', N'06', N'PAMPAMARCA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'08', N'05', N'07', N'QUEHUE', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'08', N'05', N'08', N'TUPAC AMARU', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'08', N'06', N'00', N'CANCHIS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'08', N'06', N'01', N'SICUANI', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'08', N'06', N'02', N'CHECACUPE', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'08', N'06', N'03', N'COMBAPATA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'08', N'06', N'04', N'MARANGANI', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'08', N'06', N'05', N'PITUMARCA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'08', N'06', N'06', N'SAN PABLO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'08', N'06', N'07', N'SAN PEDRO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'08', N'06', N'08', N'TINTA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'08', N'07', N'00', N'CHUMBIVILCAS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'08', N'07', N'01', N'SANTO TOMAS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'08', N'07', N'02', N'CAPACMARCA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'08', N'07', N'03', N'CHAMACA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'08', N'07', N'04', N'COLQUEMARCA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'08', N'07', N'05', N'LIVITACA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'08', N'07', N'06', N'LLUSCO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'08', N'07', N'07', N'QUIÑOTA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'08', N'07', N'08', N'VELILLE', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'08', N'08', N'00', N'ESPINAR', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'08', N'08', N'01', N'ESPINAR', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'08', N'08', N'02', N'CONDOROMA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'08', N'08', N'03', N'COPORAQUE', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'08', N'08', N'04', N'OCORURO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'08', N'08', N'05', N'PALLPATA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'08', N'08', N'06', N'PICHIGUA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'08', N'08', N'07', N'SUYCKUTAMBO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'08', N'08', N'08', N'ALTO PICHIGUA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'08', N'09', N'00', N'LA CONVENCION', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'08', N'09', N'01', N'SANTA ANA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'08', N'09', N'02', N'ECHARATE', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'08', N'09', N'03', N'HUAYOPATA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'08', N'09', N'04', N'MARANURA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'08', N'09', N'05', N'OCOBAMBA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'08', N'09', N'06', N'QUELLOUNO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'08', N'09', N'07', N'KIMBIRI', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'08', N'09', N'08', N'SANTA TERESA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'08', N'09', N'09', N'VILCABAMBA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'08', N'09', N'10', N'PICHARI', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'08', N'10', N'00', N'PARURO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'08', N'10', N'01', N'PARURO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'08', N'10', N'02', N'ACCHA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'08', N'10', N'03', N'CCAPI', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'08', N'10', N'04', N'COLCHA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'08', N'10', N'05', N'HUANOQUITE', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'08', N'10', N'06', N'OMACHA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'08', N'10', N'07', N'PACCARITAMBO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'08', N'10', N'08', N'PILLPINTO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'08', N'10', N'09', N'YAURISQUE', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'08', N'11', N'00', N'PAUCARTAMBO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'08', N'11', N'01', N'PAUCARTAMBO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'08', N'11', N'02', N'CAICAY', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'08', N'11', N'03', N'CHALLABAMBA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'08', N'11', N'04', N'COLQUEPATA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'08', N'11', N'05', N'HUANCARANI', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'08', N'11', N'06', N'KOSÑIPATA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'08', N'12', N'00', N'QUISPICANCHI', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'08', N'12', N'01', N'URCOS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'08', N'12', N'02', N'ANDAHUAYLILLAS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'08', N'12', N'03', N'CAMANTI', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'08', N'12', N'04', N'CCARHUAYO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'08', N'12', N'05', N'CCATCA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'08', N'12', N'06', N'CUSIPATA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'08', N'12', N'07', N'HUARO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'08', N'12', N'08', N'LUCRE', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'08', N'12', N'09', N'MARCAPATA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'08', N'12', N'10', N'OCONGATE', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'08', N'12', N'11', N'OROPESA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'08', N'12', N'12', N'QUIQUIJANA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'08', N'13', N'00', N'URUBAMBA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'08', N'13', N'01', N'URUBAMBA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'08', N'13', N'02', N'CHINCHERO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'08', N'13', N'03', N'HUAYLLABAMBA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'08', N'13', N'04', N'MACHUPICCHU', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'08', N'13', N'05', N'MARAS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'08', N'13', N'06', N'OLLANTAYTAMBO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'08', N'13', N'07', N'YUCAY', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'09', N'00', N'00', N'HUANCAVELICA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'09', N'01', N'00', N'HUANCAVELICA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'09', N'01', N'01', N'HUANCAVELICA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'09', N'01', N'02', N'ACOBAMBILLA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'09', N'01', N'03', N'ACORIA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'09', N'01', N'04', N'CONAYCA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'09', N'01', N'05', N'CUENCA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'09', N'01', N'06', N'HUACHOCOLPA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'09', N'01', N'07', N'HUAYLLAHUARA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'09', N'01', N'08', N'IZCUCHACA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'09', N'01', N'09', N'LARIA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'09', N'01', N'10', N'MANTA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'09', N'01', N'11', N'MARISCAL CACERES', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'09', N'01', N'12', N'MOYA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'09', N'01', N'13', N'NUEVO OCCORO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'09', N'01', N'14', N'PALCA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'09', N'01', N'15', N'PILCHACA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'09', N'01', N'16', N'VILCA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'09', N'01', N'17', N'YAULI', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'09', N'01', N'18', N'ASCENSION', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'09', N'01', N'19', N'HUANDO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'09', N'02', N'00', N'ACOBAMBA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'09', N'02', N'01', N'ACOBAMBA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'09', N'02', N'02', N'ANDABAMBA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'09', N'02', N'03', N'ANTA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'09', N'02', N'04', N'CAJA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'09', N'02', N'05', N'MARCAS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'09', N'02', N'06', N'PAUCARA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'09', N'02', N'07', N'POMACOCHA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'09', N'02', N'08', N'ROSARIO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'09', N'03', N'00', N'ANGARAES', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'09', N'03', N'01', N'LIRCAY', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'09', N'03', N'02', N'ANCHONGA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'09', N'03', N'03', N'CALLANMARCA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'09', N'03', N'04', N'CCOCHACCASA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'09', N'03', N'05', N'CHINCHO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'09', N'03', N'06', N'CONGALLA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'09', N'03', N'07', N'HUANCA-HUANCA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'09', N'03', N'08', N'HUAYLLAY GRANDE', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'09', N'03', N'09', N'JULCAMARCA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'09', N'03', N'10', N'SAN ANTONIO DE ANTAPARCO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'09', N'03', N'11', N'SANTO TOMAS DE PATA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'09', N'03', N'12', N'SECCLLA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'09', N'04', N'00', N'CASTROVIRREYNA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'09', N'04', N'01', N'CASTROVIRREYNA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'09', N'04', N'02', N'ARMA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'09', N'04', N'03', N'AURAHUA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'09', N'04', N'04', N'CAPILLAS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'09', N'04', N'05', N'CHUPAMARCA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'09', N'04', N'06', N'COCAS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'09', N'04', N'07', N'HUACHOS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'09', N'04', N'08', N'HUAMATAMBO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'09', N'04', N'09', N'MOLLEPAMPA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'09', N'04', N'10', N'SAN JUAN', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'09', N'04', N'11', N'SANTA ANA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'09', N'04', N'12', N'TANTARA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'09', N'04', N'13', N'TICRAPO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'09', N'05', N'00', N'CHURCAMPA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'09', N'05', N'01', N'CHURCAMPA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'09', N'05', N'02', N'ANCO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'09', N'05', N'03', N'CHINCHIHUASI', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'09', N'05', N'04', N'EL CARMEN', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'09', N'05', N'05', N'LA MERCED', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'09', N'05', N'06', N'LOCROJA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'09', N'05', N'07', N'PAUCARBAMBA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'09', N'05', N'08', N'SAN MIGUEL DE MAYOCC', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'09', N'05', N'09', N'SAN PEDRO DE CORIS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'09', N'05', N'10', N'PACHAMARCA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'09', N'05', N'11', N'COSME', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'09', N'06', N'00', N'HUAYTARA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'09', N'06', N'01', N'HUAYTARA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'09', N'06', N'02', N'AYAVI', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'09', N'06', N'03', N'CORDOVA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'09', N'06', N'04', N'HUAYACUNDO ARMA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'09', N'06', N'05', N'LARAMARCA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'09', N'06', N'06', N'OCOYO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'09', N'06', N'07', N'PILPICHACA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'09', N'06', N'08', N'QUERCO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'09', N'06', N'09', N'QUITO-ARMA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'09', N'06', N'10', N'SAN ANTONIO DE CUSICANCHA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'09', N'06', N'11', N'SAN FRANCISCO DE SANGAYAICO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'09', N'06', N'12', N'SAN ISIDRO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'09', N'06', N'13', N'SANTIAGO DE CHOCORVOS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'09', N'06', N'14', N'SANTIAGO DE QUIRAHUARA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'09', N'06', N'15', N'SANTO DOMINGO DE CAPILLAS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'09', N'06', N'16', N'TAMBO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'09', N'07', N'00', N'TAYACAJA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'09', N'07', N'01', N'PAMPAS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'09', N'07', N'02', N'ACOSTAMBO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'09', N'07', N'03', N'ACRAQUIA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'09', N'07', N'04', N'AHUAYCHA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'09', N'07', N'05', N'COLCABAMBA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'09', N'07', N'06', N'DANIEL HERNANDEZ', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'09', N'07', N'07', N'HUACHOCOLPA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'09', N'07', N'09', N'HUARIBAMBA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'09', N'07', N'10', N'ÑAHUIMPUQUIO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'09', N'07', N'11', N'PAZOS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'09', N'07', N'13', N'QUISHUAR', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'09', N'07', N'14', N'SALCABAMBA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'09', N'07', N'15', N'SALCAHUASI', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'09', N'07', N'16', N'SAN MARCOS DE ROCCHAC', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'09', N'07', N'17', N'SURCUBAMBA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'09', N'07', N'18', N'TINTAY PUNCU', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'10', N'00', N'00', N'HUANUCO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'10', N'01', N'00', N'HUANUCO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'10', N'01', N'01', N'HUANUCO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'10', N'01', N'02', N'AMARILIS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'10', N'01', N'03', N'CHINCHAO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'10', N'01', N'04', N'CHURUBAMBA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'10', N'01', N'05', N'MARGOS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'10', N'01', N'06', N'QUISQUI (KICHKI)', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'10', N'01', N'07', N'SAN FRANCISCO DE CAYRAN', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'10', N'01', N'08', N'SAN PEDRO DE CHAULAN', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'10', N'01', N'09', N'SANTA MARIA DEL VALLE', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'10', N'01', N'10', N'YARUMAYO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'10', N'01', N'11', N'PILLCO MARCA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'10', N'01', N'12', N'YACUS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'10', N'02', N'00', N'AMBO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'10', N'02', N'01', N'AMBO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'10', N'02', N'02', N'CAYNA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'10', N'02', N'03', N'COLPAS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'10', N'02', N'04', N'CONCHAMARCA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'10', N'02', N'05', N'HUACAR', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'10', N'02', N'06', N'SAN FRANCISCO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'10', N'02', N'07', N'SAN RAFAEL', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'10', N'02', N'08', N'TOMAY KICHWA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'10', N'03', N'00', N'DOS DE MAYO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'10', N'03', N'01', N'LA UNION', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'10', N'03', N'07', N'CHUQUIS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'10', N'03', N'11', N'MARIAS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'10', N'03', N'13', N'PACHAS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'10', N'03', N'16', N'QUIVILLA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'10', N'03', N'17', N'RIPAN', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'10', N'03', N'21', N'SHUNQUI', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'10', N'03', N'22', N'SILLAPATA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'10', N'03', N'23', N'YANAS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'10', N'04', N'00', N'HUACAYBAMBA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'10', N'04', N'01', N'HUACAYBAMBA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'10', N'04', N'02', N'CANCHABAMBA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'10', N'04', N'03', N'COCHABAMBA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'10', N'04', N'04', N'PINRA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'10', N'05', N'00', N'HUAMALIES', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'10', N'05', N'01', N'LLATA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'10', N'05', N'02', N'ARANCAY', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'10', N'05', N'03', N'CHAVIN DE PARIARCA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'10', N'05', N'04', N'JACAS GRANDE', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'10', N'05', N'05', N'JIRCAN', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'10', N'05', N'06', N'MIRAFLORES', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'10', N'05', N'07', N'MONZON', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'10', N'05', N'08', N'PUNCHAO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'10', N'05', N'09', N'PUÑOS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'10', N'05', N'10', N'SINGA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'10', N'05', N'11', N'TANTAMAYO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'10', N'06', N'00', N'LEONCIO PRADO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'10', N'06', N'01', N'RUPA-RUPA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'10', N'06', N'02', N'DANIEL ALOMIA ROBLES', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'10', N'06', N'03', N'HERMILIO VALDIZAN', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'10', N'06', N'04', N'JOSE CRESPO Y CASTILLO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'10', N'06', N'05', N'LUYANDO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'10', N'06', N'06', N'MARIANO DAMASO BERAUN', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'10', N'07', N'00', N'MARAÑON', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'10', N'07', N'01', N'HUACRACHUCO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'10', N'07', N'02', N'CHOLON', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'10', N'07', N'03', N'SAN BUENAVENTURA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'10', N'08', N'00', N'PACHITEA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'10', N'08', N'01', N'PANAO', CAST(76.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'10', N'08', N'02', N'CHAGLLA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'10', N'08', N'03', N'MOLINO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'10', N'08', N'04', N'UMARI', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'10', N'09', N'00', N'PUERTO INCA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'10', N'09', N'01', N'PUERTO INCA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'10', N'09', N'02', N'CODO DEL POZUZO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'10', N'09', N'03', N'HONORIA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'10', N'09', N'04', N'TOURNAVISTA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'10', N'09', N'05', N'YUYAPICHIS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'10', N'10', N'00', N'LAURICOCHA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'10', N'10', N'01', N'JESUS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'10', N'10', N'02', N'BAÑOS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'10', N'10', N'03', N'JIVIA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'10', N'10', N'04', N'QUEROPALCA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'10', N'10', N'05', N'RONDOS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'10', N'10', N'06', N'SAN FRANCISCO DE ASIS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'10', N'10', N'07', N'SAN MIGUEL DE CAURI', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'10', N'11', N'00', N'YAROWILCA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'10', N'11', N'01', N'CHAVINILLO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'10', N'11', N'02', N'CAHUAC', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'10', N'11', N'03', N'CHACABAMBA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'10', N'11', N'04', N'APARICIO POMARES', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'10', N'11', N'05', N'JACAS CHICO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'10', N'11', N'06', N'OBAS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'10', N'11', N'07', N'PAMPAMARCA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'10', N'11', N'08', N'CHORAS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'11', N'00', N'00', N'ICA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'11', N'01', N'00', N'ICA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'11', N'01', N'01', N'ICA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'11', N'01', N'02', N'LA TINGUIÑA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'11', N'01', N'03', N'LOS AQUIJES', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'11', N'01', N'04', N'OCUCAJE', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'11', N'01', N'05', N'PACHACUTEC', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'11', N'01', N'06', N'PARCONA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'11', N'01', N'07', N'PUEBLO NUEVO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'11', N'01', N'08', N'SALAS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'11', N'01', N'09', N'SAN JOSE DE LOS MOLINOS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'11', N'01', N'10', N'SAN JUAN BAUTISTA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'11', N'01', N'11', N'SANTIAGO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'11', N'01', N'12', N'SUBTANJALLA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'11', N'01', N'13', N'TATE', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'11', N'01', N'14', N'YAUCA DEL ROSARIO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'11', N'02', N'00', N'CHINCHA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'11', N'02', N'01', N'CHINCHA ALTA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'11', N'02', N'02', N'ALTO LARAN', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'11', N'02', N'03', N'CHAVIN', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'11', N'02', N'04', N'CHINCHA BAJA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'11', N'02', N'05', N'EL CARMEN', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'11', N'02', N'06', N'GROCIO PRADO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'11', N'02', N'07', N'PUEBLO NUEVO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'11', N'02', N'08', N'SAN JUAN DE YANAC', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'11', N'02', N'09', N'SAN PEDRO DE HUACARPANA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'11', N'02', N'10', N'SUNAMPE', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'11', N'02', N'11', N'TAMBO DE MORA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'11', N'03', N'00', N'NAZCA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'11', N'03', N'01', N'NAZCA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'11', N'03', N'02', N'CHANGUILLO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'11', N'03', N'03', N'EL INGENIO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'11', N'03', N'04', N'MARCONA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'11', N'03', N'05', N'VISTA ALEGRE', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'11', N'04', N'00', N'PALPA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'11', N'04', N'01', N'PALPA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'11', N'04', N'02', N'LLIPATA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'11', N'04', N'03', N'RIO GRANDE', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'11', N'04', N'04', N'SANTA CRUZ', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'11', N'04', N'05', N'TIBILLO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'11', N'05', N'00', N'PISCO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'11', N'05', N'01', N'PISCO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'11', N'05', N'02', N'HUANCANO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'11', N'05', N'03', N'HUMAY', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'11', N'05', N'04', N'INDEPENDENCIA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'11', N'05', N'05', N'PARACAS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'11', N'05', N'06', N'SAN ANDRES', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'11', N'05', N'07', N'SAN CLEMENTE', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'11', N'05', N'08', N'TUPAC AMARU INCA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'12', N'00', N'00', N'JUNIN', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'12', N'01', N'00', N'HUANCAYO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'12', N'01', N'01', N'HUANCAYO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'12', N'01', N'04', N'CARHUACALLANGA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'12', N'01', N'05', N'CHACAPAMPA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'12', N'01', N'06', N'CHICCHE', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'12', N'01', N'07', N'CHILCA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'12', N'01', N'08', N'CHONGOS ALTO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'12', N'01', N'11', N'CHUPURO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'12', N'01', N'12', N'COLCA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'12', N'01', N'13', N'CULLHUAS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'12', N'01', N'14', N'EL TAMBO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'12', N'01', N'16', N'HUACRAPUQUIO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'12', N'01', N'17', N'HUALHUAS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'12', N'01', N'19', N'HUANCAN', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'12', N'01', N'20', N'HUASICANCHA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'12', N'01', N'21', N'HUAYUCACHI', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'12', N'01', N'22', N'INGENIO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'12', N'01', N'24', N'PARIAHUANCA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'12', N'01', N'25', N'PILCOMAYO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'12', N'01', N'26', N'PUCARA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'12', N'01', N'27', N'QUICHUAY', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'12', N'01', N'28', N'QUILCAS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'12', N'01', N'29', N'SAN AGUSTIN', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'12', N'01', N'30', N'SAN JERONIMO DE TUNAN', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'12', N'01', N'32', N'SAÑO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'12', N'01', N'33', N'SAPALLANGA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'12', N'01', N'34', N'SICAYA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'12', N'01', N'35', N'SANTO DOMINGO DE ACOBAMBA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'12', N'01', N'36', N'VIQUES', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'12', N'02', N'00', N'CONCEPCION', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'12', N'02', N'01', N'CONCEPCION', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'12', N'02', N'02', N'ACO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'12', N'02', N'03', N'ANDAMARCA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'12', N'02', N'04', N'CHAMBARA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'12', N'02', N'05', N'COCHAS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'12', N'02', N'06', N'COMAS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'12', N'02', N'07', N'HEROINAS TOLEDO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'12', N'02', N'08', N'MANZANARES', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'12', N'02', N'09', N'MARISCAL CASTILLA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'12', N'02', N'10', N'MATAHUASI', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'12', N'02', N'11', N'MITO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'12', N'02', N'12', N'NUEVE DE JULIO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'12', N'02', N'13', N'ORCOTUNA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'12', N'02', N'14', N'SAN JOSE DE QUERO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'12', N'02', N'15', N'SANTA ROSA DE OCOPA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'12', N'03', N'00', N'CHANCHAMAYO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'12', N'03', N'01', N'CHANCHAMAYO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'12', N'03', N'02', N'PERENE', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'12', N'03', N'03', N'PICHANAQUI', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'12', N'03', N'04', N'SAN LUIS DE SHUARO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'12', N'03', N'05', N'SAN RAMON', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'12', N'03', N'06', N'VITOC', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'12', N'04', N'00', N'JAUJA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'12', N'04', N'01', N'JAUJA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'12', N'04', N'02', N'ACOLLA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'12', N'04', N'03', N'APATA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'12', N'04', N'04', N'ATAURA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'12', N'04', N'05', N'CANCHAYLLO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'12', N'04', N'06', N'CURICACA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'12', N'04', N'07', N'EL MANTARO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'12', N'04', N'08', N'HUAMALI', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'12', N'04', N'09', N'HUARIPAMPA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'12', N'04', N'10', N'HUERTAS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'12', N'04', N'11', N'JANJAILLO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'12', N'04', N'12', N'JULCAN', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'12', N'04', N'13', N'LEONOR ORDOÑEZ', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'12', N'04', N'14', N'LLOCLLAPAMPA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'12', N'04', N'15', N'MARCO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'12', N'04', N'16', N'MASMA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'12', N'04', N'17', N'MASMA CHICCHE', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'12', N'04', N'18', N'MOLINOS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'12', N'04', N'19', N'MONOBAMBA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'12', N'04', N'20', N'MUQUI', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'12', N'04', N'21', N'MUQUIYAUYO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'12', N'04', N'22', N'PACA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'12', N'04', N'23', N'PACCHA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'12', N'04', N'24', N'PANCAN', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'12', N'04', N'25', N'PARCO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'12', N'04', N'26', N'POMACANCHA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'12', N'04', N'27', N'RICRAN', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'12', N'04', N'28', N'SAN LORENZO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'12', N'04', N'29', N'SAN PEDRO DE CHUNAN', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'12', N'04', N'30', N'SAUSA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'12', N'04', N'31', N'SINCOS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'12', N'04', N'32', N'TUNAN MARCA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'12', N'04', N'33', N'YAULI', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'12', N'04', N'34', N'YAUYOS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'12', N'05', N'00', N'JUNIN', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'12', N'05', N'01', N'JUNIN', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'12', N'05', N'02', N'CARHUAMAYO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'12', N'05', N'03', N'ONDORES', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'12', N'05', N'04', N'ULCUMAYO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'12', N'06', N'00', N'SATIPO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'12', N'06', N'01', N'SATIPO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'12', N'06', N'02', N'COVIRIALI', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'12', N'06', N'03', N'LLAYLLA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'12', N'06', N'05', N'PAMPA HERMOSA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'12', N'06', N'07', N'RIO NEGRO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'12', N'06', N'08', N'RIO TAMBO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'12', N'06', N'99', N'MAZAMARI - PANGOA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'12', N'07', N'00', N'TARMA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'12', N'07', N'01', N'TARMA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'12', N'07', N'02', N'ACOBAMBA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'12', N'07', N'03', N'HUARICOLCA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'12', N'07', N'04', N'HUASAHUASI', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'12', N'07', N'05', N'LA UNION', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'12', N'07', N'06', N'PALCA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'12', N'07', N'07', N'PALCAMAYO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'12', N'07', N'08', N'SAN PEDRO DE CAJAS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'12', N'07', N'09', N'TAPO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'12', N'08', N'00', N'YAULI', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'12', N'08', N'01', N'LA OROYA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'12', N'08', N'02', N'CHACAPALPA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'12', N'08', N'03', N'HUAY-HUAY', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'12', N'08', N'04', N'MARCAPOMACOCHA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'12', N'08', N'05', N'MOROCOCHA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'12', N'08', N'06', N'PACCHA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'12', N'08', N'07', N'SANTA BARBARA DE CARHUACAYAN', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'12', N'08', N'08', N'SANTA ROSA DE SACCO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'12', N'08', N'09', N'SUITUCANCHA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'12', N'08', N'10', N'YAULI', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'12', N'09', N'00', N'CHUPACA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'12', N'09', N'01', N'CHUPACA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'12', N'09', N'02', N'AHUAC', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'12', N'09', N'03', N'CHONGOS BAJO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'12', N'09', N'04', N'HUACHAC', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'12', N'09', N'05', N'HUAMANCACA CHICO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'12', N'09', N'06', N'SAN JUAN DE ISCOS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'12', N'09', N'07', N'SAN JUAN DE JARPA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'12', N'09', N'08', N'TRES DE DICIEMBRE', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'12', N'09', N'09', N'YANACANCHA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'13', N'00', N'00', N'LA LIBERTAD', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'13', N'01', N'00', N'TRUJILLO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'13', N'01', N'01', N'TRUJILLO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'13', N'01', N'02', N'EL PORVENIR', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'13', N'01', N'03', N'FLORENCIA DE MORA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'13', N'01', N'04', N'HUANCHACO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'13', N'01', N'05', N'LA ESPERANZA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'13', N'01', N'06', N'LAREDO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'13', N'01', N'07', N'MOCHE', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'13', N'01', N'08', N'POROTO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'13', N'01', N'09', N'SALAVERRY', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'13', N'01', N'10', N'SIMBAL', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'13', N'01', N'11', N'VICTOR LARCO HERRERA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'13', N'02', N'00', N'ASCOPE', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'13', N'02', N'01', N'ASCOPE', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'13', N'02', N'02', N'CHICAMA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'13', N'02', N'03', N'CHOCOPE', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'13', N'02', N'04', N'MAGDALENA DE CAO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'13', N'02', N'05', N'PAIJAN', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'13', N'02', N'06', N'RAZURI', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'13', N'02', N'07', N'SANTIAGO DE CAO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'13', N'02', N'08', N'CASA GRANDE', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'13', N'03', N'00', N'BOLIVAR', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'13', N'03', N'01', N'BOLIVAR', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'13', N'03', N'02', N'BAMBAMARCA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'13', N'03', N'03', N'CONDORMARCA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'13', N'03', N'04', N'LONGOTEA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'13', N'03', N'05', N'UCHUMARCA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'13', N'03', N'06', N'UCUNCHA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'13', N'04', N'00', N'CHEPEN', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'13', N'04', N'01', N'CHEPEN', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'13', N'04', N'02', N'PACANGA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'13', N'04', N'03', N'PUEBLO NUEVO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'13', N'05', N'00', N'JULCAN', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'13', N'05', N'01', N'JULCAN', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'13', N'05', N'02', N'CALAMARCA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'13', N'05', N'03', N'CARABAMBA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'13', N'05', N'04', N'HUASO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'13', N'06', N'00', N'OTUZCO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'13', N'06', N'01', N'OTUZCO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'13', N'06', N'02', N'AGALLPAMPA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'13', N'06', N'04', N'CHARAT', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'13', N'06', N'05', N'HUARANCHAL', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'13', N'06', N'06', N'LA CUESTA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'13', N'06', N'08', N'MACHE', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'13', N'06', N'10', N'PARANDAY', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'13', N'06', N'11', N'SALPO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'13', N'06', N'13', N'SINSICAP', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'13', N'06', N'14', N'USQUIL', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'13', N'07', N'00', N'PACASMAYO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'13', N'07', N'01', N'SAN PEDRO DE LLOC', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'13', N'07', N'02', N'GUADALUPE', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'13', N'07', N'03', N'JEQUETEPEQUE', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'13', N'07', N'04', N'PACASMAYO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'13', N'07', N'05', N'SAN JOSE', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'13', N'08', N'00', N'PATAZ', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'13', N'08', N'01', N'TAYABAMBA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'13', N'08', N'02', N'BULDIBUYO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'13', N'08', N'03', N'CHILLIA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'13', N'08', N'04', N'HUANCASPATA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'13', N'08', N'05', N'HUAYLILLAS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'13', N'08', N'06', N'HUAYO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'13', N'08', N'07', N'ONGON', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'13', N'08', N'08', N'PARCOY', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'13', N'08', N'09', N'PATAZ', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'13', N'08', N'10', N'PIAS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'13', N'08', N'11', N'SANTIAGO DE CHALLAS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'13', N'08', N'12', N'TAURIJA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'13', N'08', N'13', N'URPAY', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'13', N'09', N'00', N'SANCHEZ CARRION', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'13', N'09', N'01', N'HUAMACHUCO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'13', N'09', N'02', N'CHUGAY', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'13', N'09', N'03', N'COCHORCO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'13', N'09', N'04', N'CURGOS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'13', N'09', N'05', N'MARCABAL', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'13', N'09', N'06', N'SANAGORAN', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'13', N'09', N'07', N'SARIN', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'13', N'09', N'08', N'SARTIMBAMBA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'13', N'10', N'00', N'SANTIAGO DE CHUCO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'13', N'10', N'01', N'SANTIAGO DE CHUCO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'13', N'10', N'02', N'ANGASMARCA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'13', N'10', N'03', N'CACHICADAN', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'13', N'10', N'04', N'MOLLEBAMBA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'13', N'10', N'05', N'MOLLEPATA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'13', N'10', N'06', N'QUIRUVILCA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'13', N'10', N'07', N'SANTA CRUZ DE CHUCA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'13', N'10', N'08', N'SITABAMBA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'13', N'11', N'00', N'GRAN CHIMU', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'13', N'11', N'01', N'CASCAS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'13', N'11', N'02', N'LUCMA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'13', N'11', N'03', N'MARMOT', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'13', N'11', N'04', N'SAYAPULLO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'13', N'12', N'00', N'VIRU', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'13', N'12', N'01', N'VIRU', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'13', N'12', N'02', N'CHAO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'13', N'12', N'03', N'GUADALUPITO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'14', N'00', N'00', N'LAMBAYEQUE', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'14', N'01', N'00', N'CHICLAYO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'14', N'01', N'01', N'CHICLAYO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'14', N'01', N'02', N'CHONGOYAPE', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'14', N'01', N'03', N'ETEN', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'14', N'01', N'04', N'ETEN PUERTO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'14', N'01', N'05', N'JOSE LEONARDO ORTIZ', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'14', N'01', N'06', N'LA VICTORIA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'14', N'01', N'07', N'LAGUNAS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'14', N'01', N'08', N'MONSEFU', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'14', N'01', N'09', N'NUEVA ARICA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'14', N'01', N'10', N'OYOTUN', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'14', N'01', N'11', N'PICSI', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'14', N'01', N'12', N'PIMENTEL', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'14', N'01', N'13', N'REQUE', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'14', N'01', N'14', N'SANTA ROSA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'14', N'01', N'15', N'SAÑA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'14', N'01', N'16', N'CAYALTI', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'14', N'01', N'17', N'PATAPO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'14', N'01', N'18', N'POMALCA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'14', N'01', N'19', N'PUCALA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'14', N'01', N'20', N'TUMAN', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'14', N'02', N'00', N'FERREÑAFE', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'14', N'02', N'01', N'FERREÑAFE', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'14', N'02', N'02', N'CAÑARIS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'14', N'02', N'03', N'INCAHUASI', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'14', N'02', N'04', N'MANUEL ANTONIO MESONES MURO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'14', N'02', N'05', N'PITIPO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'14', N'02', N'06', N'PUEBLO NUEVO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'14', N'03', N'00', N'LAMBAYEQUE', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'14', N'03', N'01', N'LAMBAYEQUE', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'14', N'03', N'02', N'CHOCHOPE', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'14', N'03', N'03', N'ILLIMO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'14', N'03', N'04', N'JAYANCA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'14', N'03', N'05', N'MOCHUMI', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'14', N'03', N'06', N'MORROPE', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'14', N'03', N'07', N'MOTUPE', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'14', N'03', N'08', N'OLMOS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'14', N'03', N'09', N'PACORA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'14', N'03', N'10', N'SALAS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'14', N'03', N'11', N'SAN JOSE', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'14', N'03', N'12', N'TUCUME', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'00', N'00', N'LIMA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'01', N'00', N'LIMA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'01', N'01', N'LIMA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'01', N'02', N'ANCON', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'01', N'03', N'ATE', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'01', N'04', N'BARRANCO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'01', N'05', N'BREÑA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'01', N'06', N'CARABAYLLO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'01', N'07', N'CHACLACAYO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'01', N'08', N'CHORRILLOS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'01', N'09', N'CIENEGUILLA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'01', N'10', N'COMAS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'01', N'11', N'EL AGUSTINO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'01', N'12', N'INDEPENDENCIA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'01', N'13', N'JESUS MARIA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'01', N'14', N'LA MOLINA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'01', N'15', N'LA VICTORIA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'01', N'16', N'LINCE', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'01', N'17', N'LOS OLIVOS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'01', N'18', N'LURIGANCHO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'01', N'19', N'LURIN', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'01', N'20', N'MAGDALENA DEL MAR', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'01', N'21', N'PUEBLO LIBRE', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'01', N'22', N'MIRAFLORES', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'01', N'23', N'PACHACAMAC', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'01', N'24', N'PUCUSANA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'01', N'25', N'PUENTE PIEDRA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'01', N'26', N'PUNTA HERMOSA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'01', N'27', N'PUNTA NEGRA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'01', N'28', N'RIMAC', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'01', N'29', N'SAN BARTOLO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'01', N'30', N'SAN BORJA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'01', N'31', N'SAN ISIDRO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'01', N'32', N'SAN JUAN DE LURIGANCHO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'01', N'33', N'SAN JUAN DE MIRAFLORES', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'01', N'34', N'SAN LUIS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'01', N'35', N'SAN MARTIN DE PORRES', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'01', N'36', N'SAN MIGUEL', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'01', N'37', N'SANTA ANITA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'01', N'38', N'SANTA MARIA DEL MAR', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'01', N'39', N'SANTA ROSA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'01', N'40', N'SANTIAGO DE SURCO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'01', N'41', N'SURQUILLO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'01', N'42', N'VILLA EL SALVADOR', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'01', N'43', N'VILLA MARIA DEL TRIUNFO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'02', N'00', N'BARRANCA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'02', N'01', N'BARRANCA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'02', N'02', N'PARAMONGA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'02', N'03', N'PATIVILCA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'02', N'04', N'SUPE', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'02', N'05', N'SUPE PUERTO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'03', N'00', N'CAJATAMBO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'03', N'01', N'CAJATAMBO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'03', N'02', N'COPA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'03', N'03', N'GORGOR', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'03', N'04', N'HUANCAPON', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'03', N'05', N'MANAS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'04', N'00', N'CANTA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'04', N'01', N'CANTA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'04', N'02', N'ARAHUAY', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'04', N'03', N'HUAMANTANGA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'04', N'04', N'HUAROS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'04', N'05', N'LACHAQUI', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'04', N'06', N'SAN BUENAVENTURA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'04', N'07', N'SANTA ROSA DE QUIVES', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'05', N'00', N'CAÑETE', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'05', N'01', N'SAN VICENTE DE CAÑETE', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'05', N'02', N'ASIA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'05', N'03', N'CALANGO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'05', N'04', N'CERRO AZUL', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'05', N'05', N'CHILCA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'05', N'06', N'COAYLLO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'05', N'07', N'IMPERIAL', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'05', N'08', N'LUNAHUANA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'05', N'09', N'MALA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'05', N'10', N'NUEVO IMPERIAL', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'05', N'11', N'PACARAN', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'05', N'12', N'QUILMANA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'05', N'13', N'SAN ANTONIO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'05', N'14', N'SAN LUIS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'05', N'15', N'SANTA CRUZ DE FLORES', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'05', N'16', N'ZUÑIGA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'06', N'00', N'HUARAL', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'06', N'01', N'HUARAL', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'06', N'02', N'ATAVILLOS ALTO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'06', N'03', N'ATAVILLOS BAJO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'06', N'04', N'AUCALLAMA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'06', N'05', N'CHANCAY', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'06', N'06', N'IHUARI', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'06', N'07', N'LAMPIAN', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'06', N'08', N'PACARAOS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'06', N'09', N'SAN MIGUEL DE ACOS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'06', N'10', N'SANTA CRUZ DE ANDAMARCA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'06', N'11', N'SUMBILCA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'06', N'12', N'VEINTISIETE DE NOVIEMBRE', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'07', N'00', N'HUAROCHIRI', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'07', N'01', N'MATUCANA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'07', N'02', N'ANTIOQUIA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'07', N'03', N'CALLAHUANCA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'07', N'04', N'CARAMPOMA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'07', N'05', N'CHICLA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'07', N'06', N'CUENCA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'07', N'07', N'HUACHUPAMPA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'07', N'08', N'HUANZA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'07', N'09', N'HUAROCHIRI', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'07', N'10', N'LAHUAYTAMBO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'07', N'11', N'LANGA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'07', N'12', N'LARAOS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'07', N'13', N'MARIATANA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'07', N'14', N'RICARDO PALMA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'07', N'15', N'SAN ANDRES DE TUPICOCHA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'07', N'16', N'SAN ANTONIO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'07', N'17', N'SAN BARTOLOME', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'07', N'18', N'SAN DAMIAN', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'07', N'19', N'SAN JUAN DE IRIS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'07', N'20', N'SAN JUAN DE TANTARANCHE', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'07', N'21', N'SAN LORENZO DE QUINTI', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'07', N'22', N'SAN MATEO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'07', N'23', N'SAN MATEO DE OTAO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'07', N'24', N'SAN PEDRO DE CASTA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'07', N'25', N'SAN PEDRO DE HUANCAYRE', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'07', N'26', N'SANGALLAYA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'07', N'27', N'SANTA CRUZ DE COCACHACRA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'07', N'28', N'SANTA EULALIA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'07', N'29', N'SANTIAGO DE ANCHUCAYA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'07', N'30', N'SANTIAGO DE TUNA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'07', N'31', N'SANTO DOMINGO DE LOS OLLEROS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'07', N'32', N'SURCO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'08', N'00', N'HUAURA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'08', N'01', N'HUACHO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'08', N'02', N'AMBAR', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'08', N'03', N'CALETA DE CARQUIN', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'08', N'04', N'CHECRAS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'08', N'05', N'HUALMAY', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'08', N'06', N'HUAURA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'08', N'07', N'LEONCIO PRADO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'08', N'08', N'PACCHO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'08', N'09', N'SANTA LEONOR', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'08', N'10', N'SANTA MARIA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'08', N'11', N'SAYAN', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'08', N'12', N'VEGUETA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'09', N'00', N'OYON', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'09', N'01', N'OYON', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'09', N'02', N'ANDAJES', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'09', N'03', N'CAUJUL', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'09', N'04', N'COCHAMARCA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'09', N'05', N'NAVAN', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'09', N'06', N'PACHANGARA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'10', N'00', N'YAUYOS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'10', N'01', N'YAUYOS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'10', N'02', N'ALIS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'10', N'03', N'ALLAUCA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'10', N'04', N'AYAVIRI', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'10', N'05', N'AZANGARO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'10', N'06', N'CACRA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'10', N'07', N'CARANIA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'10', N'08', N'CATAHUASI', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'10', N'09', N'CHOCOS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'10', N'10', N'COCHAS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'10', N'11', N'COLONIA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'10', N'12', N'HONGOS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'10', N'13', N'HUAMPARA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'10', N'14', N'HUANCAYA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'10', N'15', N'HUANGASCAR', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'10', N'16', N'HUANTAN', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'10', N'17', N'HUAÑEC', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'10', N'18', N'LARAOS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'10', N'19', N'LINCHA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'10', N'20', N'MADEAN', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'10', N'21', N'MIRAFLORES', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'10', N'22', N'OMAS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'10', N'23', N'PUTINZA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'10', N'24', N'QUINCHES', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'10', N'25', N'QUINOCAY', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'10', N'26', N'SAN JOAQUIN', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'10', N'27', N'SAN PEDRO DE PILAS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'10', N'28', N'TANTA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'10', N'29', N'TAURIPAMPA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'10', N'30', N'TOMAS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'10', N'31', N'TUPE', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'10', N'32', N'VIÑAC', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'15', N'10', N'33', N'VITIS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'16', N'00', N'00', N'LORETO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'16', N'01', N'00', N'MAYNAS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'16', N'01', N'01', N'IQUITOS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'16', N'01', N'02', N'ALTO NANAY', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'16', N'01', N'03', N'FERNANDO LORES', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'16', N'01', N'04', N'INDIANA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'16', N'01', N'05', N'LAS AMAZONAS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'16', N'01', N'06', N'MAZAN', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'16', N'01', N'07', N'NAPO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'16', N'01', N'08', N'PUNCHANA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'16', N'01', N'09', N'PUTUMAYO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'16', N'01', N'10', N'TORRES CAUSANA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'16', N'01', N'12', N'BELEN', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'16', N'01', N'13', N'SAN JUAN BAUTISTA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'16', N'01', N'14', N'TENIENTE MANUEL CLAVERO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'16', N'02', N'00', N'ALTO AMAZONAS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'16', N'02', N'01', N'YURIMAGUAS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'16', N'02', N'02', N'BALSAPUERTO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'16', N'02', N'05', N'JEBEROS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'16', N'02', N'06', N'LAGUNAS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'16', N'02', N'10', N'SANTA CRUZ', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'16', N'02', N'11', N'TENIENTE CESAR LOPEZ ROJAS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'16', N'03', N'00', N'LORETO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'16', N'03', N'01', N'NAUTA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'16', N'03', N'02', N'PARINARI', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'16', N'03', N'03', N'TIGRE', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'16', N'03', N'04', N'TROMPETEROS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'16', N'03', N'05', N'URARINAS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'16', N'04', N'00', N'MARISCAL RAMON CASTILLA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'16', N'04', N'01', N'RAMON CASTILLA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'16', N'04', N'02', N'PEBAS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'16', N'04', N'03', N'YAVARI', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'16', N'04', N'04', N'SAN PABLO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'16', N'05', N'00', N'REQUENA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'16', N'05', N'01', N'REQUENA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'16', N'05', N'02', N'ALTO TAPICHE', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'16', N'05', N'03', N'CAPELO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'16', N'05', N'04', N'EMILIO SAN MARTIN', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'16', N'05', N'05', N'MAQUIA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'16', N'05', N'06', N'PUINAHUA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'16', N'05', N'07', N'SAQUENA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'16', N'05', N'08', N'SOPLIN', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'16', N'05', N'09', N'TAPICHE', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'16', N'05', N'10', N'JENARO HERRERA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'16', N'05', N'11', N'YAQUERANA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'16', N'06', N'00', N'UCAYALI', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'16', N'06', N'01', N'CONTAMANA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'16', N'06', N'02', N'INAHUAYA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'16', N'06', N'03', N'PADRE MARQUEZ', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'16', N'06', N'04', N'PAMPA HERMOSA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'16', N'06', N'05', N'SARAYACU', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'16', N'06', N'06', N'VARGAS GUERRA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'16', N'07', N'00', N'DATEM DEL MARAÑON', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'16', N'07', N'01', N'BARRANCA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'16', N'07', N'02', N'CAHUAPANAS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'16', N'07', N'03', N'MANSERICHE', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'16', N'07', N'04', N'MORONA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'16', N'07', N'05', N'PASTAZA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'16', N'07', N'06', N'ANDOAS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'17', N'00', N'00', N'MADRE DE DIOS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'17', N'01', N'00', N'TAMBOPATA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'17', N'01', N'01', N'TAMBOPATA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'17', N'01', N'02', N'INAMBARI', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'17', N'01', N'03', N'LAS PIEDRAS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'17', N'01', N'04', N'LABERINTO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'17', N'02', N'00', N'MANU', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'17', N'02', N'01', N'MANU', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'17', N'02', N'02', N'FITZCARRALD', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'17', N'02', N'03', N'MADRE DE DIOS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'17', N'02', N'04', N'HUEPETUHE', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'17', N'03', N'00', N'TAHUAMANU', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'17', N'03', N'01', N'IÑAPARI', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'17', N'03', N'02', N'IBERIA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'17', N'03', N'03', N'TAHUAMANU', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'18', N'00', N'00', N'MOQUEGUA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'18', N'01', N'00', N'MARISCAL NIETO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'18', N'01', N'01', N'MOQUEGUA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'18', N'01', N'02', N'CARUMAS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'18', N'01', N'03', N'CUCHUMBAYA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'18', N'01', N'04', N'SAMEGUA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'18', N'01', N'05', N'SAN CRISTOBAL', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'18', N'01', N'06', N'TORATA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'18', N'02', N'00', N'GENERAL SANCHEZ CERRO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'18', N'02', N'01', N'OMATE', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'18', N'02', N'02', N'CHOJATA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'18', N'02', N'03', N'COALAQUE', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'18', N'02', N'04', N'ICHUÑA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'18', N'02', N'05', N'LA CAPILLA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'18', N'02', N'06', N'LLOQUE', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'18', N'02', N'07', N'MATALAQUE', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'18', N'02', N'08', N'PUQUINA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'18', N'02', N'09', N'QUINISTAQUILLAS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'18', N'02', N'10', N'UBINAS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'18', N'02', N'11', N'YUNGA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'18', N'03', N'00', N'ILO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'18', N'03', N'01', N'ILO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'18', N'03', N'02', N'EL ALGARROBAL', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'18', N'03', N'03', N'PACOCHA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'19', N'00', N'00', N'PASCO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'19', N'01', N'00', N'PASCO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'19', N'01', N'01', N'CHAUPIMARCA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'19', N'01', N'02', N'HUACHON', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'19', N'01', N'03', N'HUARIACA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'19', N'01', N'04', N'HUAYLLAY', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'19', N'01', N'05', N'NINACACA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'19', N'01', N'06', N'PALLANCHACRA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'19', N'01', N'07', N'PAUCARTAMBO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'19', N'01', N'08', N'SAN FRANCISCO DE ASIS DE YARUSYACAN', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'19', N'01', N'09', N'SIMON BOLIVAR', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'19', N'01', N'10', N'TICLACAYAN', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'19', N'01', N'11', N'TINYAHUARCO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'19', N'01', N'12', N'VICCO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'19', N'01', N'13', N'YANACANCHA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'19', N'02', N'00', N'DANIEL ALCIDES CARRION', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'19', N'02', N'01', N'YANAHUANCA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'19', N'02', N'02', N'CHACAYAN', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'19', N'02', N'03', N'GOYLLARISQUIZGA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'19', N'02', N'04', N'PAUCAR', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'19', N'02', N'05', N'SAN PEDRO DE PILLAO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'19', N'02', N'06', N'SANTA ANA DE TUSI', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'19', N'02', N'07', N'TAPUC', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'19', N'02', N'08', N'VILCABAMBA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'19', N'03', N'00', N'OXAPAMPA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'19', N'03', N'01', N'OXAPAMPA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'19', N'03', N'02', N'CHONTABAMBA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'19', N'03', N'03', N'HUANCABAMBA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'19', N'03', N'04', N'PALCAZU', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'19', N'03', N'05', N'POZUZO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'19', N'03', N'06', N'PUERTO BERMUDEZ', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'19', N'03', N'07', N'VILLA RICA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'19', N'03', N'08', N'CONSTITUCION', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'20', N'00', N'00', N'PIURA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'20', N'01', N'00', N'PIURA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'20', N'01', N'01', N'PIURA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'20', N'01', N'04', N'CASTILLA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'20', N'01', N'05', N'CATACAOS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'20', N'01', N'07', N'CURA MORI', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'20', N'01', N'08', N'EL TALLAN', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'20', N'01', N'09', N'LA ARENA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'20', N'01', N'10', N'LA UNION', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'20', N'01', N'11', N'LAS LOMAS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'20', N'01', N'14', N'TAMBO GRANDE', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'20', N'02', N'00', N'AYABACA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'20', N'02', N'01', N'AYABACA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'20', N'02', N'02', N'FRIAS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'20', N'02', N'03', N'JILILI', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'20', N'02', N'04', N'LAGUNAS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'20', N'02', N'05', N'MONTERO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'20', N'02', N'06', N'PACAIPAMPA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'20', N'02', N'07', N'PAIMAS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'20', N'02', N'08', N'SAPILLICA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'20', N'02', N'09', N'SICCHEZ', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'20', N'02', N'10', N'SUYO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'20', N'03', N'00', N'HUANCABAMBA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'20', N'03', N'01', N'HUANCABAMBA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'20', N'03', N'02', N'CANCHAQUE', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'20', N'03', N'03', N'EL CARMEN DE LA FRONTERA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'20', N'03', N'04', N'HUARMACA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'20', N'03', N'05', N'LALAQUIZ', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'20', N'03', N'06', N'SAN MIGUEL DE EL FAIQUE', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'20', N'03', N'07', N'SONDOR', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'20', N'03', N'08', N'SONDORILLO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'20', N'04', N'00', N'MORROPON', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'20', N'04', N'01', N'CHULUCANAS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'20', N'04', N'02', N'BUENOS AIRES', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'20', N'04', N'03', N'CHALACO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'20', N'04', N'04', N'LA MATANZA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'20', N'04', N'05', N'MORROPON', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'20', N'04', N'06', N'SALITRAL', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'20', N'04', N'07', N'SAN JUAN DE BIGOTE', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'20', N'04', N'08', N'SANTA CATALINA DE MOSSA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'20', N'04', N'09', N'SANTO DOMINGO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'20', N'04', N'10', N'YAMANGO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'20', N'05', N'00', N'PAITA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'20', N'05', N'01', N'PAITA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'20', N'05', N'02', N'AMOTAPE', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'20', N'05', N'03', N'ARENAL', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'20', N'05', N'04', N'COLAN', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'20', N'05', N'05', N'LA HUACA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'20', N'05', N'06', N'TAMARINDO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'20', N'05', N'07', N'VICHAYAL', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'20', N'06', N'00', N'SULLANA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'20', N'06', N'01', N'SULLANA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'20', N'06', N'02', N'BELLAVISTA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'20', N'06', N'03', N'IGNACIO ESCUDERO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'20', N'06', N'04', N'LANCONES', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'20', N'06', N'05', N'MARCAVELICA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'20', N'06', N'06', N'MIGUEL CHECA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'20', N'06', N'07', N'QUERECOTILLO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'20', N'06', N'08', N'SALITRAL', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'20', N'07', N'00', N'TALARA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'20', N'07', N'01', N'PARIÑAS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'20', N'07', N'02', N'EL ALTO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'20', N'07', N'03', N'LA BREA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'20', N'07', N'04', N'LOBITOS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'20', N'07', N'05', N'LOS ORGANOS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'20', N'07', N'06', N'MANCORA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'20', N'08', N'00', N'SECHURA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'20', N'08', N'01', N'SECHURA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'20', N'08', N'02', N'BELLAVISTA DE LA UNION', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'20', N'08', N'03', N'BERNAL', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'20', N'08', N'04', N'CRISTO NOS VALGA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'20', N'08', N'05', N'VICE', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'20', N'08', N'06', N'RINCONADA LLICUAR', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'21', N'00', N'00', N'PUNO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'21', N'01', N'00', N'PUNO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'21', N'01', N'01', N'PUNO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'21', N'01', N'02', N'ACORA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'21', N'01', N'03', N'AMANTANI', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'21', N'01', N'04', N'ATUNCOLLA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'21', N'01', N'05', N'CAPACHICA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'21', N'01', N'06', N'CHUCUITO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'21', N'01', N'07', N'COATA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'21', N'01', N'08', N'HUATA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'21', N'01', N'09', N'MAÑAZO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'21', N'01', N'10', N'PAUCARCOLLA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'21', N'01', N'11', N'PICHACANI', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'21', N'01', N'12', N'PLATERIA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'21', N'01', N'13', N'SAN ANTONIO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'21', N'01', N'14', N'TIQUILLACA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'21', N'01', N'15', N'VILQUE', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'21', N'02', N'00', N'AZANGARO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'21', N'02', N'01', N'AZANGARO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'21', N'02', N'02', N'ACHAYA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'21', N'02', N'03', N'ARAPA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'21', N'02', N'04', N'ASILLO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'21', N'02', N'05', N'CAMINACA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'21', N'02', N'06', N'CHUPA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'21', N'02', N'07', N'JOSE DOMINGO CHOQUEHUANCA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'21', N'02', N'08', N'MUÑANI', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'21', N'02', N'09', N'POTONI', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'21', N'02', N'10', N'SAMAN', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'21', N'02', N'11', N'SAN ANTON', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'21', N'02', N'12', N'SAN JOSE', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'21', N'02', N'13', N'SAN JUAN DE SALINAS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'21', N'02', N'14', N'SANTIAGO DE PUPUJA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'21', N'02', N'15', N'TIRAPATA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'21', N'03', N'00', N'CARABAYA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'21', N'03', N'01', N'MACUSANI', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'21', N'03', N'02', N'AJOYANI', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'21', N'03', N'03', N'AYAPATA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'21', N'03', N'04', N'COASA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'21', N'03', N'05', N'CORANI', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'21', N'03', N'06', N'CRUCERO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'21', N'03', N'07', N'ITUATA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'21', N'03', N'08', N'OLLACHEA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'21', N'03', N'09', N'SAN GABAN', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'21', N'03', N'10', N'USICAYOS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'21', N'04', N'00', N'CHUCUITO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'21', N'04', N'01', N'JULI', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'21', N'04', N'02', N'DESAGUADERO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'21', N'04', N'03', N'HUACULLANI', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'21', N'04', N'04', N'KELLUYO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'21', N'04', N'05', N'PISACOMA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'21', N'04', N'06', N'POMATA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'21', N'04', N'07', N'ZEPITA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'21', N'05', N'00', N'EL COLLAO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'21', N'05', N'01', N'ILAVE', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'21', N'05', N'02', N'CAPAZO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'21', N'05', N'03', N'PILCUYO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'21', N'05', N'04', N'SANTA ROSA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'21', N'05', N'05', N'CONDURIRI', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'21', N'06', N'00', N'HUANCANE', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'21', N'06', N'01', N'HUANCANE', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'21', N'06', N'02', N'COJATA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'21', N'06', N'03', N'HUATASANI', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'21', N'06', N'04', N'INCHUPALLA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'21', N'06', N'05', N'PUSI', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'21', N'06', N'06', N'ROSASPATA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'21', N'06', N'07', N'TARACO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'21', N'06', N'08', N'VILQUE CHICO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'21', N'07', N'00', N'LAMPA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'21', N'07', N'01', N'LAMPA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'21', N'07', N'02', N'CABANILLA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'21', N'07', N'03', N'CALAPUJA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'21', N'07', N'04', N'NICASIO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'21', N'07', N'05', N'OCUVIRI', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'21', N'07', N'06', N'PALCA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'21', N'07', N'07', N'PARATIA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'21', N'07', N'08', N'PUCARA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'21', N'07', N'09', N'SANTA LUCIA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'21', N'07', N'10', N'VILAVILA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'21', N'08', N'00', N'MELGAR', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'21', N'08', N'01', N'AYAVIRI', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'21', N'08', N'02', N'ANTAUTA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'21', N'08', N'03', N'CUPI', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'21', N'08', N'04', N'LLALLI', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'21', N'08', N'05', N'MACARI', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'21', N'08', N'06', N'NUÑOA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'21', N'08', N'07', N'ORURILLO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'21', N'08', N'08', N'SANTA ROSA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'21', N'08', N'09', N'UMACHIRI', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'21', N'09', N'00', N'MOHO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'21', N'09', N'01', N'MOHO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'21', N'09', N'02', N'CONIMA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'21', N'09', N'03', N'HUAYRAPATA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'21', N'09', N'04', N'TILALI', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'21', N'10', N'00', N'SAN ANTONIO DE PUTINA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'21', N'10', N'01', N'PUTINA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'21', N'10', N'02', N'ANANEA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'21', N'10', N'03', N'PEDRO VILCA APAZA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'21', N'10', N'04', N'QUILCAPUNCU', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'21', N'10', N'05', N'SINA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'21', N'11', N'00', N'SAN ROMAN', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'21', N'11', N'01', N'JULIACA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'21', N'11', N'02', N'CABANA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'21', N'11', N'03', N'CABANILLAS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'21', N'11', N'04', N'CARACOTO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'21', N'12', N'00', N'SANDIA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'21', N'12', N'01', N'SANDIA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'21', N'12', N'02', N'CUYOCUYO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'21', N'12', N'03', N'LIMBANI', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'21', N'12', N'04', N'PATAMBUCO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'21', N'12', N'05', N'PHARA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'21', N'12', N'06', N'QUIACA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'21', N'12', N'07', N'SAN JUAN DEL ORO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'21', N'12', N'08', N'YANAHUAYA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'21', N'12', N'09', N'ALTO INAMBARI', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'21', N'12', N'10', N'SAN PEDRO DE PUTINA PUNCO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'21', N'13', N'00', N'YUNGUYO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'21', N'13', N'01', N'YUNGUYO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'21', N'13', N'02', N'ANAPIA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'21', N'13', N'03', N'COPANI', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'21', N'13', N'04', N'CUTURAPI', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'21', N'13', N'05', N'OLLARAYA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'21', N'13', N'06', N'TINICACHI', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'21', N'13', N'07', N'UNICACHI', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'22', N'00', N'00', N'SAN MARTIN', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'22', N'01', N'00', N'MOYOBAMBA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'22', N'01', N'01', N'MOYOBAMBA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'22', N'01', N'02', N'CALZADA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'22', N'01', N'03', N'HABANA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'22', N'01', N'04', N'JEPELACIO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'22', N'01', N'05', N'SORITOR', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'22', N'01', N'06', N'YANTALO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'22', N'02', N'00', N'BELLAVISTA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'22', N'02', N'01', N'BELLAVISTA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'22', N'02', N'02', N'ALTO BIAVO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'22', N'02', N'03', N'BAJO BIAVO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'22', N'02', N'04', N'HUALLAGA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'22', N'02', N'05', N'SAN PABLO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'22', N'02', N'06', N'SAN RAFAEL', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'22', N'03', N'00', N'EL DORADO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'22', N'03', N'01', N'SAN JOSE DE SISA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'22', N'03', N'02', N'AGUA BLANCA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'22', N'03', N'03', N'SAN MARTIN', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'22', N'03', N'04', N'SANTA ROSA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'22', N'03', N'05', N'SHATOJA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'22', N'04', N'00', N'HUALLAGA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'22', N'04', N'01', N'SAPOSOA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'22', N'04', N'02', N'ALTO SAPOSOA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'22', N'04', N'03', N'EL ESLABON', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'22', N'04', N'04', N'PISCOYACU', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'22', N'04', N'05', N'SACANCHE', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'22', N'04', N'06', N'TINGO DE SAPOSOA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'22', N'05', N'00', N'LAMAS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'22', N'05', N'01', N'LAMAS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'22', N'05', N'02', N'ALONSO DE ALVARADO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'22', N'05', N'03', N'BARRANQUITA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'22', N'05', N'04', N'CAYNARACHI', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'22', N'05', N'05', N'CUÑUMBUQUI', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'22', N'05', N'06', N'PINTO RECODO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'22', N'05', N'07', N'RUMISAPA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'22', N'05', N'08', N'SAN ROQUE DE CUMBAZA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'22', N'05', N'09', N'SHANAO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'22', N'05', N'10', N'TABALOSOS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'22', N'05', N'11', N'ZAPATERO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'22', N'06', N'00', N'MARISCAL CACERES', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'22', N'06', N'01', N'JUANJUI', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'22', N'06', N'02', N'CAMPANILLA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'22', N'06', N'03', N'HUICUNGO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'22', N'06', N'04', N'PACHIZA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'22', N'06', N'05', N'PAJARILLO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'22', N'07', N'00', N'PICOTA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'22', N'07', N'01', N'PICOTA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'22', N'07', N'02', N'BUENOS AIRES', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'22', N'07', N'03', N'CASPISAPA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'22', N'07', N'04', N'PILLUANA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'22', N'07', N'05', N'PUCACACA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'22', N'07', N'06', N'SAN CRISTOBAL', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'22', N'07', N'07', N'SAN HILARION', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'22', N'07', N'08', N'SHAMBOYACU', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'22', N'07', N'09', N'TINGO DE PONASA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'22', N'07', N'10', N'TRES UNIDOS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'22', N'08', N'00', N'RIOJA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'22', N'08', N'01', N'RIOJA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'22', N'08', N'02', N'AWAJUN', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'22', N'08', N'03', N'ELIAS SOPLIN VARGAS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'22', N'08', N'04', N'NUEVA CAJAMARCA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'22', N'08', N'05', N'PARDO MIGUEL', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'22', N'08', N'06', N'POSIC', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'22', N'08', N'07', N'SAN FERNANDO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'22', N'08', N'08', N'YORONGOS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'22', N'08', N'09', N'YURACYACU', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'22', N'09', N'00', N'SAN MARTIN', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'22', N'09', N'01', N'TARAPOTO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'22', N'09', N'02', N'ALBERTO LEVEAU', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'22', N'09', N'03', N'CACATACHI', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'22', N'09', N'04', N'CHAZUTA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'22', N'09', N'05', N'CHIPURANA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'22', N'09', N'06', N'EL PORVENIR', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'22', N'09', N'07', N'HUIMBAYOC', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'22', N'09', N'08', N'JUAN GUERRA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'22', N'09', N'09', N'LA BANDA DE SHILCAYO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'22', N'09', N'10', N'MORALES', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'22', N'09', N'11', N'PAPAPLAYA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'22', N'09', N'12', N'SAN ANTONIO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'22', N'09', N'13', N'SAUCE', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'22', N'09', N'14', N'SHAPAJA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'22', N'10', N'00', N'TOCACHE', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'22', N'10', N'01', N'TOCACHE', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'22', N'10', N'02', N'NUEVO PROGRESO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'22', N'10', N'03', N'POLVORA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'22', N'10', N'04', N'SHUNTE', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'22', N'10', N'05', N'UCHIZA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'23', N'00', N'00', N'TACNA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'23', N'01', N'00', N'TACNA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'23', N'01', N'01', N'TACNA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'23', N'01', N'02', N'ALTO DE LA ALIANZA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'23', N'01', N'03', N'CALANA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'23', N'01', N'04', N'CIUDAD NUEVA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'23', N'01', N'05', N'INCLAN', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'23', N'01', N'06', N'PACHIA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'23', N'01', N'07', N'PALCA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'23', N'01', N'08', N'POCOLLAY', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'23', N'01', N'09', N'SAMA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'23', N'01', N'10', N'CORONEL GREGORIO ALBARRACIN LANCHIPA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'23', N'02', N'00', N'CANDARAVE', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'23', N'02', N'01', N'CANDARAVE', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'23', N'02', N'02', N'CAIRANI', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'23', N'02', N'03', N'CAMILACA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'23', N'02', N'04', N'CURIBAYA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'23', N'02', N'05', N'HUANUARA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'23', N'02', N'06', N'QUILAHUANI', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'23', N'03', N'00', N'JORGE BASADRE', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'23', N'03', N'01', N'LOCUMBA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'23', N'03', N'02', N'ILABAYA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'23', N'03', N'03', N'ITE', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'23', N'04', N'00', N'TARATA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'23', N'04', N'01', N'TARATA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'23', N'04', N'02', N'HEROES ALBARRACIN', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'23', N'04', N'03', N'ESTIQUE', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'23', N'04', N'04', N'ESTIQUE-PAMPA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'23', N'04', N'05', N'SITAJARA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'23', N'04', N'06', N'SUSAPAYA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'23', N'04', N'07', N'TARUCACHI', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'23', N'04', N'08', N'TICACO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'24', N'00', N'00', N'TUMBES', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'24', N'01', N'00', N'TUMBES', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'24', N'01', N'01', N'TUMBES', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'24', N'01', N'02', N'CORRALES', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'24', N'01', N'03', N'LA CRUZ', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'24', N'01', N'04', N'PAMPAS DE HOSPITAL', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'24', N'01', N'05', N'SAN JACINTO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'24', N'01', N'06', N'SAN JUAN DE LA VIRGEN', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'24', N'02', N'00', N'CONTRALMIRANTE VILLAR', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'24', N'02', N'01', N'ZORRITOS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'24', N'02', N'02', N'CASITAS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'24', N'02', N'03', N'CANOAS DE PUNTA SAL', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'24', N'03', N'00', N'ZARUMILLA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'24', N'03', N'01', N'ZARUMILLA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'24', N'03', N'02', N'AGUAS VERDES', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'24', N'03', N'03', N'MATAPALO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'24', N'03', N'04', N'PAPAYAL', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'25', N'00', N'00', N'UCAYALI', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'25', N'01', N'00', N'CORONEL PORTILLO', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'25', N'01', N'01', N'CALLERIA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'25', N'01', N'02', N'CAMPOVERDE', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'25', N'01', N'03', N'IPARIA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'25', N'01', N'04', N'MASISEA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'25', N'01', N'05', N'YARINACOCHA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'25', N'01', N'06', N'NUEVA REQUENA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'25', N'01', N'07', N'MANANTAY', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'25', N'02', N'00', N'ATALAYA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'25', N'02', N'01', N'RAYMONDI', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'25', N'02', N'02', N'SEPAHUA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'25', N'02', N'03', N'TAHUANIA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'25', N'02', N'04', N'YURUA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'25', N'03', N'00', N'PADRE ABAD', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'25', N'03', N'01', N'PADRE ABAD', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'25', N'03', N'02', N'IRAZOLA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'25', N'03', N'03', N'CURIMANA', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'25', N'04', N'00', N'PURUS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Ubigeo] ([CodDpto], [CodProv], [CodDist], [Nombre], [precio]) VALUES (N'25', N'04', N'01', N'PURUS', CAST(5.00 AS Decimal(5, 2)))
GO
SET IDENTITY_INSERT [dbo].[Usuario] ON 
GO
INSERT [dbo].[Usuario] ([id_usuario], [usuario], [password], [nombre], [apellido_paterno], [apellido_materno], [fecha_nacimiento], [dni], [email], [id_rol], [celular], [telefono], [activo], [fecha_creacion], [activo_correo], [token_correo], [token_recuperacion], [fecha_ultima_recuperacion]) VALUES (2, N'user', N'zEeÌ«¯h¡`®ÉtÔY_äš', N'Toshio', N'Minei', N'Moromisato', NULL, N'44605786', N'user@example.com', 2, N'654321234565432', N'434324243243', 1, CAST(N'2014-02-11T11:25:59.540' AS DateTime), 1, N'jg1ndpocr3', NULL, NULL)
GO
INSERT [dbo].[Usuario] ([id_usuario], [usuario], [password], [nombre], [apellido_paterno], [apellido_materno], [fecha_nacimiento], [dni], [email], [id_rol], [celular], [telefono], [activo], [fecha_creacion], [activo_correo], [token_correo], [token_recuperacion], [fecha_ultima_recuperacion]) VALUES (3, N'admin', N'ú;DYº«àt:ùJKAç)†´úÅY', N'Cai', N'Aguayo', N'Mendoza', NULL, N'55437437', N'admin@example.com', 1, NULL, NULL, 1, CAST(N'2014-02-11T11:57:48.747' AS DateTime), 1, N'pjinkz9ivk', N'n76obfkfjd', CAST(N'2014-05-08T12:25:53.087' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Usuario] OFF
GO
SET IDENTITY_INSERT [dbo].[Whishlist] ON 
GO
INSERT [dbo].[Whishlist] ([id_whishlist], [id_producto], [id_usuario], [fecha_creacion]) VALUES (1, 13, 2, CAST(N'2014-03-11T14:31:52.653' AS DateTime))
GO
INSERT [dbo].[Whishlist] ([id_whishlist], [id_producto], [id_usuario], [fecha_creacion]) VALUES (5, 8, 2, CAST(N'2014-03-13T14:45:17.150' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Whishlist] OFF
GO
ALTER TABLE [dbo].[Operador_Logistico] ADD  CONSTRAINT [DF_Operador_Logistico_Habilitado]  DEFAULT ((1)) FOR [Habilitado]
GO
ALTER TABLE [dbo].[Pedido] ADD  CONSTRAINT [DF_Pedido_estado]  DEFAULT ((1)) FOR [estado]
GO
ALTER TABLE [dbo].[Producto] ADD  CONSTRAINT [DF_Producto_activo]  DEFAULT ((1)) FOR [activo]
GO
ALTER TABLE [dbo].[Producto] ADD  CONSTRAINT [DF_Producto_fecha_creacion]  DEFAULT (getdate()) FOR [fecha_creacion]
GO
ALTER TABLE [dbo].[Producto] ADD  CONSTRAINT [DF_Producto_fecha_modificacion]  DEFAULT (getdate()) FOR [fecha_modificacion]
GO
ALTER TABLE [dbo].[Producto] ADD  CONSTRAINT [DF_Producto_cantidad_vendidos]  DEFAULT ((0)) FOR [cantidad_vendidos]
GO
ALTER TABLE [dbo].[Usuario] ADD  CONSTRAINT [DF_Usuario_activo_correo]  DEFAULT ((0)) FOR [activo_correo]
GO
ALTER TABLE [dbo].[Carrito]  WITH CHECK ADD  CONSTRAINT [FK_Carrito_Direccion] FOREIGN KEY([id_direccion_envio])
REFERENCES [dbo].[Direccion] ([id_direccion])
GO
ALTER TABLE [dbo].[Carrito] CHECK CONSTRAINT [FK_Carrito_Direccion]
GO
ALTER TABLE [dbo].[Carrito]  WITH CHECK ADD  CONSTRAINT [FK_Carrito_Direccion1] FOREIGN KEY([id_direccion_facturacion])
REFERENCES [dbo].[Direccion] ([id_direccion])
GO
ALTER TABLE [dbo].[Carrito] CHECK CONSTRAINT [FK_Carrito_Direccion1]
GO
ALTER TABLE [dbo].[Carrito]  WITH CHECK ADD  CONSTRAINT [FK_Carrito_Usuario] FOREIGN KEY([id_usuario])
REFERENCES [dbo].[Usuario] ([id_usuario])
GO
ALTER TABLE [dbo].[Carrito] CHECK CONSTRAINT [FK_Carrito_Usuario]
GO
ALTER TABLE [dbo].[Carrito_Producto]  WITH CHECK ADD  CONSTRAINT [FK_Carrito_Producto_Carrito] FOREIGN KEY([id_carrito])
REFERENCES [dbo].[Carrito] ([id_carrito])
GO
ALTER TABLE [dbo].[Carrito_Producto] CHECK CONSTRAINT [FK_Carrito_Producto_Carrito]
GO
ALTER TABLE [dbo].[Carrito_Producto]  WITH CHECK ADD  CONSTRAINT [FK_Carrito_Producto_Producto] FOREIGN KEY([id_producto])
REFERENCES [dbo].[Producto] ([id_producto])
GO
ALTER TABLE [dbo].[Carrito_Producto] CHECK CONSTRAINT [FK_Carrito_Producto_Producto]
GO
ALTER TABLE [dbo].[Carrito_Producto_Elemento_Atributo]  WITH CHECK ADD  CONSTRAINT [FK_Carrito_Producto_Elemento_Atributo_Carrito_Producto] FOREIGN KEY([id_carrito_producto])
REFERENCES [dbo].[Carrito_Producto] ([id_carrito_producto])
GO
ALTER TABLE [dbo].[Carrito_Producto_Elemento_Atributo] CHECK CONSTRAINT [FK_Carrito_Producto_Elemento_Atributo_Carrito_Producto]
GO
ALTER TABLE [dbo].[Carrito_Producto_Elemento_Atributo]  WITH CHECK ADD  CONSTRAINT [FK_Carrito_Producto_Elemento_Atributo_Elemento_Atributo] FOREIGN KEY([id_elemento_atributo])
REFERENCES [dbo].[Elemento_Atributo] ([id_elemento_atributo])
GO
ALTER TABLE [dbo].[Carrito_Producto_Elemento_Atributo] CHECK CONSTRAINT [FK_Carrito_Producto_Elemento_Atributo_Elemento_Atributo]
GO
ALTER TABLE [dbo].[Categoria]  WITH CHECK ADD  CONSTRAINT [FK_Categoria_Categoria] FOREIGN KEY([id_padre])
REFERENCES [dbo].[Categoria] ([id_categoria])
GO
ALTER TABLE [dbo].[Categoria] CHECK CONSTRAINT [FK_Categoria_Categoria]
GO
ALTER TABLE [dbo].[Direccion]  WITH CHECK ADD  CONSTRAINT [FK_Direccion_Usuario] FOREIGN KEY([id_usuario])
REFERENCES [dbo].[Usuario] ([id_usuario])
GO
ALTER TABLE [dbo].[Direccion] CHECK CONSTRAINT [FK_Direccion_Usuario]
GO
ALTER TABLE [dbo].[Elemento_Atributo]  WITH CHECK ADD  CONSTRAINT [FK_Elemento_Atributo_Atributo] FOREIGN KEY([id_atributo])
REFERENCES [dbo].[Atributo] ([id_atributo])
GO
ALTER TABLE [dbo].[Elemento_Atributo] CHECK CONSTRAINT [FK_Elemento_Atributo_Atributo]
GO
ALTER TABLE [dbo].[Imagen_Producto]  WITH CHECK ADD  CONSTRAINT [FK_Imagen_Producto_Producto] FOREIGN KEY([id_producto])
REFERENCES [dbo].[Producto] ([id_producto])
GO
ALTER TABLE [dbo].[Imagen_Producto] CHECK CONSTRAINT [FK_Imagen_Producto_Producto]
GO
ALTER TABLE [dbo].[Pedido]  WITH CHECK ADD  CONSTRAINT [FK_Pedido_Forma_Pago] FOREIGN KEY([id_forma_pago])
REFERENCES [dbo].[Forma_Pago] ([id_forma_pago])
GO
ALTER TABLE [dbo].[Pedido] CHECK CONSTRAINT [FK_Pedido_Forma_Pago]
GO
ALTER TABLE [dbo].[Pedido]  WITH CHECK ADD  CONSTRAINT [FK_Pedido_Usuario] FOREIGN KEY([id_usuario])
REFERENCES [dbo].[Usuario] ([id_usuario])
GO
ALTER TABLE [dbo].[Pedido] CHECK CONSTRAINT [FK_Pedido_Usuario]
GO
ALTER TABLE [dbo].[Pedido_Direccion]  WITH CHECK ADD  CONSTRAINT [FK_Pedido_Direccion_Pedido] FOREIGN KEY([id_pedido])
REFERENCES [dbo].[Pedido] ([id_pedido])
GO
ALTER TABLE [dbo].[Pedido_Direccion] CHECK CONSTRAINT [FK_Pedido_Direccion_Pedido]
GO
ALTER TABLE [dbo].[Pedido_Producto]  WITH CHECK ADD  CONSTRAINT [FK_Pedido_Producto_Pedido] FOREIGN KEY([id_pedido])
REFERENCES [dbo].[Pedido] ([id_pedido])
GO
ALTER TABLE [dbo].[Pedido_Producto] CHECK CONSTRAINT [FK_Pedido_Producto_Pedido]
GO
ALTER TABLE [dbo].[Pedido_Producto]  WITH CHECK ADD  CONSTRAINT [FK_Pedido_Producto_Producto] FOREIGN KEY([id_producto])
REFERENCES [dbo].[Producto] ([id_producto])
GO
ALTER TABLE [dbo].[Pedido_Producto] CHECK CONSTRAINT [FK_Pedido_Producto_Producto]
GO
ALTER TABLE [dbo].[Pedido_Producto_Elemento_Atributo]  WITH CHECK ADD  CONSTRAINT [FK_Pedido_Producto_Elemento_Atributo_Pedido_Producto] FOREIGN KEY([id_pedido_producto])
REFERENCES [dbo].[Pedido_Producto] ([id_pedido_producto])
GO
ALTER TABLE [dbo].[Pedido_Producto_Elemento_Atributo] CHECK CONSTRAINT [FK_Pedido_Producto_Elemento_Atributo_Pedido_Producto]
GO
ALTER TABLE [dbo].[Producto_Categoria]  WITH CHECK ADD  CONSTRAINT [FK_Producto_Categoria_Categoria] FOREIGN KEY([id_categoria])
REFERENCES [dbo].[Categoria] ([id_categoria])
GO
ALTER TABLE [dbo].[Producto_Categoria] CHECK CONSTRAINT [FK_Producto_Categoria_Categoria]
GO
ALTER TABLE [dbo].[Producto_Categoria]  WITH CHECK ADD  CONSTRAINT [FK_Producto_Categoria_Producto] FOREIGN KEY([id_producto])
REFERENCES [dbo].[Producto] ([id_producto])
GO
ALTER TABLE [dbo].[Producto_Categoria] CHECK CONSTRAINT [FK_Producto_Categoria_Producto]
GO
ALTER TABLE [dbo].[Producto_Color]  WITH CHECK ADD  CONSTRAINT [FK_Producto_Color_Color] FOREIGN KEY([id_color])
REFERENCES [dbo].[Color] ([id_color])
GO
ALTER TABLE [dbo].[Producto_Color] CHECK CONSTRAINT [FK_Producto_Color_Color]
GO
ALTER TABLE [dbo].[Producto_Color]  WITH CHECK ADD  CONSTRAINT [FK_Producto_Color_Producto] FOREIGN KEY([id_producto])
REFERENCES [dbo].[Producto] ([id_producto])
GO
ALTER TABLE [dbo].[Producto_Color] CHECK CONSTRAINT [FK_Producto_Color_Producto]
GO
ALTER TABLE [dbo].[Producto_Elemento_Atributo]  WITH CHECK ADD  CONSTRAINT [FK_Producto_Elemento_Atributo_Elemento_Atributo] FOREIGN KEY([id_elemento_atributo])
REFERENCES [dbo].[Elemento_Atributo] ([id_elemento_atributo])
GO
ALTER TABLE [dbo].[Producto_Elemento_Atributo] CHECK CONSTRAINT [FK_Producto_Elemento_Atributo_Elemento_Atributo]
GO
ALTER TABLE [dbo].[Producto_Elemento_Atributo]  WITH CHECK ADD  CONSTRAINT [FK_Producto_Elemento_Atributo_Producto] FOREIGN KEY([id_producto])
REFERENCES [dbo].[Producto] ([id_producto])
GO
ALTER TABLE [dbo].[Producto_Elemento_Atributo] CHECK CONSTRAINT [FK_Producto_Elemento_Atributo_Producto]
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_Rol] FOREIGN KEY([id_rol])
REFERENCES [dbo].[Rol] ([id_rol])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK_Usuario_Rol]
GO
ALTER TABLE [dbo].[Whishlist]  WITH CHECK ADD  CONSTRAINT [FK_Whishlist_Usuario] FOREIGN KEY([id_usuario])
REFERENCES [dbo].[Usuario] ([id_usuario])
GO
ALTER TABLE [dbo].[Whishlist] CHECK CONSTRAINT [FK_Whishlist_Usuario]
GO
/****** Object:  StoredProcedure [dbo].[Atributo_Delete]    Script Date: 13/05/2018 12:52:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Atributo_Delete] (
    @id_atributo int
)
AS
BEGIN

    SET NOCOUNT ON;

	delete Producto_Elemento_Atributo
	from Producto_Elemento_Atributo pe join Elemento_Atributo ea on pe.id_elemento_atributo = ea.id_elemento_atributo
	where ea.id_atributo = @id_atributo

	delete from Elemento_Atributo
	where id_atributo = @id_atributo

    delete from [dbo].[Atributo]
    where
        [id_atributo] = @id_atributo
END
GO
/****** Object:  StoredProcedure [dbo].[Atributo_Get]    Script Date: 13/05/2018 12:52:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Atributo_Get](
    @id_atributo int
)
AS
BEGIN

    SET NOCOUNT ON;

    select 
        a.[descripcion]
        ,a.[id_atributo]
        ,a.[nombre]
    from [dbo].[Atributo] a
    where
        a.[id_atributo] = @id_atributo
END
GO
/****** Object:  StoredProcedure [dbo].[Atributo_Get_No_Producto]    Script Date: 13/05/2018 12:52:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sergio Minei
-- Create date: 22/08/2014
-- Description:	Devuelve los atributos que no tiene un producto
-- =============================================
CREATE PROCEDURE [dbo].[Atributo_Get_No_Producto]
(
	@id_producto int
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	select a.descripcion
		,a.id_atributo
		,a.nombre
	from Atributo a
	where a.id_atributo not in (select ea.id_atributo
								from Producto_Elemento_Atributo pe join Elemento_Atributo ea on pe.id_elemento_atributo = ea.id_elemento_atributo
								where pe.id_producto = @id_producto)
END
GO
/****** Object:  StoredProcedure [dbo].[Atributo_Get_Producto]    Script Date: 13/05/2018 12:52:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sergio Minei
-- Create date: 26/08/2014
-- Description:	Muestra todos los atributos de un producto
-- =============================================
CREATE PROCEDURE [dbo].[Atributo_Get_Producto]
(
	@id_producto int
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    select distinct a.descripcion
		,a.id_atributo
		,a.nombre
	from Producto_Elemento_Atributo pe join Elemento_Atributo ea on pe.id_elemento_atributo = ea.id_elemento_atributo
		join Atributo a on ea.id_atributo = a.id_atributo
	where pe.id_producto = @id_producto
END
GO
/****** Object:  StoredProcedure [dbo].[Atributo_Insert]    Script Date: 13/05/2018 12:52:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Atributo_Insert] (
    @descripcion varchar(500) = null,
    @nombre varchar(200)
)
AS
BEGIN

    SET NOCOUNT ON;

    insert into [dbo].[Atributo]
    (
        [descripcion],
        [nombre]
    )
    values
    (
        @descripcion,
        @nombre
    )

    select @@IDENTITY as 'id_atributo'
END
GO
/****** Object:  StoredProcedure [dbo].[Atributo_Select]    Script Date: 13/05/2018 12:52:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Atributo_Select]
AS
BEGIN

    SET NOCOUNT ON;

    select 
        a.[descripcion]
        ,a.[id_atributo]
        ,a.[nombre]
    from [dbo].[Atributo] a
END
GO
/****** Object:  StoredProcedure [dbo].[Atributo_Update]    Script Date: 13/05/2018 12:52:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Atributo_Update] (
    @descripcion varchar(500) = null,
    @id_atributo int,
    @nombre varchar(200)
)
AS
BEGIN

    SET NOCOUNT ON;

    update [dbo].[Atributo]
    set
        [descripcion] = @descripcion,
        [nombre] = @nombre
    where
        [id_atributo] = @id_atributo
END
GO
/****** Object:  StoredProcedure [dbo].[Boton_Inicio_Get]    Script Date: 13/05/2018 12:52:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Boton_Inicio_Get](
    @id_boton_inicio int
)
AS
BEGIN

    SET NOCOUNT ON;

    select 
        b.[descripcion]
        ,b.[id_boton_inicio]
        ,b.[nombre]
        ,b.[url]
    from [dbo].[Boton_Inicio] b
    where
        b.[id_boton_inicio] = @id_boton_inicio
END
GO
/****** Object:  StoredProcedure [dbo].[Boton_Inicio_Insert]    Script Date: 13/05/2018 12:52:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Boton_Inicio_Insert] (
    @descripcion varchar(500),
    @nombre varchar(100),
    @url varchar(500)
)
AS
BEGIN

    SET NOCOUNT ON;

    insert into [dbo].[Boton_Inicio]
    (
        [descripcion],
        [nombre],
        [url]
    )
    values
    (
        @descripcion,
        @nombre,
        @url
    )

    select @@IDENTITY as 'id_boton_inicio'
END
GO
/****** Object:  StoredProcedure [dbo].[Boton_Inicio_Select]    Script Date: 13/05/2018 12:52:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Boton_Inicio_Select]
AS
BEGIN

    SET NOCOUNT ON;

    select 
        b.[descripcion]
        ,b.[id_boton_inicio]
        ,b.[nombre]
        ,b.[url]
    from [dbo].[Boton_Inicio] b
END
GO
/****** Object:  StoredProcedure [dbo].[Boton_Inicio_Update]    Script Date: 13/05/2018 12:52:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Boton_Inicio_Update] (
    @descripcion varchar(500),
    @id_boton_inicio int,
    @nombre varchar(100),
    @url varchar(500)
)
AS
BEGIN

    SET NOCOUNT ON;

    update [dbo].[Boton_Inicio]
    set
        [descripcion] = @descripcion,
        [nombre] = @nombre,
        [url] = @url
    where
        [id_boton_inicio] = @id_boton_inicio
END
GO
/****** Object:  StoredProcedure [dbo].[Carrito_Delete]    Script Date: 13/05/2018 12:52:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Carrito_Delete] (
    @id_carrito int,
    @id_direccion_envio int,
    @id_direccion_facturacion int,
    @id_usuario int
)
AS
BEGIN

    SET NOCOUNT ON;

    delete from [dbo].[Carrito]
    where
        [id_carrito] = @id_carrito and 
        [id_direccion_envio] = @id_direccion_envio and 
        [id_direccion_facturacion] = @id_direccion_facturacion and 
        [id_usuario] = @id_usuario
END
GO
/****** Object:  StoredProcedure [dbo].[Carrito_Delete_Total]    Script Date: 13/05/2018 12:52:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sergio Minei
-- Create date: 17/02/2014
-- Description:	Borra por completo un carrito junto con sus productos
-- =============================================
CREATE PROCEDURE [dbo].[Carrito_Delete_Total]
	@id_usuario int
AS
BEGIN
	SET NOCOUNT ON;

	declare @id_carrito int = (select c.id_carrito from Carrito c where c.id_usuario = @id_usuario)

	delete Carrito_Producto_Elemento_Atributo
	from Carrito_Producto cp join Carrito_Producto_Elemento_Atributo cpea on cp.id_carrito_producto = cpea.id_carrito_producto
	where cp.id_carrito = @id_carrito

    delete from Carrito_Producto
	where id_carrito = @id_carrito

	delete from Carrito
	where id_carrito = @id_carrito
END
GO
/****** Object:  StoredProcedure [dbo].[Carrito_Get]    Script Date: 13/05/2018 12:52:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Carrito_Get](
    @id_carrito int,
    @id_direccion_envio int,
    @id_direccion_facturacion int,
    @id_usuario int
)
AS
BEGIN

    SET NOCOUNT ON;

    select 
        c.[id_carrito]
        ,c.[id_direccion_envio]
        ,c.[id_direccion_facturacion]
        ,c.[id_usuario]
        ,c.[total]
    from [dbo].[Carrito] c
    where
        c.[id_carrito] = @id_carrito or 
        c.[id_direccion_envio] = @id_direccion_envio or 
        c.[id_direccion_facturacion] = @id_direccion_facturacion or 
        c.[id_usuario] = @id_usuario
END
GO
/****** Object:  StoredProcedure [dbo].[Carrito_Get_Usuario]    Script Date: 13/05/2018 12:52:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sergio Minei
-- Create date: 04/03/2014
-- Description:	Devuelve el carrito de compras de un usuario
-- =============================================
CREATE PROCEDURE [dbo].[Carrito_Get_Usuario]
(
	@id_usuario int
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    select 
        c.[id_carrito]
        ,c.[id_direccion_envio]
        ,c.[id_direccion_facturacion]
        ,c.[id_usuario]
        ,(select sum(p.precio) from Producto p join Carrito_Producto cp on p.id_producto = cp.id_producto where cp.id_carrito = c.id_carrito) as 'total'
    from [dbo].[Carrito] c
    where
        c.[id_usuario] = @id_usuario

	select 
		cp.cantidad
		,c.id_carrito
		,p.id_producto
		,p.nombre as 'nombre_producto'
		,ip.nombre as 'nombre_imagen'
		,p.precio
		,cp.id_color
		,cp.id_carrito_producto
	from Carrito c join Carrito_Producto cp on c.id_carrito = cp.id_carrito
		join Producto p on p.id_producto = cp.id_producto
		join Imagen_Producto ip on ip.id_producto = p.id_producto
	where c.id_usuario = @id_usuario
		and ip.mostrar_primero = 1
		and p.activo = 1

	select 
		cpe.id_carrito_producto
		,cpe.id_elemento_atributo
		,ea.nombre as 'elemento'
		,a.nombre as 'atributo'
	from Carrito c join Carrito_Producto cp on c.id_carrito = cp.id_carrito
		join Carrito_Producto_Elemento_Atributo cpe on cp.id_carrito_producto = cpe.id_carrito_producto
		join Elemento_Atributo ea on cpe.id_elemento_atributo = ea.id_elemento_atributo
		join Atributo a on ea.id_atributo = a.id_atributo
	where c.id_usuario = @id_usuario
END
GO
/****** Object:  StoredProcedure [dbo].[Carrito_Insert]    Script Date: 13/05/2018 12:52:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Carrito_Insert] (
    @id_direccion_envio int = null,
    @id_direccion_facturacion int = null,
    @id_usuario int,
    @total decimal(10, 2)
)
AS
BEGIN

    SET NOCOUNT ON;

    insert into [Carrito]
    (
        [id_direccion_envio],
        [id_direccion_facturacion],
        [id_usuario],
        [total]
    )
    values
    (
        @id_direccion_envio,
        @id_direccion_facturacion,
        @id_usuario,
        @total
    )

	select @@IDENTITY as 'id_carrito'
END
GO
/****** Object:  StoredProcedure [dbo].[Carrito_Insert_Update]    Script Date: 13/05/2018 12:52:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Carrito_Insert_Update] (
    @id_carrito int,
    @id_direccion_envio int = null,
    @id_direccion_facturacion int = null,
    @id_usuario int,
    @total decimal(10, 10)
)
AS
BEGIN

    SET NOCOUNT ON;

    if(@id_carrito = 0 or @id_direccion_envio = 0 or @id_direccion_facturacion = 0 or @id_usuario = 0)
    begin
        insert into [dbo].[Carrito]
        (
            [id_carrito],
            [id_direccion_envio],
            [id_direccion_facturacion],
            [id_usuario],
            [total]
        )
        values
        (
            @id_carrito,
            @id_direccion_envio,
            @id_direccion_facturacion,
            @id_usuario,
            @total
        )
    end
    else
    begin
        update [dbo].[Carrito]
        set
            [total] = @total
        where
            [id_carrito] = @id_carrito and 
            [id_direccion_envio] = @id_direccion_envio and 
            [id_direccion_facturacion] = @id_direccion_facturacion and 
            [id_usuario] = @id_usuario

    end
END
GO
/****** Object:  StoredProcedure [dbo].[Carrito_Producto_Delete]    Script Date: 13/05/2018 12:52:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Carrito_Producto_Delete] (
    @id_carrito_producto int
)
AS
BEGIN

    SET NOCOUNT ON;

	delete from Carrito_Producto_Elemento_Atributo
	where id_carrito_producto = @id_carrito_producto

    delete from [dbo].[Carrito_Producto]
    where
        id_carrito_producto = @id_carrito_producto
END
GO
/****** Object:  StoredProcedure [dbo].[Carrito_Producto_Elemento_Atributo_Delete]    Script Date: 13/05/2018 12:52:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Carrito_Producto_Elemento_Atributo_Delete] (
    @id_carrito_producto int,
    @id_elemento_atributo int
)
AS
BEGIN

    SET NOCOUNT ON;

    delete from [dbo].[Carrito_Producto_Elemento_Atributo]
    where
        [id_carrito_producto] = @id_carrito_producto and 
        [id_elemento_atributo] = @id_elemento_atributo
END
GO
/****** Object:  StoredProcedure [dbo].[Carrito_Producto_Elemento_Atributo_Get]    Script Date: 13/05/2018 12:52:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Carrito_Producto_Elemento_Atributo_Get](
    @id_carrito_producto int,
    @id_elemento_atributo int
)
AS
BEGIN

    SET NOCOUNT ON;

    select 
        c.[id_carrito_producto]
        ,c.[id_elemento_atributo]
    from [dbo].[Carrito_Producto_Elemento_Atributo] c
    where
        c.[id_carrito_producto] = @id_carrito_producto or 
        c.[id_elemento_atributo] = @id_elemento_atributo
END
GO
/****** Object:  StoredProcedure [dbo].[Carrito_Producto_Elemento_Atributo_Insert]    Script Date: 13/05/2018 12:52:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Carrito_Producto_Elemento_Atributo_Insert] (
    @id_carrito_producto int,
    @id_elemento_atributo int
)
AS
BEGIN

    SET NOCOUNT ON;

    insert into [dbo].[Carrito_Producto_Elemento_Atributo]
    (
        [id_carrito_producto],
        [id_elemento_atributo]
    )
    values
    (
        @id_carrito_producto,
        @id_elemento_atributo
    )
END
GO
/****** Object:  StoredProcedure [dbo].[Carrito_Producto_Get]    Script Date: 13/05/2018 12:52:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Carrito_Producto_Get](
    @id_carrito_producto int
)
AS
BEGIN

    SET NOCOUNT ON;

    select 
        c.[cantidad]
        ,c.[id_carrito]
        ,c.[id_producto]
		,c.id_carrito_producto
    from [dbo].[Carrito_Producto] c
    where
        c.[id_carrito_producto] = @id_carrito_producto
END
GO
/****** Object:  StoredProcedure [dbo].[Carrito_Producto_Insert]    Script Date: 13/05/2018 12:52:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Carrito_Producto_Insert] (
    @cantidad int,
    @id_carrito int,
    @id_producto int
)
AS
BEGIN

    SET NOCOUNT ON;

    insert into [dbo].[Carrito_Producto]
    (
        [cantidad],
        [id_carrito],
        [id_producto]
    )
    values
    (
        @cantidad,
        @id_carrito,
        @id_producto
    )

	select @@IDENTITY as 'id_carrito_producto'
END
GO
/****** Object:  StoredProcedure [dbo].[Carrito_Producto_Select]    Script Date: 13/05/2018 12:52:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Carrito_Producto_Select]
AS
BEGIN

    SET NOCOUNT ON;

    select 
        c.[cantidad]
        ,c.[id_carrito]
        ,c.[id_producto]
		,c.id_carrito_producto
    from [dbo].[Carrito_Producto] c
END
GO
/****** Object:  StoredProcedure [dbo].[Carrito_Producto_Update]    Script Date: 13/05/2018 12:52:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Carrito_Producto_Update] (
    @cantidad int,
    @id_carrito_producto int
)
AS
BEGIN

    SET NOCOUNT ON;

    update [dbo].[Carrito_Producto]
    set
        [cantidad] = @cantidad
    where
        id_carrito_producto = @id_carrito_producto
END
GO
/****** Object:  StoredProcedure [dbo].[Carrito_Select]    Script Date: 13/05/2018 12:52:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Carrito_Select]
AS
BEGIN

    SET NOCOUNT ON;

    select 
        c.[id_carrito]
        ,c.[id_direccion_envio]
        ,c.[id_direccion_facturacion]
        ,c.[id_usuario]
        ,c.[total]
    from [dbo].[Carrito] c
END
GO
/****** Object:  StoredProcedure [dbo].[Carrito_Update]    Script Date: 13/05/2018 12:52:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Carrito_Update] (
    @id_carrito int,
    @id_direccion_envio int = null,
    @id_direccion_facturacion int = null,
    @id_usuario int,
    @total decimal(10, 10)
)
AS
BEGIN

    SET NOCOUNT ON;

    update [dbo].[Carrito]
    set
        [total] = @total
    where
        [id_carrito] = @id_carrito and 
        [id_direccion_envio] = @id_direccion_envio and 
        [id_direccion_facturacion] = @id_direccion_facturacion and 
        [id_usuario] = @id_usuario
END
GO
/****** Object:  StoredProcedure [dbo].[Categoria_Delete]    Script Date: 13/05/2018 12:52:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Categoria_Delete] (
    @id_categoria int
)
AS
BEGIN

    SET NOCOUNT ON;

	delete from Producto_Categoria 
	where id_categoria = @id_categoria

    delete from [dbo].[Categoria]
    where
        [id_categoria] = @id_categoria
END
GO
/****** Object:  StoredProcedure [dbo].[Categoria_Get]    Script Date: 13/05/2018 12:52:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Categoria_Get](
    @id_categoria int
)
AS
BEGIN

    SET NOCOUNT ON;

    select 
        c.[descripcion]
        ,c.[id_categoria]
        ,c.[nombre]
		,c.id_padre
    from [dbo].[Categoria] c
    where
        c.[id_categoria] = @id_categoria
	order by c.id_padre
END
GO
/****** Object:  StoredProcedure [dbo].[Categoria_Insert]    Script Date: 13/05/2018 12:52:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Categoria_Insert] (
    @descripcion varchar(1000) = null,
    @nombre varchar(100),
	@id_padre int = null
)
AS
BEGIN

    SET NOCOUNT ON;

    insert into [dbo].[Categoria]
    (
        [descripcion],
        [nombre],
		id_padre
    )
    values
    (
        @descripcion,
        @nombre,
		@id_padre
    )

    select @@IDENTITY as 'id_categoria'
END
GO
/****** Object:  StoredProcedure [dbo].[Categoria_Insert_Update]    Script Date: 13/05/2018 12:52:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Categoria_Insert_Update] (
    @descripcion varchar(1000) = null,
    @id_categoria int,
    @nombre varchar(100),
	@id_padre int = null
)
AS
BEGIN

    SET NOCOUNT ON;

    if(@id_categoria = 0)
    begin
        insert into [dbo].[Categoria]
        (
            [descripcion],
            [nombre],
			id_padre
        )
        values
        (
            @descripcion,
            @nombre,
			@id_padre
        )

        select @@IDENTITY as 'id_categoria'
    end
    else
    begin
        update [dbo].[Categoria]
        set
            [descripcion] = @descripcion,
            [nombre] = @nombre,
			id_padre = @id_padre
        where
            [id_categoria] = @id_categoria

        select @id_categoria as 'id_categoria'
    end
END
GO
/****** Object:  StoredProcedure [dbo].[Categoria_Select]    Script Date: 13/05/2018 12:52:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Categoria_Select]
AS
BEGIN

    SET NOCOUNT ON;

    select 
        c.[descripcion]
        ,c.[id_categoria]
        ,c.[nombre]
		,c.id_padre
    from [dbo].[Categoria] c
	order by c.id_padre, c.nombre
END
GO
/****** Object:  StoredProcedure [dbo].[Categoria_Update]    Script Date: 13/05/2018 12:52:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Categoria_Update] (
    @descripcion varchar(1000) = null,
    @id_categoria int,
    @nombre varchar(100),
	@id_padre int = null
)
AS
BEGIN

    SET NOCOUNT ON;

    update [dbo].[Categoria]
    set
        [descripcion] = @descripcion,
        [nombre] = @nombre,
		id_padre =@id_padre
    where
        [id_categoria] = @id_categoria
END
GO
/****** Object:  StoredProcedure [dbo].[Color_Delete]    Script Date: 13/05/2018 12:52:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Color_Delete] (
    @id_color int
)
AS
BEGIN

    SET NOCOUNT ON;

    delete from [dbo].[Color]
    where
        [id_color] = @id_color
END
GO
/****** Object:  StoredProcedure [dbo].[Color_Get]    Script Date: 13/05/2018 12:52:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Color_Get](
    @id_color int
)
AS
BEGIN

    SET NOCOUNT ON;

    select 
        c.[descripcion]
        ,c.[id_color]
        ,c.[nombre]
    from [dbo].[Color] c
    where
        c.[id_color] = @id_color
END
GO
/****** Object:  StoredProcedure [dbo].[Color_Insert]    Script Date: 13/05/2018 12:52:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Color_Insert] (
    @descripcion varchar(2000) = null,
    @nombre varchar(200)
)
AS
BEGIN

    SET NOCOUNT ON;

    insert into [dbo].[Color]
    (
        [descripcion],
        [nombre]
    )
    values
    (
        @descripcion,
        @nombre
    )

    select @@IDENTITY as 'id_color'
END
GO
/****** Object:  StoredProcedure [dbo].[Color_Insert_Update]    Script Date: 13/05/2018 12:52:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Color_Insert_Update] (
    @descripcion varchar(2000),
    @id_color int,
    @nombre varchar(200)
)
AS
BEGIN

    SET NOCOUNT ON;

    if(@id_color = 0)
    begin
        insert into [dbo].[Color]
        (
            [descripcion],
            [nombre]
        )
        values
        (
            @descripcion,
            @nombre
        )

        select @@IDENTITY as 'id_color'
    end
    else
    begin
        update [dbo].[Color]
        set
            [descripcion] = @descripcion,
            [nombre] = @nombre
        where
            [id_color] = @id_color

        select @id_color as 'id_color'
    end
END
GO
/****** Object:  StoredProcedure [dbo].[Color_Select]    Script Date: 13/05/2018 12:52:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Color_Select]
AS
BEGIN

    SET NOCOUNT ON;

    select 
        c.[descripcion]
        ,c.[id_color]
        ,c.[nombre]
    from [dbo].[Color] c
END
GO
/****** Object:  StoredProcedure [dbo].[Color_Select_Producto]    Script Date: 13/05/2018 12:52:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sergio Minei
-- Create date: 18/03/2014
-- Description:	Devuelve en colores en base a una lista de productos
-- =============================================
CREATE PROCEDURE [dbo].[Color_Select_Producto]
(
	@parameter varchar(50)
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    --declare @parameter varchar(50) = '3,8'
	declare @query varchar(1000) = 'select c.id_color, c.nombre, pc.id_producto from Color c join producto_color pc on c.id_color = pc.id_color where pc.id_producto in (' + @parameter + ') order by pc.id_producto, c.nombre'

	exec (@query)
END
GO
/****** Object:  StoredProcedure [dbo].[Color_Update]    Script Date: 13/05/2018 12:52:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Color_Update] (
    @descripcion varchar(2000) = null,
    @id_color int,
    @nombre varchar(200)
)
AS
BEGIN

    SET NOCOUNT ON;

    update [dbo].[Color]
    set
        [descripcion] = @descripcion,
        [nombre] = @nombre
    where
        [id_color] = @id_color
END
GO
/****** Object:  StoredProcedure [dbo].[Devolucion_Delete]    Script Date: 13/05/2018 12:52:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Devolucion_Delete] (
    @id_devolucion int,
    @id_pedido int,
    @id_producto int
)
AS
BEGIN

    SET NOCOUNT ON;

    delete from [dbo].[Devolucion]
    where
        [id_devolucion] = @id_devolucion and 
        [id_pedido] = @id_pedido and 
        [id_producto] = @id_producto
END
GO
/****** Object:  StoredProcedure [dbo].[Devolucion_Get]    Script Date: 13/05/2018 12:52:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Devolucion_Get](
    @id_devolucion int,
    @id_pedido int,
    @id_producto int
)
AS
BEGIN

    SET NOCOUNT ON;

    select 
        d.[id_devolucion]
        ,d.[id_pedido]
        ,d.[id_producto]
        ,d.[motivo]
    from [dbo].[Devolucion] d
    where
        d.[id_devolucion] = @id_devolucion or 
        d.[id_pedido] = @id_pedido or 
        d.[id_producto] = @id_producto
END
GO
/****** Object:  StoredProcedure [dbo].[Devolucion_Insert]    Script Date: 13/05/2018 12:52:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Devolucion_Insert] (
    @id_pedido int,
    @id_producto int,
    @motivo varchar(1000)
)
AS
BEGIN

    SET NOCOUNT ON;

    insert into [dbo].[Devolucion]
    (
        [id_pedido],
        [id_producto],
        [motivo]
    )
    values
    (
        @id_pedido,
        @id_producto,
        @motivo
    )

    select @@IDENTITY as 'id_devolucion'
END
GO
/****** Object:  StoredProcedure [dbo].[Devolucion_Insert_Update]    Script Date: 13/05/2018 12:52:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Devolucion_Insert_Update] (
    @id_devolucion int,
    @id_pedido int,
    @id_producto int,
    @motivo varchar(1000)
)
AS
BEGIN

    SET NOCOUNT ON;

    if(@id_devolucion = 0 or @id_pedido = 0 or @id_producto = 0)
    begin
        insert into [dbo].[Devolucion]
        (
            [id_pedido],
            [id_producto],
            [motivo]
        )
        values
        (
            @id_pedido,
            @id_producto,
            @motivo
        )

        select @@IDENTITY as 'id_devolucion'
    end
    else
    begin
        update [dbo].[Devolucion]
        set
            [motivo] = @motivo
        where
            [id_devolucion] = @id_devolucion and 
            [id_pedido] = @id_pedido and 
            [id_producto] = @id_producto

        select @id_devolucion as 'id_devolucion'
    end
END
GO
/****** Object:  StoredProcedure [dbo].[Devolucion_Select]    Script Date: 13/05/2018 12:52:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Devolucion_Select]
AS
BEGIN

    SET NOCOUNT ON;

    select 
        d.[id_devolucion]
        ,d.[id_pedido]
        ,d.[id_producto]
        ,d.[motivo]
    from [dbo].[Devolucion] d
END
GO
/****** Object:  StoredProcedure [dbo].[Devolucion_Update]    Script Date: 13/05/2018 12:52:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Devolucion_Update] (
    @id_devolucion int,
    @id_pedido int,
    @id_producto int,
    @motivo varchar(1000)
)
AS
BEGIN

    SET NOCOUNT ON;

    update [dbo].[Devolucion]
    set
        [motivo] = @motivo
    where
        [id_devolucion] = @id_devolucion and 
        [id_pedido] = @id_pedido and 
        [id_producto] = @id_producto
END
GO
/****** Object:  StoredProcedure [dbo].[Direccion_Delete]    Script Date: 13/05/2018 12:52:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Direccion_Delete] (
    @id_direccion int
)
AS
BEGIN

    SET NOCOUNT ON;

    delete from [dbo].[Direccion]
    where
        [id_direccion] = @id_direccion
END
GO
/****** Object:  StoredProcedure [dbo].[Direccion_Get]    Script Date: 13/05/2018 12:52:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Direccion_Get](
    @id_direccion int
)
AS
BEGIN

    SET NOCOUNT ON;

    select 
        d.[direccion]
        ,d.[id_departamento]
        ,d.[id_direccion]
        ,d.[id_distrito]
        ,d.[id_provincia]
        ,d.[id_usuario]
        ,d.[nombre]
        ,d.[referencia]
		,(select u.nombre from Ubigeo u where u.CodDpto = d.id_departamento and u.CodProv = '00' and u.CodDist = '00') as 'nombre_departamento'
		,(select u.nombre from Ubigeo u where u.CodDpto = d.id_departamento and u.CodProv = d.id_provincia and u.CodDist = '00') as 'nombre_provincia'
		,(select u.nombre from Ubigeo u where u.CodDpto = d.id_departamento and u.CodProv = d.id_provincia and u.CodDist = d.id_distrito) as 'nombre_distrito'
		,(select u.precio from Ubigeo u where u.CodDpto = d.id_departamento and u.CodProv = d.id_provincia and u.CodDist = d.id_distrito) as 'precio_envio'
	from [dbo].[Direccion] d
    where
        d.[id_direccion] = @id_direccion
END
GO
/****** Object:  StoredProcedure [dbo].[Direccion_Insert]    Script Date: 13/05/2018 12:52:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Direccion_Insert] (
    @direccion varchar(500),
    @id_departamento varchar(2),
    @id_distrito varchar(2),
    @id_provincia varchar(2),
    @id_usuario int,
    @nombre varchar(500),
    @referencia varchar(500)
)
AS
BEGIN

    SET NOCOUNT ON;

	declare @cantidad int = (select count(d.id_direccion) from Direccion d where d.id_usuario = @id_usuario and d.nombre = @nombre)

	if(@cantidad <> 0) 
		select -1 as 'id_direccion'
	else
	begin
		insert into [dbo].[Direccion]
		(
			[direccion],
			[id_departamento],
			[id_distrito],
			[id_provincia],
			[id_usuario],
			[nombre],
			[referencia]
		)
		values
		(
			@direccion,
			@id_departamento,
			@id_distrito,
			@id_provincia,
			@id_usuario,
			@nombre,
			@referencia
		)

		select @@IDENTITY as 'id_direccion'
	end
END
GO
/****** Object:  StoredProcedure [dbo].[Direccion_Insert_Update]    Script Date: 13/05/2018 12:52:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Direccion_Insert_Update] (
    @direccion varchar(500),
    @id_departamento int,
    @id_direccion int,
    @id_distrito int,
    @id_provincia int,
    @id_usuario int,
    @nombre varchar(500),
    @referencia varchar(500)
)
AS
BEGIN

    SET NOCOUNT ON;

    if(@id_direccion = 0 or @id_usuario = 0)
    begin
        insert into [dbo].[Direccion]
        (
            [direccion],
            [id_departamento],
            [id_direccion],
            [id_distrito],
            [id_provincia],
            [id_usuario],
            [nombre],
            [referencia]
        )
        values
        (
            @direccion,
            @id_departamento,
            @id_direccion,
            @id_distrito,
            @id_provincia,
            @id_usuario,
            @nombre,
            @referencia
        )
    end
    else
    begin
        update [dbo].[Direccion]
        set
            [direccion] = @direccion,
            [id_departamento] = @id_departamento,
            [id_distrito] = @id_distrito,
            [id_provincia] = @id_provincia,
            [nombre] = @nombre,
            [referencia] = @referencia
        where
            [id_direccion] = @id_direccion and 
            [id_usuario] = @id_usuario

    end
END
GO
/****** Object:  StoredProcedure [dbo].[Direccion_Select]    Script Date: 13/05/2018 12:52:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Direccion_Select]
AS
BEGIN

    SET NOCOUNT ON;

    select 
        d.[direccion]
        ,d.[id_departamento]
        ,d.[id_direccion]
        ,d.[id_distrito]
        ,d.[id_provincia]
        ,d.[id_usuario]
        ,d.[nombre]
        ,d.[referencia]
    from [dbo].[Direccion] d
END
GO
/****** Object:  StoredProcedure [dbo].[Direccion_Select_Usuario]    Script Date: 13/05/2018 12:52:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Direccion_Select_Usuario]
(
	@id_usuario int
)
AS
BEGIN

    SET NOCOUNT ON;

    select 
        d.[direccion]
        ,d.[id_departamento]
        ,d.[id_direccion]
        ,d.[id_distrito]
        ,d.[id_provincia]
        ,d.[id_usuario]
        ,d.[nombre]
        ,d.[referencia]
		,(select u.nombre from Ubigeo u where u.CodDpto = d.id_departamento and u.CodProv = '00' and u.CodDist = '00') as 'nombre_departamento'
		,(select u.nombre from Ubigeo u where u.CodDpto = d.id_departamento and u.CodProv = d.id_provincia and u.CodDist = '00') as 'nombre_provincia'
		,(select u.nombre from Ubigeo u where u.CodDpto = d.id_departamento and u.CodProv = d.id_provincia and u.CodDist = d.id_distrito) as 'nombre_distrito'
	from [dbo].[Direccion] d
	where id_usuario = @id_usuario
END
GO
/****** Object:  StoredProcedure [dbo].[Direccion_Update]    Script Date: 13/05/2018 12:52:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Direccion_Update] (
    @direccion varchar(500),
    @id_departamento varchar(2),
    @id_direccion int,
    @id_distrito varchar(2),
    @id_provincia varchar(2),
    @id_usuario int,
    @nombre varchar(500),
    @referencia varchar(500)
)
AS
BEGIN

    SET NOCOUNT ON;

	declare @cantidad int = (select count(d.id_direccion) from Direccion d where d.id_usuario = @id_usuario and d.nombre = @nombre and d.id_direccion <> d.id_direccion)

	if(@cantidad <> 0) 
		select -1 as 'id_direccion'
	else
	begin
		update [dbo].[Direccion]
		set
			[direccion] = @direccion,
			[id_departamento] = @id_departamento,
			[id_distrito] = @id_distrito,
			[id_provincia] = @id_provincia,
			[nombre] = @nombre,
			[referencia] = @referencia,
			[id_usuario] = @id_usuario
		where
			[id_direccion] = @id_direccion

		select 1 as 'id_direccion'
	end
        
END
GO
/****** Object:  StoredProcedure [dbo].[Elemento_Atributo_Delete]    Script Date: 13/05/2018 12:52:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Elemento_Atributo_Delete] (
    @id_elemento_atributo int
)
AS
BEGIN

    SET NOCOUNT ON;

	delete from Producto_Elemento_Atributo
	where id_elemento_atributo = @id_elemento_atributo

    delete from [dbo].[Elemento_Atributo]
    where
        [id_elemento_atributo] = @id_elemento_atributo
END
GO
/****** Object:  StoredProcedure [dbo].[Elemento_Atributo_Get]    Script Date: 13/05/2018 12:52:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Elemento_Atributo_Get](
    @id_atributo int,
    @id_elemento_atributo int
)
AS
BEGIN

    SET NOCOUNT ON;

    select 
        e.[id_atributo]
        ,e.[id_elemento_atributo]
        ,e.[nombre]
    from [dbo].[Elemento_Atributo] e
    where
        e.[id_atributo] = @id_atributo or 
        e.[id_elemento_atributo] = @id_elemento_atributo
END
GO
/****** Object:  StoredProcedure [dbo].[Elemento_Atributo_Get_Atributo]    Script Date: 13/05/2018 12:52:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sergio Minei
-- Create date: 21/08/2014
-- Description:	Muestra todos los elementos de un atributo
-- =============================================
CREATE PROCEDURE [dbo].[Elemento_Atributo_Get_Atributo]
(
	@id_atributo int
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    select ea.id_atributo
		,ea.id_elemento_atributo
		,ea.nombre
	from Elemento_Atributo ea
	where ea.id_atributo = @id_atributo
	order by ea.nombre
END
GO
/****** Object:  StoredProcedure [dbo].[Elemento_Atributo_Insert]    Script Date: 13/05/2018 12:52:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Elemento_Atributo_Insert] (
    @id_atributo int,
    @nombre varchar(200)
)
AS
BEGIN

    SET NOCOUNT ON;

    insert into [dbo].[Elemento_Atributo]
    (
        [id_atributo],
        [nombre]
    )
    values
    (
        @id_atributo,
        @nombre
    )
END
GO
/****** Object:  StoredProcedure [dbo].[Elemento_Atributo_Select]    Script Date: 13/05/2018 12:52:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Elemento_Atributo_Select]
AS
BEGIN

    SET NOCOUNT ON;

    select 
        e.[id_atributo]
        ,e.[id_elemento_atributo]
        ,e.[nombre]
    from [dbo].[Elemento_Atributo] e
	order by e.nombre
END
GO
/****** Object:  StoredProcedure [dbo].[Elemento_Atributo_Update]    Script Date: 13/05/2018 12:52:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Elemento_Atributo_Update] (
    @id_atributo int,
    @id_elemento_atributo int,
    @nombre varchar(200)
)
AS
BEGIN

    SET NOCOUNT ON;

    update [dbo].[Elemento_Atributo]
    set
        [nombre] = @nombre
    where
        [id_atributo] = @id_atributo and 
        [id_elemento_atributo] = @id_elemento_atributo
END
GO
/****** Object:  StoredProcedure [dbo].[Forma_Pago_Delete]    Script Date: 13/05/2018 12:52:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Forma_Pago_Delete] (
    @id_forma_pago int
)
AS
BEGIN

    SET NOCOUNT ON;

    delete from [dbo].[Forma_Pago]
    where
        [id_forma_pago] = @id_forma_pago
END
GO
/****** Object:  StoredProcedure [dbo].[Forma_Pago_Get]    Script Date: 13/05/2018 12:52:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Forma_Pago_Get](
    @id_forma_pago int
)
AS
BEGIN

    SET NOCOUNT ON;

    select 
        f.[descripcion]
        ,f.[id_forma_pago]
        ,f.[nombre]
    from [dbo].[Forma_Pago] f
    where
        f.[id_forma_pago] = @id_forma_pago
END
GO
/****** Object:  StoredProcedure [dbo].[Forma_Pago_Insert]    Script Date: 13/05/2018 12:52:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Forma_Pago_Insert] (
    @descripcion varchar(1000) = null,
    @id_forma_pago int,
    @nombre varchar(200)
)
AS
BEGIN

    SET NOCOUNT ON;

    insert into [dbo].[Forma_Pago]
    (
        [descripcion],
        [id_forma_pago],
        [nombre]
    )
    values
    (
        @descripcion,
        @id_forma_pago,
        @nombre
    )
END
GO
/****** Object:  StoredProcedure [dbo].[Forma_Pago_Insert_Update]    Script Date: 13/05/2018 12:52:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Forma_Pago_Insert_Update] (
    @descripcion varchar(1000) = null,
    @id_forma_pago int,
    @nombre varchar(200)
)
AS
BEGIN

    SET NOCOUNT ON;

    if(@id_forma_pago = 0)
    begin
        insert into [dbo].[Forma_Pago]
        (
            [descripcion],
            [id_forma_pago],
            [nombre]
        )
        values
        (
            @descripcion,
            @id_forma_pago,
            @nombre
        )
    end
    else
    begin
        update [dbo].[Forma_Pago]
        set
            [descripcion] = @descripcion,
            [nombre] = @nombre
        where
            [id_forma_pago] = @id_forma_pago

    end
END
GO
/****** Object:  StoredProcedure [dbo].[Forma_Pago_Select]    Script Date: 13/05/2018 12:52:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Forma_Pago_Select]
AS
BEGIN

    SET NOCOUNT ON;

    select 
        f.[descripcion]
        ,f.[id_forma_pago]
        ,f.[nombre]
    from [dbo].[Forma_Pago] f
END
GO
/****** Object:  StoredProcedure [dbo].[Forma_Pago_Update]    Script Date: 13/05/2018 12:52:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Forma_Pago_Update] (
    @descripcion varchar(1000) = null,
    @id_forma_pago int,
    @nombre varchar(200)
)
AS
BEGIN

    SET NOCOUNT ON;

    update [dbo].[Forma_Pago]
    set
        [descripcion] = @descripcion,
        [nombre] = @nombre
    where
        [id_forma_pago] = @id_forma_pago
END
GO
/****** Object:  StoredProcedure [dbo].[Imagen_Producto_Delete]    Script Date: 13/05/2018 12:52:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Imagen_Producto_Delete] (
    @id_imagen int,
    @id_producto int
)
AS
BEGIN

    SET NOCOUNT ON;

    delete from [dbo].[Imagen_Producto]
    where
        [id_imagen] = @id_imagen and 
        [id_producto] = @id_producto
END
GO
/****** Object:  StoredProcedure [dbo].[Imagen_Producto_Get]    Script Date: 13/05/2018 12:52:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Imagen_Producto_Get](
    @id_imagen int,
    @id_producto int
)
AS
BEGIN

    SET NOCOUNT ON;

    select 
        i.[id_imagen]
        ,i.[id_producto]
        ,i.[nombre]
		,i.mostrar_primero
    from [dbo].[Imagen_Producto] i
    where
        i.[id_imagen] = @id_imagen
END
GO
/****** Object:  StoredProcedure [dbo].[Imagen_Producto_Insert]    Script Date: 13/05/2018 12:52:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Imagen_Producto_Insert] (
    @id_producto int,
    @nombre varchar(100),
	@mostrar_primero bit
)
AS
BEGIN

    SET NOCOUNT ON;

    insert into [dbo].[Imagen_Producto]
    (
        [id_producto],
        [nombre],
		mostrar_primero
    )
    values
    (
        @id_producto,
        @nombre,
		@mostrar_primero
    )

    declare @id_imagen int = @@IDENTITY

	update Imagen_Producto
	set nombre = CONCAT(@id_imagen, nombre)
	where id_imagen = @id_imagen

	select @id_imagen as 'id_imagen'
END
GO
/****** Object:  StoredProcedure [dbo].[Imagen_Producto_Insert_Update]    Script Date: 13/05/2018 12:52:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Imagen_Producto_Insert_Update] (
    @id_imagen int,
    @id_producto int,
    @nombre varchar(100)
)
AS
BEGIN

    SET NOCOUNT ON;

    if(@id_imagen = 0 or @id_producto = 0)
    begin
        insert into [dbo].[Imagen_Producto]
        (
            [id_producto],
            [nombre]
        )
        values
        (
            @id_producto,
            @nombre
        )

        select @@IDENTITY as 'id_imagen'
    end
    else
    begin
        update [dbo].[Imagen_Producto]
        set
            [nombre] = @nombre
        where
            [id_imagen] = @id_imagen and 
            [id_producto] = @id_producto

        select @id_imagen as 'id_imagen'
    end
END
GO
/****** Object:  StoredProcedure [dbo].[Imagen_Producto_Select]    Script Date: 13/05/2018 12:52:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Imagen_Producto_Select]
AS
BEGIN

    SET NOCOUNT ON;

    select 
        i.[id_imagen]
        ,i.[id_producto]
        ,i.[nombre]
    from [dbo].[Imagen_Producto] i
END
GO
/****** Object:  StoredProcedure [dbo].[Imagen_Producto_Update]    Script Date: 13/05/2018 12:52:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Imagen_Producto_Update] (
    @id_imagen int,
    @id_producto int,
    @nombre varchar(100),
	@mostrar_primero bit
)
AS
BEGIN

    SET NOCOUNT ON;

    update [dbo].[Imagen_Producto]
    set
        [nombre] = @nombre,
		id_producto = @id_producto,
		mostrar_primero = @mostrar_primero
    where
        [id_imagen] = @id_imagen
END
GO
/****** Object:  StoredProcedure [dbo].[Login]    Script Date: 13/05/2018 12:52:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sergio Minei
-- Create date: 10/02/2014
-- Description:	Permite al usuario ingresar al sistema
-- =============================================
CREATE PROCEDURE [dbo].[Login]
	@usuario varchar(150),
	@password varchar(150)
AS
BEGIN
	SET NOCOUNT ON;

    select 
		u.apellido_materno
		,u.apellido_paterno
		,u.celular
		,u.dni
		,u.email
		,u.fecha_creacion
		,u.fecha_nacimiento
		,u.id_rol
		,u.id_usuario
		,u.nombre
		,u.telefono
		,u.usuario
		,u.activo_correo
	from Usuario u
	where u.usuario = @usuario 
		and u.password = HASHBYTES('SHA1', @password)
		and u.activo = 1
END
GO
/****** Object:  StoredProcedure [dbo].[Operador_Logistico_Get]    Script Date: 13/05/2018 12:52:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Operador_Logistico_Get](
    @id_operador int
)
AS
BEGIN

    SET NOCOUNT ON;

    select 
        o.[Costo_Lima]
        ,o.[Costo_Provincia]
        ,o.[Habilitado]
        ,o.[Id_Operador]
        ,o.[Nombre]
        ,o.[Tiempo_Entrega]
    from [dbo].[Operador_Logistico] o
    where
        o.[Id_Operador] = @id_operador
END
GO
/****** Object:  StoredProcedure [dbo].[Operador_Logistico_Insert]    Script Date: 13/05/2018 12:52:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Operador_Logistico_Insert] (
    @costo_lima decimal(5, 2),
    @costo_provincia decimal(5, 2),
    @habilitado bit,
    @nombre varchar(50),
    @tiempo_entrega varchar(100)
)
AS
BEGIN

    SET NOCOUNT ON;

    insert into [dbo].[Operador_Logistico]
    (
        [Costo_Lima],
        [Costo_Provincia],
        [Habilitado],
        [Nombre],
        [Tiempo_Entrega]
    )
    values
    (
        @costo_lima,
        @costo_provincia,
        @habilitado,
        @nombre,
        @tiempo_entrega
    )

    select @@IDENTITY as 'id_operador'
END
GO
/****** Object:  StoredProcedure [dbo].[Operador_Logistico_Select]    Script Date: 13/05/2018 12:52:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Operador_Logistico_Select]
AS
BEGIN

    SET NOCOUNT ON;

    select 
        o.[Costo_Lima]
        ,o.[Costo_Provincia]
        ,o.[Habilitado]
        ,o.[Id_Operador]
        ,o.[Nombre]
        ,o.[Tiempo_Entrega]
    from [dbo].[Operador_Logistico] o
END
GO
/****** Object:  StoredProcedure [dbo].[Operador_Logistico_Select_Habilitado]    Script Date: 13/05/2018 12:52:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Operador_Logistico_Select_Habilitado]
AS
BEGIN

    SET NOCOUNT ON;

    select 
        o.[Costo_Lima]
        ,o.[Costo_Provincia]
        ,o.[Habilitado]
        ,o.[Id_Operador]
        ,o.[Nombre]
        ,o.[Tiempo_Entrega]
    from [dbo].[Operador_Logistico] o
	where o.Habilitado = 1;
END
GO
/****** Object:  StoredProcedure [dbo].[Operador_Logistico_Update]    Script Date: 13/05/2018 12:52:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Operador_Logistico_Update] (
    @costo_lima decimal(5, 2),
    @costo_provincia decimal(5, 2),
    @habilitado bit,
    @id_operador int,
    @nombre varchar(50),
    @tiempo_entrega varchar(100)
)
AS
BEGIN

    SET NOCOUNT ON;

    update [dbo].[Operador_Logistico]
    set
        [Costo_Lima] = @costo_lima,
        [Costo_Provincia] = @costo_provincia,
        [Habilitado] = @habilitado,
        [Nombre] = @nombre,
        [Tiempo_Entrega] = @tiempo_entrega
    where
        [Id_Operador] = @id_operador
END
GO
/****** Object:  StoredProcedure [dbo].[Operador_Logistico_Update_Activo]    Script Date: 13/05/2018 12:52:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sergio Minei
-- Create date: 26/05/2014
-- Description:	Cambiar a activo/no activo de un operador logistico
-- =============================================
CREATE PROCEDURE [dbo].[Operador_Logistico_Update_Activo]
(
	@Id_Operador int
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	declare @habilitado bit = (select op.habilitado from Operador_Logistico op where op.Id_Operador = @Id_Operador)

	if(@habilitado = 1)
		set @habilitado = 0
	else
		set @habilitado = 1

    update Operador_Logistico
	set habilitado = @habilitado
	where Id_Operador = @Id_Operador
END
GO
/****** Object:  StoredProcedure [dbo].[Pedido_Buscar]    Script Date: 13/05/2018 12:52:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sergio Minei
-- Create date: 01/09/2014
-- Description:	Devuelve una lista de pedidos en base a una bíusqueda
-- =============================================
CREATE PROCEDURE [dbo].[Pedido_Buscar]
(
	@fecha_compra_inicio datetime = null,
	@fecha_compra_fin datetime = null,
	@usuario varchar(150) = null,
	@estado int = null
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SET DATEFORMAT dmy;

    select p.id_pedido
		,p.id_usuario
		,p.total
		,p.fecha_compra
		,p.id_forma_pago
		,p.precio_envio
		,p.subtotal
		,p.id_tipo_recibo
		,p.razon_social
		,p.ruc
		,(select fp.nombre from Forma_Pago fp where fp.id_forma_pago = p.id_forma_pago) as 'Nombre_Forma_Pago'
		,(select case when p.id_pedido = 1 then 'Boleta' else 'Factura' end) as 'Nombre_Tipo_Recibo'
		,(select u.usuario from Usuario u where u.id_usuario = p.id_usuario) as 'Nombre_Usuario'
		,p.estado
	from Pedido p join usuario u on p.id_usuario = u.id_usuario
	where p.estado = isnull(@estado, p.estado)
		and u.usuario like isnull(concat('%',@usuario,'%'), u.usuario)
		and p.fecha_compra between isnull(@fecha_compra_inicio, '01/01/2000') and ISNULL(@fecha_compra_fin, '01/01/2100')
	order by p.fecha_compra desc
END
GO
/****** Object:  StoredProcedure [dbo].[Pedido_Delete]    Script Date: 13/05/2018 12:52:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Pedido_Delete] (
    @id_forma_pago int,
    @id_pedido int,
    @id_usuario int
)
AS
BEGIN

    SET NOCOUNT ON;

    delete from [dbo].[Pedido]
    where
        [id_forma_pago] = @id_forma_pago and 
        [id_pedido] = @id_pedido and 
        [id_usuario] = @id_usuario
END
GO
/****** Object:  StoredProcedure [dbo].[Pedido_Direccion_Delete]    Script Date: 13/05/2018 12:52:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Pedido_Direccion_Delete] (
    @id_pedido_direccion int
)
AS
BEGIN

    SET NOCOUNT ON;

    delete from [dbo].[Pedido_Direccion]
    where
        [id_pedido_direccion] = @id_pedido_direccion
END
GO
/****** Object:  StoredProcedure [dbo].[Pedido_Direccion_Get]    Script Date: 13/05/2018 12:52:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Pedido_Direccion_Get](
    @id_pedido_direccion int
)
AS
BEGIN

    SET NOCOUNT ON;

    select 
        p.[departamento]
        ,p.[direccion]
        ,p.[distrito]
        ,p.[id_pedido_direccion]
        ,p.[provincia]
        ,p.[referencia]
    from [dbo].[Pedido_Direccion] p
    where
        p.[id_pedido_direccion] = @id_pedido_direccion
END
GO
/****** Object:  StoredProcedure [dbo].[Pedido_Direccion_Insert]    Script Date: 13/05/2018 12:52:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Pedido_Direccion_Insert] (
    @departamento varchar(50),
    @direccion varchar(500),
    @distrito varchar(50),
    @provincia varchar(50),
    @referencia varchar(500),
	@id_pedido int,
	@id_tipo_direccion int
)
AS
BEGIN

    SET NOCOUNT ON;

    insert into [dbo].[Pedido_Direccion]
    (
        [departamento],
        [direccion],
        [distrito],
        [provincia],
        [referencia],
		id_pedido,
		id_tipo_direccion
    )
    values
    (
        @departamento,
        @direccion,
        @distrito,
        @provincia,
        @referencia,
		@id_pedido,
		@id_tipo_direccion
    )
END
GO
/****** Object:  StoredProcedure [dbo].[Pedido_Direccion_Insert_Update]    Script Date: 13/05/2018 12:52:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Pedido_Direccion_Insert_Update] (
    @departamento varchar(50),
    @direccion varchar(500),
    @distrito varchar(50),
    @id_pedido_direccion int,
    @provincia varchar(50),
    @referencia varchar(500)
)
AS
BEGIN

    SET NOCOUNT ON;

    if(@id_pedido_direccion = 0)
    begin
        insert into [dbo].[Pedido_Direccion]
        (
            [departamento],
            [direccion],
            [distrito],
            [id_pedido_direccion],
            [provincia],
            [referencia]
        )
        values
        (
            @departamento,
            @direccion,
            @distrito,
            @id_pedido_direccion,
            @provincia,
            @referencia
        )
    end
    else
    begin
        update [dbo].[Pedido_Direccion]
        set
            [departamento] = @departamento,
            [direccion] = @direccion,
            [distrito] = @distrito,
            [provincia] = @provincia,
            [referencia] = @referencia
        where
            [id_pedido_direccion] = @id_pedido_direccion

    end
END
GO
/****** Object:  StoredProcedure [dbo].[Pedido_Direccion_Select]    Script Date: 13/05/2018 12:52:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Pedido_Direccion_Select]
AS
BEGIN

    SET NOCOUNT ON;

    select 
        p.[departamento]
        ,p.[direccion]
        ,p.[distrito]
        ,p.[id_pedido_direccion]
        ,p.[provincia]
        ,p.[referencia]
    from [dbo].[Pedido_Direccion] p
END
GO
/****** Object:  StoredProcedure [dbo].[Pedido_Direccion_Update]    Script Date: 13/05/2018 12:52:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Pedido_Direccion_Update] (
    @departamento varchar(50),
    @direccion varchar(500),
    @distrito varchar(50),
    @id_pedido_direccion int,
    @provincia varchar(50),
    @referencia varchar(500)
)
AS
BEGIN

    SET NOCOUNT ON;

    update [dbo].[Pedido_Direccion]
    set
        [departamento] = @departamento,
        [direccion] = @direccion,
        [distrito] = @distrito,
        [provincia] = @provincia,
        [referencia] = @referencia
    where
        [id_pedido_direccion] = @id_pedido_direccion
END
GO
/****** Object:  StoredProcedure [dbo].[Pedido_Get]    Script Date: 13/05/2018 12:52:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Pedido_Get](
    @id_forma_pago int,
    @id_pedido int,
    @id_usuario int
)
AS
BEGIN

    SET NOCOUNT ON;

    select 
        p.[fecha_compra]
        ,p.[id_forma_pago]
        ,p.[id_pedido]
        ,p.[id_usuario]
        ,p.[total]
    from [dbo].[Pedido] p
    where
        p.[id_forma_pago] = @id_forma_pago or 
        p.[id_pedido] = @id_pedido or 
        p.[id_usuario] = @id_usuario
END
GO
/****** Object:  StoredProcedure [dbo].[Pedido_Get_Completo]    Script Date: 13/05/2018 12:52:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sergio Minei
-- Create date: 26/03/2014
-- Description:	Muestra todos los datos de un pedido
-- =============================================
CREATE PROCEDURE [dbo].[Pedido_Get_Completo]
(
	@id_pedido int
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    select p.id_pedido
		,p.id_usuario
		,p.total
		,p.fecha_compra
		,p.id_forma_pago
		,p.precio_envio
		,p.subtotal
		,p.id_tipo_recibo
		,p.razon_social
		,p.ruc
		,(select fp.nombre from Forma_Pago fp where fp.id_forma_pago = p.id_forma_pago) as 'Nombre_Forma_Pago'
		,(select case when p.id_tipo_recibo = 1 then 'Boleta' else 'Factura' end) as 'Nombre_Tipo_Recibo'
	from Pedido p
	where p.id_pedido = @id_pedido
	order by p.fecha_compra desc

	select pd.id_pedido_direccion
		,pd.departamento
		,pd.distrito
		,pd.provincia
		,pd.referencia
		,pd.direccion
		,pd.id_pedido
		,pd.id_tipo_direccion
		,(select case when pd.id_pedido_direccion = 1 then 'Envío' else 'Facturación' end) as 'Nombre_Tipo_Direccion'
	from Pedido_Direccion pd
	where pd.id_pedido = @id_pedido
	order by pd.id_tipo_direccion asc

	select pp.id_pedido
		,pp.id_producto
		,pp.precio
		,pp.cantidad
		,p.nombre
		,ip.nombre as 'nombre_imagen'
		,pp.id_pedido_producto
	from Pedido_Producto pp join Producto p on pp.id_producto = p.id_producto
		join Imagen_Producto ip on p.id_producto = ip.id_producto
	where pp.id_pedido = @id_pedido
		and ip.mostrar_primero = 1
	order by p.nombre

	select ppea.atributo
		,ppea.element
		,ppea.id_pedido_producto
		,ppea.id_pedido_producto_elemento_atributo
	from Pedido_Producto_Elemento_Atributo ppea join Pedido_Producto pp on ppea.id_pedido_producto = pp.id_pedido_producto
	where pp.id_pedido = @id_pedido
END
GO
/****** Object:  StoredProcedure [dbo].[Pedido_Get_Completo_Cip]    Script Date: 13/05/2018 12:52:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sergio Minei
-- Create date: 18/06/2014
-- Description:	Muestra todos los datos de un pedido
-- =============================================
CREATE PROCEDURE [dbo].[Pedido_Get_Completo_Cip]
(
	@cip varchar(15)
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    select p.id_pedido
		,p.id_usuario
		,p.total
		,p.fecha_compra
		,p.id_forma_pago
		,p.precio_envio
		,p.subtotal
		,p.id_tipo_recibo
		,p.razon_social
		,p.ruc
		,(select fp.nombre from Forma_Pago fp where fp.id_forma_pago = p.id_forma_pago) as 'Nombre_Forma_Pago'
		,(select case when p.id_tipo_recibo = 1 then 'Boleta' else 'Factura' end) as 'Nombre_Tipo_Recibo'
		,u.email
	from Pedido p join Usuario u on p.id_usuario = u.id_usuario
	where p.cip = @cip 
		and p.estado <> 3
		and p.estado <> 4
	order by p.fecha_compra desc

	select pd.id_pedido_direccion
		,pd.departamento
		,pd.distrito
		,pd.provincia
		,pd.referencia
		,pd.direccion
		,pd.id_pedido
		,pd.id_tipo_direccion
		,(select case when pd.id_pedido_direccion = 1 then 'Envío' else 'Facturación' end) as 'Nombre_Tipo_Direccion'
	from Pedido_Direccion pd join Pedido p on pd.id_pedido = p.id_pedido
	where p.cip = @cip 
		and p.estado <> 3
		and p.estado <> 4
	order by pd.id_tipo_direccion asc

	select pp.id_pedido
		,pp.id_producto
		,pp.precio
		,pp.cantidad
		,p.nombre
		,ip.nombre as 'nombre_imagen'
	from Pedido_Producto pp join Producto p on pp.id_producto = p.id_producto
		join Imagen_Producto ip on p.id_producto = ip.id_producto
		join Pedido pe on pp.id_pedido = pe.id_pedido
	where pe.cip = @cip 
		and pe.estado <> 3
		and pe.estado <> 4
		and ip.mostrar_primero = 1
	order by p.nombre
END
GO
/****** Object:  StoredProcedure [dbo].[Pedido_Insert]    Script Date: 13/05/2018 12:52:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Pedido_Insert] (
    @id_forma_pago int,
    @id_usuario int,
    @total decimal(10, 2),
	@precio_envio decimal(5,2),
	@subtotal decimal(10,2),
	@id_tipo_recibo int,
	@razon_social varchar(100) = null,
	@ruc varchar(15) = null,
	@operador_logistico varchar(50),
	@tiempo_entrega varchar(100),
	@cip varchar(15) = null
)
AS
BEGIN

    SET NOCOUNT ON;

    insert into [dbo].[Pedido]
    (
        [fecha_compra],
        [id_forma_pago],
        [id_usuario],
        [total],
		precio_envio,
		subtotal,
		id_tipo_recibo,
		razon_social,
		ruc,
		operador_logistico,
		tiempo_entrega,
		cip
    )
    values
    (
        getdate(),
        @id_forma_pago,
        @id_usuario,
        @total,
		@precio_envio,
		@subtotal,
		@id_tipo_recibo,
		@razon_social,
		@ruc,
		@operador_logistico,
		@tiempo_entrega,
		@cip
    )

	select @@IDENTITY as 'id_pedido'
END
GO
/****** Object:  StoredProcedure [dbo].[Pedido_Insert_Update]    Script Date: 13/05/2018 12:52:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Pedido_Insert_Update] (
    @fecha_compra datetime,
    @id_forma_pago int = null,
    @id_pedido int,
    @id_usuario int,
    @total decimal(10, 10)
)
AS
BEGIN

    SET NOCOUNT ON;

    if(@id_forma_pago = 0 or @id_pedido = 0 or @id_usuario = 0)
    begin
        insert into [dbo].[Pedido]
        (
            [fecha_compra],
            [id_forma_pago],
            [id_pedido],
            [id_usuario],
            [total]
        )
        values
        (
            @fecha_compra,
            @id_forma_pago,
            @id_pedido,
            @id_usuario,
            @total
        )
    end
    else
    begin
        update [dbo].[Pedido]
        set
            [fecha_compra] = @fecha_compra,
            [total] = @total
        where
            [id_forma_pago] = @id_forma_pago and 
            [id_pedido] = @id_pedido and 
            [id_usuario] = @id_usuario

    end
END
GO
/****** Object:  StoredProcedure [dbo].[Pedido_Producto_Elemento_Atributo_Insert]    Script Date: 13/05/2018 12:52:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Pedido_Producto_Elemento_Atributo_Insert] (
    @atributo varchar(200),
    @element varchar(200),
    @id_pedido_producto int
)
AS
BEGIN

    SET NOCOUNT ON;

    insert into [dbo].[Pedido_Producto_Elemento_Atributo]
    (
        [atributo],
        [element],
        [id_pedido_producto]
    )
    values
    (
        @atributo,
        @element,
        @id_pedido_producto
    )

	select @@IDENTITY as 'id_pedido_producto_elemento_atributo'
END
GO
/****** Object:  StoredProcedure [dbo].[Pedido_Producto_Insert]    Script Date: 13/05/2018 12:52:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Pedido_Producto_Insert] (
    @cantidad int,
    @id_pedido int,
    @id_producto int,
    @precio decimal(7, 2)
)
AS
BEGIN

    SET NOCOUNT ON;

    insert into [dbo].[Pedido_Producto]
    (
        [cantidad],
        [id_pedido],
        [id_producto],
        [precio]
    )
    values
    (
        @cantidad,
        @id_pedido,
        @id_producto,
        @precio
    )

	declare @id_pedido_producto int = @@IDENTITY

	update producto 
	set cantidad_vendidos = cantidad_vendidos + @cantidad
	where id_producto = @id_producto

	select @id_pedido_producto as 'id_pedido_producto'
END
GO
/****** Object:  StoredProcedure [dbo].[Pedido_Select]    Script Date: 13/05/2018 12:52:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Pedido_Select]
AS
BEGIN

    SET NOCOUNT ON;

    select p.id_pedido
		,p.id_usuario
		,p.total
		,p.fecha_compra
		,p.id_forma_pago
		,p.precio_envio
		,p.subtotal
		,p.id_tipo_recibo
		,p.razon_social
		,p.ruc
		,(select fp.nombre from Forma_Pago fp where fp.id_forma_pago = p.id_forma_pago) as 'Nombre_Forma_Pago'
		,(select case when p.id_pedido = 1 then 'Boleta' else 'Factura' end) as 'Nombre_Tipo_Recibo'
		,(select u.usuario from Usuario u where u.id_usuario = p.id_usuario) as 'Nombre_Usuario'
		,p.estado
	from Pedido p
	order by p.fecha_compra desc
END
GO
/****** Object:  StoredProcedure [dbo].[Pedido_Select_Usuario]    Script Date: 13/05/2018 12:52:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sergio Minei
-- Create date: 26/03/2014
-- Description:	Muestra todos los pedidos de un usuario
-- =============================================
CREATE PROCEDURE [dbo].[Pedido_Select_Usuario]
(
	@id_usuario int
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    select p.id_pedido
		,p.id_usuario
		,p.total
		,p.fecha_compra
		,p.id_forma_pago
		,p.precio_envio
		,p.subtotal
		,p.id_tipo_recibo
		,p.razon_social
		,p.ruc
		,(select fp.nombre from Forma_Pago fp where fp.id_forma_pago = p.id_forma_pago) as 'Nombre_Forma_Pago'
		,(select case when p.id_pedido = 1 then 'Boleta' else 'Factura' end) as 'Nombre_Tipo_Recibo'
		,p.estado
	from Pedido p
	where p.id_usuario = @id_usuario
	order by p.fecha_compra desc
END
GO
/****** Object:  StoredProcedure [dbo].[Pedido_Update]    Script Date: 13/05/2018 12:52:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Pedido_Update] (
    @fecha_compra datetime,
    @id_forma_pago int = null,
    @id_pedido int,
    @id_usuario int,
    @total decimal(10, 10)
)
AS
BEGIN

    SET NOCOUNT ON;

    update [dbo].[Pedido]
    set
        [fecha_compra] = @fecha_compra,
        [total] = @total
    where
        [id_forma_pago] = @id_forma_pago and 
        [id_pedido] = @id_pedido and 
        [id_usuario] = @id_usuario
END
GO
/****** Object:  StoredProcedure [dbo].[Pedido_Update_Estado]    Script Date: 13/05/2018 12:52:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sergio Minei
-- Create date: 20/06/2014
-- Description:	Cambia el estado de un pedido
-- =============================================
CREATE PROCEDURE [dbo].[Pedido_Update_Estado]
(
	@id_pedido int,
	@estado int
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    update Pedido
	set estado = @estado
	where id_pedido = @id_pedido
END
GO
/****** Object:  StoredProcedure [dbo].[Pedido_Update_Estado_Cip]    Script Date: 13/05/2018 12:52:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sergio Minei
-- Create date: 13/06/2014
-- Description:	Cambia el estado de un pedido en base a un CIP
-- =============================================
CREATE PROCEDURE [dbo].[Pedido_Update_Estado_Cip]
(
	@cip varchar(15),
	@estado int
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    update Pedido
	set estado = @estado
	where cip = @cip
		and estado <> 3
		and estado <> 4
END
GO
/****** Object:  StoredProcedure [dbo].[Producto_Buscar]    Script Date: 13/05/2018 12:52:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sergio Minei
-- Create date: 25/03/2014
-- Description:	Devuelve todos los productos en base una busqueda
-- =============================================
CREATE PROCEDURE [dbo].[Producto_Buscar]
(
	@nombre varchar(200) = null,
	@activo bit = null
)
AS
BEGIN
	SET NOCOUNT ON;

    select 
		ip.id_imagen
		,ip.mostrar_primero
		,ip.nombre as 'nombre_imagen'
		,ip.id_producto
		,p.activo
		,p.cantidad_vendidos
		,p.descripcion
		,p.descuento
		,p.destacado
		,p.detalle
		,p.fecha_creacion
		,p.fecha_modificacion
		,p.id_producto
		,p.id_usuario_creacion
		,p.id_usuario_modificacion
		,p.nombre
		,p.precio
		,p.descripcion_corta
	from producto p join Imagen_Producto ip on p.id_producto = ip.id_producto
	where p.activo = isnull(@activo, p.activo)
		and ip.mostrar_primero = 1
		and p.nombre like isnull(concat('%',@nombre,'%'), p.nombre)
	order by p.fecha_creacion desc, p.id_producto

	select 
		c.descripcion
		,c.id_color
		,c.nombre
		,pc.id_producto
	from color c join Producto_Color pc on c.id_color = pc.id_color
		join Producto p on p.id_producto = pc.id_producto
	where p.activo = isnull(@activo, p.activo)
		and p.nombre like isnull(concat('%',@nombre,'%'), p.nombre)
	order by p.fecha_creacion desc, p.id_producto

	select
		c.descripcion
		,c.id_categoria
		,c.id_padre
		,c.nombre
		,cp.id_producto
	from Categoria c join Producto_Categoria cp on c.id_categoria = cp.id_categoria
		join producto p on p.id_producto = cp.id_producto
	where p.activo = isnull(@activo, p.activo)
		and p.nombre like isnull(concat('%',@nombre,'%'), p.nombre)
	order by p.fecha_creacion desc, p.id_producto
END
GO
/****** Object:  StoredProcedure [dbo].[Producto_Categoria_Delete]    Script Date: 13/05/2018 12:52:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Producto_Categoria_Delete] (
    @id_categoria int,
    @id_producto int
)
AS
BEGIN

    SET NOCOUNT ON;

    delete from [dbo].[Producto_Categoria]
    where
        [id_categoria] = @id_categoria and 
        [id_producto] = @id_producto
END
GO
/****** Object:  StoredProcedure [dbo].[Producto_Categoria_Delete_Producto]    Script Date: 13/05/2018 12:52:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sergio Minei
-- Create date: 23/04/2014
-- Description:	Elimina todas las categorias de un producto
-- =============================================
CREATE PROCEDURE [dbo].[Producto_Categoria_Delete_Producto]
(
	@id_producto int
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    delete from Producto_Categoria
	where id_producto = @id_producto
END
GO
/****** Object:  StoredProcedure [dbo].[Producto_Categoria_Get]    Script Date: 13/05/2018 12:52:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Producto_Categoria_Get](
    @id_categoria int,
    @id_producto int
)
AS
BEGIN

    SET NOCOUNT ON;

    select 
        p.[id_categoria]
        ,p.[id_producto]
    from [dbo].[Producto_Categoria] p
    where
        p.[id_categoria] = @id_categoria or 
        p.[id_producto] = @id_producto
END
GO
/****** Object:  StoredProcedure [dbo].[Producto_Categoria_Insert]    Script Date: 13/05/2018 12:52:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Producto_Categoria_Insert] (
    @id_categoria int,
    @id_producto int
)
AS
BEGIN

    SET NOCOUNT ON;

    insert into [dbo].[Producto_Categoria]
    (
        [id_categoria],
        [id_producto]
    )
    values
    (
        @id_categoria,
        @id_producto
    )
END
GO
/****** Object:  StoredProcedure [dbo].[Producto_Categoria_Select]    Script Date: 13/05/2018 12:52:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Producto_Categoria_Select]
AS
BEGIN

    SET NOCOUNT ON;

    select 
        p.[id_categoria]
        ,p.[id_producto]
    from [dbo].[Producto_Categoria] p
END
GO
/****** Object:  StoredProcedure [dbo].[Producto_Color_Delete_Producto]    Script Date: 13/05/2018 12:52:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sergio Minei
-- Create date: 23/04/2014
-- Description:	Elimina todos los colores de un producto
-- =============================================
CREATE PROCEDURE [dbo].[Producto_Color_Delete_Producto]
(
	@id_producto int
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    delete from Producto_Color
	where id_producto = @id_producto
END
GO
/****** Object:  StoredProcedure [dbo].[Producto_Color_Insert]    Script Date: 13/05/2018 12:52:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sergio Minei
-- Create date: 16/04/2014
-- Description:	Inserta un producto color
-- =============================================
CREATE PROCEDURE [dbo].[Producto_Color_Insert]
(
	@id_producto int,
	@id_color int
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    insert into Producto_Color
	(
		id_producto,
		id_color
	)
	values
	(
		@id_producto,
		@id_color
	)
END
GO
/****** Object:  StoredProcedure [dbo].[Producto_Delete]    Script Date: 13/05/2018 12:52:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Producto_Delete] (
    @id_producto int
)
AS
BEGIN

    SET NOCOUNT ON;

    delete from [dbo].[Producto]
    where
        [id_producto] = @id_producto
END
GO
/****** Object:  StoredProcedure [dbo].[Producto_Elemento_Atributo_Delete]    Script Date: 13/05/2018 12:52:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Producto_Elemento_Atributo_Delete] (
    @id_elemento_atributo int,
    @id_producto int
)
AS
BEGIN

    SET NOCOUNT ON;

    delete from [dbo].[Producto_Elemento_Atributo]
    where
        [id_elemento_atributo] = @id_elemento_atributo and 
        [id_producto] = @id_producto
END
GO
/****** Object:  StoredProcedure [dbo].[Producto_Elemento_Atributo_Delete_Producto]    Script Date: 13/05/2018 12:52:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sergio Minei
-- Create date: 25/08/2014
-- Description:	Elimina todos los atributos de un producto
-- =============================================
CREATE PROCEDURE [dbo].[Producto_Elemento_Atributo_Delete_Producto]
(
	@id_producto int
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    delete from Producto_Elemento_Atributo
	where id_producto = @id_producto
END
GO
/****** Object:  StoredProcedure [dbo].[Producto_Elemento_Atributo_Insert]    Script Date: 13/05/2018 12:52:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Producto_Elemento_Atributo_Insert] (
    @id_elemento_atributo int,
    @id_producto int
)
AS
BEGIN

    SET NOCOUNT ON;

    insert into [dbo].[Producto_Elemento_Atributo]
    (
        [id_elemento_atributo],
        [id_producto]
    )
    values
    (
        @id_elemento_atributo,
        @id_producto
    )
END
GO
/****** Object:  StoredProcedure [dbo].[Producto_Elemento_Atributo_Select]    Script Date: 13/05/2018 12:52:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Producto_Elemento_Atributo_Select]
AS
BEGIN

    SET NOCOUNT ON;

    select 
        p.[id_elemento_atributo]
        ,p.[id_producto]
    from [dbo].[Producto_Elemento_Atributo] p
END
GO
/****** Object:  StoredProcedure [dbo].[Producto_Get]    Script Date: 13/05/2018 12:52:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Producto_Get](
    @id_producto int
)
AS
BEGIN

    SET NOCOUNT ON;

    select 
        p.[activo]
        ,p.[descripcion]
        ,p.[descuento]
        ,p.[detalle]
        ,p.[fecha_creacion]
        ,p.[fecha_modificacion]
        ,p.[id_producto]
        ,p.[id_usuario_creacion]
        ,p.[id_usuario_modificacion]
        ,p.[nombre]
        ,p.[precio]
		,p.descripcion_corta
		,p.escoger_color
		,p.caracteristica_tecnica
		,p.youtube
		,p.destacado
    from [dbo].[Producto] p
    where
        p.[id_producto] = @id_producto

	select 
		ip.id_imagen
		,ip.id_producto
		,ip.mostrar_primero
		,ip.nombre 
	from Imagen_Producto ip
	where ip.id_producto = @id_producto
	order by ip.mostrar_primero desc

	select 
		c.descripcion
		,c.id_categoria
		,c.id_padre
		,c.nombre
	from Producto_Categoria pc join Categoria c on pc.id_categoria = c.id_categoria
	where pc.id_producto = @id_producto
	order by c.id_padre

	select
		c.id_color
		,c.nombre
		,c.descripcion
	from producto p join Producto_Color pc on p.id_producto = pc.id_producto
		join color c on c.id_color = pc.id_color
	where p.id_producto = @id_producto
	order by c.nombre desc

	select distinct 
		a.descripcion
		,a.id_atributo
		,a.nombre
	from Producto_Elemento_Atributo pe join Elemento_Atributo ea on pe.id_elemento_atributo = ea.id_elemento_atributo
		join Atributo a on ea.id_atributo = a.id_atributo
	where pe.id_producto = @id_producto

	select 
		ea.id_atributo
		,ea.id_elemento_atributo
		,ea.nombre
	from Producto_Elemento_Atributo pe join Elemento_Atributo ea on pe.id_elemento_atributo = ea.id_elemento_atributo
	where pe.id_producto = @id_producto
END
GO
/****** Object:  StoredProcedure [dbo].[Producto_Get_Categoria]    Script Date: 13/05/2018 12:52:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sergio Minei
-- Create date: 27/02/2014
-- Description:	Devuelve todos los productos en base a una categoria
-- =============================================
CREATE PROCEDURE [dbo].[Producto_Get_Categoria]
(
	@id_categoria int
)
AS
BEGIN
	SET NOCOUNT ON;

    select 
		ip.id_imagen
		,ip.mostrar_primero
		,ip.nombre as 'nombre_imagen'
		,ip.id_producto
		,p.activo
		,p.cantidad_vendidos
		,p.descripcion
		,p.descuento
		,p.destacado
		,p.detalle
		,p.fecha_creacion
		,p.fecha_modificacion
		,p.id_producto
		,p.id_usuario_creacion
		,p.id_usuario_modificacion
		,p.nombre
		,p.precio
		,p.descripcion_corta
	from producto p join Imagen_Producto ip on p.id_producto = ip.id_producto
		join producto_categoria pc on p.id_producto = pc.id_producto
	where p.activo = 1
		and ip.mostrar_primero = 1
		and pc.id_categoria = @id_categoria
	order by p.fecha_creacion desc, p.id_producto

	select 
		c.descripcion
		,c.id_color
		,c.nombre
		,pc.id_producto
	from color c join Producto_Color pc on c.id_color = pc.id_color
		join Producto p on p.id_producto = pc.id_producto
		join producto_categoria pca on p.id_producto = pca.id_producto
	where p.activo = 1
		and pca.id_categoria = @id_categoria
	order by p.fecha_creacion desc, p.id_producto

	select
		c.descripcion
		,c.id_categoria
		,c.id_padre
		,c.nombre
		,cp.id_producto
	from Categoria c join Producto_Categoria cp on c.id_categoria = cp.id_categoria
		join producto p on p.id_producto = cp.id_producto
		join producto_categoria pc on p.id_producto = pc.id_producto
	where p.activo = 1
		and pc.id_categoria = @id_categoria
	order by p.fecha_creacion desc, p.id_producto
END
GO
/****** Object:  StoredProcedure [dbo].[Producto_Insert]    Script Date: 13/05/2018 12:52:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Producto_Insert] (
    @descripcion varchar(1000),
    @descuento decimal(7, 2) = null,
    @detalle varchar(5000),
    @id_usuario_creacion int,
    @id_usuario_modificacion int,
    @nombre varchar(200),
    @precio decimal(7, 2),
	@destacado bit,
	@descripcion_corta varchar(1000),
	@caracteristica_tecnica varchar(5000),
	@youtube varchar(50)
)
AS
BEGIN

    SET NOCOUNT ON;

    insert into [dbo].[Producto]
    (
        [descripcion],
        [descuento],
        [detalle],
        [fecha_creacion],
        [fecha_modificacion],
        [id_usuario_creacion],
        [id_usuario_modificacion],
        [nombre],
        [precio],
		destacado,
		descripcion_corta,
		caracteristica_tecnica,
		youtube,
		escoger_color
    )
    values
    (
        @descripcion,
        @descuento,
        @detalle,
        GETDATE(),
        GETDATE(),
        @id_usuario_creacion,
        @id_usuario_modificacion,
        @nombre,
        @precio,
		@destacado,
		@descripcion_corta,
		@caracteristica_tecnica,
		@youtube,
		1
    )

    select @@IDENTITY as 'id_producto'
END
GO
/****** Object:  StoredProcedure [dbo].[Producto_Insert_Update]    Script Date: 13/05/2018 12:52:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Producto_Insert_Update] (
    @activo bit,
    @descripcion varchar(1000),
    @descuento decimal(7, 2) = null,
    @detalle varchar(5000),
    @fecha_creacion datetime,
    @fecha_modificacion int,
    @id_producto int,
    @id_usuario_creacion int,
    @id_usuario_modificacion int,
    @nombre varchar(200),
    @precio decimal(7, 2)
)
AS
BEGIN

    SET NOCOUNT ON;

    if(@id_producto = 0)
    begin
        insert into [dbo].[Producto]
        (
            [activo],
            [descripcion],
            [descuento],
            [detalle],
            [fecha_creacion],
            [fecha_modificacion],
            [id_usuario_creacion],
            [id_usuario_modificacion],
            [nombre],
            [precio]
        )
        values
        (
            @activo,
            @descripcion,
            @descuento,
            @detalle,
            @fecha_creacion,
            @fecha_modificacion,
            @id_usuario_creacion,
            @id_usuario_modificacion,
            @nombre,
            @precio
        )

        select @@IDENTITY as 'id_producto'
    end
    else
    begin
        update [dbo].[Producto]
        set
            [activo] = @activo,
            [descripcion] = @descripcion,
            [descuento] = @descuento,
            [detalle] = @detalle,
            [fecha_creacion] = @fecha_creacion,
            [fecha_modificacion] = @fecha_modificacion,
            [id_usuario_creacion] = @id_usuario_creacion,
            [id_usuario_modificacion] = @id_usuario_modificacion,
            [nombre] = @nombre,
            [precio] = @precio
        where
            [id_producto] = @id_producto

        select @id_producto as 'id_producto'
    end
END
GO
/****** Object:  StoredProcedure [dbo].[Producto_Select]    Script Date: 13/05/2018 12:52:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Producto_Select]
AS
BEGIN

    SET NOCOUNT ON;

    select 
		ip.id_imagen
		,ip.mostrar_primero
		,ip.nombre as 'nombre_imagen'
		,ip.id_producto
		,p.activo
		,p.cantidad_vendidos
		,p.descripcion
		,p.descuento
		,p.destacado
		,p.detalle
		,p.fecha_creacion
		,p.fecha_modificacion
		,p.id_producto
		,p.id_usuario_creacion
		,p.id_usuario_modificacion
		,p.nombre
		,p.precio
		,p.descripcion_corta
	from producto p join Imagen_Producto ip on p.id_producto = ip.id_producto
	where ip.mostrar_primero = 1
	order by p.fecha_creacion desc, p.id_producto

	select 
		c.descripcion
		,c.id_color
		,c.nombre
		,pc.id_producto
	from color c join Producto_Color pc on c.id_color = pc.id_color
		join Producto p on p.id_producto = pc.id_producto
	order by p.fecha_creacion desc, p.id_producto

	select
		c.descripcion
		,c.id_categoria
		,c.id_padre
		,c.nombre
		,cp.id_producto
	from Categoria c join Producto_Categoria cp on c.id_categoria = cp.id_categoria
		join producto p on p.id_producto = cp.id_producto
	order by p.fecha_creacion desc, p.id_producto

END
GO
/****** Object:  StoredProcedure [dbo].[Producto_Select_Activos]    Script Date: 13/05/2018 12:52:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sergio Minei
-- Create date: 15/04/2014
-- Description:	Lista todos los productos activos
-- =============================================
CREATE PROCEDURE [dbo].[Producto_Select_Activos]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    select 
		ip.id_imagen
		,ip.mostrar_primero
		,ip.nombre as 'nombre_imagen'
		,ip.id_producto
		,p.activo
		,p.cantidad_vendidos
		,p.descripcion
		,p.descuento
		,p.destacado
		,p.detalle
		,p.fecha_creacion
		,p.fecha_modificacion
		,p.id_producto
		,p.id_usuario_creacion
		,p.id_usuario_modificacion
		,p.nombre
		,p.precio
		,p.descripcion_corta
	from producto p join Imagen_Producto ip on p.id_producto = ip.id_producto
	where p.activo = 1
		and ip.mostrar_primero = 1
	order by p.fecha_creacion desc, p.id_producto

	select 
		c.descripcion
		,c.id_color
		,c.nombre
		,pc.id_producto
	from color c join Producto_Color pc on c.id_color = pc.id_color
		join Producto p on p.id_producto = pc.id_producto
	where p.activo = 1
	order by p.fecha_creacion desc, p.id_producto

	select
		c.descripcion
		,c.id_categoria
		,c.id_padre
		,c.nombre
		,cp.id_producto
	from Categoria c join Producto_Categoria cp on c.id_categoria = cp.id_categoria
		join producto p on p.id_producto = cp.id_producto
	where p.activo = 1
	order by p.fecha_creacion desc, p.id_producto
END
GO
/****** Object:  StoredProcedure [dbo].[Producto_Select_Destacado]    Script Date: 13/05/2018 12:52:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sergio Minei
-- Create date: 12/02/2014
-- Description:	Muestra todos los productos destacados
-- =============================================
CREATE PROCEDURE [dbo].[Producto_Select_Destacado]
AS
BEGIN

	SET NOCOUNT ON;

	select 
		ip.id_imagen
		,ip.mostrar_primero
		,ip.nombre as 'nombre_imagen'
		,ip.id_producto
		,p.activo
		,p.cantidad_vendidos
		,p.descripcion
		,p.descuento
		,p.destacado
		,p.detalle
		,p.fecha_creacion
		,p.fecha_modificacion
		,p.id_producto
		,p.id_usuario_creacion
		,p.id_usuario_modificacion
		,p.nombre
		,p.precio
		,p.descripcion_corta
	from producto p join Imagen_Producto ip on p.id_producto = ip.id_producto
	where p.destacado = 1
		and p.activo = 1
		and ip.mostrar_primero = 1
	order by p.fecha_creacion desc, p.id_producto, ip.mostrar_primero desc
END
GO
/****** Object:  StoredProcedure [dbo].[Producto_Select_Nuevos]    Script Date: 13/05/2018 12:52:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sergio Minei
-- Create date: 18/02/2014
-- Description:	Lista los últimos 8 productos en ser registrados
-- =============================================
CREATE PROCEDURE [dbo].[Producto_Select_Nuevos]
AS
BEGIN

	SET NOCOUNT ON;

	select top 8
		ip.id_imagen
		,ip.mostrar_primero
		,ip.nombre as 'nombre_imagen'
		,ip.id_producto
		,p.activo
		,p.cantidad_vendidos
		,p.descripcion
		,p.descuento
		,p.destacado
		,p.detalle
		,p.fecha_creacion
		,p.fecha_modificacion
		,p.id_producto
		,p.id_usuario_creacion
		,p.id_usuario_modificacion
		,p.nombre
		,p.precio
		,p.descripcion_corta
	from producto p join Imagen_Producto ip on p.id_producto = ip.id_producto
	where p.activo = 1
		and ip.mostrar_primero = 1
	order by p.fecha_creacion desc, p.id_producto, ip.mostrar_primero desc
END
GO
/****** Object:  StoredProcedure [dbo].[Producto_Select_Populares]    Script Date: 13/05/2018 12:52:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sergio Minei
-- Create date: 19/02/2014
-- Description:	Lista los 4 productos más populares
-- =============================================
CREATE PROCEDURE [dbo].[Producto_Select_Populares]
AS
BEGIN

	SET NOCOUNT ON;

	select top 4
		ip.id_imagen
		,ip.mostrar_primero
		,ip.nombre as 'nombre_imagen'
		,ip.id_producto
		,p.activo
		,p.cantidad_vendidos
		,p.descripcion
		,p.descuento
		,p.destacado
		,p.detalle
		,p.fecha_creacion
		,p.fecha_modificacion
		,p.id_producto
		,p.id_usuario_creacion
		,p.id_usuario_modificacion
		,p.nombre
		,p.precio
		,p.descripcion_corta
	from producto p join Imagen_Producto ip on p.id_producto = ip.id_producto
	where p.activo = 1
		and ip.mostrar_primero = 1
	order by p.cantidad_vendidos desc, p.fecha_creacion desc
END
GO
/****** Object:  StoredProcedure [dbo].[Producto_Select_Top_Categoria]    Script Date: 13/05/2018 12:52:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sergio Minei
-- Create date: 19/02/2014
-- Description:	Lista los 4 productos más populares
-- =============================================
CREATE PROCEDURE [dbo].[Producto_Select_Top_Categoria]
(
	@id_categoria int,
	@id_producto int
)
AS
BEGIN

	SET NOCOUNT ON;

	select top 4
		ip.id_imagen
		,ip.mostrar_primero
		,ip.nombre as 'nombre_imagen'
		,ip.id_producto
		,p.activo
		,p.cantidad_vendidos
		,p.descripcion
		,p.descuento
		,p.destacado
		,p.detalle
		,p.fecha_creacion
		,p.fecha_modificacion
		,p.id_producto
		,p.id_usuario_creacion
		,p.id_usuario_modificacion
		,p.nombre
		,p.precio
		,p.descripcion_corta
	from producto p join Imagen_Producto ip on p.id_producto = ip.id_producto
		join Producto_Categoria pc on pc.id_producto = p.id_producto
	where p.activo = 1
		and ip.mostrar_primero = 1
		and pc.id_categoria = @id_categoria
		and p.id_producto <> @id_producto
	order by NEWID()
END
GO
/****** Object:  StoredProcedure [dbo].[Producto_Update]    Script Date: 13/05/2018 12:52:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Producto_Update] (
    @descripcion varchar(1000),
    @descuento decimal(7, 2) = null,
    @detalle varchar(5000),
    @id_usuario_modificacion int,
    @nombre varchar(200),
    @precio decimal(7, 2),
	@destacado bit,
	@descripcion_corta varchar(1000),
	@caracteristica_tecnica varchar(5000),
	@youtube varchar(50),
	@id_producto int
)
AS
BEGIN

    SET NOCOUNT ON;

    update [dbo].[Producto]
    set
        [descripcion] = @descripcion,
        [descuento] = @descuento,
        [detalle] = @detalle,
        [id_usuario_modificacion] = @id_usuario_modificacion,
        [nombre] = @nombre,
        [precio] = @precio,
		destacado = @destacado,
		descripcion_corta = @descripcion_corta,
		caracteristica_tecnica = @caracteristica_tecnica,
		youtube = @youtube,
		fecha_modificacion = GETDATE()
    where
        [id_producto] = @id_producto
END
GO
/****** Object:  StoredProcedure [dbo].[Producto_Update_Activo]    Script Date: 13/05/2018 12:52:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sergio Minei
-- Create date: 15/04/2014
-- Description:	Cambiar a activo/no activo de un producto
-- =============================================
CREATE PROCEDURE [dbo].[Producto_Update_Activo]
(
	@id_producto int
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	declare @activo bit = (select p.activo from Producto p where p.id_producto = @id_producto)

	if(@activo = 1)
		set @activo = 0
	else
		set @activo = 1

    update Producto
	set activo = @activo
	where id_producto = @id_producto
END
GO
/****** Object:  StoredProcedure [dbo].[Rol_Delete]    Script Date: 13/05/2018 12:52:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Rol_Delete] (
    @id_rol int
)
AS
BEGIN

    SET NOCOUNT ON;

    delete from [dbo].[Rol]
    where
        [id_rol] = @id_rol
END
GO
/****** Object:  StoredProcedure [dbo].[Rol_Get]    Script Date: 13/05/2018 12:52:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Rol_Get](
    @id_rol int
)
AS
BEGIN

    SET NOCOUNT ON;

    select 
        r.[descripcion]
        ,r.[id_rol]
        ,r.[nombre]
    from [dbo].[Rol] r
    where
        r.[id_rol] = @id_rol
END
GO
/****** Object:  StoredProcedure [dbo].[Rol_Insert]    Script Date: 13/05/2018 12:52:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Rol_Insert] (
    @descripcion varchar(100) = null,
    @id_rol int,
    @nombre varchar(100)
)
AS
BEGIN

    SET NOCOUNT ON;

    insert into [dbo].[Rol]
    (
        [descripcion],
        [id_rol],
        [nombre]
    )
    values
    (
        @descripcion,
        @id_rol,
        @nombre
    )
END
GO
/****** Object:  StoredProcedure [dbo].[Rol_Insert_Update]    Script Date: 13/05/2018 12:52:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Rol_Insert_Update] (
    @descripcion varchar(100) = null,
    @id_rol int,
    @nombre varchar(100)
)
AS
BEGIN

    SET NOCOUNT ON;

    if(@id_rol = 0)
    begin
        insert into [dbo].[Rol]
        (
            [descripcion],
            [id_rol],
            [nombre]
        )
        values
        (
            @descripcion,
            @id_rol,
            @nombre
        )
    end
    else
    begin
        update [dbo].[Rol]
        set
            [descripcion] = @descripcion,
            [nombre] = @nombre
        where
            [id_rol] = @id_rol

    end
END
GO
/****** Object:  StoredProcedure [dbo].[Rol_Select]    Script Date: 13/05/2018 12:52:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Rol_Select]
AS
BEGIN

    SET NOCOUNT ON;

    select 
        r.[descripcion]
        ,r.[id_rol]
        ,r.[nombre]
    from [dbo].[Rol] r
END
GO
/****** Object:  StoredProcedure [dbo].[Rol_Update]    Script Date: 13/05/2018 12:52:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Rol_Update] (
    @descripcion varchar(100) = null,
    @id_rol int,
    @nombre varchar(100)
)
AS
BEGIN

    SET NOCOUNT ON;

    update [dbo].[Rol]
    set
        [descripcion] = @descripcion,
        [nombre] = @nombre
    where
        [id_rol] = @id_rol
END
GO
/****** Object:  StoredProcedure [dbo].[Slider_Delete]    Script Date: 13/05/2018 12:52:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Slider_Delete] (
    @id_slider int
)
AS
BEGIN

    SET NOCOUNT ON;

    delete from [dbo].[Slider]
    where
        [id_slider] = @id_slider
END
GO
/****** Object:  StoredProcedure [dbo].[Slider_Get]    Script Date: 13/05/2018 12:52:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Slider_Get](
    @id_slider int
)
AS
BEGIN

    SET NOCOUNT ON;

    select 
        s.[background]
        ,s.[boton]
        ,s.[descripcion]
        ,s.[id_slider]
        ,s.[imagen]
        ,s.[nombre]
        ,s.[url]
    from [dbo].[Slider] s
    where
        s.[id_slider] = @id_slider
END
GO
/****** Object:  StoredProcedure [dbo].[Slider_Insert]    Script Date: 13/05/2018 12:52:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Slider_Insert] (
    @background varchar(200),
    @boton varchar(50),
    @descripcion varchar(150),
    @imagen varchar(200),
    @nombre varchar(100),
    @url varchar(100)
)
AS
BEGIN

    SET NOCOUNT ON;

    insert into [dbo].[Slider]
    (
        [background],
        [boton],
        [descripcion],
        [imagen],
        [nombre],
        [url],
		orden
    )
    values
    (
        @background,
        @boton,
        @descripcion,
        @imagen,
        @nombre,
        @url,
		(select MAX(orden) + 1 from Slider)
    )

	declare @id_slider int = @@IDENTITY;

	update Slider
	set background = concat(@id_slider, @background),
		imagen = CONCAT('img', @id_slider, @imagen)
	where id_slider = @id_slider

    select @id_slider as 'id_slider'
END
GO
/****** Object:  StoredProcedure [dbo].[Slider_Select]    Script Date: 13/05/2018 12:52:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Slider_Select]
AS
BEGIN

    SET NOCOUNT ON;

    select 
        s.[background]
        ,s.[boton]
        ,s.[descripcion]
        ,s.[id_slider]
        ,s.[imagen]
        ,s.[nombre]
        ,s.[url]
		,s.orden
    from [dbo].[Slider] s
	order by s.orden
END
GO
/****** Object:  StoredProcedure [dbo].[Slider_Update]    Script Date: 13/05/2018 12:52:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Slider_Update] (
    @boton varchar(50),
    @descripcion varchar(150),
    @id_slider int,
    @nombre varchar(100),
    @url varchar(100)
)
AS
BEGIN

    SET NOCOUNT ON;

    update [dbo].[Slider]
    set
        [boton] = @boton,
        [descripcion] = @descripcion,
        [nombre] = @nombre,
        [url] = @url
    where
        [id_slider] = @id_slider
END
GO
/****** Object:  StoredProcedure [dbo].[Slider_Update_Background]    Script Date: 13/05/2018 12:52:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sergio Minei
-- Create date: 06/08/2014
-- Description:	Actualiza la imagen de fondo de un slider
-- =============================================
CREATE PROCEDURE [dbo].[Slider_Update_Background]
(
	@background varchar(200),
	@id_slider int
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    update Slider
	set background = @background
	where id_slider = @id_slider
END
GO
/****** Object:  StoredProcedure [dbo].[Slider_Update_Imagen]    Script Date: 13/05/2018 12:52:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sergio Minei
-- Create date: 06/08/2014
-- Description:	Actualiza la imagen de un slider
-- =============================================
CREATE PROCEDURE [dbo].[Slider_Update_Imagen]
(
	@imagen varchar(200),
	@id_slider int
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    update Slider
	set imagen = @imagen
	where id_slider = @id_slider
END
GO
/****** Object:  StoredProcedure [dbo].[Slider_Update_Orden]    Script Date: 13/05/2018 12:52:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sergio Minei
-- Create date: 07/08/2014
-- Description:	Actualiza el orden de los sliders
-- =============================================
CREATE PROCEDURE [dbo].[Slider_Update_Orden]
(
	@id_slider int,
	@orden int
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    update slider
	set orden = @orden
	where id_slider = @id_slider
END
GO
/****** Object:  StoredProcedure [dbo].[Ubigeo_Get_Distrito]    Script Date: 13/05/2018 12:52:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sergio Minei
-- Create date: 11/03/2014
-- Description:	Devuelve los distritos de una provincia
-- =============================================
CREATE PROCEDURE [dbo].[Ubigeo_Get_Distrito]
(
	@coddpto varchar(2),
	@codprov varchar(2)
)
AS
BEGIN

	SET NOCOUNT ON;

    select 
		coddpto
		,codprov
		,coddist
		,nombre
		,precio
	from ubigeo u
	where u.coddpto = @coddpto
		and u.codprov = @codprov
		and u.coddist <> '00'
END
GO
/****** Object:  StoredProcedure [dbo].[Ubigeo_Get_Provincia]    Script Date: 13/05/2018 12:52:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sergio Minei
-- Create date: 11/03/2014
-- Description:	Devuelve las provincias de un departamento
-- =============================================
CREATE PROCEDURE [dbo].[Ubigeo_Get_Provincia]
(
	@coddpto varchar(2)
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    select 
		coddpto
		,codprov
		,coddist
		,nombre
	from ubigeo u
	where u.coddpto = @coddpto
		and u.codprov <> '00'
		and u.coddist = '00'
END
GO
/****** Object:  StoredProcedure [dbo].[Ubigeo_Select_Departamento]    Script Date: 13/05/2018 12:52:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sergio Minei
-- Create date: 11/03/2014
-- Description:	Obtiene todos los departamentos de la tabla ubigeo
-- =============================================
CREATE PROCEDURE [dbo].[Ubigeo_Select_Departamento]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    select 
		coddpto
		,codprov
		,coddist
		,nombre
	from ubigeo u
	where u.codprov = '00'
		and u.coddist = '00'
END
GO
/****** Object:  StoredProcedure [dbo].[Ubigeo_Update_Precio]    Script Date: 13/05/2018 12:52:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sergio Minei
-- Create date: 11/04/2014
-- Description:	Actualiza el precio de envio de un distrito
-- =============================================
CREATE PROCEDURE [dbo].[Ubigeo_Update_Precio]
(
	@coddpto varchar(2),
	@codprov varchar(2),
	@coddist varchar(2),
	@precio decimal(5,2)
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    update Ubigeo
	set precio = @precio
	where coddpto = @coddpto
		and codprov = @codprov
		and coddist = @coddist
END
GO
/****** Object:  StoredProcedure [dbo].[Usuario_Activar]    Script Date: 13/05/2018 12:52:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sergio Minei
-- Create date: 06/03/2014
-- Description:	Activa una cuenta de usuario
-- =============================================
CREATE PROCEDURE [dbo].[Usuario_Activar](
	@usuario varchar(150),
	@token_correo varchar(20)
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    update Usuario
	set activo_correo = 1
	where usuario = @usuario and token_correo = @token_correo;

	select 
		u.apellido_materno
		,u.apellido_paterno
		,u.celular
		,u.dni
		,u.email
		,u.fecha_creacion
		,u.fecha_nacimiento
		,u.id_rol
		,u.id_usuario
		,u.nombre
		,u.telefono
		,u.usuario
		,u.activo_correo
	from Usuario u
	where u.usuario = @usuario 
		and token_correo = @token_correo
		and u.activo = 1
END
GO
/****** Object:  StoredProcedure [dbo].[Usuario_Buscar]    Script Date: 13/05/2018 12:52:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sergio Minei
-- Create date: 01/09/2014
-- Description:	Devuelve todos los usuarios en base a una búsqueda
-- =============================================
CREATE PROCEDURE [dbo].[Usuario_Buscar]
(
	@usuario varchar(150) = null,
	@nombre varchar(200) = null,
	@apellido_paterno varchar(200) = null,
	@apellido_materno varchar(200) = null,
	@dni varchar(10) = null,
	@activo bit = null,
	@email varchar(250) = null
)
AS
BEGIN
	SET NOCOUNT ON;

    select 
        u.[activo]
        ,u.[apellido_materno]
        ,u.[apellido_paterno]
        ,u.[celular]
        ,u.[dni]
        ,u.[email]
        ,u.[fecha_creacion]
        ,u.[fecha_nacimiento]
        ,u.[id_rol]
        ,u.[id_usuario]
        ,u.[nombre]
        ,u.[password]
        ,u.[telefono]
        ,u.[usuario]
    from [Usuario] u
	where u.activo = isnull(@activo, u.activo)
		and u.usuario like isnull(concat('%',@usuario,'%'), u.usuario)
		and u.nombre like isnull(concat('%',@nombre,'%'), u.nombre)
		and u.apellido_paterno like isnull(concat('%',@apellido_paterno,'%'), u.apellido_paterno)
		and isnull(u.apellido_materno, 0) like isnull(concat('%',@apellido_materno,'%'), isnull(u.apellido_materno, 0))
		and u.dni like isnull(concat('%',@dni,'%'), u.dni)
		and u.email like isnull(concat('%',@email,'%'), u.email)
END
GO
/****** Object:  StoredProcedure [dbo].[Usuario_Delete]    Script Date: 13/05/2018 12:52:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Usuario_Delete] (
    @id_rol int,
    @id_usuario int
)
AS
BEGIN

    SET NOCOUNT ON;

    delete from [dbo].[Usuario]
    where
        [id_rol] = @id_rol and 
        [id_usuario] = @id_usuario
END
GO
/****** Object:  StoredProcedure [dbo].[Usuario_Get]    Script Date: 13/05/2018 12:52:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Usuario_Get](
    @id_usuario int
)
AS
BEGIN

    SET NOCOUNT ON;

    select 
        u.[activo]
        ,u.[apellido_materno]
        ,u.[apellido_paterno]
        ,u.[celular]
        ,u.[dni]
        ,u.[email]
        ,u.[fecha_creacion]
        ,u.[fecha_nacimiento]
        ,u.[id_rol]
        ,u.[id_usuario]
        ,u.[nombre]
        ,u.[password]
        ,u.[telefono]
        ,u.[usuario]
    from [dbo].[Usuario] u
    where
        u.[id_usuario] = @id_usuario
END
GO
/****** Object:  StoredProcedure [dbo].[Usuario_Insert]    Script Date: 13/05/2018 12:52:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Usuario_Insert] (
    @apellido_materno varchar(200) = null,
    @apellido_paterno varchar(200),
    @celular varchar(15) = null,
    @dni varchar(10),
    @email varchar(250),
    @fecha_nacimiento datetime = null,
    @id_rol int,
    @nombre varchar(200),
    @password varchar(MAX),
    @telefono varchar(15) = null,
    @usuario varchar(150),
	@token_correo varchar(20)
)
AS
BEGIN

    SET NOCOUNT ON;

	declare @existe_usuario int = (select COUNT(u.id_usuario) from Usuario u where u.usuario = @usuario)

	if(@existe_usuario <> 0)
	begin
		select -1 as 'id_usuario' --Ya existe un usuario con el username
	end
	else
	begin
		declare @existe_email int = (select COUNT(u.id_usuario) from Usuario u where u.email = @email)
		if(@existe_email <> 0)
		begin
			select -2 as 'id_usuario' --Ya existe un usuario con el email
		end
		else
		begin
			declare @existe_dni int = (select COUNT(u.id_usuario) from Usuario u where u.dni = @dni)
			if(@existe_dni <> 0)
			begin
				select -3 as 'id_usuario' --Ya existe un usuario con el dni
			end
			else
			begin
				insert into [dbo].[Usuario]
				(
					[activo],
					[apellido_materno],
					[apellido_paterno],
					[celular],
					[dni],
					[email],
					[fecha_creacion],
					[fecha_nacimiento],
					[id_rol],
					[nombre],
					[password],
					[telefono],
					[usuario],
					token_correo
				)
				values
				(
					1,
					@apellido_materno,
					@apellido_paterno,
					@celular,
					@dni,
					@email,
					GETDATE(),
					@fecha_nacimiento,
					@id_rol,
					@nombre,
					HASHBYTES('SHA1', @password),
					@telefono,
					@usuario,
					@token_correo
				)

				select @@IDENTITY as 'id_usuario'
			end
		end
	end
END
GO
/****** Object:  StoredProcedure [dbo].[Usuario_Insert_Update]    Script Date: 13/05/2018 12:52:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Usuario_Insert_Update] (
    @activo bit,
    @apellido_materno varchar(200) = null,
    @apellido_paterno varchar(200),
    @celular varchar(15) = null,
    @dni varchar(10),
    @email varchar(250),
    @fecha_creacion datetime,
    @fecha_nacimiento datetime = null,
    @id_rol int,
    @id_usuario int,
    @nombre varchar(200),
    @password varchar(MAX),
    @telefono varchar(15) = null,
    @usuario varchar(150)
)
AS
BEGIN

    SET NOCOUNT ON;

    if(@id_rol = 0 or @id_usuario = 0)
    begin
        insert into [dbo].[Usuario]
        (
            [activo],
            [apellido_materno],
            [apellido_paterno],
            [celular],
            [dni],
            [email],
            [fecha_creacion],
            [fecha_nacimiento],
            [id_rol],
            [nombre],
            [password],
            [telefono],
            [usuario]
        )
        values
        (
            @activo,
            @apellido_materno,
            @apellido_paterno,
            @celular,
            @dni,
            @email,
            @fecha_creacion,
            @fecha_nacimiento,
            @id_rol,
            @nombre,
            @password,
            @telefono,
            @usuario
        )

        select @@IDENTITY as 'id_usuario'
    end
    else
    begin
        update [dbo].[Usuario]
        set
            [activo] = @activo,
            [apellido_materno] = @apellido_materno,
            [apellido_paterno] = @apellido_paterno,
            [celular] = @celular,
            [dni] = @dni,
            [email] = @email,
            [fecha_creacion] = @fecha_creacion,
            [fecha_nacimiento] = @fecha_nacimiento,
            [nombre] = @nombre,
            [password] = @password,
            [telefono] = @telefono,
            [usuario] = @usuario
        where
            [id_rol] = @id_rol and 
            [id_usuario] = @id_usuario

        select @id_usuario as 'id_usuario'
    end
END
GO
/****** Object:  StoredProcedure [dbo].[Usuario_Select]    Script Date: 13/05/2018 12:52:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Usuario_Select]
AS
BEGIN

    SET NOCOUNT ON;

    select 
        u.[activo]
        ,u.[apellido_materno]
        ,u.[apellido_paterno]
        ,u.[celular]
        ,u.[dni]
        ,u.[email]
        ,u.[fecha_creacion]
        ,u.[fecha_nacimiento]
        ,u.[id_rol]
        ,u.[id_usuario]
        ,u.[nombre]
        ,u.[password]
        ,u.[telefono]
        ,u.[usuario]
    from [dbo].[Usuario] u
END
GO
/****** Object:  StoredProcedure [dbo].[Usuario_Update]    Script Date: 13/05/2018 12:52:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Usuario_Update] (
    @apellido_materno varchar(200) = null,
    @apellido_paterno varchar(200),
    @celular varchar(15) = null,
    @dni varchar(10),
    @email varchar(250),
    --@fecha_nacimiento datetime = null,
    @id_usuario int,
    @nombre varchar(200),
    @telefono varchar(15) = null,
	@token_correo varchar(20),
	@id_rol int
)
AS
BEGIN

    SET NOCOUNT ON;

	declare @correo_uso int = (select count(u.id_usuario) from Usuario u where u.email = @email and u.id_usuario <> @id_usuario) --Correo en uso

	if(@correo_uso > 0)
		select -1 --correo repetido
	else
	begin
		declare @cambio_correo int = (select count(u.id_usuario) from Usuario u where u.email = @email and u.id_usuario = @id_usuario) --Correo en uso

		declare @activo_correo bit = 1

		if(@cambio_correo = 0)
		begin
			set @activo_correo = 0
			select -2 --Se cambió el correo, volver a activar
		end
		else
		begin
			set @activo_correo = 1
			select -3 --No se cambio el correo
		end

		update [dbo].[Usuario]
		set
			[apellido_materno] = @apellido_materno,
			[apellido_paterno] = @apellido_paterno,
			[celular] = @celular,
			[dni] = @dni,
			[email] = @email,
			--[fecha_nacimiento] = @fecha_nacimiento,
			[nombre] = @nombre,
			[telefono] = @telefono,
			activo_correo = @activo_correo,
			token_correo = @token_correo,
			id_rol = @id_rol
		where
			[id_usuario] = @id_usuario
	end
END
GO
/****** Object:  StoredProcedure [dbo].[Usuario_Update_Activo]    Script Date: 13/05/2018 12:52:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sergio Minei
-- Create date: 29/04/2014
-- Description:	Cambia el estado del un usuario
-- =============================================
CREATE PROCEDURE [dbo].[Usuario_Update_Activo]
(
	@id_usuario int
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    declare @activo bit = (select u.activo from Usuario u where u.id_usuario = @id_usuario)

	if(@activo = 1)
		set @activo = 0
	else
		set @activo = 1

    update Usuario
	set activo = @activo
	where id_usuario = @id_usuario
END
GO
/****** Object:  StoredProcedure [dbo].[Usuario_Update_Password]    Script Date: 13/05/2018 12:52:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sergio Minei
-- Create date: 03/03/2014
-- Description:	Cambia la contraseña de un usuario
-- =============================================
CREATE PROCEDURE [dbo].[Usuario_Update_Password]
(
	@id_usuario int,
	@password_antiguo varchar(max),
	@password_nuevo varchar(max)
)
AS
BEGIN

	SET NOCOUNT ON;

    declare @existe int = (select count(u.id_usuario) from Usuario u where u.id_usuario = @id_usuario and u.password = HASHBYTES('SHA1', @password_antiguo))

	if(@existe = 0)
	begin
		select -1 --La contraseña es incorrecta
	end
	else
	begin
		update Usuario
		set
			password =  HASHBYTES('SHA1', @password_nuevo)
		where id_usuario = @id_usuario

		select 1
	end
END
GO
/****** Object:  StoredProcedure [dbo].[Usuario_Update_Recuperar_Pass]    Script Date: 13/05/2018 12:52:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sergio Minei
-- Create date: 07/04/2014
-- Description:	Usado para la recuperación de contraseña
-- =============================================
CREATE PROCEDURE [dbo].[Usuario_Update_Recuperar_Pass]
(
	@email varchar(250),
	@token_recuperacion varchar(20)
)
AS
BEGIN
	SET NOCOUNT ON;

	declare @cantidad int = (select count(u.id_usuario) from usuario u where u.email = @email)

	if(@cantidad <> 0)
	begin
		update Usuario
		set token_recuperacion = @token_recuperacion,
			fecha_ultima_recuperacion = getdate()
		where email = @email

		select u.usuario
			,u.nombre
			,u.apellido_paterno
			,u.email
			,u.token_recuperacion
		from usuario u
		where u.email = @email
	end
END
GO
/****** Object:  StoredProcedure [dbo].[Usuario_Update_Recuperar_Pass_Nuevo]    Script Date: 13/05/2018 12:52:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sergio Minei
-- Create date: 08/04/2014
-- Description:	Cambia la contraseña de un usuario
-- =============================================
CREATE PROCEDURE [dbo].[Usuario_Update_Recuperar_Pass_Nuevo]
(
	@usuario varchar(150),
	@password varchar(200),
	@token_recuperacion varchar(20)
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    update Usuario
	set password = HASHBYTES('SHA1', @password),
		token_recuperacion = null,
		fecha_ultima_recuperacion = null
	where usuario = @usuario
		and token_recuperacion = @token_recuperacion
END
GO
/****** Object:  StoredProcedure [dbo].[Usuario_Validar_Recuperar_Pass]    Script Date: 13/05/2018 12:52:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sergio Minei
-- Create date: 08/04/2014
-- Description:	Verifica si la página de recuperar es válida o no
-- =============================================
CREATE PROCEDURE [dbo].[Usuario_Validar_Recuperar_Pass]
(
	@usuario varchar(150),
	@token_recuperacion varchar(20)
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    declare @cantidad int = (select count(u.id_usuario) from usuario u where u.usuario = @usuario and u.token_recuperacion = @token_recuperacion and u.activo = 1 and DATEDIFF(hh, u.fecha_ultima_recuperacion, GETDATE()) <= 24)

	if(@cantidad > 0)
		select 1
	else
		select 0
END
GO
/****** Object:  StoredProcedure [dbo].[Whishlist_Delete]    Script Date: 13/05/2018 12:52:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Whishlist_Delete] (
    @id_producto int,
    @id_usuario int,
    @id_whishlist int
)
AS
BEGIN

    SET NOCOUNT ON;

    delete from [dbo].[Whishlist]
    where
        [id_producto] = @id_producto and 
        [id_usuario] = @id_usuario and 
        [id_whishlist] = @id_whishlist
END
GO
/****** Object:  StoredProcedure [dbo].[Whishlist_Delete_Usuario_Producto]    Script Date: 13/05/2018 12:52:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sergio Minei
-- Create date: 11/03/2014
-- Description:	Borra un producto de un usuario de favoritos
-- =============================================
CREATE PROCEDURE [dbo].[Whishlist_Delete_Usuario_Producto]
(
	@id_producto int,
	@id_usuario int
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    delete from Whishlist
	where id_producto = @id_producto
		and id_usuario = @id_usuario
END
GO
/****** Object:  StoredProcedure [dbo].[Whishlist_Get]    Script Date: 13/05/2018 12:52:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Whishlist_Get](
    @id_producto int,
    @id_usuario int,
    @id_whishlist int
)
AS
BEGIN

    SET NOCOUNT ON;

    select 
        w.[fecha_creacion]
        ,w.[id_producto]
        ,w.[id_usuario]
        ,w.[id_whishlist]
    from [dbo].[Whishlist] w
    where
        w.[id_producto] = @id_producto or 
        w.[id_usuario] = @id_usuario or 
        w.[id_whishlist] = @id_whishlist
END
GO
/****** Object:  StoredProcedure [dbo].[Whishlist_Insert]    Script Date: 13/05/2018 12:52:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Whishlist_Insert] (
    @id_producto int,
    @id_usuario int
)
AS
BEGIN

    SET NOCOUNT ON;

    insert into [dbo].[Whishlist]
    (
        [fecha_creacion],
        [id_producto],
        [id_usuario]
    )
    values
    (
        getdate(),
        @id_producto,
        @id_usuario
    )

    select @@IDENTITY as 'id_whishlist'
END
GO
/****** Object:  StoredProcedure [dbo].[Whishlist_Insert_Update]    Script Date: 13/05/2018 12:52:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Whishlist_Insert_Update] (
    @fecha_creacion int,
    @id_producto int,
    @id_usuario int,
    @id_whishlist int
)
AS
BEGIN

    SET NOCOUNT ON;

    if(@id_producto = 0 or @id_usuario = 0 or @id_whishlist = 0)
    begin
        insert into [dbo].[Whishlist]
        (
            [fecha_creacion],
            [id_producto],
            [id_usuario]
        )
        values
        (
            @fecha_creacion,
            @id_producto,
            @id_usuario
        )

        select @@IDENTITY as 'id_whishlist'
    end
    else
    begin
        update [dbo].[Whishlist]
        set
            [fecha_creacion] = @fecha_creacion
        where
            [id_producto] = @id_producto and 
            [id_usuario] = @id_usuario and 
            [id_whishlist] = @id_whishlist

        select @id_whishlist as 'id_whishlist'
    end
END
GO
/****** Object:  StoredProcedure [dbo].[Whishlist_Select]    Script Date: 13/05/2018 12:52:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Whishlist_Select]
AS
BEGIN

    SET NOCOUNT ON;

    select 
        w.[fecha_creacion]
        ,w.[id_producto]
        ,w.[id_usuario]
        ,w.[id_whishlist]
    from [dbo].[Whishlist] w
END
GO
/****** Object:  StoredProcedure [dbo].[Whishlist_Update]    Script Date: 13/05/2018 12:52:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Whishlist_Update] (
    @fecha_creacion int,
    @id_producto int,
    @id_usuario int,
    @id_whishlist int
)
AS
BEGIN

    SET NOCOUNT ON;

    update [dbo].[Whishlist]
    set
        [fecha_creacion] = @fecha_creacion
    where
        [id_producto] = @id_producto and 
        [id_usuario] = @id_usuario and 
        [id_whishlist] = @id_whishlist
END
GO
/****** Object:  StoredProcedure [dbo].[Wishlist_Get_Usuario]    Script Date: 13/05/2018 12:52:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sergio Minei
-- Create date: 11/03/2014
-- Description:	Obtiene el wishlist de un usuario
-- =============================================
CREATE PROCEDURE [dbo].[Wishlist_Get_Usuario](
	@id_usuario int
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    select 
        w.[fecha_creacion]
        ,w.[id_producto]
        ,w.[id_usuario]
        ,w.[id_whishlist]
		,ip.nombre as 'nombre_imagen'
		,p.nombre
		,p.precio
		,p.descripcion_corta
    from [dbo].[Whishlist] w join Producto p on w.id_producto = p.id_producto
		join Imagen_Producto ip on p.id_producto = ip.id_producto
	where w.id_usuario = @id_usuario
END
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1: Boleta
2: Factura' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Pedido', @level2type=N'COLUMN',@level2name=N'id_tipo_recibo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1: Pedido
2: Pagado
3: Expirado
4: Entregado' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Pedido', @level2type=N'COLUMN',@level2name=N'estado'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1: Envio
2: Direccion' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Pedido_Direccion', @level2type=N'COLUMN',@level2name=N'id_tipo_direccion'
GO
USE [master]
GO
ALTER DATABASE [TuImportasShop] SET  READ_WRITE 
GO
