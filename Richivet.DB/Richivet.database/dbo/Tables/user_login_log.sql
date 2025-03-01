﻿CREATE TABLE [dbo].[user_login_log]
(
	[id] BIGINT NOT NULL PRIMARY KEY identity(1,1),
	[ip] nvarchar(255) NOT NULL DEFAULT '',
	[address] nvarchar(1024) NOT NULL DEFAULT '',
	[login_type] TINYINT NOT NULL,
	[login_time] DATETIME NULL DEFAULT getdate() ,
	[user_id] bigint NOT NULL

   

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
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'用戶登入紀錄',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'user_login_log',
    @level2type = NULL,
    @level2name = NULL