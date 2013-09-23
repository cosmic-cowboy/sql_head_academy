-- 演習03 SUB_QUERY

SELECT class, AVG(weight)
FROM (

	SELECT 
		class,
		weight,
		(
			SELECT COUNT(w1.weight) AS seq
			FROM weights2 w1 
			WHERE w1.class = w0.class
			AND (CAST(w1.weight AS TEXT) || w1.student_id) >= (CAST(w0.weight AS TEXT) || w0.student_id )
		) AS hi,
		(
			SELECT COUNT(w2.weight) AS seq
			FROM weights2 w2 
			WHERE w2.class = w0.class
			AND (CAST(w2.weight AS TEXT) || w2.student_id) <= (CAST(w0.weight AS TEXT) || w0.student_id )
		) AS lo
	FROM weights2 w0
) TMP
-- hiとloが近接する場所が中心になる
WHERE hi in (lo, lo + 1, lo - 1)
GROUP BY class;