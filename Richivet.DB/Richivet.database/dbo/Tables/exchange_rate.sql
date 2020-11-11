CREATE TABLE [dbo].[exchange_rate]
(
	[id] BIGINT NOT NULL PRIMARY KEY identity(1,1),
	[currency_name] nvarchar(45) NOT NULL,
	[rate] float not null

	CONSTRAINT uq_currency_name_Unique UNIQUE([currency_name])  
)

SET IDENTITY_INSERT [dbo].[exchange_rate] ON
INSERT INTO [dbo].[exchange_rate] ([id], [currency_name], [rate]) VALUES (1, N'USD', 0.033)
INSERT INTO [dbo].[exchange_rate] ([id], [currency_name], [rate]) VALUES (2, N'VND', 800)
SET IDENTITY_INSERT [dbo].[exchange_rate] OFF

