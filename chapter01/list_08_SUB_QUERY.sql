-- リスト8連番の更新（相関サブクエリ）

UPDATE weights3 
SET seq = 
(
	SELECT COUNT(*)
	FROM weights3 W2
	WHERE (CAST(W2.class AS TEXT) || CAST(W2.student_id AS TEXT))
	   <= (CAST(weights3.class AS TEXT) || CAST(weights3.student_id AS TEXT))
);