CREATE TABLE [dbo].[Veterinario_tratamento] (
    [cod_veterinario] INT NOT NULL,
    [cod_tratamento]  INT NOT NULL,
    CONSTRAINT [FK_veterinario_tratamento] FOREIGN KEY ([cod_veterinario]) REFERENCES [dbo].[Veterinario] ([Cod_veterinario]),
    CONSTRAINT [FK_tratamento_veterinario] FOREIGN KEY ([cod_tratamento]) REFERENCES [dbo].[Tratamento] ([Cod_Tratamento])
);

