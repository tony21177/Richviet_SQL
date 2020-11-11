CREATE TABLE [dbo].[UsersXRoles]
(
	[RoleCode] NVARCHAR (128)    NOT NULL,
	[UserCode]  NVARCHAR (128)    NOT NULL,

	CONSTRAINT [PK_UsersXRoles] PRIMARY KEY CLUSTERED ([RoleCode] ASC, [UserCode] ASC),
    CONSTRAINT [FK_UsersXRoles_Roles] FOREIGN KEY ([RoleCode]) REFERENCES [dbo].[Roles] ([RoleCode]) ON DELETE CASCADE,
    CONSTRAINT [FK_UsersXRoles_AdminUser] FOREIGN KEY ([UserCode]) REFERENCES [dbo].[AdminUser] ([UserCode]) ON DELETE CASCADE

)

GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'使用者角色對應檔',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'UsersXRoles',
    @level2type = NULL,
    @level2name = NULL
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'使用者識別',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'UsersXRoles',
    @level2type = N'COLUMN',
    @level2name = N'UserCode'