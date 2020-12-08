CREATE TABLE [dbo].[notification_message]
(
	[Id] BIGINT NOT NULL PRIMARY KEY identity(1,1),
    [user_id] BIGINT NOT NULL, 
    [title] NVARCHAR(MAX) NOT NULL, 
    [content] NVARCHAR(MAX) NULL, 
    [image_url] NVARCHAR(MAX) NULL, 
    [is_read] BIT NOT NULL DEFAULT 0, 
    [language] NVARCHAR(50) NOT NULL,
    [update_time] DATETIME NOT NULL DEFAULT Getdate(),
    [create_time] DATETIME NOT NULL DEFAULT Getdate(),

    CONSTRAINT uq_notification_message_user_id UNIQUE([user_id]),
    CONSTRAINT [FK_notification_message] FOREIGN KEY ([user_id]) REFERENCES [dbo].[user]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION,
)


GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'對應user的pk',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'notification_message',
    @level2type = N'COLUMN',
    @level2name = N'user_id'

GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'推播通知標題',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'notification_message',
    @level2type = N'COLUMN',
    @level2name = N'title'

GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'推播通知內容',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'notification_message',
    @level2type = N'COLUMN',
    @level2name = N'content'

GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'推播通知圖片連結',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'notification_message',
    @level2type = N'COLUMN',
    @level2name = N'image_url'

GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'推播通知是否已讀取\\ntrue:已讀\\nfalse:未讀\\n',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'notification_message',
    @level2type = N'COLUMN',
    @level2name = N'is_read'

GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'推播通知語言碼',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'notification_message',
    @level2type = N'COLUMN',
    @level2name = N'language'