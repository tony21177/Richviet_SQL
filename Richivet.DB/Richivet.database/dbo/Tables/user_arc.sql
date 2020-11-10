--使用者KYC資料
CREATE TABLE [dbo].[user_arc]
(
	[id] BIGINT NOT NULL PRIMARY KEY identity(1,1),
	[user_id] bigint NOT NULL,
	[country] nvarchar(255),
	[arc_name] nvarchar(255),
	[arc_no] varchar(255) NOT NULL DEFAULT '',
	[passport_id] varchar(255) NOT NULL DEFAULT '',
	[back_sequence] varchar(255) NOT NULL DEFAULT '',
	[arc_issue_date] datetime DEFAULT NULL,
	[id_image_a] varchar(255) NOT NULL DEFAULT '',
	[id_image_b] varchar(255) NOT NULL DEFAULT '',
	[id_image_c] varchar(255) NOT NULL DEFAULT '',
	[kyc_status] int DEFAULT 0,
	[kyc_status_update_time] datetime NULL DEFAULT NULL,
	[create_time] datetime NULL DEFAULT getdate(),
	[update_time] datetime NULL DEFAULT getdate(),

	CONSTRAINT uq_user_id_Unique UNIQUE([user_id]),
	CONSTRAINT [FK_User_UserArc] FOREIGN KEY ([user_id]) REFERENCES [dbo].[user]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION,
   

)
