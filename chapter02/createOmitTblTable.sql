/* 第2回　更新なんてこわくない！（1）*/
-- 表1　OmitTbl：埋め立て前

DROP TABLE OmitTbl;

CREATE TABLE OmitTbl(
	keycol CHAR(1) NOT NULL,
	seq INTEGER NOT NULL,
	val INTEGER
);

INSERT INTO OmitTbl VALUES('A',1,50);
INSERT INTO OmitTbl VALUES('A',2,NULL);
INSERT INTO OmitTbl VALUES('A',3,NULL);
INSERT INTO OmitTbl VALUES('A',4,70);
INSERT INTO OmitTbl VALUES('A',5,NULL);
INSERT INTO OmitTbl VALUES('A',6,900);
INSERT INTO OmitTbl VALUES('B',1,10);
INSERT INTO OmitTbl VALUES('B',2,20);
INSERT INTO OmitTbl VALUES('B',3,NULL);
INSERT INTO OmitTbl VALUES('B',4,3);
INSERT INTO OmitTbl VALUES('B',5,NULL);
INSERT INTO OmitTbl VALUES('B',6,NULL);