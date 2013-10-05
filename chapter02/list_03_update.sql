-- 第2回　更新なんてこわくない！　（2）行から列への更新
-- 3つの相関サブクエリを実行しなければならず，パフォーマンスに問題あり

-- とりあえず student_idだけ登録
INSERT INTO ScoreCols (student_id) (
	SELECT student_id 
	FROM ScoreRows
	GROUP BY student_id
);

-- 更新
UPDATE ScoreCols SET 
score_en = (SELECT score FROM ScoreRows WHERE student_id = ScoreCols.student_id AND subject = '英語'),
score_nl = (SELECT score FROM ScoreRows WHERE student_id = ScoreCols.student_id AND subject = '国語'),
score_mt = (SELECT score FROM ScoreRows WHERE student_id = ScoreCols.student_id AND subject = '数学');



-- 更新というか、登録ですが...
-- INSERT INTO ScoreCols (
-- 	SELECT student_id, MAX(score_en), MAX(score_nl), MAX(score_mt)
-- 	FROM (SELECT 
-- 		student_id,
-- 		(CASE 
-- 			WHEN subject = '英語' THEN score
-- 			ELSE NULL 
-- 		END) AS score_en,
-- 		(CASE 
-- 			WHEN subject = '国語' THEN score
-- 			ELSE NULL 
-- 		END) AS score_nl,
-- 		(CASE 
-- 			WHEN subject = '数学' THEN score
-- 			ELSE NULL 
-- 		END) AS score_mt
-- 	FROM ScoreRows
-- 	) TMP
-- 	GROUP BY student_id
-- );