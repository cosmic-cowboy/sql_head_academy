/* 第2回　更新なんてこわくない！（1）*/

UPDATE omittbl O1
SET val = 
(
	SELECT val
	FROM omittbl O2
	WHERE O2.keycol = O1.keycol
	 AND O2.seq = (
	 	SELECT MAX(O3.seq)
	 	FROM omittbl O3
	 	WHERE O3.keycol = O1.keycol
	 	 AND O3.seq < O1.seq
	 	 AND O3.val IS NOT NULL
	 ) 
)
WHERE val IS NULL;

-- valの値がNULLの場合、seqの番号が小さいvalを持つ値を代入する
-- 例）
-- 1 , 2
-- 2 , NULL（valは2）
-- 3 , 1
-- 4 , NULL（valは1）
-- 5 , NULL（valは1）
-- 
-- 一回のサブクエリでは取得できないので、入れ子にする
-- valの値がNULLの場合、valの値がNULLではない、keycolが同じで一番近くのseqが小さいレコードを探す
-- レコードが見つかったら、そのvalを取り出す。

-- SELECT keycol, seq,
-- 	(CASE
-- 		WHEN val is not null THEN val
-- 		WHEN val is null THEN
-- 			(SELECT val
-- 			 FROM omittbl O2
-- 			 WHERE O2.keycol = O1.keycol
-- 			  AND O2.seq = 
-- 				(SELECT MAX(O3.seq)
-- 				 FROM omittbl O3
-- 				 WHERE O3.keycol = O1.keycol
-- 				  AND O3.seq < O1.seq
-- 				  AND O3.val IS NOT NULL
-- 				)
-- 			)
-- 		ELSE NULL
-- 	END) AS VAL
-- FROM omittbl O1;