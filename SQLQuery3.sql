USE [Dbb]
GO

/****** Object:  Table [dbo].[Customer]    Script Date: 05.09.2020 17:25:02 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Customer](
	[CustomerID] [int] NOT NULL,
	[CustomerName] [nvarchar](50) NOT NULL,
	[ContactName] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](50) NOT NULL,
	[City] [nvarchar](50) NOT NULL,
	[Postal Code] [nchar](10) NOT NULL,
	[Country] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO


SELECT CustomerName FROM Customer;
