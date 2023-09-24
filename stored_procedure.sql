DROP PROCEDURE IF EXISTS employeeInfo;
DELIMITER $$
USE `royale_baby_clinic`$$
CREATE PROCEDURE employeeInfo()
BEGIN
select * from clinic_employee;
end
$$
DELIMITER ;

drop procedure employeeInfo;

DROP PROCEDURE IF EXISTS patientInfo;
DELIMITER $$
USE `royale_baby_clinic`$$
CREATE PROCEDURE patientInfo()
BEGIN
select * from patient_info;
end
$$
DELIMITER ;


DROP PROCEDURE IF EXISTS pharmacyInfo;
DELIMITER $$
USE `royale_baby_clinic`$$
CREATE PROCEDURE pharmacyInfo()
BEGIN
select * from pharmacy_inventory;
end
$$
DELIMITER ;

DELIMITER //





DROP PROCEDURE IF EXISTS specificPatient;
DELIMITER $$
USE `royale_baby_clinic`$$
CREATE PROCEDURE specificPatient(IN pid int)
BEGIN
select * from patient_info where patient_id = pid;
end
$$
DELIMITER ;








 