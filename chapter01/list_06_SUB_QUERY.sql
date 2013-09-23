-- リスト6 クラスごとに連番を振る（相関サブクエリ）

SELECT 
	class,
	student_id,
	(
		SELECT COUNT(*)
		FROM weights2 W2
		WHERE W2.class = W1.class
		  AND W2.student_id <= W1.student_id
	) AS seq
FROM weights2 W1;