--服務所在國家的匯款相關設定
CREATE TABLE [dbo].[bussiness_unit_remit_setting]
(
	[id] BIGINT NOT NULL PRIMARY KEY identity(1,1),
	[country] nvarchar(10) NOT NULL,
	[remit_min] float not null,
	[remit_max] float not null,
	[update_time] datetime not null DEFAULT GETDATE(),
	CONSTRAINT uq_country_Unique UNIQUE([country])  
)

GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'服務所在國家',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'bussiness_unit_remit_setting',
    @level2type = N'COLUMN',
    @level2name = N'country'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'匯款最低金額',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'bussiness_unit_remit_setting',
    @level2type = N'COLUMN',
    @level2name = N'remit_min'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'匯款最高金額',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'bussiness_unit_remit_setting',
    @level2type = N'COLUMN',
    @level2name = N'remit_max'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'服務所在國家的匯款相關設定',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'bussiness_unit_remit_setting',
    @level2type = NULL,
    @level2name = NULL

