-- 第2回　更新なんてこわくない！　（2）行から列への更新

DROP TABLE ScoreCols;

CREATE TABLE ScoreCols(
	student_id VARCHAR(4) NOT NULL,
	score_en INTEGER,
	score_nl INTEGER,
	score_mt INTEGER
);