-- 第2回　更新なんてこわくない！　（2）行から列への更新

DROP TABLE ScoreColsNN;

CREATE TABLE ScoreColsNN(
	student_id VARCHAR(4) NOT NULL,
	score_en INTEGER NOT NULL,
	score_nl INTEGER NOT NULL,
	score_mt INTEGER NOT NULL
);

-- とりあえず student_idだけ登録
INSERT INTO ScoreColsNN (
	SELECT student_id,0,0,0 
	FROM ScoreRows
	GROUP BY student_id
);