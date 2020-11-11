CREATE TABLE [dbo].[exchange_rate]
(
	[id] BIGINT NOT NULL PRIMARY KEY identity(1,1),
	[currency_name] nvarchar(45) NOT NULL,
	[rate] float not null

	CONSTRAINT uq_currency_name_Unique UNIQUE([currency_name])  
)

