USE ISCHOOL;

DROP TABLE IF EXISTS new_course_records;

CREATE TABLE `new_course_records` (
`new_course_record_id` int(11) NOT NULL AUTO_INCREMENT,
`new_course_record_text` varchar(300) DEFAULT NULL,
`new_couse_record_timestamp` datetime DEFAULT NULL, 
PRIMARY KEY (`new_course_record_id`)
) ENGINE=InnoDB;

DROP TRIGGER IF EXISTS new_course;

DELIMITER //
CREATE TRIGGER new_course
AFTER INSERT ON courses
FOR EACH ROW 
	
BEGIN
	DECLARE course_id_var INT;
    DECLARE course_code_var VARCHAR(4);
    DECLARE course_number_var VARCHAR(4);
    DECLARE course_description_var VARCHAR(100);
    DECLARE credits_var VARCHAR(4);

	SET course_id_var = NEW.course_id;
    set course_code_var = new.course_code;
    SET course_number_var = new.course_number;
    SET course_description_var = new.course_description;
    SET credits_var = new.credits;

	INSERT INTO new_course_records VALUES (course_id_var, CONCAT('You have added a new course, ', course_code_var,course_number_var, 
							', named ',course_description_var,' worth ',credits_var,' credits.'),NOW());

END//

DELIMITER ;

DELETE FROM courses WHERE (course_id, course_code, course_number, course_description, credits) = (83, 'INST', '999', 'Database Seminar', 3);

INSERT INTO courses (course_id, course_code, course_number, course_description, credits) values (83, 'INST', '999', 'Database Seminar', 3);
SELECT * FROM new_course_records;
