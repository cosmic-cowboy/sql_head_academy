-- リスト1　主キーが1列の場合(ROW_NUMBER)

SELECT
	student_id,
	ROW_NUMBER() OVER (ORDER BY student_id) AS seq 
FROM Weights;