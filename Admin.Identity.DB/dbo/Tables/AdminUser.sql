CREATE TABLE [dbo].[AdminUser]
(
	 [UserCode]	NVARCHAR (128)   NOT NULL,
	 [Account] 	NVARCHAR (256)    NOT NULL,
	 [Password] NVARCHAR (256)    NOT NULL,
	 [IsSystemPassword] BIT    NOT NULL DEFAULT 1,
	 [UserName]	NVARCHAR (256)    NOT NULL,
	 [Email] NVARCHAR (256)   NULL,
	 [CellPhone] NVARCHAR (32)   NULL,
	 [Phone] NVARCHAR (32)   NULL,
	 [Address] NVARCHAR (256)   NULL,
	 [TwoFactorEnable] BIT NOT NULL DEFAULT 0,
	 [TwoFactorType]   INT NOT NULL DEFAULT 1, --1 -> SMS 2 --> Email
	 [IsActive]		  BIT	NOT NULL DEFAULT 0,
	 [Language]		  NVARCHAR(8) NOT NULL DEFAULT 'en-US',
	 [TimeZone]		  NVARCHAR(64) NOT NULL DEFAULT 'UTC',
	 [CreateUser]	  NVARCHAR (256)    NOT NULL DEFAULT 'System',
	 [UpdateUser]	  NVARCHAR (256)    NOT NULL DEFAULT 'System',
	 [CreatTime]	  DateTime			NOT NULL,
	 [UpdateTime]	  DateTime			NOT NULL,

	 CONSTRAINT [PK_AdminUser] PRIMARY KEY CLUSTERED ([UserCode] ASC)
)

GO

CREATE UNIQUE INDEX [IX_AdminUser_Account] ON [dbo].[AdminUser] ([Account])
GO

EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'使用者',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'AdminUser',
    @level2type = NULL,
    @level2name = NULL
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'使用者識別',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'AdminUser',
    @level2type = N'COLUMN',
    @level2name = N'UserCode'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'使用者帳號',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'AdminUser',
    @level2type = N'COLUMN',
    @level2name = N'Account'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'使用者名稱',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'AdminUser',
    @level2type = N'COLUMN',
    @level2name = 'UserName'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'使用者電子信箱',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'AdminUser',
    @level2type = N'COLUMN',
    @level2name = N'Email'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'使用者手機',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'AdminUser',
    @level2type = N'COLUMN',
    @level2name = N'CellPhone'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'是否需要雙因子驗證',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'AdminUser',
    @level2type = N'COLUMN',
    @level2name = N'TwoFactorEnable'
GO


EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'是否停權',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'AdminUser',
    @level2type = N'COLUMN',
    @level2name = N'IsActive'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'密碼(加密)',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'AdminUser',
    @level2type = N'COLUMN',
    @level2name = N'Password'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'使用者電話',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'AdminUser',
    @level2type = N'COLUMN',
    @level2name = N'Phone'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'地址',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'AdminUser',
    @level2type = N'COLUMN',
    @level2name = N'Address'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'時區',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'AdminUser',
    @level2type = N'COLUMN',
    @level2name = N'TimeZone'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'語言',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'AdminUser',
    @level2type = N'COLUMN',
    @level2name = N'Language'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'建立人員',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'AdminUser',
    @level2type = N'COLUMN',
    @level2name = N'CreateUser'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'更新人員',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'AdminUser',
    @level2type = N'COLUMN',
    @level2name = N'UpdateUser'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'建立時間',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'AdminUser',
    @level2type = N'COLUMN',
    @level2name = N'CreatTime'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'更新時間',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'AdminUser',
    @level2type = N'COLUMN',
    @level2name = N'UpdateTime'
