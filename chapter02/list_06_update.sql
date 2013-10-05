-- 第2回　更新なんてこわくない！　（2）行から列への更新
-- リスト6　リスト4（リスト機能の利用）のNOT NULL制約対応
-- 生徒は存在するが教科が存在しなかった場合のNULL対応
-- そもそも生徒が存在しなかった場合のNULL対応

UPDATE ScoreColsNN
SET (score_en, score_nl, score_mt) = 
	(SELECT
		COALESCE(
			MAX(
				CASE WHEN subject = '英語'
				THEN score
				ELSE NULL END), 0) AS score_en,
		COALESCE(
			MAX(
				CASE WHEN subject = '国語'
				THEN score
				ELSE NULL END), 0) AS score_nl,
		COALESCE(
			MAX(
				CASE WHEN subject = '数学'
				THEN score
				ELSE NULL END), 0) AS score_mt
	FROM ScoreRows SR
	WHERE SR.student_id = ScoreColsNN.student_id)
WHERE EXISTS(
	SELECT *
	FROM ScoreRows
	WHERE student_id = ScoreColsNN.student_id);