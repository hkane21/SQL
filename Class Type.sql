USE iSchool;

DROP FUNCTION IF EXISTS student_year;

DELIMITER //

CREATE FUNCTION student_year 
(
	start_date DATETIME
)
RETURNS VARCHAR (20)
DETERMINISTIC MODIFIES SQL DATA
BEGIN 
	-- DECLARE a variable of type VARCHAR(250) to SET to the class type in the IF statement
    DECLARE CLASSTYPE VARCHAR(250);

    -- WRITE IF statement with parameter to SET each class type based on conditions stated in the problem
	IF YEAR(start_date) <= '2018' THEN 
		SET classtype = 'Senior';
	ELSEIF YEAR(start_date) = '2019' THEN
		SET CLASSTYPE = 'Junior';
	ELSEIF YEAR(start_date) = '2020' THEN
		SET CLASSTYPE = 'Sophomore';
	ELSE 
		SET CLASSTYPE = 'Freshman';
	END IF;
	
    RETURN (CLASSTYPE);
    -- RETURN variable associated with class type;
END //
DELIMITER ;

-- SELECT statement FROM people class using function
SELECT CONCAT(fname, " ", lname) as "student_name", start_date, student_year(start_date) AS "student_class" 
FROM people ORDER BY start_date, student_name;
