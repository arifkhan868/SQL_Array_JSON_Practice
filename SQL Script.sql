-----ARRAY TABLE CREATE
create table master.students (
  id serial,
  student_name varchar,
  subject_name varchar,
  numbers int[]
);

select
  *
from
  master.students;

------ARRAY DATA INSERT
insert into
  master.students (student_name, subject_name, numbers)
values
  ('Ariful Islam', 'English', '{79,82,89}'),
  ('Jannatul Jerin', 'Math', '{83,76,93}'),
  ('Monir Hasan', 'Biology', '{96,73,86}'),
  ('Jahid Hasan', 'Bangla', '{84,92,79}');

select
  s.student_name,
  s.subject_name,
  s.numbers[1]
from
  master.students s;

select
  s.student_name,
  s.subject_name,
  s.numbers[2]
from
  master.students s;

select
  s.student_name,
  s.subject_name,
  s.numbers[3]
from
  master.students s;

select
  s.student_name,
  s.subject_name,
  s.numbers[1] as first_semester,
  s.numbers[2] as second_semester,
  s.numbers[3] as final_semester
from
  master.students s;

------ARRAY DATA UPDATE & DELETE
update master.students
set
  numbers = '{92,85,79}'
where
  student_name = 'Jahid Hasan';

select
  *
from
  master.students;

update master.students
set
  numbers[3] = 80
where
  student_name = 'Jahid Hasan';

update master.students
set
  numbers[2] = null
where
  student_name = 'Monir Hasan';

update master.students
set
  numbers[1] = 94
where
  numbers[1] = 79;

create table master."section" (
  id serial,
  section_name varchar,
  enrroled_student int[]
);

select
  *
from
  master."section";

insert into
  master."section" (section_name, enrroled_student)
values
  ('SQL', '{1,2}'),
  ('Power BI', '{3,4}');

select
  st.student_name,
  sc.section_name,
  sc.enrroled_student
from
  master.students st
  join master."section" sc on array[st.id] <@ sc.enrroled_student;

alter table master."section"
add teacher int[];

select
  *
from
  master."section";

alter table master.students
add teacher int[];

select
  *
from
  master.students;

select
  st.student_name,
  sc.section_name,
  sc.teacher as sc_teacher,
  st.teacher as st_teacher
from
  master.students st
  join master."section" sc on st.teacher && sc.teacher;

-----JSON & JSONB 
'{"name": "Ariful",
"age" : 25,
"skill": ["SQL","Power BI","Python","Word"]}'
create table master.profile (id serial, user_data jsonb);

select
  *
from
  master.profile;

insert into
  master.profile (user_data)
values
  (
    '{"name": "Ariful",
"age" : 22,
"skill": ["SQL","Power Point","Bangla","Word"]}'
  ),
  (
    '{"fullname": "Jannatul Jerin",
"age" : 27,
"skills": ["English","Biology ","Python","Pandas"]}'
  ),
  (
    '{"name": "Monir",
"age" : 23,
"skill": ["Nampy","Matplotive","Excel","Word"]}'
  ),
  (
    '{"fullname": "Ariful Islam",
"age" : 32,
"skills": ["Photoshop","Illustrator","Canva","ChatGPT"]}'
  ),
  (
    '{"finalname": "MD Rasel Miah",
"age" : 30,
"skill": ["PostgreSQL","Database","Python","Outlook"]}'
  ),
  (
    '{"finalname": "MD Jahid Hasan",
"age" : 26,
"skills": ["My SQL","SQL Server","R","Word"]}'
  );

select
  *
from
  master.profile;

select
  up.user_data ->> 'name' as Name
from
  master.profile up
where
  up.user_data ->> 'name' is not null
union all
select
  up.user_data ->> 'fullname' as Name
from
  master.profile up
where
  up.user_data ->> 'fullname' is not null
union all
select
  up.user_data ->> 'finalname' as Name
from
  master.profile up
where
  up.user_data ->> 'finalname' is not null;

select
  up.user_data -> 'age'
from
  master.profile up
where
  up.user_data ? 'age';

select
  up.user_data ->> 'skill' as "Skills",
  up.user_data ->> 'skills' as "Skills"
from
  master.profile up;

select
  up.user_data -> 'skill' ->> 0 as "Skills"
from
  master.profile up
where
  up.user_data ? 'skill'
union all
select
  up.user_data -> 'skill' ->> 1 as "Skills"
from
  master.profile up
where
  up.user_data ? 'skill'
union all
select
  up.user_data -> 'skill' ->> 2 as "Skills"
from
  master.profile up
where
  up.user_data ? 'skill'
union all
select
  up.user_data -> 'skill' ->> 3 as "Skills"
from
  master.profile up
where
  up.user_data ? 'skill'
union all
select
  up.user_data -> 'skills' ->> 0 as "Skills"
from
  master.profile up
where
  up.user_data ? 'skills'
union all
select
  up.user_data -> 'skills' ->> 1 as "Skills"
from
  master.profile up
where
  up.user_data ? 'skills'
union all
select
  up.user_data -> 'skills' ->> 2 as "Skills"
from
  master.profile up
where
  up.user_data ? 'skills'
union all
select
  up.user_data -> 'skills' ->> 3 as "Skills"
from
  master.profile up
where
  up.user_data ? 'skills';