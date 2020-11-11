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

SET IDENTITY_INSERT [dbo].[bussiness_unit_remit_setting] ON

IF EXISTS (SELECT [id] FROM [dbo].[bussiness_unit_remit_setting])
    DELETE FROM [dbo].[bussiness_unit_remit_setting]
ELSE
    INSERT INTO [dbo].[bussiness_unit_remit_setting] ([id], [country], [remit_min], [remit_max], [update_time]) VALUES (1, N'TW', 1000, 30000, N'2020-11-11 10:18:47')


SET IDENTITY_INSERT [dbo].[bussiness_unit_remit_setting] OFF