# 查询学过编号为“01”的课程并且也学过编号为“02”的课程的学生
SELECT
	* 
FROM
	student st 
WHERE
	st.s_id IN (
	SELECT a.s_id
	FROM
		( SELECT s_id, c_id FROM score WHERE score.c_id = '01' ) AS a
	INNER JOIN ( SELECT s_id, c_id FROM score WHERE score.c_id = '02' ) AS b ON a.s_id = b.s_id );