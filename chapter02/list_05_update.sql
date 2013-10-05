-- 第2回　更新なんてこわくない！　（2）行から列への更新
-- リスト5　リスト3（1列ずつ更新）のNOT NULL制約対応


UPDATE ScoreColsNN
SET
score_en = COALESCE(
	(	SELECT score
		FROM ScoreRows
		WHERE student_id = ScoreColsNN.student_id
		AND subject = '英語'), 
	0),
score_nl = COALESCE(
	(	SELECT score
	FROM ScoreRows
	WHERE student_id = ScoreColsNN.student_id
	AND subject = '国語'), 
	0),
score_mt = COALESCE(
	(	SELECT score
		FROM ScoreRows
		WHERE student_id = ScoreColsNN.student_id
		AND subject = '数学'),
	0)
WHERE EXISTS (
	SELECT *
	FROM ScoreRows
	WHERE student_id = ScoreColsNN.student_id
);