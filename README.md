# SQL_Array_JSON_Practice

---
# SQL_Practice
**Repository Name:** SQL_Practice  
**Description:** My playground for practicing advanced SQL concepts — Arrays & JSON/JSONB handling in PostgreSQL. Perfect for exploring real-world data scenarios!  

---

## 🚀 Overview
Welcome to my little SQL playground!

Here, I like to tinker with arrays and JSON in PostgreSQL. Through these exercises, I got a better feel for how to store, query, and manage structured as well as semi-structured data — kind of like how it’s done in real-world projects.

If you’re learning SQL or just curious about databases, I hope this repo helps you explore and level up your skills, just like it helped me.

---

## 📂 What’s Inside

### 1️⃣ Array Handling
- **Tables:** `master.students`, `master.section`
- **Focus Areas:**
  - Creating tables with array columns
  - Inserting, updating, deleting array data
  - Querying array elements efficiently
  - Using arrays for table relationships and joins
- **Example Queries:**
```sql
-- Get first semester marks
SELECT student_name, numbers[1] AS first_semester
FROM master.students;

-- Update array elements
UPDATE master.students
SET numbers[2] = 85
WHERE student_name = 'Jahid Hasan';
 ```
---
### 2️⃣ ARRAY Relationships – master.section
```sql
-- Create sections with enrolled students as arrays
CREATE TABLE master.section (
    id SERIAL,
    section_name VARCHAR,
    enrolled_student INT[]
);

-- Join students with sections using array operators
SELECT st.student_name, sc.section_name
FROM master.students st
JOIN master.section sc
ON ARRAY[st.id] <@ sc.enrolled_student;

-- Add teachers as arrays
ALTER TABLE master.section
ADD teacher INT[];

ALTER TABLE master.students
ADD teacher INT[];

-- Join students and sections using teacher arrays
SELECT st.student_name, sc.section_name, sc.teacher AS sc_teacher, st.teacher AS st_teacher
FROM master.students st
JOIN master.section sc
ON st.teacher && sc.teacher;
```

---
### 3️⃣ JSON & JSONB Handling
- **Tables:** `master`.`profile`
- **Focus Areas:**
-  Storing user profiles in JSONB
-  Extracting data from JSON arrays and nested objects
-  Handling multiple possible keys (name, fullname, finalname)
-  **Example Queries:**

```sql
-- Extract names from JSON
SELECT up.user_data->>'name' AS Name
FROM master.profile up
WHERE up.user_data->>'name' IS NOT NULL
UNION ALL
SELECT up.user_data->>'fullname'
FROM master.profile up
WHERE up.user_data->>'fullname' IS NOT NULL;

-- Extract first skill from JSON array
SELECT up.user_data->'skills'->>0 AS Skill
FROM master.profile up
WHERE up.user_data ? 'skills';
```
### JSON & JSONB Handling – master.profile
```sql
-- Insert sample profiles
INSERT INTO master.profile (user_data)
VALUES 
('{"name": "Ariful", "age": 22, "skill": ["SQL","Power Point","Word"]}'),
('{"fullname": "Jannatul Jerin", "age": 27, "skills": ["English","Biology","Python","Pandas"]}');

-- Extract names from multiple possible keys
SELECT up.user_data->>'name' AS Name
FROM master.profile up
WHERE up.user_data->>'name' IS NOT NULL
UNION ALL
SELECT up.user_data->>'fullname' AS Name
FROM master.profile up
WHERE up.user_data->>'fullname' IS NOT NULL;

-- Extract ages
SELECT up.user_data->'age' AS Age
FROM master.profile up
WHERE up.user_data ? 'age';

-- Extract all skills individually from JSON arrays
SELECT up.user_data->'skill'->>0 AS Skill
FROM master.profile up
WHERE up.user_data ? 'skill'
UNION ALL
SELECT up.user_data->'skill'->>1
FROM master.profile up
WHERE up.user_data ? 'skill'
UNION ALL
SELECT up.user_data->'skills'->>0
FROM master.profile up
WHERE up.user_data ? 'skills';
```
---
## 💡 Learning Outcomes

- By practicing with this repository, you will:
- vGain confidence using ARRAY columns and querying individual elements.
- Learn to manipulate JSON/JSONB data efficiently in PostgreSQL.
- Understand how to join tables using arrays for real-world scenarios.
- Build a foundation for advanced SQL skills, helpful for data analytics, BI, and backend development.





