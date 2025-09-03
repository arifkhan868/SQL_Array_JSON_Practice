# SQL_Array_JSON_Practice

---
# SQL_Practice
**Repository Name:** SQL_Practice  
**Description:** My playground for practicing advanced SQL concepts — Arrays & JSON/JSONB handling in PostgreSQL. Perfect for exploring real-world data scenarios!  

---

## 🚀 Overview
Welcome to my SQL practice repository!  

Here, I explore **complex data types** like arrays and JSON in PostgreSQL. These exercises helped me understand how to store, query, and manipulate structured and semi-structured data in a way that mirrors real-world applications.  

Whether you’re a fellow learner or just curious about SQL, this repo is for anyone who wants to level up their database skills.  

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
