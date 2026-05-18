CREATE DATABASE elearning_platform;

USE elearning_platform;
-- create learners table

CREATE TABLE learners (
    learner_id INT PRIMARY KEY,
    full_name VARCHAR(100),
    country VARCHAR(50)
);

-- create courses table
CREATE TABLE courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100),
    category VARCHAR(50),
    unit_price DECIMAL(10,2)
);

-- create purchases table

CREATE TABLE purchases (
    purchase_id INT PRIMARY KEY,
    learner_id INT,
    course_id INT,
    quantity INT,
    purchase_date DATE,

    FOREIGN KEY (learner_id)
    REFERENCES learners(learner_id),

    FOREIGN KEY (course_id)
    REFERENCES courses(course_id)
);

-- insert sample data
-- learners

INSERT INTO learners VALUES
(1, 'Vishnu Prathap', 'India'),
(2, 'Rahul Kumar', 'India'),
(3, 'Emily Johnson', 'USA'),
(4, 'Ahmed Ali', 'UAE'),
(5, 'Sophia Lee', 'Canada');

-- insert into courses

INSERT INTO courses VALUES
(101, 'SQL for Beginners', 'Database', 1500.00),
(102, 'Python for Data Analysis', 'Programming', 2500.00),
(103, 'Power BI Dashboarding', 'Visualization', 2000.00),
(104, 'Machine Learning Basics', 'AI', 3000.00),
(105, 'Excel Analytics', 'Spreadsheet', 1200.00);

-- insert into purchases

INSERT INTO purchases VALUES
(1, 1, 101, 1, '2026-05-01'),
(2, 1, 103, 2, '2026-05-03'),
(3, 2, 102, 1, '2026-05-04'),
(4, 3, 104, 1, '2026-05-05'),
(5, 4, 101, 3, '2026-05-06'),
(6, 5, 105, 2, '2026-05-07'),
(7, 2, 103, 1, '2026-05-08'),
(8, 3, 102, 2, '2026-05-09');

SELECT * FROM learners;

SELECT * FROM courses;

SELECT * FROM purchases;

-- data explorations using joins
-- inner joins

SELECT 
    l.full_name AS learner_name,
    l.country,
    c.course_name,
    c.category,
    p.quantity,
    FORMAT(p.quantity * c.unit_price, 2) AS total_amount,
    p.purchase_date
FROM purchases p
INNER JOIN learners l
ON p.learner_id = l.learner_id
INNER JOIN courses c
ON p.course_id = c.course_id
ORDER BY total_amount DESC;

-- left joins

SELECT 
    l.full_name,
    c.course_name,
    p.quantity
FROM learners l
LEFT JOIN purchases p
ON l.learner_id = p.learner_id
LEFT JOIN courses c
ON p.course_id = c.course_id;

-- right joins

SELECT 
    c.course_name,
    l.full_name,
    p.quantity
FROM purchases p
RIGHT JOIN courses c
ON p.course_id = c.course_id
LEFT JOIN learners l
ON p.learner_id = l.learner_id;

-- total spend by each learners

SELECT 
    l.full_name AS learner_name,
    l.country,
    FORMAT(SUM(p.quantity * c.unit_price), 2) AS total_spending
FROM learners l
INNER JOIN purchases p
ON l.learner_id = p.learner_id
INNER JOIN courses c
ON p.course_id = c.course_id
GROUP BY l.learner_id, l.full_name, l.country
ORDER BY SUM(p.quantity * c.unit_price) DESC;

-- top 3 most purchesed courses
SELECT 
    c.course_name,
    SUM(p.quantity) AS total_quantity_sold
FROM purchases p
INNER JOIN courses c
ON p.course_id = c.course_id
GROUP BY c.course_id, c.course_name
ORDER BY total_quantity_sold DESC
LIMIT 3;

-- revenue by category
SELECT 
    c.category,
    FORMAT(SUM(p.quantity * c.unit_price), 2) AS total_revenue,
    COUNT(DISTINCT p.learner_id) AS unique_learners
FROM purchases p
INNER JOIN courses c
ON p.course_id = c.course_id
GROUP BY c.category
ORDER BY SUM(p.quantity * c.unit_price) DESC;

-- learners purchased by mulitible categoryes
SELECT 
    l.full_name,
    COUNT(DISTINCT c.category) AS categories_purchased
FROM learners l
INNER JOIN purchases p
ON l.learner_id = p.learner_id
INNER JOIN courses c
ON p.course_id = c.course_id
GROUP BY l.learner_id, l.full_name
HAVING COUNT(DISTINCT c.category) > 1;

-- courses not purchases
SELECT 
    c.course_name
FROM courses c
LEFT JOIN purchases p
ON c.course_id = p.course_id
WHERE p.purchase_id IS NULL;

