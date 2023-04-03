#1.查询课程编号为“01”的课程比“02”的课程成绩高的所有学生的信息及课程分数（重点）
SELECT
	st.s_name,
	st.s_name,
	st.s_sex,
	a.s_score AS score01,
	b.s_score AS score02 
FROM
	student st
	INNER JOIN ( SELECT s_id, s_score FROM score WHERE c_id = '01' ) a ON st.s_id = a.s_id
	INNER JOIN ( SELECT s_id, s_score FROM score WHERE c_id = '02' ) b ON st.s_id = b.s_id 
WHERE
	a.s_score > b.s_score;
	
-- 此写法可借鉴方法但是是错误的
-- SELECT
-- 	student.*,
-- 	score.c_id,
-- 	score.s_score 
-- FROM
-- 	student
-- 	INNER JOIN score ON student.s_id = score.s_id 
-- WHERE
-- 	student.s_id IN (
-- 	SELECT
-- 		a.s_id 
-- 	FROM
-- 		( SELECT * FROM score WHERE score.c_id = 01 ) AS a
-- 		LEFT JOIN ( SELECT * FROM score WHERE score.c_id = 02 ) AS b ON a.s_id = b.s_id 
-- 	WHERE
-- 		a.s_score > b.s_score 
-- 	OR b.s_id IS NULL 
-- 	);

-- 使长型数据变宽型数据再进行操作
SELECT st.*,temp.s01,temp.s02
FROM 
	(SELECT 
		a.s_id,
		MAX(CASE WHEN a.c_id='01' then a.s_score ELSE NULL END) s01,
		MAX(CASE WHEN a.c_id='02' then a.s_score ELSE NULL END) s02
	FROM score a
	GROUP BY a.s_id) temp,student st
WHERE temp.s01>temp.s02
AND st.s_id=temp.s_id;