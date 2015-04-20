CREATE TABLE [dbo].[Veterinario_Medicamento] (
    [cod_veterinario] INT NOT NULL,
    [cod_medicamento] INT NOT NULL,
    CONSTRAINT [FK_veterinario_medicamento] FOREIGN KEY ([cod_medicamento]) REFERENCES [dbo].[Medicamento] ([Cod_medicamento]),
    CONSTRAINT [FK_medicamento_veterinario] FOREIGN KEY ([cod_veterinario]) REFERENCES [dbo].[Veterinario] ([Cod_veterinario])
);

