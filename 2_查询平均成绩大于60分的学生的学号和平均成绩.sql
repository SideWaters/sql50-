#查询平均成绩大于60分的学生的学号和平均成绩

SELECT s_id,AVG(s_score)
FROM score
GROUP BY s_id HAVING AVG(s_score)>60

#类似：查询所有课程成绩小于60的学生的学号、姓名
SELECT *
FROM student
WHERE s_id NOT IN
(SELECT s_id FROM SCORE WHERE s_score>=60 )