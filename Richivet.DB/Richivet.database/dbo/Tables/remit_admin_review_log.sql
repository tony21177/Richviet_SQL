CREATE TABLE [dbo].[remit_admin_review_log]
(
	[Id] BIGINT NOT NULL PRIMARY KEY identity(1,1),
    [remit_record_id] BIGINT NOT NULL, 
    [from_transaction_status] SMALLINT NOT NULL, 
    [to_transaction_status] SMALLINT NOT NULL, 
    [note] NVARCHAR(1000) NOT NULL DEFAULT '', 
    [create_time] DATETIME NOT NULL DEFAULT GETDATE(), 
    CONSTRAINT [FK_remit_admin_review_log_ToTable] FOREIGN KEY ([remit_record_id]) REFERENCES [remit_record](id),

)

GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'原來的交易狀態',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'remit_admin_review_log',
    @level2type = N'COLUMN',
    @level2name = N'from_transaction_status'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'備註',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'remit_admin_review_log',
    @level2type = N'COLUMN',
    @level2name = N'note'