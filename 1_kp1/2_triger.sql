CREATE TRIGGER scores_AFTER_INSERT 
AFTER INSERT 
ON scores 
FOR EACH ROW
BEGIN
	SET @t1 = (SELECT AVG(`value`) FROM `scores`);;
	INSERT INTO `reports`(test_id, avr_score) VALUES ('5', @t1);;
END;;