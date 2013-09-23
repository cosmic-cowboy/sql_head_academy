-- 第1回　SQLで連番を扱う　（5 ）断絶区間を求める

SELECT (N1.num + 1) AS gap_start,(MIN(N2.num) - 1) AS gap_end 
FROM Numbers N1 
INNER JOIN Numbers N2 
ON N2.num > N1.num 
GROUP BY N1.num
HAVING (N1.num + 1) < MIN(N2.num)
ORDER BY gap_start;

-- 工程1
-- 該当の数字より大きい数字を羅列
-- SELECT * 
-- FROM Numbers N1
-- INNER JOIN Numbers N2
-- ON N2.num > N1.num;

-- 工程2
-- 該当の数字ごとにまとめる
-- 該当の数字より大きい数字の中で最小の数字を洗いだす
-- SELECT N1.num, MIN(N2.num)
-- FROM Numbers N1
-- INNER JOIN Numbers N2
-- ON N2.num > N1.num
-- GROUP BY N1.num
-- ORDER BY N1.num;

-- 工程3
-- 工程2の中から該当の数字よりひとつ上の数字が存在しないものを抽出する
-- 該当するレコードには存在しない数字が含まれているので、その最小値と最大値を表示するようにすれば良い。
-- SELECT N1.num, MIN(N2.num)
-- FROM Numbers N1
-- INNER JOIN Numbers N2
-- ON N2.num > N1.num
-- GROUP BY N1.num
-- HAVING (N1.num + 1) < MIN(N2.num)
-- ORDER BY N1.num;

-- 工程4
-- 該当するレコードには存在しない数字が含まれているので、その最小値と最大値を表示するようにすれば良い。
-- SELECT (N1.num + 1) AS gap_start, (MIN(N2.num) - 1) AS gap_end
-- FROM Numbers N1
-- INNER JOIN Numbers N2
-- ON N2.num > N1.num
-- GROUP BY N1.num
-- HAVING (N1.num + 1) < MIN(N2.num)
-- ORDER BY N1.num;


-- 考えたやり方　全然違った
-- 最小値と最大値を出す
-- 最小値から最大値までの連番を作成する
-- outer join してNULLだけ出す
-- SELECT  
-- 	CASE WHEN seqTHEN
-- FROM
-- (
-- SELECT seq,
-- 	(SELECT num FROM NUMBERS N WHERE S.seq = N.num) AS num
-- FROM sequence S
-- WHERE seq BETWEEN (SELECT MIN(num) FROM NUMBERS)  AND (SELECT MAX(num) FROM NUMBERS)
-- ) TMP
-- WHERE num is null
