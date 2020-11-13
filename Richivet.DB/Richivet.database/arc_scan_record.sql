CREATE TABLE [dbo].[arc_scan_record]
(
	[Id] BIGINT NOT NULL PRIMARY KEY IDENTITY, 
    [remit_record_id] BIGINT NULL DEFAULT null, 
    [arc_status] TINYINT NOT NULL DEFAULT 0, 
    [scan_time] DATETIME NOT NULL DEFAULT Getdate()
)

GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'會員KYC移民署系統掃描紀錄',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'arc_scan_record',
    @level2type = NULL,
    @level2name = NULL
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'此欄位有值時,對應至remit_record,代表為會員申請匯款時做的ARC驗證,null表示為註冊時做的ARC驗證',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'arc_scan_record',
    @level2type = N'COLUMN',
    @level2name = N'remit_record_id'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'系統移民屬ARC驗證,0:未確認,1:資料符合,2:資料不符,3:系統驗證失敗',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'arc_scan_record',
    @level2type = N'COLUMN',
    @level2name = N'arc_status'