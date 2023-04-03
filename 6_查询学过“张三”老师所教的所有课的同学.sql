#查询学过“张三”老师所教的所有课的同学的信息
-- SELECT
-- sc.s_id,s.s_name
-- FROM
-- score sc
-- LEFT JOIN student s ON s.s_id = sc.s_id
-- WHERE
-- sc.c_id IN (
-- SELECT
-- c.c_id
-- FROM
-- course c
-- LEFT JOIN teacher t ON t.t_id = c.t_id
-- WHERE
-- t.t_name = '张三'
-- )
-- GROUP BY
-- sc.s_id,
-- s.s_name
-- HAVING
-- count( 1 ) >= (
-- SELECT
-- count( 1 )
-- FROM
-- course c
-- LEFT JOIN teacher t ON t.t_id = c.t_id
-- WHERE
-- t.t_name = '张三'
-- )
-- ORDER BY
-- sc.s_id

select a.s_id,a.s_name

from student as a

join score as b on a.s_id=b.s_id

where b.c_id in (


select b.c_id

from teacher as a

join course as b on a.t_id=b.t_id

where a.t_name='张三'

)

group by a.s_id

having count(b.c_id)=(

select count(b.c_id)

from teacher as a

join course as b on a.t_id=b.t_id

where a.t_name='张三'

);