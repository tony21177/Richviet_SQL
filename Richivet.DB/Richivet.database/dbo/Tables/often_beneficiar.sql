--常用收款人
CREATE TABLE [dbo].[often_beneficiar]
(
	[id] bigint NOT NULL PRIMARY KEY identity(1,1),
	[name] nvarchar(45) NOT NULL, 
	[payee_address] varchar(100) NOT NULL,
	[payee_id] varchar(100) NOT NULL DEFAULT '',
	[note] nvarchar(100) NOT NULL DEFAULT '',
	[user_id] bigint NOT NULL,
	[receive_bank_id] int DEFAULT NULL,
	[payee_type_id] bigint NOT NULL,
	[payee_relation_id] bigint NOT NULL DEFAULT 0,
	[create_time] datetime NULL DEFAULT GetDate(),
	[update_time] datetime NULL DEFAULT GetDate(),

    CONSTRAINT [fk_often_beneficiar_payee_relation] FOREIGN KEY ([payee_relation_id]) REFERENCES [dbo].[payee_relation_type]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT [fk_often_beneficiar_payee_type] FOREIGN KEY ([payee_type_id]) REFERENCES [dbo].[payee_type]([id]),
    CONSTRAINT [fk_often_beneficiar_user] FOREIGN KEY ([user_id]) REFERENCES [dbo].[user]([id]),
)

GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'收款人姓名',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'often_beneficiar',
    @level2type = N'COLUMN',
    @level2name = N'name'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'根據type有不同格式',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'often_beneficiar',
    @level2type = N'COLUMN',
    @level2name = N'payee_address'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'收款人的ID',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'often_beneficiar',
    @level2type = N'COLUMN',
    @level2name = N'payee_id'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'備註',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'often_beneficiar',
    @level2type = N'COLUMN',
    @level2name = N'note'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'對應receive_bank的pk(收款方銀行代號)',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'often_beneficiar',
    @level2type = N'COLUMN',
    @level2name = N'receive_bank_id'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'對照payee_type的pk(收款方式)',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'often_beneficiar',
    @level2type = N'COLUMN',
    @level2name = N'payee_type_id'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'對應payee_relation_type的pk(與收款人的關係)',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'often_beneficiar',
    @level2type = N'COLUMN',
    @level2name = N'payee_relation_id'