CREATE TABLE [dbo].[user_register_type]
(
	[id] BIGINT NOT NULL PRIMARY KEY identity(1,1),
	[user_id] BIGINT NOT NULL,
	[name] nvarchar(100) NOT NULL DEFAULT '',
	[auth_platform_id] nvarchar(45) NOT NULL,
	[register_type] int NOT NULL,
	[email] nvarchar(255) DEFAULT '',
	[register_time] datetime NULL DEFAULT NULL,
	[create_time] datetime NULL DEFAULT GETDATE(),
	[update_time] datetime NULL DEFAULT GETDATE(),

	CONSTRAINT [uni_user_id_platform_id] UNIQUE([user_id], [auth_platform_id]),
	CONSTRAINT [fk_user_register] FOREIGN KEY ([user_id]) REFERENCES [user] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
)
