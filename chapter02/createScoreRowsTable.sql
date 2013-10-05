-- 第2回　更新なんてこわくない！　（2）行から列への更新

DROP TABLE ScoreRows;

CREATE TABLE ScoreRows(
	student_id VARCHAR(4) NOT NULL,
	subject VARCHAR(2) NOT NULL,
	score INTEGER
);

INSERT INTO ScoreRows VALUES('A001','英語',100);
INSERT INTO ScoreRows VALUES('A001','国語',58);
INSERT INTO ScoreRows VALUES('A001','数学',90);
INSERT INTO ScoreRows VALUES('B002','英語',77);
INSERT INTO ScoreRows VALUES('B002','国語',60);
INSERT INTO ScoreRows VALUES('C001','英語',52);
INSERT INTO ScoreRows VALUES('C003','国語',49);
INSERT INTO ScoreRows VALUES('C003','社会',100);