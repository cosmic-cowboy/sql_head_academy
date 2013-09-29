/* 第2回　更新なんてこわくない！（1）*/

UPDATE omittbl O1
SET val = NULL
WHERE 
	seq != (
		SELECT MIN(O2.seq) 
		FROM omittbl O2
		WHERE O2.val = O1.val
		AND O2.keycol = O1.keycol
	)

-- UPDATE OmitTbl
-- 	SET val = 
-- 		CASE WHEN val = 
-- 			(SELECT val 
-- 			 FROM OmitTbl O1
-- 			 WHERE O1.keycol = OmitTbl.keycol      
-- 		  	   AND O1.seq = 
-- 		  	   	(SELECT MAX(seq)
-- 				 FROM OmitTbl O2       
-- 				 WHERE O2.keycol = OmitTbl.keycol          
-- 				   AND O2.seq < OmitTbl.seq)
-- 			)
-- 		THEN NULL 
-- 		ELSE val END;

-- seqの番号が小さいvalと同じvalをレコードがあった場合、valにNULLを代入する
-- 例）
-- 1 , 2
-- 2 , 2（valをNULLに）
-- 3 , 1
-- 4 , 1（valをNULLに）
-- 5 , 1（valをNULLに）

-- SELECT 
-- 	keycol, seq,
-- 	(CASE 
-- 		WHEN 
-- 			seq = (
-- 				SELECT MIN(O2.seq) 
-- 				FROM omittbl O2
-- 				WHERE O2.val = O1.val
-- 				 AND O2.keycol = O1.keycol
-- 			)
-- 		THEN O1.val
-- 		ELSE NULL
-- 	END) AS VAL
-- FROM omittbl O1
-- ORDER BY keycol, seq;