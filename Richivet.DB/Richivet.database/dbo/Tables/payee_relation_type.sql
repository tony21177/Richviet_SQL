CREATE TABLE [dbo].[payee_relation_type]
(
	[id] BIGINT NOT NULL PRIMARY KEY,
	[type] int NOT NULL,
	[description] nvarchar(200) NOT NULL DEFAULT '',
)
