CREATE TABLE [dbo].[push_notification_setting]
(
	[id] BIGINT NOT NULL PRIMARY KEY identity(1,1),
	[user_id] bigint NOT NULL,
	[mobile_token] NVARCHAR(256) NULL,
	[is_turn_on] TINYINT NOT NULL DEFAULT 1,

	CONSTRAINT uq_push_notification_setting_user_id UNIQUE([user_id]),
	CONSTRAINT [FK_push_notification_setting] FOREIGN KEY ([user_id]) REFERENCES [dbo].[user]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION,
)
