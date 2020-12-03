CREATE TABLE [dbo].[remit_record]
(
	[id] BIGINT NOT NULL PRIMARY KEY identity(1,1),
	[user_id] BIGINT NOT NULL,
	[arc_name] nvarchar(255) NOT NULL,
	[arc_no] nvarchar(255) NOT NULL,
	[payee_type] TINYINT NOT NULL,
	[id_image_a] nvarchar(512) NOT NULL DEFAULT '',
	[id_image_b] nvarchar(512) NOT NULL DEFAULT '',
	[id_image_c] nvarchar(512) NOT NULL DEFAULT '',
	[real_time_pic] nvarchar(512) NOT NULL DEFAULT '',
	[e_signature] nvarchar(512) DEFAULT '' NOT NULL,
	[create_time] DATETIME NOT NULL DEFAULT GETDATE(),
	[update_time] DATETIME NOT NULL DEFAULT GETDATE(),
	[from_currency_id] BIGINT NULL DEFAULT null,
	[to_currency_id] BIGINT NULL DEFAULT null,
	[from_amount] FLOAT NOT NULL DEFAULT 0,
	[apply_exchange_rate] float NOT NULL DEFAULT 0,
	[transaction_exchange_rate] float NOT NULL DEFAULT 0,
	[fee] float DEFAULT 0 NOT NULL,
	[fee_type] TINYINT NOT NULL DEFAULT 0,
	[discount_id] BIGINT DEFAULT NULL,
	[discount_amount] float DEFAULT NULL,
	[beneficiary_id] bigint DEFAULT NULL,
	[transaction_status] SMALLINT  NOT NULL DEFAULT 0,
	[payment_time] datetime NULL DEFAULT NULL,
	[payment_code] nvarchar(200) null DEFAULT NULL,

    [arc_scan_record_id] BIGINT NULL DEFAULT NULL,
    [aml_scan_record_id] BIGINT NULL DEFAULT NULL, 
    [formal_apply_time] DATETIME NULL DEFAULT NULL, 
    CONSTRAINT [fk_remit_record_arc_scan_record] FOREIGN KEY ([arc_scan_record_id]) REFERENCES [dbo].[arc_scan_record] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT [FK_often_beneficiary_remit_record] FOREIGN KEY ([beneficiary_id]) REFERENCES [dbo].[often_beneficiary]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT [fk_remit_record_user1] FOREIGN KEY ([user_id]) REFERENCES [dbo].[user]([id]), 
    CONSTRAINT [FK_remit_record_currency_code] FOREIGN KEY ([to_currency_id]) REFERENCES [dbo].[currency_code]([id]),
   
)

GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'收款方式,對應table:payee_type',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'remit_record',
    @level2type = N'COLUMN',
    @level2name = N'payee_type'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'匯出國家幣(對應currency_code的pk)',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'remit_record',
    @level2type = N'COLUMN',
    @level2name = N'from_currency_id'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'收款國家幣(對應currency_code的pk)',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'remit_record',
    @level2type = N'COLUMN',
    @level2name = N'to_currency_id'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'使用者申請時當下匯率',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'remit_record',
    @level2type = N'COLUMN',
    @level2name = N'apply_exchange_rate'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'實際匯款時的匯率',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'remit_record',
    @level2type = N'COLUMN',
    @level2name = N'transaction_exchange_rate'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'手續費要搭配fee_type',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'remit_record',
    @level2type = N'COLUMN',
    @level2name = N'fee'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'手續費計算方式\n0:數量\n1:百分比',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'remit_record',
    @level2type = N'COLUMN',
    @level2name = N'fee_type'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'總折扣金額',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'remit_record',
    @level2type = N'COLUMN',
    @level2name = N'discount_amount'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'-10:其他錯誤,-9: 審核失敗,-8: AML未通過,-7:交易逾期,0:草稿,1: 待ARC審核,2ARC審核成功,3:AML審核成功,4:營運人員確認OK,待會員繳款狀態,5: 已繳款,待營運人員處理,9:處理完成',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'remit_record',
    @level2type = N'COLUMN',
    @level2name = N'transaction_status'
GO

GO


GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'會員繳款時間',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'remit_record',
    @level2type = N'COLUMN',
    @level2name = N'payment_time'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'繳款碼,給前端產生QR CODE用',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'remit_record',
    @level2type = N'COLUMN',
    @level2name = N'payment_code'
GO

EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'匯款紀錄',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'remit_record',
    @level2type = NULL,
    @level2name = NULL
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'對應的系統掃描arc紀錄id',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'remit_record',
    @level2type = N'COLUMN',
    @level2name = N'arc_scan_record_id'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'對應的系統掃描AML紀錄id',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'remit_record',
    @level2type = N'COLUMN',
    @level2name = N'aml_scan_record_id'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'送出匯款申請時間',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'remit_record',
    @level2type = N'COLUMN',
    @level2name = N'formal_apply_time'
GO
