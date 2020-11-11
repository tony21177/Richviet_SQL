CREATE TABLE [dbo].[payee_type]
(
	[id] BIGINT NOT NULL PRIMARY KEY identity(1,1),
	[type] int NOT NULL Default 0,
    [description] nvarchar(45) NOT NULL DEFAULT '' 
)

GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'收款方式',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'payee_type',
    @level2type = N'COLUMN',
    @level2name = N'type'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'收款方式描述',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'payee_type',
    @level2type = N'COLUMN',
    @level2name = N'description'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'收款方式',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'payee_type',
    @level2type = NULL,
    @level2name = NULL