-- 第2回　更新なんてこわくない！　（2）行から列への更新
-- リスト4　より効率的なSQL：リスト機能の利用


UPDATE ScoreCols
SET (score_en, score_nl, score_mt)
= (SELECT 
	MAX(CASE WHEN subject = '英語'
	THEN score
	ELSE NULL END) AS score_en,
	MAX(CASE WHEN subject = '国語'
	THEN score
	ELSE NULL END) AS score_nl,
	MAX(CASE WHEN subject = '数学'
	THEN score
	ELSE NULL END) AS score_mt
	FROM ScoreRows SR
	WHERE SR.student_id = ScoreCols.student_id);


-- SELECT 
-- 	SR.student_id,
-- 	MAX(
-- 		CASE WHEN subject = '英語'
-- 		THEN score
-- 		ELSE NULL END
-- 	) AS score_en,
-- 	MAX(
-- 		CASE WHEN subject = '国語'
-- 		THEN score
-- 		ELSE NULL END
-- 	) AS score_nl,
-- 	MAX(
-- 		CASE WHEN subject = '数学'
-- 		THEN score
-- 		ELSE NULL END
-- 	) AS score_mt

-- FROM ScoreRows SR
-- INNER JOIN ScoreCols SC
-- ON SR.student_id = SC.student_id
-- GROUP BY SR.student_id;