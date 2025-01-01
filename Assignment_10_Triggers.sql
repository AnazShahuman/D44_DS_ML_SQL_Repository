# 10-Triggers
# ========================
# 1. Create a table named teachers with fields id, name, subject, experience and salary and insert 8 rows. 
# 2. Create a before insert trigger named before_insert_teacher that will raise an error “salary cannot be negative” if the salary inserted to the table is less than zero. 
# 3. Create an after insert trigger named after_insert_teacher that inserts a row with teacher_id,action, timestamp to a table called teacher_log when a new entry gets inserted to the teacher table. teacher_id -> column of teacher table, action -> the trigger action, timestamp -> time at which the new row has got inserted. 
# 4. Create a before delete trigger that will raise an error when you try to delete a row that has experience greater than 10 years. 
# 5. Create an after delete trigger that will insert a row to teacher_log table when that row is deleted from teacher table.
#
# ===========================================================================================================

#
# Create a Database Named SQL_Assignment10

create database SQL_Assigment10;

# Use the database SQL_Assigment10 for further commands

use SQL_Assigment10;
#
#
#
# 1. Create a table named teachers with fields id, name, subject, experience and salary and insert 8 rows.
CREATE TABLE teachers (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    subject VARCHAR(100),
    experience INT,
    salary DECIMAL(10, 2)
);

INSERT INTO teachers (id, name, subject, experience, salary) VALUES
(1, 'Peter Parker', 'Math', 5, 50000.00),
(2, 'Mary Jane', 'Science', 8, 55000.00),
(3, 'Clark Kent', 'History', 12, 60000.00),
(4, 'Louis Lane', 'English', 3, 45000.00),
(5, 'Bruce Wayne', 'Physical Education', 7, 52000.00),
(6, 'Oliver Green', 'Art', 10, 48000.00),
(7, 'Bill Gates', 'Music', 15, 62000.00),
(8, 'Steve Jobs', 'Computer Science', 2, 47000.00);
#
#
# 2. Create a before insert trigger named before_insert_teacher that will raise an error “salary cannot be negative” if the salary inserted to the table is less than zero. 
DELIMITER $$

CREATE TRIGGER before_insert_teacher
BEFORE INSERT ON teachers
FOR EACH ROW
BEGIN
    IF NEW.salary < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Salary cannot be negative';
    END IF;
END $$

DELIMITER ;
#
#
#
# 3. Create an after insert trigger named after_insert_teacher that inserts a row with teacher_id,action, timestamp to a table called teacher_log when a new entry gets inserted to the teacher table. teacher_id -> column of teacher table, action -> the trigger action, timestamp -> time at which the new row has got inserted. 
CREATE TABLE teacher_log (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    teacher_id INT,
    action VARCHAR(50),
    timestamp DATETIME
);

DELIMITER $$

CREATE TRIGGER after_insert_teacher
AFTER INSERT ON teachers
FOR EACH ROW
BEGIN
    INSERT INTO teacher_log (teacher_id, action, timestamp)
    VALUES (NEW.id, 'INSERT', NOW());
END $$

DELIMITER ;
#
#
# 4. Create a before delete trigger that will raise an error when you try to delete a row that has experience greater than 10 years. 
#
DELIMITER $$

CREATE TRIGGER before_delete_teacher
BEFORE DELETE ON teachers
FOR EACH ROW
BEGIN
    IF OLD.experience > 10 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Cannot delete a teacher with more than 10 years of experience';
    END IF;
END $$

DELIMITER ;
#
# 5. Create an after delete trigger that will insert a row to teacher_log table when that row is deleted from teacher table.
#
DELIMITER $$

CREATE TRIGGER after_delete_teacher
AFTER DELETE ON teachers
FOR EACH ROW
BEGIN
    INSERT INTO teacher_log (teacher_id, action, timestamp)
    VALUES (OLD.id, 'DELETE', NOW());
END $$

DELIMITER ;