CREATE VIEW [dbo].[user_info_view]
	AS select u.id AS id,
        u.phone AS phone,
        u.email AS email,
        u.gender AS gender,
        u.birthday AS birthday,
        u.level AS level,
        u.create_time AS create_time,
        u.update_time AS update_time,
        ua.country AS country,
        ua.arc_name AS arc_name,
        ua.arc_no AS arc_no,
        ua.passport_id AS passport_id,
        ua.back_sequence AS back_sequence,
        ua.id_image_a AS id_image_a,
        ua.id_image_b AS id_image_b,
        ua.id_image_c AS id_image_c,
        ua.kyc_status AS kyc_status,
        ua.kyc_status_update_time AS kyc_status_update_time,
        ua.arc_issue_date AS arc_issue_date,
        ua.arc_expire_date AS arc_expire_date,
        ur.register_time AS register_time,
        ur.auth_platform_id AS auth_platform_id,
        ur.register_type AS register_type,
        ur.email AS login_platform_emal,
        ur.name AS name
    FROM
        [dbo].[user] u
        JOIN [dbo].[user_arc] ua ON u.id = ua.user_id
        JOIN [dbo].[user_register_type] ur ON u.id = ur.user_id
