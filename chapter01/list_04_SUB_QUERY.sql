-- リスト4 主キーが複数列の場合（相関サブクエリ：文字列結合して1 列とみなす）

SELECT 
	class,
	student_id, 
	(
		SELECT COUNT(*)
		FROM Weights2 W2
		WHERE (CAST(W2.class AS TEXT) || CAST(W2.student_id AS TEXT)) 
		<= (CAST(W1.class AS TEXT) || CAST(W1.student_id AS TEXT))
	)AS seq 
FROM Weights2 W1;