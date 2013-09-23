/* リスト10 メジアンを求める（集合指向型）：母集合を上位と下位に分割する */

SELECT *
FROM (

	SELECT 
		weight,
		-- 上位からの順位
		ROW_NUMBER() OVER (ORDER BY weight asc,  student_id asc) AS hi,
		-- 下位からの順位
		ROW_NUMBER() OVER (ORDER BY weight desc, student_id desc) AS lo
	FROM weights
) TMP
-- hiとloが近接する場所が中心になる
WHERE hi in (lo, lo + 1, lo - 1);
