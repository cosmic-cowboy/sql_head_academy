-- 演習03 ROW_NUMBER

SELECT class, AVG(weight)
FROM (

	SELECT 
		class,
		weight,
		-- 上位からの順位
		ROW_NUMBER() OVER (PARTITION BY class ORDER BY weight asc,  student_id asc) AS hi,
		-- 下位からの順位
		ROW_NUMBER() OVER (PARTITION BY class ORDER BY weight desc, student_id desc) AS lo
	FROM weights2
) TMP
-- hiとloが近接する場所が中心になる
WHERE hi in (lo, lo + 1, lo - 1)
GROUP BY class;