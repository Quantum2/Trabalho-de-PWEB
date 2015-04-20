CREATE TABLE [dbo].[Cliente_noticia] (
    [cod_cliente] INT NOT NULL,
    [cod_noticia] INT NOT NULL,
    CONSTRAINT [FK_cliente_noticia] FOREIGN KEY ([cod_noticia]) REFERENCES [dbo].[Noticia] ([Cod_noticia]),
    CONSTRAINT [FK_noticia_cliente] FOREIGN KEY ([cod_cliente]) REFERENCES [dbo].[Cliente] ([cod_cliente])
);

