-- 1行のデータを3行に CROSS JOIN で
SELECT S.seq, O.col1, O.col2, O.col3 
FROM seq S 
CROSS JOIN onerow O;