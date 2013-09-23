-- リスト7　連番の更新（ROW_NUMBER）

UPDATE weights3
SET seq = 
(
	SELECT seq 
	FROM 
	(	SELECT 
			class, student_id,
			ROW_NUMBER() OVER(PARTITION BY class ORDER BY class, student_id) AS seq
		FROM weights3
	) SeqTbl
	WHERE weights3.class = SeqTbl.class
	AND weights3.student_id = SeqTbl.student_id
);