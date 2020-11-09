CREATE TABLE [dbo].[receive_bank]
(
	[id] BIGINT NOT NULL PRIMARY KEY identity(1,1),
	[swift_code] nvarchar(15) NOT NULL,
	[code] nvarchar(5) NOT NULL,
	[viet_name] nvarchar(100) NOT NULL,
	[en_name] nvarchar(100) NOT NULL,
	[tw_name] nvarchar(100) NOT NULL,
	[sort_num] int default 0

	CONSTRAINT uq_swift_code_Unique UNIQUE([swift_code])  
) 
