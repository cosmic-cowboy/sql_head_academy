-- リスト5　クラスごとに連番を振る(ROW_NUMBER)

SELECT 
	class, 
	student_id,
	ROW_NUMBER() OVER (PARTITION BY class ORDER BY student_id) AS seq
FROM weights2;