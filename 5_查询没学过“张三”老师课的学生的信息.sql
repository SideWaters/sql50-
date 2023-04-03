# 查询没学过“张三”老师课的学生的

SELECT *
FROM student
WHERE s_id NOT IN
(SELECT sc.s_id
FROM score sc 
INNER JOIN course co ON co.c_id = sc.c_id
INNER JOIN teacher te ON te.t_id = co.t_id
WHERE te.t_name = '张三'
);

