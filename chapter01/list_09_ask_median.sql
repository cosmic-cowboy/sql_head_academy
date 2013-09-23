/* リスト9 メジアンを求める（集合指向型）：母集合を上位と下位に分割する */

SELECT AVG(weight)  
FROM (
	SELECT W1.weight          
	FROM Weights W1, Weights W2         
	GROUP BY W1.weight               
	--S1（下位集合）の条件 体重を総当りで比較 軽い半分を抽出（両方に存在する値を抽出）
	HAVING SUM(CASE WHEN W2.weight >= W1.weight THEN 1 ELSE 0 END) >= COUNT(*) / 2               
	--S2（上位集合）の条件 体重を総当りで比較 思い半分を抽出 
	AND SUM(CASE WHEN W2.weight <= W1.weight THEN 1 ELSE 0 END)    >= COUNT(*) / 2 ) TMP;