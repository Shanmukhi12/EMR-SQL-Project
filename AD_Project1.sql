DROP DATABASE IF EXISTS royale_baby_clinic;

-- Database creation --
CREATE DATABASE royale_baby_clinic;

USE royale_baby_clinic;

-- creating table clinic_treatment_room --
CREATE TABLE clinic_treatment_room
( room_no VARCHAR(50) PRIMARY KEY,
  room_type VARCHAR(50)
);

-- inserting values into clinic_treatment_room --
Insert into clinic_treatment_room values
('G101', 'GENERAL ROOM-1'),
('G102', 'GENERAL ROOM-2'),
('G103', 'GENERAL ROOM-3'),
('S101', 'SURGERY ROOM-1'),
('S102', 'SURGERY ROOM-2'),
('X101', 'X-RAY ROOM'),
('O101', 'OPERATION ROOM-1'),
('O102', 'OPERATION ROOM-2'),
('I101', 'INCUBATOR ROOM'),
('IC101', 'ICU');

-- creating tablel clinic_employee--
CREATE TABLE clinic_employee(
Employee_id INT PRIMARY KEY,
First_Name VARCHAR(50),
Last_Name VARCHAR(50),
Designation VARCHAR(50),
Salary DECIMAL(9,2));


-- Inserting values into clinic_employee --
INSERT INTO clinic_employee VALUES 
(1201,'Stephen','Joseph','Pediatrician',15000),
(1202,'Jeffrey','Mary','Neonatologist',12000),
(1203,'Charles','Mark','Ophthamologist',10000),
(1204,'Daniel','Thomas','Psychiartist',15000),
(1205,'Steven','Jennifer','Nurse',6000),
(1206,'Paul','Richard','Receptionist',8000),
(1207,'Elizabeth','Willaim','Nurse',6000),
(1208,'Susan','James','Dentist',16000);

SELECT * FROM clinic_employee;

-- creating table health_insurance--
CREATE TABLE health_insurance 
(
	insurance_id INT PRIMARY KEY,
    insurance_provider VARCHAR(100),
    policy_no VARCHAR(100),
    plan_type VARCHAR(100),
    start_date DATETIME,
    end_date DATETIME
);

-- inserting values ointo health_insurance --
Insert into health_insurance values
(121212001,'Humana', 'Humana Silver', 'HS1212001','2022-08-22 08:00:00', '2023-08-22 08:00:00'),
(121212002,'Humana', 'Humana Gold', 'HG1212002','2022-01-01 09:00:00', '2023-05-01 09:00:00'),
(121212003,'Cigna', 'Cigna Silver', 'CS1212003','2023-01-01 7:00:00', '2024-01-01 07:00:00'),
(121212004,'Cigna', 'Cigna Gold', 'CG1212004', '2022-05-01 09:00:00', '2023-05-01 09:00:00'),
(121212005,'Coventry', 'Coventry Silver', 'COS1212005','2023-03-01 09:00:00', '2024-10-01 20:00:00'),
(121212006,'Coventry', 'Coventry Gold', 'COS1212006','2022-02-01 10:00:00', '2024-09-01 19:00:00'),
(121212007,'BlueCross', 'BlueCross Silver', 'BCS1212007','2023-02-01 10:00:00', '2024-05-01 10:00:00'),
(121212008,'BlueCross', 'BlueCross Gold', 'BCG1212008','2023-02-01 10:00:00', '2025-09-01 19:00:00');

-- creating table test_procedure --
CREATE TABLE test_procedure
(
 id INT PRIMARY KEY,
 name VARCHAR(100),
 description VARCHAR(500),
 price INT);

-- inserting values into test_procedure --
INSERT INTO test_procedure VALUES
(01, 'Blood Tests', 'general blood test', 150);

INSERT INTO test_procedure VALUES
(02, 'CT Scan', 'to check a slice, or cross-section, of the body', 300),
(03, 'MRI', 'Magnetic Resonance Imaging to detect tumours', 1000),
(04, 'Ultra Sound', 'to check the picture of organs, tissues, and other structures inside the body', 500),
(05, 'Cavity filling', 'Repairing teeth', 700),
(06, 'ERG', 'to check retinal issues', 400),
(07, 'Urine Tests', 'for physical examination of urine', 450);

-- creating table patient_info --
CREATE TABLE Patient_Info (
    patient_id INTEGER NOT NULL PRIMARY KEY,
    First_Name VARCHAR(25) NOT NULL,
    Middle_Name VARCHAR(25),
    Last_Name VARCHAR(25) NOT NULL,
    Gender VARCHAR(10) NOT NULL,
    Age INTEGER NOT NULL,
    Phone_number VARCHAR(15) NOT NULL,
    Address VARCHAR(100) NOT NULL,
    Insurance_id INTEGER NOT NULL,
    pcp INTEGER NOT NULL,
    CONSTRAINT Patient_Info_fk_insurance FOREIGN KEY (Insurance_id)
        REFERENCES health_insurance (insurance_id),
    CONSTRAINT Patient_Info_fk_pcp FOREIGN KEY (pcp)
        REFERENCES clinic_employee (Employee_id)
);

SELECT * FROM Patient_Info;
SELECT * FROM test_procedure;


Insert into Patient_Info values
('1301', 'Emma', '','Watson', 'Female', 12, '8990786756', '12F Arshford','121212001',1201);

-- inserting values into patient_info --
INSERT INTO Patient_Info VALUES
('1302', 'Olivia', 'Oli','Ava', 'Female', 05, '9078563467', '9543A UT','121212006',1208),
('1303', 'Benjamin', '','James', 'Male', 10, '2367459087', '9551A UT','121212005',1202),
('1304', 'Henry', 'Ken','Watson', 'Male', 07, '98760956898', '100021 UTN','121212004',1204),
('1305', 'Jack', '','Levi', 'Male', 13, '7890987610', '9543B UT','121212003',1201),
('1306', 'Isabella', '','Mia', 'Female', 08, '9848022334', '9531A Arshford','121212003',1201),
('1307', 'Mary', '','Queen', 'Female', 11, '6789093467', '9505C UT','121212007',1204),
('1308', 'Evelyn', '','Pathric', 'Female', 16, '9000000121', '9543C UT','121212007',1203),
('1309', 'Charlotte', '','Amelia', 'Female', 09, '8888899999', '9547A UT','121212002',1202),
('1310', 'Noah', 'Lucas','Liam', 'Male', 10, '9999777798', '9535D UT','121212008',1201);

-- creating table appointment_info --
CREATE TABLE appointment_info (
    appointment_id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
    patient_id INTEGER NOT NULL,
    nurse_id INTEGER NOT NULL,
    doctor_id INTEGER NOT NULL,
    start_datetime DATETIME NOT NULL,
    end_datetime DATETIME NOT NULL,
    room_number VARCHAR(50) NOT NULL,
    CONSTRAINT fk_patient FOREIGN KEY (patient_id)
        REFERENCES patient_info (patient_id),
	CONSTRAINT fk_nurse FOREIGN KEY (nurse_id)
        REFERENCES clinic_employee (Employee_id),
    CONSTRAINT fk_doctor FOREIGN KEY (doctor_id)
        REFERENCES clinic_employee (Employee_id),
    CONSTRAINT fk_roomno FOREIGN KEY (room_number)
        REFERENCES clinic_treatment_room (room_no)
);

-- inserting values into appointment_into --
Insert into appointment_info values
(1, 1301, 1205, 1201, '2023-01-12 11:30:00', '2023-01-12 14:30:00', 'I101'),
(2, 1302, 1205, 1203, '2023-01-25 10:00:00', '2023-01-25 12:30:00', 'G101'),
(3, 1303, 1207, 1201, '2023-02-14 12:00:00', '2023-02-14 14:55:00', 'G102'),
(4, 1304, 1205, 1202, '2023-02-24 13:00:00', '2023-02-24 14:00:00', 'G103'),
(5, 1303, 1205, 1204, '2023-03-01 14:00:00', '2023-03-01 16:30:00', 'G101'),
(7, 1303, 1207, 1202, '2023-03-09 08:30:00', '2023-03-09 12:35:00', 'IC101'),
(8, 1302, 1207, 1206, '2023-03-10 11:35:00', '2023-03-10 13:25:00', 'X101'),
(9, 1306, 1207, 1203, '2023-03-14 11:45:00', '2023-03-14 12:50:00', 'S101'),
(10, 1301, 1205, 1206, '2023-03-17 11:15:00', '2023-03-17 13:15:00', 'G101');

-- creating table patient_procedure --
CREATE TABLE patient_procedure (
	procedure_no INTEGER NOT NULL UNIQUE,
    appointment_id INTEGER NOT NULL,
    procedure_id INTEGER NOT NULL,
    date_ DATETIME NOT NULL,
    doctor_id INTEGER NOT NULL,
    nurse_id INTEGER NOT NULL,
    PRIMARY KEY (appointment_id, procedure_id),
    CONSTRAINT fk_procedure_code FOREIGN KEY (procedure_id)
        REFERENCES test_procedure (id),
    CONSTRAINT fk_procedure_doctor FOREIGN KEY (doctor_id)
        REFERENCES clinic_employee (Employee_id),
    CONSTRAINT fk_procedure_nurse FOREIGN KEY (nurse_id)
        REFERENCES clinic_employee (Employee_id),
    CONSTRAINT fk_procedure_appointment FOREIGN KEY (appointment_id)
        REFERENCES appointment_info (appointment_id)
);

SELECT * FROM patient_procedure;
DROP TABLE patient_procedure;
 -- inserting values into patient_procedure --
Insert into patient_procedure values
(11, 1, 1, '2023-01-12 12:00:00', 1201, 1205),
(12, 2, 1, '2023-01-25 11:00:00', 1201, 1205),
(13, 3, 2, '2023-02-14 12:30:00', 1202, 1207),
(14, 4, 3, '2023-02-24 13:20:00', 1203, 1205),
(15, 5, 4, '2023-03-01 14:10:00', 1202, 1207),
(16, 7, 5, '2023-03-09 10:00:00', 1208, 1207);

-- creating table procedure_results --
CREATE TABLE procedure_results (
    procedure_id INTEGER NOT NULL,
    results VARCHAR(150) NOT NULL,
    summary VARCHAR(200),
    CONSTRAINT fk_procedure_results FOREIGN KEY (procedure_id)
        REFERENCES patient_procedure (procedure_id)
);
SELECT * FROM procedure_results;

-- inserting values into procedure_results --
INSERT INTO procedure_results VALUES
(1,'Normal',''),
(2, 'Abnormal','Slightly fractured'),
(3,'Negative',''),
(4,'Normal',''),
(5,'Normal','');

-- creating table patient_symptoms --
CREATE TABLE patient_symptoms (
    appointment_id INTEGER NOT NULL UNIQUE,
    fever TINYINT NOT NULL,
    flu TINYINT NOT NULL,
    ear_infection TINYINT NOT NULL,
    stomach_pain TINYINT NOT NULL,
    pneumonia TINYINT NOT NULL,
    toothpain TINYINT NOT NULL,
    CONSTRAINT fk_appointment_symptoms FOREIGN KEY (appointment_id)
        REFERENCES appointment_info (appointment_id)
);

SELECT * FROM patient_symptoms;

-- inserting values into patient_symptoms --
INSERT INTO patient_symptoms VALUES
(1,1,0,0,0,1,0),
(2,1,1,0,0,0,0),
(3,0,0,0,0,1,0),
(4,0,0,0,0,0,1),
(5,1,0,0,1,0,0),
(7,0,1,0,0,0,0),
(8,0,0,1,0,0,0);


-- creating table pharmacy_inventory --
CREATE TABLE pharmacy_inventory (
    medicine_id VARCHAR(50) NOT NULL PRIMARY KEY,
    medicine_name VARCHAR(150) NOT NULL,
    supplier VARCHAR(100) NOT NULL,
    description VARCHAR(300),
    price_per_item DECIMAL(8, 2) NOT NULL
);
DROP TABLE pharmacy_inventory;
select * from pharmacy_inventory;

-- inserting values into pharmacy_inventory --
INSERT INTO pharmacy_inventory VALUES
('M1','Dolo', 'McKesson Corporation','',12.10),
('M2','Amoxicillin', 'Cardinal Health','',09.20),
('M3','Cefdinir', 'Alfresa holdings','',25.00),
('M4','Ibuprofen', 'CR Pharmaceutical','',13.70);

-- creating table medical_prescription --
CREATE TABLE medical_prescription (
    appointment_id INTEGER NOT NULL,
    medicine_id VARCHAR(50) NOT NULL,
    medicine_dose INT NOT NULL,
    PRIMARY KEY(appointment_id, medicine_id),
    CONSTRAINT fk_appointment_prescription FOREIGN KEY (appointment_id)
        REFERENCES appointment_info (appointment_id),
	CONSTRAINT fk_medicine_prescription FOREIGN KEY (medicine_id)
        REFERENCES pharmacy_inventory (medicine_id)
);


SELECT * FROM medical_prescription;

-- inserting values into medical_prescription --
INSERT INTO medical_prescription VALUES
(1,'M1',1),
(2,'M3',2),
(3,'M4',1),
(4,'M1',2),
(5,'M2',1),
(7,'M3',1),
(8,'M4',2),
(1,'M2',2);

-- creating table bill --
CREATE TABLE bill (
    bill_id INTEGER PRIMARY KEY AUTO_INCREMENT,
    appointment_id INTEGER NOT NULL,
    total_cost DECIMAL(9,3),
    date_ DATETIME NOT NULL,
    CONSTRAINT fk_bill_appointment FOREIGN KEY (appointment_id)
        REFERENCES appointment_info (appointment_id)
);

SELECT * FROM bill;

-- inserting values into bill
INSERT INTO bill VALUES 
(55,1,680,'2021-08-11 11:00:00'),
(56,2,100,'2021-03-27 12:00:00'),
(57,3,550,'2021-03-27 16:00:00'),
(58,4,400,'2021-09-15 15:00:00'),
(59,5,1010,'2021-09-23 14:00:00'),
(60,7,210,'2021-09-15 15:00:00'),
(61,8,300,'2021-09-23 14:00:00');

