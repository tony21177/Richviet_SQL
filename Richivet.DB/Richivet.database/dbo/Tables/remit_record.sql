CREATE TABLE [dbo].[remit_record]
(
	[id] BIGINT NOT NULL PRIMARY KEY identity(1,1),
	[user_id] BIGINT NOT NULL,
	[arc_name] nvarchar(255) NOT NULL,
	[arc_no] nvarchar(255) NOT NULL,
	[payee_type] INT NOT NULL,
	[id_image_a] nvarchar(512) NOT NULL DEFAULT '',
	[id_image_b] nvarchar(512) NOT NULL DEFAULT '',
	[id_image_c] nvarchar(512) NOT NULL DEFAULT '',
	[real_time_pic] nvarchar(512) NOT NULL DEFAULT '',
	[e-signature] nvarchar(512) DEFAULT '' NOT NULL,
	[create_time] datetime NOT NULL DEFAULT GETDATE(),
	[update_time] datetime NOT NULL DEFAULT GETDATE(),
	[from_currency_id] int NULL DEFAULT null,
	[to_currency_id] int NULL DEFAULT null,
	[from_amount] FLOAT NOT NULL DEFAULT 0,
	[apply_exchange_rate] float NOT NULL DEFAULT 0,
	[transaction_exchange_rate] float NOT NULL DEFAULT 0,
	[fee] float DEFAULT 0,
	[fee_type] int NULL DEFAULT 0,
	[discount_id] int DEFAULT NULL,
	[discount_amount] float DEFAULT NULL,
	[beneficiar_id] bigint DEFAULT NULL,
	[transaction_status] int  NOT NULL DEFAULT 98,
	[arc_status]  int  DEFAULT 0,
	[arc_verify_time] datetime NULL DEFAULT NULL,
	[payment_time] datetime NULL DEFAULT NULL,
	[payment_code] nvarchar(200) null DEFAULT NULL,

    CONSTRAINT [FK_often_beneficiar_remit_record] FOREIGN KEY ([beneficiar_id]) REFERENCES [dbo].[often_beneficiar]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT [fk_remit_record_user1] FOREIGN KEY ([user_id]) REFERENCES [dbo].[user]([id]),
   
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
    @value = N'99:其他錯誤\\\\98:草稿\\\\n9: 審核失敗\\\\n0: 待審核(系統進入arc_status流程)\\\\n1: 待繳款\\\\n2: 已繳款\\\\n3:處理完成',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'remit_record',
    @level2type = N'COLUMN',
    @level2name = N'transaction_status'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'0:arc未審核,1:系統自動審核arc成功',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'remit_record',
    @level2type = N'COLUMN',
    @level2name = N'arc_status'
GO

EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'系統自動審核移名屬ARC時間',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'remit_record',
    @level2type = N'COLUMN',
    @level2name = N'arc_verify_time'
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
