SELECT ROW_NUMBER() OVER (ORDER BY AVRG DESC, STD_ID ASC) AS ROWNUM
	, S.STD_IDX
	, S.STD_ID
	, R.TOTAL
	, R.ATTEND_P
	, R.ATTEND_N
	, R.ATTEND_AA
	, R.ATTEND_A
	, CASE WHEN ATTEND_P > 0 THEN (R.ATTEND_P + R.ATTEND_N + R.ATTEND_AA) / R.TOTAL * 100 ELSE 0 END AS AVRG
FROM (
	SELECT A.STD_IDX, A.STD_ID
		, COUNT(A.IDX) TOTAL
		, SUM( CASE WHEN A.ATTEND_YN = 'P' THEN 1 ELSE 0 END) ATTEND_P
		, SUM( CASE WHEN A.ATTEND_YN = 'N' THEN 1 ELSE 0 END) ATTEND_N
		, SUM( CASE WHEN A.ATTEND_YN = 'AA' THEN 1 ELSE 0 END) ATTEND_AA
		, SUM( CASE WHEN A.ATTEND_YN = 'A' THEN 1 ELSE 0 END) ATTEND_A
	FROM HS_TB_CLS_ATTENDANCE A
	WHERE A.CLS_IDX IN (
		SELECT CI.CLS_IDX
		FROM HS_TB_CLASS_INFO CI
		WHERE RIGHT(CI.CLS_ID, 4) = '0118'
		AND CI.DEL_FLAG = 'N'
	)
	AND A.DEL_FLAG = 'N'
	GROUP BY A.STD_IDX
) R
LEFT OUTER JOIN HS_TB_STUDENT_INFO S
		ON S.STD_IDX = R.STD_IDX
		AND S.DEL_FLAG = 'N'
ORDER BY AVRG DESC, STD_ID ASC