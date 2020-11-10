--使用者KYC資料
CREATE TABLE [dbo].[user_arc]
(
	[id] BIGINT NOT NULL PRIMARY KEY identity(1,1),
	[user_id] bigint NOT NULL,
	[country] nvarchar(255) NOT NULL DEFAULT '',
	[arc_name] nvarchar(255) NOT NULL DEFAULT '',
	[arc_no] varchar(255) NOT NULL DEFAULT '',
	[passport_id] varchar(255) NOT NULL DEFAULT '',
	[back_sequence] varchar(255) NOT NULL DEFAULT '',
	[arc_issue_date] datetime DEFAULT NULL,
	[id_image_a] varchar(255) NOT NULL DEFAULT '',
	[id_image_b] varchar(255) NOT NULL DEFAULT '',
	[id_image_c] varchar(255) NOT NULL DEFAULT '',
	[kyc_status] int DEFAULT 0,
	[kyc_status_update_time] datetime NULL DEFAULT NULL,
	[create_time] datetime NULL DEFAULT getdate(),
	[update_time] datetime NULL DEFAULT getdate(),

	CONSTRAINT uq_user_id_Unique UNIQUE([user_id]),
	CONSTRAINT [FK_User_UserArc] FOREIGN KEY ([user_id]) REFERENCES [dbo].[user]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION,
   

)

GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'對應user的pk',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'user_arc',
    @level2type = N'COLUMN',
    @level2name = N'user_id'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'國家',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'user_arc',
    @level2type = N'COLUMN',
    @level2name = N'country'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'ARC姓名',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'user_arc',
    @level2type = N'COLUMN',
    @level2name = N'arc_name'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'ARC ID',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'user_arc',
    @level2type = N'COLUMN',
    @level2name = N'arc_no'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'護照號碼',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'user_arc',
    @level2type = N'COLUMN',
    @level2name = N'passport_id'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'背面序號',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'user_arc',
    @level2type = N'COLUMN',
    @level2name = N'back_sequence'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'發證日期',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'user_arc',
    @level2type = N'COLUMN',
    @level2name = N'arc_issue_date'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'證件正面',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'user_arc',
    @level2type = N'COLUMN',
    @level2name = N'id_image_a'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'證件反面',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'user_arc',
    @level2type = N'COLUMN',
    @level2name = N'id_image_b'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'手持證件照',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'user_arc',
    @level2type = N'COLUMN',
    @level2name = N'id_image_c'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'KYC審核狀態, \\\\r\\\\n9:未通過, \\\\r\\\\n0:未認證,\\\\r\\\\n1:待審核,\\\\r\\\\n2:審核通過;',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'user_arc',
    @level2type = N'COLUMN',
    @level2name = N'kyc_status'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'審核時間',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'user_arc',
    @level2type = N'COLUMN',
    @level2name = N'kyc_status_update_time'