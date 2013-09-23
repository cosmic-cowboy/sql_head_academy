/* 演習01 メジアンを求める（集合指向型）：母集合を上位と下位に分割する */
-- ２つのサブクエリで昇順と降順を求めている
-- ２つのサブクエリを含む抽出データはFROM句で囲わないとhiをWHERE句に設定できない。


SELECT AVG(weight) FROM
(
SELECT weight,
(
	SELECT COUNT(w1.weight) AS seq
	FROM weights w1
	WHERE (CAST(w1.weight AS TEXT) ||  w1.student_id) >= (CAST(w0.weight AS TEXT) ||  w0.student_id)
) AS hi,
(
	SELECT COUNT(w2.weight) AS seq
	FROM weights w2
	WHERE (CAST(w2.weight AS TEXT) ||  w2.student_id) <= (CAST(w0.weight AS TEXT) ||  w0.student_id)
) AS lo
FROM weights w0
) TMP
WHERE hi in (lo, lo + 1, lo -1) ;