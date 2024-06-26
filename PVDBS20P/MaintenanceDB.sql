-- Enabling the replication database
use master
exec sp_replicationdboption @dbname = N'MaintenanceDB', @optname = N'publish', @value = N'true'
GO

exec [MaintenanceDB].sys.sp_addlogreader_agent @job_login = null, @job_password = null, @publisher_security_mode = 1
GO
-- Adding the transactional publication
use [MaintenanceDB]
exec sp_addpublication @publication = N'MaintenanceDB', @description = N'Transactional publication of database ''MaintenanceDB'' from Publisher ''PVCO01P-NAV\NAV''.', @sync_method = N'concurrent', @retention = 36, @allow_push = N'true', @allow_pull = N'true', @allow_anonymous = N'false', @enabled_for_internet = N'false', @snapshot_in_defaultfolder = N'true', @compress_snapshot = N'false', @ftp_port = 21, @ftp_login = N'anonymous', @allow_subscription_copy = N'false', @add_to_active_directory = N'false', @repl_freq = N'continuous', @status = N'active', @independent_agent = N'true', @immediate_sync = N'false', @allow_sync_tran = N'false', @autogen_sync_procs = N'false', @allow_queued_tran = N'false', @allow_dts = N'false', @replicate_ddl = 1, @allow_initialize_from_backup = N'false', @enabled_for_p2p = N'false', @enabled_for_het_sub = N'false'
GO


exec sp_addpublication_snapshot @publication = N'MaintenanceDB', @frequency_type = 1, @frequency_interval = 0, @frequency_relative_interval = 0, @frequency_recurrence_factor = 0, @frequency_subday = 0, @frequency_subday_interval = 0, @active_start_time_of_day = 0, @active_end_time_of_day = 235959, @active_start_date = 0, @active_end_date = 0, @job_login = null, @job_password = null, @publisher_security_mode = 1
exec sp_grant_publication_access @publication = N'MaintenanceDB', @login = N'sa'
GO
exec sp_grant_publication_access @publication = N'MaintenanceDB', @login = N'NT AUTHORITY\SYSTEM'
GO
exec sp_grant_publication_access @publication = N'MaintenanceDB', @login = N'DOMAIN-A\srvc_sql_pvdbs33p'
GO
exec sp_grant_publication_access @publication = N'MaintenanceDB', @login = N'DOMAIN-A\srvc_sql_pvdbs37p'
GO
exec sp_grant_publication_access @publication = N'MaintenanceDB', @login = N'DOMAIN-A\SRVC_SQL_PVDBS39P'
GO
exec sp_grant_publication_access @publication = N'MaintenanceDB', @login = N'DOMAIN-A\SRVC_SQLSENTRY'
GO
exec sp_grant_publication_access @publication = N'MaintenanceDB', @login = N'DOMAIN-A\Local Admin - Database Servers'
GO
exec sp_grant_publication_access @publication = N'MaintenanceDB', @login = N'DOMAIN-A\srvc_NAVII_0002'
GO
exec sp_grant_publication_access @publication = N'MaintenanceDB', @login = N'DOMAIN-A\CBTS_GROUP'
GO
exec sp_grant_publication_access @publication = N'MaintenanceDB', @login = N'DOMAIN-A\SRVC_SQL_Distributor'
GO
exec sp_grant_publication_access @publication = N'MaintenanceDB', @login = N'DOMAIN-A\dechime'
GO
exec sp_grant_publication_access @publication = N'MaintenanceDB', @login = N'DOMAIN-A\gmiladin'
GO
exec sp_grant_publication_access @publication = N'MaintenanceDB', @login = N'DOMAIN-A\NAVII_AGP20'
GO
exec sp_grant_publication_access @publication = N'MaintenanceDB', @login = N'DOMAIN-A\ejiang'
GO
exec sp_grant_publication_access @publication = N'MaintenanceDB', @login = N'NT SERVICE\Winmgmt'
GO
exec sp_grant_publication_access @publication = N'MaintenanceDB', @login = N'NT SERVICE\SQLWriter'
GO
exec sp_grant_publication_access @publication = N'MaintenanceDB', @login = N'NT SERVICE\SQLSERVERAGENT'
GO
exec sp_grant_publication_access @publication = N'MaintenanceDB', @login = N'NT SERVICE\MSSQLSERVER'
GO

-- Adding the transactional articles
use [MaintenanceDB]
exec sp_addarticle @publication = N'MaintenanceDB', @article = N'Email_Addr', @source_owner = N'dbo', @source_object = N'Email_Addr', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x000000000803509F, @identityrangemanagementoption = N'manual', @destination_table = N'Email_Addr', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'false', @ins_cmd = N'CALL [sp_MSins_dboEmail_Addr]', @del_cmd = N'CALL [sp_MSdel_dboEmail_Addr]', @upd_cmd = N'SCALL [sp_MSupd_dboEmail_Addr]'
GO
use [MaintenanceDB]
exec sp_addarticle @publication = N'MaintenanceDB', @article = N'Email_Reports', @source_owner = N'dbo', @source_object = N'Email_Reports', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x000000000803509F, @identityrangemanagementoption = N'manual', @destination_table = N'Email_Reports', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'false', @ins_cmd = N'CALL [sp_MSins_dboEmail_Reports]', @del_cmd = N'CALL [sp_MSdel_dboEmail_Reports]', @upd_cmd = N'SCALL [sp_MSupd_dboEmail_Reports]'
GO
use [MaintenanceDB]
exec sp_addarticle @publication = N'MaintenanceDB', @article = N'Email_Reports_Addr', @source_owner = N'dbo', @source_object = N'Email_Reports_Addr', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x000000000803509F, @identityrangemanagementoption = N'manual', @destination_table = N'Email_Reports_Addr', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'false', @ins_cmd = N'CALL [sp_MSins_dboEmail_Reports_Addr]', @del_cmd = N'CALL [sp_MSdel_dboEmail_Reports_Addr]', @upd_cmd = N'SCALL [sp_MSupd_dboEmail_Reports_Addr]'
GO

-- Adding the transactional subscriptions
use [MaintenanceDB]
exec sp_addsubscription @publication = N'MaintenanceDB', @subscriber = N'PVD37P', @destination_db = N'MaintenanceDB', @subscription_type = N'Push', @sync_type = N'automatic', @article = N'all', @update_mode = N'read only', @subscriber_type = 0
exec sp_addpushsubscription_agent @publication = N'MaintenanceDB', @subscriber = N'PVD37P', @subscriber_db = N'MaintenanceDB', @job_login = null, @job_password = null, @subscriber_security_mode = 1, @frequency_type = 64, @frequency_interval = 1, @frequency_relative_interval = 1, @frequency_recurrence_factor = 0, @frequency_subday = 4, @frequency_subday_interval = 5, @active_start_time_of_day = 0, @active_end_time_of_day = 235959, @active_start_date = 0, @active_end_date = 0, @dts_package_location = N'Distributor'
GO
use [MaintenanceDB]
exec sp_addsubscription @publication = N'MaintenanceDB', @subscriber = N'PVDBS24P', @destination_db = N'MaintenanceDB', @subscription_type = N'Push', @sync_type = N'automatic', @article = N'all', @update_mode = N'read only', @subscriber_type = 0
exec sp_addpushsubscription_agent @publication = N'MaintenanceDB', @subscriber = N'PVDBS24P', @subscriber_db = N'MaintenanceDB', @job_login = null, @job_password = null, @subscriber_security_mode = 1, @frequency_type = 64, @frequency_interval = 1, @frequency_relative_interval = 1, @frequency_recurrence_factor = 0, @frequency_subday = 4, @frequency_subday_interval = 5, @active_start_time_of_day = 0, @active_end_time_of_day = 235959, @active_start_date = 0, @active_end_date = 0, @dts_package_location = N'Distributor'
GO
use [MaintenanceDB]
exec sp_addsubscription @publication = N'MaintenanceDB', @subscriber = N'PVDBS25P', @destination_db = N'MaintenanceDB', @subscription_type = N'Push', @sync_type = N'automatic', @article = N'all', @update_mode = N'read only', @subscriber_type = 0
exec sp_addpushsubscription_agent @publication = N'MaintenanceDB', @subscriber = N'PVDBS25P', @subscriber_db = N'MaintenanceDB', @job_login = null, @job_password = null, @subscriber_security_mode = 1, @frequency_type = 64, @frequency_interval = 1, @frequency_relative_interval = 1, @frequency_recurrence_factor = 0, @frequency_subday = 4, @frequency_subday_interval = 5, @active_start_time_of_day = 0, @active_end_time_of_day = 235959, @active_start_date = 0, @active_end_date = 0, @dts_package_location = N'Distributor'
GO
use [MaintenanceDB]
exec sp_addsubscription @publication = N'MaintenanceDB', @subscriber = N'PVDBS26P', @destination_db = N'MaintenanceDB', @subscription_type = N'Push', @sync_type = N'automatic', @article = N'all', @update_mode = N'read only', @subscriber_type = 0
exec sp_addpushsubscription_agent @publication = N'MaintenanceDB', @subscriber = N'PVDBS26P', @subscriber_db = N'MaintenanceDB', @job_login = null, @job_password = null, @subscriber_security_mode = 1, @frequency_type = 64, @frequency_interval = 1, @frequency_relative_interval = 1, @frequency_recurrence_factor = 0, @frequency_subday = 4, @frequency_subday_interval = 5, @active_start_time_of_day = 0, @active_end_time_of_day = 235959, @active_start_date = 0, @active_end_date = 0, @dts_package_location = N'Distributor'
GO

