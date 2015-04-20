CREATE TABLE [dbo].[Noticia]
(
	[Cod_noticia] INT NOT NULL PRIMARY KEY, 
    [Data] DATE NULL, 
    [Titulo] NCHAR(10) NULL, 
    [Texto] NVARCHAR(MAX) NULL
)
