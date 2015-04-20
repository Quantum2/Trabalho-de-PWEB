CREATE TABLE [dbo].[Cliente_consulta] (
    [cod_consulta] INT NOT NULL,
    [cod_cliente]  INT NOT NULL,
    CONSTRAINT [FK_Cliente_consulta] FOREIGN KEY ([cod_consulta]) REFERENCES [dbo].[Consulta] ([cod_consulta]),
    CONSTRAINT [FK_Consulta_cliente] FOREIGN KEY ([cod_cliente]) REFERENCES [dbo].[Cliente] ([cod_cliente])
);

