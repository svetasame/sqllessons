DROP DATABASE IF EXISTS dz_6;
CREATE DATABASE dz_6;
USE dz_6;


DROP FUNCTION IF EXISTS FormatSeconds;
DELIMITER //
CREATE FUNCTION FormatSeconds(seconds INT)
RETURNS VARCHAR(255)
DETERMINISTIC
BEGIN
    DECLARE days INT;
    DECLARE hours INT;
    DECLARE minutes INT;
    DECLARE secs INT;
    DECLARE result VARCHAR(255);
    
    SET days = FLOOR(seconds / (24*60*60));
    SET seconds = seconds % (24*60*60);
    SET hours = FLOOR(seconds / (60*60));
    SET seconds = seconds % (60*60);
    SET minutes = FLOOR(seconds / 60);
    SET secs = seconds % 60;
    
    SET result = CONCAT(days, ' days ', hours, ' hours ', minutes, ' minutes ', secs, ' seconds');
    
    RETURN result;
END //

SELECT FormatSeconds(123456)//

SELECT FormatSeconds(66522456)//

DROP FUNCTION IF EXISTS EVEN//

CREATE FUNCTION EVEN (num INT)
RETURNS VARCHAR(255)
LANGUAGE SQL DETERMINISTIC CONTAINS SQL SQL SECURITY DEFINER
BEGIN
  DECLARE result VARCHAR(255);
    DECLARE output VARCHAR(255);
    SET result = '';
    SET output = '';
    
    WHILE num > 1 DO
        IF num % 2 = 0 THEN
            SET result = CONCAT(output, num, ', ', result);
        END IF;
        SET num = num - 1;
    END WHILE;
    
    RETURN result;
END//

SELECT EVEN(10);