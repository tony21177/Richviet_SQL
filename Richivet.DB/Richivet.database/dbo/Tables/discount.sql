CREATE TABLE [dbo].[discount]
(
	[id] BIGINT NOT NULL PRIMARY KEY identity(1,1),
	[user_id] BIGINT NOT NULL,
	[value] float NOT NULL,
	[effective_date] datetime DEFAULT NULL,
	[expire_date] datetime DEFAULT NULL,
	[use_status]  int NOT NULL DEFAULT 0,
	[create_time] datetime NOT NULL DEFAULT Getdate(),
	[update_time] datetime NOT NULL DEFAULT Getdate(),

	CONSTRAINT [ffk_discount_user] FOREIGN KEY ([user_id]) REFERENCES [dbo].[user]([id]),
)

GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'0:可使用,1:已使用,2:無效',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'discount',
    @level2type = N'COLUMN',
    @level2name = N'use_status'