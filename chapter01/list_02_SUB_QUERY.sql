-- リスト2 主キーが1列の場合（相関サブクエリ）

SELECT 
	student_id,
	(	SELECT COUNT(*) 
		FROM Weights W2 
		WHERE W2.student_id <= W1.student_id 
	) AS seq
FROM Weights W1
ORDER BY student_id;
