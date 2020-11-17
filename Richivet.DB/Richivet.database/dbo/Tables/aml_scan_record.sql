CREATE TABLE [dbo].[aml_scan_record]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY, 
    [aml_status] SMALLINT NOT NULL DEFAULT 0, 
    [scan_time] DATETIME NOT NULL DEFAULT Getdate(), 
    [description] NVARCHAR(MAX) NULL DEFAULT NULL,

)

GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'會員AML系統掃描紀錄',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'aml_scan_record',
    @level2type = NULL,
    @level2name = NULL