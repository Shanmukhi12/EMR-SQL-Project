-- displaying information of patient_info table --
SELECT * FROM patient_info;

-- displaying information about test_procedure table --
SELECT * FROM test_procedure;

-- Show the procedures with price less than 500 --
SELECT * FROM test_procedure WHERE price <=500;

-- insertion--
INSERT INTO test_procedure VALUES
(8,'Tooth Repair','repairing the tooth',550);

SELECT * FROM test_procedure;

-- insertion --
INSERT INTO pharmacy_inventory VALUES
('M5','Paracetamol','CR Pharmaceutical','',10);



SELECT * FROM pharmacy_inventory;

-- Update --
UPDATE test_procedure SET price=600 WHERE id = 8;
UPDATE pharmacy_inventory SET description='Take with caution' WHERE medicine_id = 'M1';

SELECT * FROM test_procedure;
SELECT * FROM pharmacy_inventory;

-- Delete --
DELETE FROM pharmacy_inventory WHERE medicine_id = 'M5';
SELECT * FROM clinic_treatment_room;
DELETE FROM clinic_treatment_room WHERE room_no LIKE 'O%';





-- Total number of employees in the clinic --
SELECT count(*) FROM clinic_employee;

-- Total number of employees in clinic whose designation is nurse --
SELECT COUNT(*) FROM clinic_employee WHERE Designation = 'Nurse';

-- Total number of employees in clinic whose designation is receptionist --
SELECT COUNT(*) FROM clinic_employee WHERE Designation = 'Receptionist';

-- Total count of patients visited the clinic so far --
SELECT COUNT(*) FROM patient_info;

-- Total count of doctors in the clinic --
SELECT COUNT(*) FROM clinic_employee WHERE Designation NOT IN ('Nurse','Receptionist');

-- Count of patients visited the clinic between certain dates --
SELECT COUNT(patient_id)
FROM appointment_info
WHERE start_datetime BETWEEN '2023-03-01' AND '2023-03-25';

-- Complex Queries --
-- Employee with highest salary in the clinic --
SELECT CONCAT(First_Name,' ',Last_Name) AS Doctor_Name, Salary
FROM clinic_employee 
WHERE salary = (SELECT MAX(salary) FROM clinic_employee);


SELECT * FROM health_insurance;

-- insurance providers for the patients visiting the clinic --
SELECT DISTINCT insurance_provider FROM health_insurance hl
JOIN patient_info p ON
hl.insurance_id = p.insurance_id;



-- Get patient info who undergone procedure and the physician who performed the surgery
SELECT CONCAT(p.first_name, " ", p.last_name) as patient_name,
CONCAT(e.first_name, " ", e.last_name) as doctor_name, tp.name
FROM patient_info p
JOIN appointment_info a ON p.patient_id=a.patient_id
JOIN clinic_employee e ON a.doctor_id=e.employee_id
JOIN patient_procedure pp ON pp.appointment_id = a.appointment_id
JOIN test_procedure tp ON tp.id = pp.procedure_id
ORDER BY patient_name;

-- No of patients each doctor has treated --
SELECT e.employee_id AS Doctor_ID,
	   CONCAT(e.First_Name,' ',e.Last_Name) AS Doctor_Name,
       COUNT(a.patient_id) "No. of Patients"
FROM appointment_info a
JOIN clinic_employee e ON a.doctor_id=e.employee_id
GROUP BY e.First_Name
HAVING COUNT(a.patient_id)>=1
ORDER BY Doctor_ID;

-- identify the nurses and the room in which they will assist the doctors --
SELECT CONCAT(e.First_Name,' ' ,e.Last_Name) AS "Nurse",
       a.room_number AS "Room No."
FROM clinic_employee e
JOIN appointment_info a ON a.nurse_id=e.employee_id;


-- Getting patient info who undergone certain procedure --
SELECT p.*,
CONCAT(e.First_Name, " ", e.Last_Name) as doctor_name
FROM patient_info p
JOIN appointment_info a ON p.patient_id=a.patient_id
JOIN clinic_employee e ON a.doctor_id=e.employee_id
JOIN patient_procedure pp ON pp.appointment_id = a.appointment_id
JOIN test_procedure tp ON tp.id = pp.procedure_id where tp.name = 'CT Scan';

-- Patients seen by the doctor on a particular day --
SELECT p.*,
CONCAT(e.First_Name, " ", e.Last_Name) as doctor_name
FROM patient_info p
JOIN appointment_info a ON p.patient_id=a.patient_id
JOIN clinic_employee e ON a.doctor_id=e.employee_id
WHERE start_datetime like '2023-03%' and e.employee_id IN (1201,1202,1203,1204);




