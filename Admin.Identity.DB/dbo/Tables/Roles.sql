CREATE TABLE [dbo].[Roles]
(
    [RoleCode]	      NVARCHAR (128)   NOT NULL,
	[RoleName]        NVARCHAR (256)    NOT NULL,
	[Description]     NVARCHAR (256)    NULL,
	[CreateUser]	  NVARCHAR (256)    NOT NULL DEFAULT 'System',
	[UpdateUser]	  NVARCHAR (256)    NOT NULL DEFAULT 'System',
	[CreateTime]		  DateTime			NOT NULL,
	[UpdateTime]	  DateTime			NOT NULL,
	CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED ([RoleCode]),
    CONSTRAINT [UK_Roles] UNIQUE ([RoleName])
)
GO

EXEC sp_addextendedproperty @name = N'MS_Description', 
	@value=N'角色' , 
	@level0type=N'SCHEMA',
	@level0name=N'dbo', 
	@level1type=N'TABLE',
	@level1name=N'Roles'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'角色名稱',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'Roles',
    @level2type = N'COLUMN',
    @level2name = 'RoleName'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'建立人員',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'Roles',
    @level2type = N'COLUMN',
    @level2name = N'CreateUser'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'更新人員',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'Roles',
    @level2type = N'COLUMN',
    @level2name = N'UpdateUser'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'建立時間',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'Roles',
    @level2type = N'COLUMN',
    @level2name = 'CreateTime'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'更新時間',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'Roles',
    @level2type = N'COLUMN',
    @level2name = N'UpdateTime'