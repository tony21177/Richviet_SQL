--用户表
CREATE TABLE [dbo].[user]
(
	[id] BIGINT NOT NULL PRIMARY KEY identity(1,1),
	[phone] nvarchar(255),
	[email] nvarchar(255),
	[password] nvarchar(255),
	[gender] int NOT NULL DEFAULT 0,
	[create_time] datetime NULL DEFAULT Getdate(),
	[update_time] datetime NULL DEFAULT Getdate(),
	[birthday] datetime NULL DEFAULT getdate(),
	[status] int   NOT NULL DEFAULT 0,
)

GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'會員狀態\\\\n0:草稿會員\\\\n1:正式會員',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'user',
    @level2type = N'COLUMN',
    @level2name = N'status'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'更新时间',
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