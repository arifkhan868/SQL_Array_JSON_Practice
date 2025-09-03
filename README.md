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
WHERE student_name = 'Jahid Hasan'; ```
---
### 2️⃣ JSON & JSONB Handling
- **Tables:** `master`.`profile`
- **Focus Areas:**
-  Storing user profiles in JSONB
-  Extracting data from JSON arrays and nested objects
-  Handling multiple possible keys (name, fullname, finalname)
-  Example Queries:






