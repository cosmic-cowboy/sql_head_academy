-- リスト3　主キーが複数列の場合(ROW_NUMBER)

SELECT 
	class, 
	student_id,
	ROW_NUMBER() OVER (ORDER BY class, student_id) AS seq
FROM Weights2;