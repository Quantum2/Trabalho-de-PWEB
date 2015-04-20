CREATE TABLE [dbo].[Animal_consulta] (
    [cod_consulta] INT NOT NULL,
    [cod_animal]   INT NOT NULL,
    CONSTRAINT [FK_Animal_conulta] FOREIGN KEY ([cod_consulta]) REFERENCES [dbo].[Consulta] ([cod_consulta]),
    CONSTRAINT [FK_consulta_animal] FOREIGN KEY ([cod_animal]) REFERENCES [dbo].[Animal] ([cod_animal])
);

