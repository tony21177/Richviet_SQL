CREATE TABLE [dbo].[push_notification_setting]
(
	[id] BIGINT NOT NULL PRIMARY KEY identity(1,1),
	[user_id] bigint NOT NULL,
	[mobile_token] NVARCHAR(256) NULL,
	[is_turn_on] TINYINT NOT NULL DEFAULT 1,
	[create_time] DATETIME NOT NULL DEFAULT Getdate(),
	[update_time] DATETIME NOT NULL DEFAULT Getdate(),

	CONSTRAINT uq_push_notification_setting_user_id UNIQUE([user_id]),
	CONSTRAINT [FK_push_notification_setting] FOREIGN KEY ([user_id]) REFERENCES [dbo].[user]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION,
)


GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'對應user的pk',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'push_notification_setting',
    @level2type = N'COLUMN',
    @level2name = N'user_id'

GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'推播通知所需的裝置識別token',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'push_notification_setting',
    @level2type = N'COLUMN',
    @level2name = N'mobile_token'

GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'使用者通知開關\\n1:開啟\\n0:關閉\\n',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'push_notification_setting',
    @level2type = N'COLUMN',
    @level2name = N'is_turn_on'

