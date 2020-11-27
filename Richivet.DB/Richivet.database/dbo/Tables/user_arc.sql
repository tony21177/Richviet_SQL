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
	[arc_issue_date] DATE DEFAULT NULL,
    [arc_expire_date] DATE DEFAULT NULL,
	[id_image_a] varchar(255) NOT NULL DEFAULT '',
	[id_image_b] varchar(255) NOT NULL DEFAULT '',
	[id_image_c] varchar(255) NOT NULL DEFAULT '',
	[kyc_status] SMALLINT DEFAULT 0 NOT NULL,
	[kyc_status_update_time] datetime NULL DEFAULT NULL,
	[create_time] DATETIME NOT NULL DEFAULT getdate(),
	[update_time] DATETIME NOT NULL DEFAULT getdate(),

    [last_arc_scan_record_id] BIGINT NULL DEFAULT NULL, 
    CONSTRAINT uq_user_id_Unique UNIQUE([user_id]),
	CONSTRAINT [FK_User_UserArc] FOREIGN KEY ([user_id]) REFERENCES [dbo].[user]([id]) ON DELETE CASCADE ON UPDATE NO ACTION,
    CONSTRAINT [fk_user_arc_scan_id] FOREIGN KEY ([last_arc_scan_record_id]) REFERENCES [dbo].[arc_scan_record] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
   

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
    @value = N'KYC審核狀態, -10:禁用,-9:KYC未通過,-8:AML未通過 ,0:草稿會員,1:待審核(註冊完),2:ARC驗證成功,3:AML通過,9:正式會員(KYC審核通過)',
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
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'使用者KYC資料',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'user_arc',
    @level2type = NULL,
    @level2name = NULL
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'居留期限',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'user_arc',
    @level2type = N'COLUMN',
    @level2name = N'arc_expire_date'
GO

GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'最後一次的ARC掃描紀錄id',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'user_arc',
    @level2type = N'COLUMN',
    @level2name = N'last_arc_scan_record_id'