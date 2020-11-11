--可收款银行表
CREATE TABLE [dbo].[receive_bank]
(
	[id] BIGINT NOT NULL PRIMARY KEY identity(1,1),
	[swift_code] nvarchar(15) NOT NULL,
	[code] nvarchar(5) NOT NULL,
	[viet_name] nvarchar(100) NOT NULL,
	[en_name] nvarchar(100) NOT NULL,
	[tw_name] nvarchar(100) NOT NULL,
	[sort_num] int default 0

	CONSTRAINT uq_swift_code_Unique UNIQUE([swift_code]) NOT NULL  
) 

GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'台灣銀行代碼',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'receive_bank',
    @level2type = N'COLUMN',
    @level2name = N'code'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'名稱(越南)',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'receive_bank',
    @level2type = N'COLUMN',
    @level2name = N'viet_name'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'名稱(英文)',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'receive_bank',
    @level2type = N'COLUMN',
    @level2name = N'en_name'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'名稱(繁体中文)',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'receive_bank',
    @level2type = N'COLUMN',
    @level2name = N'tw_name'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'排序',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'receive_bank',
    @level2type = N'COLUMN',
    @level2name = N'sort_num'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'可收款银行表',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'receive_bank',
    @level2type = NULL,
    @level2name = NULL