CREATE TABLE [dbo].[payee_relation_type]
(
	[id] BIGINT NOT NULL PRIMARY KEY IDENTITY(1, 1),
	[type] TINYINT NOT NULL,
	[description] nvarchar(200) NOT NULL DEFAULT '',
)

GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'收款人關係',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'payee_relation_type',
    @level2type = NULL,
    @level2name = NULL