--用户表
CREATE TABLE [dbo].[user]
(
	[id] BIGINT NOT NULL PRIMARY KEY identity(1,1),
	[phone] nvarchar(255) NOT NULL DEFAULT '',
	[email] nvarchar(255) NOT NULL DEFAULT '',
	[password] nvarchar(255) DEFAULT NULL,
	[gender] int NOT NULL DEFAULT 0,
	[create_time] datetime NOT NULL DEFAULT Getdate(),
	[update_time] datetime NOT NULL DEFAULT Getdate(),
	[birthday] DATE NULL DEFAULT NULL, 
    [level] TINYINT NOT NULL DEFAULT 0
)

GO

GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'更新時間',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'user',
    @level2type = N'COLUMN',
    @level2name = N'update_time'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'0:其他(包括未填)\\n1:男\\n2:女\\n',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'user',
    @level2type = N'COLUMN',
    @level2name = N'gender'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'密碼',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'user',
    @level2type = N'COLUMN',
    @level2name = N'password'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'信箱',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'user',
    @level2type = N'COLUMN',
    @level2name = N'email'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'手機號碼',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'user',
    @level2type = N'COLUMN',
    @level2name = N'phone'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'用户',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'user',
    @level2type = NULL,
    @level2name = NULL
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'會員等級0:一般會員;1:VIP;9:高風險',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'user',
    @level2type = N'COLUMN',
    @level2name = N'level'