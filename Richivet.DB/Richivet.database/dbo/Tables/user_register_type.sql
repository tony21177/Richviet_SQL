CREATE TABLE [dbo].[user_register_type]
(
	[id] BIGINT NOT NULL PRIMARY KEY identity(1,1),
	[user_id] BIGINT NOT NULL,
	[name] nvarchar(100) NOT NULL DEFAULT '',
	[auth_platform_id] nvarchar(45) NOT NULL,
	[register_type] TINYINT NOT NULL,
	[email] nvarchar(255) DEFAULT '',
	[register_time] DATETIME NULL DEFAULT NULL,
	[create_time] DATETIME NOT NULL DEFAULT GETDATE(),
	[update_time] DATETIME NOT NULL DEFAULT GETDATE(),

	CONSTRAINT [uni_user_id_platform_id] UNIQUE([user_id], [auth_platform_id]),
	CONSTRAINT [fk_user_register] FOREIGN KEY ([user_id]) REFERENCES [user] ([id]) ON DELETE CASCADE ON UPDATE NO ACTION
)

GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'平台的名字',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'user_register_type',
    @level2type = N'COLUMN',
    @level2name = N'name'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'不同平台(FB,Apple...)的id',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'user_register_type',
    @level2type = N'COLUMN',
    @level2name = N'auth_platform_id'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'註冊方式\\\\n0:平台本身\\n1:FB\\n2:apple\\n3:google\\n4:zalo\n',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'user_register_type',
    @level2type = N'COLUMN',
    @level2name = N'register_type'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'註冊時間',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'user_register_type',
    @level2type = N'COLUMN',
    @level2name = N'register_time'
GO

GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'對應user的pk',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'user_register_type',
    @level2type = N'COLUMN',
    @level2name = N'user_id'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'使用者註冊的方式',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'user_register_type',
    @level2type = NULL,
    @level2name = NULL
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'更新時間',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'user_register_type',
    @level2type = N'COLUMN',
    @level2name = N'update_time'