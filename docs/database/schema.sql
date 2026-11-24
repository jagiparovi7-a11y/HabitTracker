CREATE TABLE users (id INT PRIMARY KEY, name VARCHAR(100) NOT NULL, email VARCHAR(150) NOT NULL UNIQUE);
CREATE TABLE habits (id INT PRIMARY KEY, user_id INT NOT NULL REFERENCES users(id), title VARCHAR(100) NOT NULL);
CREATE TABLE categories (id INT PRIMARY KEY, name VARCHAR(100) NOT NULL UNIQUE);
CREATE TABLE habit_categories (habit_id INT REFERENCES habits(id), category_id INT REFERENCES categories(id), PRIMARY KEY(habit_id, category_id));
CREATE TABLE habit_logs (id INT PRIMARY KEY, habit_id INT NOT NULL REFERENCES habits(id), log_date DATE NOT NULL, completed BOOLEAN NOT NULL, UNIQUE(habit_id, log_date));
CREATE TABLE reminders (id INT PRIMARY KEY, habit_id INT NOT NULL REFERENCES habits(id), remind_at TIME NOT NULL);
CREATE TABLE goals (id INT PRIMARY KEY, habit_id INT NOT NULL REFERENCES habits(id), target_days INT NOT NULL CHECK(target_days > 0));
INSERT INTO users VALUES (1,'Aruzhan','aru@example.com'),(2,'Dias','dias@example.com'),(3,'Dana','dana@example.com');
INSERT INTO habits VALUES (1,1,'Reading'),(2,2,'Walking'),(3,3,'Drink water');
INSERT INTO categories VALUES (1,'Education'),(2,'Health'),(3,'Discipline');
INSERT INTO habit_categories VALUES (1,1),(1,3),(2,2),(3,2);
INSERT INTO habit_logs VALUES (1,1,'2026-11-22',TRUE),(2,1,'2026-11-23',TRUE),(3,2,'2026-11-23',FALSE),(4,3,'2026-11-23',TRUE);
INSERT INTO reminders VALUES (1,1,'20:00'),(2,2,'08:00'),(3,3,'09:00');
INSERT INTO goals VALUES (1,1,30),(2,2,21),(3,3,30);

SELECT u.name, h.title, l.log_date, l.completed FROM users u JOIN habits h ON h.user_id=u.id JOIN habit_logs l ON l.habit_id=h.id ORDER BY l.id;
SELECT h.title, COUNT(l.id) AS total_days, SUM(CASE WHEN l.completed THEN 1 ELSE 0 END) AS completed_days FROM habits h LEFT JOIN habit_logs l ON l.habit_id=h.id GROUP BY h.id,h.title ORDER BY h.id;
