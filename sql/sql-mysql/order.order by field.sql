SELECT IFNULL(AUTH_TYPE, 'R') AS AUTH_TYPE_G_TMP
FROM HS_TB_AUTH_MENU
WHERE IFNULL(DEL_FLAG,'N') = 'N'
AND PGM_IDX= PP.IDX
AND AUTH_GRP_CD IN (
		SELECT AUTH_GRP_CD
		FROM HS_TB_AUTH_MEM
		WHERE MEM_ID = 'T10000028'
		AND DEL_FLAG = 'N'
	)

ORDER BY FIELD (AUTH_TYPE_G_TMP,'A','C','D','P','R')

LIMIT 1