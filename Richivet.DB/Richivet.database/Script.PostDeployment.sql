/*
部署後指令碼樣板							
--------------------------------------------------------------------------------------
 此檔案包含要附加到組建指令碼的 SQL 陳述式		
 使用 SQLCMD 語法可將檔案包含在部署後指令碼中			
 範例:      :r .\myfile.sql								
 使用 SQLCMD 語法可參考部署後指令碼中的變數		
 範例:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/

/* bussiness_unit_remit_setting */
SET IDENTITY_INSERT [dbo].[bussiness_unit_remit_setting] ON

IF EXISTS (SELECT [id] FROM [dbo].[bussiness_unit_remit_setting])
    DELETE FROM [dbo].[bussiness_unit_remit_setting]
ELSE
    INSERT INTO [dbo].[bussiness_unit_remit_setting] ( [country], [remit_min], [remit_max], [update_time]) VALUES ( N'TW', 1000, 30000, N'2020-11-11 10:18:47')

SET IDENTITY_INSERT [dbo].[bussiness_unit_remit_setting] OFF

/* currency_code */
SET IDENTITY_INSERT [dbo].[currency_code] ON

IF EXISTS (SELECT [id] FROM [dbo].[currency_code])
    DELETE FROM [dbo].[currency_code]
ELSE
    INSERT INTO [dbo].[currency_code] ( [currency_name], [country], [fee], [fee_type]) VALUES ( N'TWD', N'TW', 0, 0)
    INSERT INTO [dbo].[currency_code] ( [currency_name], [country], [fee], [fee_type]) VALUES ( N'USD', N'US', 0, 0)
    INSERT INTO [dbo].[currency_code] ( [currency_name], [country], [fee], [fee_type]) VALUES ( N'VND', N'VN', 0, 0)
    INSERT INTO [dbo].[currency_code] ( [currency_name], [country], [fee], [fee_type]) VALUES ( N'USD', N'VN', 0, 0)

SET IDENTITY_INSERT [dbo].[currency_code] OFF

/* exchange_rate */
SET IDENTITY_INSERT [dbo].[exchange_rate] ON

IF EXISTS (SELECT [id] FROM [dbo].[exchange_rate])
    DELETE FROM [dbo].[exchange_rate]
ELSE
    INSERT INTO [dbo].[exchange_rate] ( [currency_name], [rate]) VALUES ( N'USD', 0.033)
    INSERT INTO [dbo].[exchange_rate] ( [currency_name], [rate]) VALUES ( N'VND', 800)

SET IDENTITY_INSERT [dbo].[exchange_rate] OFF

/* payee_relation_type */
SET IDENTITY_INSERT [dbo].[payee_relation_type] ON

IF EXISTS (SELECT [id] FROM [dbo].[payee_relation_type])
    DELETE FROM [dbo].[payee_relation_type]
ELSE
    INSERT INTO [dbo].[payee_relation_type] ( [type], [description]) VALUES ( 0, N'父母')
    INSERT INTO [dbo].[payee_relation_type] ( [type], [description]) VALUES ( 1, N'兄弟姊妹')
    INSERT INTO [dbo].[payee_relation_type] ( [type], [description]) VALUES (2, N'兒女')

SET IDENTITY_INSERT [dbo].[payee_relation_type] OFF

/* payee_type */
SET IDENTITY_INSERT [dbo].[payee_type] ON

IF EXISTS (SELECT [id] FROM [dbo].[payee_type])
    DELETE FROM [dbo].[payee_type]
ELSE
    INSERT INTO [dbo].[payee_type] ( [type], [description]) VALUES ( 0, N'銀行帳號匯款')

SET IDENTITY_INSERT [dbo].[payee_type] OFF

/* receive_bank */
SET IDENTITY_INSERT [dbo].[receive_bank] ON

IF EXISTS (SELECT [id] FROM [dbo].[receive_bank])
    DELETE FROM [dbo].[receive_bank]
ELSE
    INSERT INTO [dbo].[receive_bank] ( [swift_code], [code], [viet_name], [en_name], [tw_name], [sort_num]) VALUES ( N'UWCBTWTP007', N'013', N'Ngân hàng Cathay United', N'Cathay United Bank', N'NULL國泰世華商業銀行', 1)

SET IDENTITY_INSERT [dbo].[receive_bank] OFF