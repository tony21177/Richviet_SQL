CREATE TABLE [dbo].[currency_code]
(
	[id] BIGINT NOT NULL PRIMARY KEY identity(1,1),
	[currency_name] nvarchar(255) NOT NULL,
	[country] nvarchar(10) not null,
    [fee] float NOT NULL DEFAULT 0,
	[fee_type] int NOT NULL DEFAULT 0,
)

GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'貨幣名稱',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'currency_code',
    @level2type = N'COLUMN',
    @level2name = N'currency_name'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'國家',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'currency_code',
    @level2type = N'COLUMN',
    @level2name = N'country'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'收款幣種為此幣別時收的手續費(以匯出幣種為計價單位)',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'currency_code',
    @level2type = N'COLUMN',
    @level2name = N'fee'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'手續費計算方式\\n0:數量\\n1:百分比',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'currency_code',
    @level2type = N'COLUMN',
    @level2name = N'fee_type'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'國家可使用貨幣幣別,比如越南可收美金和越南盾',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'currency_code',
    @level2type = NULL,
    @level2name = NULL
