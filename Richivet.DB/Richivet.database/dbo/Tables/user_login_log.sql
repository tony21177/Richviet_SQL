CREATE TABLE [dbo].[user_login_log]
(
	[id] BIGINT NOT NULL PRIMARY KEY identity(1,1),
	[ip] nvarchar(255) NOT NULL DEFAULT '',
	[address] nvarchar(1024) NOT NULL DEFAULT '',
	[login_type] int NOT NULL,
	[login_time] datetime NULL DEFAULT NULL,
	[user_id] bigint NOT NULL,

	CONSTRAINT [fk_user_login_log_user] FOREIGN KEY ([user_id]) REFERENCES [dbo].[user]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION,
   

)

GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'login地區',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'user_login_log',
    @level2type = N'COLUMN',
    @level2name = N'address'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'登入時間',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'user_login_log',
    @level2type = N'COLUMN',
    @level2name = N'login_time'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'0:平台本身\\n1:FB\\n2:apple\\n3:google\\n4:zalo',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'user_login_log',
    @level2type = N'COLUMN',
    @level2name = N'login_type'