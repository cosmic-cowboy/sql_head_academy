-- リスト13 0～999 までの連番を保持するシーケンス・ビューを作る

CREATE VIEW Sequence (seq)AS 
SELECT (D1.digit * 100) + (D2.digit * 10) + D3.digit 
FROM digits D1
CROSS JOIN digits D2
CROSS JOIN digits D3;