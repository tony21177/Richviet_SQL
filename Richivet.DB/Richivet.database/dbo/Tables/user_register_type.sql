CREATE TABLE [dbo].[user_register_type]
(
	[id] BIGINT NOT NULL PRIMARY KEY identity(1,1),
	[user_id] BIGINT NOT NULL,
	[name] nvarchar(100) NOT NULL DEFAULT '',
	[auth_platform_id] nvarchar(45) NOT NULL,
	[register_type] int NOT NULL,
	[email] nvarchar(255) DEFAULT '',
	[register_time] datetime NULL DEFAULT NULL,
	[create_time] datetime NULL DEFAULT GETDATE(),
	[update_time] datetime NULL DEFAULT GETDATE(),

	CONSTRAINT [uni_user_id_platform_id] UNIQUE([user_id], [auth_platform_id]),
	CONSTRAINT [fk_user_register] FOREIGN KEY ([user_id]) REFERENCES [user] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
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
    @value = N'注册时间',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'user_register_type',
    @level2type = N'COLUMN',
    @level2name = N'register_time'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'更新时间',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'user_register_type',
    @level2type = N'COLUMN',
    @level2name = N'create_time'