DROP trigger Audit_HealthInsurance_AFTER_INSERT;
DELIMITER $$
CREATE DEFINER = CURRENT_USER TRIGGER `royale_baby_clinic`.`Audit_HealthInsurance_AFTER_INSERT` 
AFTER INSERT ON `health_insurance` FOR EACH ROW
BEGIN
Insert into Audit_healthinsurance values (
NEW.Insurance_id,
NEW.insurance_provider,
NEW.policy_no,
NEW.plan_type,
'inserted', NOW(), USER());
END
$$
DELIMITER ;

DROP trigger Audit_Bill_AFTER_INSERT;
DELIMITER $$
CREATE DEFINER = CURRENT_USER TRIGGER `royale_baby_clinic`.`Audit_Bill_AFTER_INSERT` 
AFTER INSERT ON `bill` FOR EACH ROW
BEGIN
Insert into audit_bill values (
NEW.bill_id,
NEW.appointment_id,
NEW.total_cost,
NEW.date_,
'inserted', NOW(), USER());
END
$$
DELIMITER ;


DROP TRIGGER IF EXISTS `royale_baby_clinic`.`Audit_HealthInsurance_AFTER_UPDATE`;

DELIMITER $$
USE `royale_baby_clinic`$$
CREATE DEFINER = CURRENT_USER TRIGGER `royale_baby_clinic`.`Audit_HealthInsurance_AFTER_UPDATE` 
AFTER UPDATE ON `health_insurance` FOR EACH ROW
BEGIN
Insert into audit_healthinsurance values (
OLD.Insurance_id,
OLD.insurance_provider,
OLD.policy_no,
OLD.plan_type,
'updated', NOW(), USER());
END
$$
DELIMITER ;


DROP TRIGGER IF EXISTS `royale_baby_clinic`.`Audit_HealthInsurance_AFTER_DELETE`;
DELIMITER $$
USE `royale_baby_clinic`$$
CREATE DEFINER = CURRENT_USER TRIGGER `royale_baby_clinic`.`Audit_HealthInsurance_AFTER_DELETE`
 AFTER DELETE ON `health_insurance` FOR EACH ROW
BEGIN
Insert into audit_healthinsurance values (
OLD.Insurance_id,
OLD.insurance_provider,
OLD.policy_no,
OLD.plan_type,
'deleted', NOW(), USER());
END
$$
DELIMITER ;

DROP TRIGGER Audit_bill_AFTER_UPDATE;
DELIMITER $$
USE `royale_baby_clinic`$$
CREATE DEFINER = CURRENT_USER TRIGGER `royale_baby_clinic`.`Audit_bill_AFTER_UPDATE` 
AFTER UPDATE ON `bill` FOR EACH ROW
BEGIN
Insert into audit_bill values (
OLD.bill_id,
OLD.appointment_id,
OLD.total_cost,
OLD.date_,
'updated', NOW(), USER());
END
$$
DELIMITER ;


DROP TRIGGER Audit_bill_AFTER_DELETE;
DELIMITER $$
USE `royale_baby_clinic`$$
CREATE DEFINER = CURRENT_USER TRIGGER `royale_baby_clinic`.`Audit_bill_AFTER_DELETE` 
AFTER DELETE ON `bill` FOR EACH ROW
BEGIN
Insert into audit_bill values (
OLD.bill_id,
OLD.appointment_id,
OLD.total_cost,
OLD.date_,
'deleted', NOW(), USER());
END
$$
DELIMITER ;

DROP TRIGGER Audit_Appointment_AFTER_INSERT;
DELIMITER $$
CREATE DEFINER = CURRENT_USER TRIGGER `royale_baby_clinic`.`Audit_Appointment_AFTER_INSERT` 
AFTER INSERT ON `appointment_info` FOR EACH ROW
BEGIN
Insert into audit_appointmentinfo values (
NEW.appointment_id,
NEW.patient_id,
NEW.nurse_id,
NEW.doctor_id,
NEW.start_datetime,
NEW.end_datetime,
'inserted', NOW(), USER());
END
$$
DELIMITER ;

DROP TRIGGER Audit_Appointment_AFTER_UPDATE;
DELIMITER $$
CREATE DEFINER = CURRENT_USER TRIGGER `royale_baby_clinic`.`Audit_Appointment_AFTER_UPDATE` 
AFTER UPDATE ON `appointment_info` FOR EACH ROW
BEGIN
Insert into audit_appointmentinfo values (
OLD.appointment_id,
OLD.patient_id,
OLD.nurse_id,
OLD.doctor_id,
OLD.start_datetime,
OLD.end_datetime,
'updated', NOW(), USER());
END
$$
DELIMITER ;

DROP TRIGGER Audit_Appointment_AFTER_DELETE;
DELIMITER $$
CREATE DEFINER = CURRENT_USER TRIGGER `royale_baby_clinic`.`Audit_Appointment_AFTER_DELETE` 
AFTER DELETE ON `appointment_info` FOR EACH ROW
BEGIN
Insert into audit_appointmentinfo values (
OLD.appointment_id,
OLD.patient_id,
OLD.nurse_id,
OLD.doctor_id,
OLD.start_datetime,
OLD.end_datetime,
'deleted', NOW(), USER());
END
$$
DELIMITER ;

DROP TRIGGER Audit_employee_AFTER_INSERT;
DELIMITER $$
CREATE DEFINER = CURRENT_USER TRIGGER `royale_baby_clinic`.`Audit_employee_AFTER_INSERT` 
AFTER INSERT ON `clinic_employee` FOR EACH ROW
BEGIN
Insert into audit_clinicemployee values (
NEW.Employee_id,
NEW.First_Name,
NEW.Last_Name,
NEW.Designation,
NEW.Salary,
'inserted', NOW(), USER());
END
$$
DELIMITER ;

DROP TRIGGER Audit_employee_AFTER_UPDATE;
DELIMITER $$
CREATE DEFINER = CURRENT_USER TRIGGER `royale_baby_clinic`.`Audit_employee_AFTER_UPDATE` 
AFTER UPDATE ON `clinic_employee` FOR EACH ROW
BEGIN
Insert into audit_clinicemployee values (
OLD.Employee_id,
OLD.First_Name,
OLD.Last_Name,
OLD.Designation,
OLD.Salary,
'updated', NOW(), USER());
END
$$
DELIMITER ;

DROP TRIGGER Audit_employee_AFTER_DELETE;
DELIMITER $$
CREATE DEFINER = CURRENT_USER TRIGGER `royale_baby_clinic`.`Audit_employee_AFTER_DELETE` 
AFTER DELETE ON `clinic_employee` FOR EACH ROW
BEGIN
Insert into audit_clinicemployee values (
OLD.Employee_id,
OLD.First_Name,
OLD.Last_Name,
OLD.Designation,
OLD.Salary,
'deleted', NOW(), USER());
END
$$
DELIMITER ;

DROP TRIGGER Audit_TreatmentRoom_AFTER_INSERT;
DELIMITER $$
CREATE DEFINER = CURRENT_USER TRIGGER `royale_baby_clinic`.`Audit_TreatmentRoom_AFTER_INSERT` 
AFTER INSERT ON `clinic_treatment_room` FOR EACH ROW
BEGIN
Insert into audit_treatmentroom values (
NEW.room_no,
NEW.room_type,
'inserted', NOW(), USER());
END
$$
DELIMITER ;

DROP TRIGGER Audit_TreatmentRoom_AFTER_UPDATE;
DELIMITER $$
CREATE DEFINER = CURRENT_USER TRIGGER `royale_baby_clinic`.`Audit_TreatmentRoom_AFTER_UPDATE` 
AFTER UPDATE ON `clinic_treatment_room` FOR EACH ROW
BEGIN
Insert into audit_treatmentroom values (
OLD.room_no,
OLD.room_type,
'updated', NOW(), USER());
END
$$
DELIMITER ;

DROP TRIGGER Audit_Treatment_Room_AFTER_DELETE;
DELIMITER $$
CREATE DEFINER = CURRENT_USER TRIGGER `royale_baby_clinic`.`Audit_Treatment_Room_AFTER_DELETE` 
AFTER DELETE ON `clinic_treatment_room` FOR EACH ROW
BEGIN
Insert into audit_clinicemployee values (
OLD.room_no,
OLD.room_type,
'deleted', NOW(), USER());
END
$$
DELIMITER ;

DROP TRIGGER Audit_medicalprescription_AFTER_INSERT;
DELIMITER $$
CREATE DEFINER = CURRENT_USER TRIGGER `royale_baby_clinic`.`Audit_medicalprescription_AFTER_INSERT` 
AFTER INSERT ON `medical_prescription` FOR EACH ROW
BEGIN
Insert into audit_medicalprescription values (
NEW.appointment_id,
NEW.medicine_id,
NEW.medicine_dose,
'inserted', NOW(), USER());
END
$$
DELIMITER ;

DROP TRIGGER Audit_medicalprescription_AFTER_UPDATE;
DELIMITER $$
CREATE DEFINER = CURRENT_USER TRIGGER `royale_baby_clinic`.`Audit_medicalprescription_AFTER_UPDATE` 
AFTER UPDATE ON `medical_prescription` FOR EACH ROW
BEGIN
Insert into audit_medicalprescription values (
OLD.appointment_id,
OLD.medicine_id,
OLD.medicine_dose,
'updated', NOW(), USER());
END
$$
DELIMITER ;

DROP TRIGGER Audit_medicalprescription_AFTER_DELETE;
DELIMITER $$
CREATE DEFINER = CURRENT_USER TRIGGER `royale_baby_clinic`.`Audit_medicalprescription_AFTER_DELETE` 
AFTER DELETE ON `medical_prescription` FOR EACH ROW
BEGIN
Insert into audit_medicalprescription values (
OLD.appointment_id,
OLD.medicine_id,
OLD.medicine_dose,
'deleted', NOW(), USER());
END
$$
DELIMITER ;

DROP TRIGGER Audit_patientinfo_AFTER_INSERT;
DELIMITER $$
CREATE DEFINER = CURRENT_USER TRIGGER `royale_baby_clinic`.`Audit_patientinfo_AFTER_INSERT` 
AFTER INSERT ON `patient_info` FOR EACH ROW
BEGIN
Insert into audit_patientinfo values (
NEW.patient_id,
NEW.First_Name,
NEW.Middle_Name,
NEW.Last_Name,
NEW.Gender,
NEW.Age,
NEW.Phone_number,
NEW.Address,
NEW.Insurance_id,
NEW.pcp,
'inserted', NOW(), USER());
END
$$
DELIMITER ;

DROP TRIGGER Audit_patientinfo_AFTER_UPDATE;
DELIMITER $$
CREATE DEFINER = CURRENT_USER TRIGGER `royale_baby_clinic`.`Audit_patientinfo_AFTER_UPDATE` 
AFTER UPDATE ON `patient_info` FOR EACH ROW
BEGIN
Insert into audit_patientinfo values (
OLD.patient_id,
OLD.First_Name,
OLD.Middle_Name,
OLD.Last_Name,
OLD.Gender,
OLD.Age,
OLD.Phone_number,
OLD.Address,
OLD.Insurance_id,
OLD.pcp,
'updated', NOW(), USER());
END
$$
DELIMITER ;

DROP TRIGGER Audit_patientinfo_AFTER_DELETE;
DELIMITER $$
CREATE DEFINER = CURRENT_USER TRIGGER `royale_baby_clinic`.`Audit_patientinfo_AFTER_DELETE` 
AFTER DELETE ON `patient_info` FOR EACH ROW
BEGIN
Insert into audit_patientinfo values (
OLD.patient_id,
OLD.First_Name,
OLD.Middle_Name,
OLD.Last_Name,
OLD.Gender,
OLD.Age,
OLD.Phone_number,
OLD.Address,
OLD.Insurance_id,
OLD.pcp,
'deleted', NOW(), USER());
END
$$
DELIMITER ;


DROP TRIGGER Audit_patientprocedure_AFTER_INSERT;
DELIMITER $$
CREATE DEFINER = CURRENT_USER TRIGGER `royale_baby_clinic`.`Audit_patientprocedure_AFTER_INSERT` 
AFTER INSERT ON `patient_procedure` FOR EACH ROW
BEGIN
Insert into audit_patientprocedure values (
NEW.procedure_no,
NEW.appointment_id,
NEW.procedure_id,
NEW.date_,
NEW.doctor_id,
NEW.date_,
NEW.doctor_id,
NEW.nurse_id,
'inserted', NOW(), USER());
END
$$
DELIMITER ;

DROP TRIGGER Audit_patientprocedure_AFTER_UPDATE;
DELIMITER $$
CREATE DEFINER = CURRENT_USER TRIGGER `royale_baby_clinic`.`Audit_patientprocedure_AFTER_UPDATE` 
AFTER UPDATE ON `patient_procedure` FOR EACH ROW
BEGIN
Insert into audit_patientprocedure values (
OLD.procedure_no,
OLD.appointment_id,
OLD.procedure_id,
OLD.date_,
OLD.doctor_id,
OLD.nurse_id,
'updated', NOW(), USER());
END
$$
DELIMITER ;

DROP TRIGGER Audit_patientprocedure_AFTER_DELETE;
DELIMITER $$
CREATE DEFINER = CURRENT_USER TRIGGER `royale_baby_clinic`.`Audit_patientprocedure_AFTER_DELETE` 
AFTER DELETE ON `patient_procedure` FOR EACH ROW
BEGIN
Insert into audit_patientprocedure values (
OLD.procedure_no,
OLD.appointment_id,
OLD.procedure_id,
OLD.date_,
OLD.doctor_id,
OLD.nurse_id,
'deleted', NOW(), USER());
END
$$
DELIMITER ;

DROP TRIGGER Audit_patientsymptoms_AFTER_INSERT;
DELIMITER $$
CREATE DEFINER = CURRENT_USER TRIGGER `royale_baby_clinic`.`Audit_patientsymptoms_AFTER_INSERT` 
AFTER INSERT ON `patient_symptoms` FOR EACH ROW
BEGIN
Insert into audit_patientsymptoms values (
NEW.appointment_id,
NEW.fever,
NEW.flu,
NEW.ear_infection,
NEW.stomach_pain,
NEW.pneumonia,
NEW.toothpain,
'inserted', NOW(), USER());
END
$$
DELIMITER ;

DROP TRIGGER Audit_patientsymptoms_AFTER_UPDATE;
DELIMITER $$
CREATE DEFINER = CURRENT_USER TRIGGER `royale_baby_clinic`.`Audit_patientsymptoms_AFTER_UPDATE` 
AFTER UPDATE ON `patient_symptoms` FOR EACH ROW
BEGIN
Insert into audit_patientsymptoms values (
OLD.appointment_id,
OLD.fever,
OLD.flu,
OLD.ear_infection,
OLD.stomach_pain,
OLD.pneumonia,
OLD.toothpain,
'updated', NOW(), USER());
END
$$
DELIMITER ;


DROP TRIGGER Audit_patientsymptoms_AFTER_DELETE;
DELIMITER $$
CREATE DEFINER = CURRENT_USER TRIGGER `royale_baby_clinic`.`Audit_patientsymptoms_AFTER_DELETE` 
AFTER DELETE ON `patient_symptoms` FOR EACH ROW
BEGIN
Insert into audit_patientsymptoms values (
OLD.appointment_id,
OLD.fever,
OLD.flu,
OLD.ear_infection,
OLD.stomach_pain,
OLD.pneumonia,
OLD.toothpain,
'deleted', NOW(), USER());
END
$$
DELIMITER ;


DROP TRIGGER Audit_pharmacyinventory_AFTER_INSERT;
DELIMITER $$
CREATE DEFINER = CURRENT_USER TRIGGER `royale_baby_clinic`.`Audit_pharmacyinventory_AFTER_INSERT` 
AFTER INSERT ON `pharmacy_inventory` FOR EACH ROW
BEGIN
Insert into audit_pharmacyinventory values (
NEW.medicine_id,
NEW.medicine_name,
NEW.supplier,
NEW.description,
NEW.price_per_item,
'inserted', NOW(), USER());
END
$$
DELIMITER ;

DROP TRIGGER Audit_pharmacyinventory_AFTER_UPDATE;
DELIMITER $$
CREATE DEFINER = CURRENT_USER TRIGGER `royale_baby_clinic`.`Audit_pharmacyinventory_AFTER_UPDATE` 
AFTER UPDATE ON `pharmacy_inventory` FOR EACH ROW
BEGIN
Insert into audit_pharmacyinventory values (
OLD.medicine_id,
OLD.medicine_name,
OLD.supplier,
OLD.description,
OLD.price_per_item,
'updated', NOW(), USER());
END
$$
DELIMITER ;


DROP TRIGGER Audit_pharmacyinventory_AFTER_DELETE;
DELIMITER $$
CREATE DEFINER = CURRENT_USER TRIGGER `royale_baby_clinic`.`Audit_pharmacyinventory_AFTER_DELETE` 
AFTER DELETE ON `pharmacy_inventory` FOR EACH ROW
BEGIN
Insert into audit_pharmacyinventory values (
OLD.medicine_id,
OLD.medicine_name,
OLD.supplier,
OLD.description,
OLD.price_per_item,
'deleted', NOW(), USER());
END
$$
DELIMITER ;


DROP TRIGGER Audit_procedureresults_AFTER_INSERT;
DELIMITER $$
CREATE DEFINER = CURRENT_USER TRIGGER `royale_baby_clinic`.`Audit_procedureresults_AFTER_INSERT` 
AFTER INSERT ON `procedure_results` FOR EACH ROW
BEGIN
Insert into audit_procedureresults values (
NEW.procedure_id,
NEW.results,
NEW.summary,
'inserted', NOW(), USER());
END
$$
DELIMITER ;

DROP TRIGGER Audit_procedureresults_AFTER_UPDATE;
DELIMITER $$
CREATE DEFINER = CURRENT_USER TRIGGER `royale_baby_clinic`.`Audit_procedureresults_AFTER_UPDATE` 
AFTER UPDATE ON `procedure_results` FOR EACH ROW
BEGIN
Insert into audit_procedureresults values (
OLD.procedure_id,
OLD.results,
OLD.summary,
'updated', NOW(), USER());
END
$$
DELIMITER ;

DROP TRIGGER Audit_procedureresults_AFTER_DELETE;
DELIMITER $$
CREATE DEFINER = CURRENT_USER TRIGGER `royale_baby_clinic`.`Audit_procedureresults_AFTER_DELETE` 
AFTER DELETE ON `procedure_results` FOR EACH ROW
BEGIN
Insert into audit_procedureresults values (
OLD.procedure_id,
OLD.results,
OLD.summary,
'deleted', NOW(), USER());
END
$$
DELIMITER ;

DROP TRIGGER Audit_testprocedure_AFTER_DELETE;
DELIMITER $$
CREATE DEFINER = CURRENT_USER TRIGGER `royale_baby_clinic`.`Audit_testprocedure_AFTER_DELETE` 
AFTER DELETE ON `test_procedure` FOR EACH ROW
BEGIN
Insert into audit_testprocedure values (
OLD.id,
OLD.name,
OLD.description,
OLD.price,
'deleted', NOW(), USER());
END
$$
DELIMITER ;

DROP TRIGGER Audit_testprocedure_AFTER_UPDATE;
DELIMITER $$
CREATE DEFINER = CURRENT_USER TRIGGER `royale_baby_clinic`.`Audit_testprocedure_AFTER_UPDATE` 
AFTER UPDATE ON `test_procedure` FOR EACH ROW
BEGIN
Insert into audit_testprocedure values (
OLD.id,
OLD.name,
OLD.description,
OLD.price,
'updated', NOW(), USER());
END
$$
DELIMITER ;

DROP TRIGGER Audit_testprocedure_AFTER_UPDATE;
SHOW TRIGGERS;


select * from audit_testprocedure;

delete from audit_testprocedure where user = 'root@localhost';