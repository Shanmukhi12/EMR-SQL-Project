use royale_baby_clinic;

CREATE TABLE Audit_ClinicEmployee (

    Employee_id INTEGER NOT NULL PRIMARY KEY,
    First_Name VARCHAR(50) NOT NULL,
    Last_Name VARCHAR(50) NOT NULL,
    Designation VARCHAR(50) NOT NULL,
    Salary DECIMAL(9, 2 ) NOT NULL,
    Action_Performed Varchar(50) NOT NULL,
    Action_Time DATETIME NOT NULL
);

CREATE TABLE Audit_TreatmentRoom
( room_no VARCHAR(50) PRIMARY KEY,
  room_type VARCHAR(50),
  Action_Performed Varchar(50) NOT NULL,
  Action_Time DATETIME NOT NULL
);


CREATE TABLE Audit_HealthInsurance 
(
	insurance_id INT PRIMARY KEY,
    insurance_provider VARCHAR(100),
    policy_no VARCHAR(100),
    plan_type VARCHAR(100),
    start_date DATETIME,
    end_date DATETIME,
    Action_Performed VARCHAR(50),
    Action_Time DATETIME NOT NULL
);


CREATE TABLE Audit_TestProcedure
(
 id INT PRIMARY KEY,
 name VARCHAR(100),
 description VARCHAR(500),
 price INT,
 Action_Performed VARCHAR(50),
 Action_Time DATETIME NOT NULL
 );
 
 
CREATE TABLE Audit_PatientInfo (
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
    Action_Performed VARCHAR(50) NOT NULL,
    Action_Time DATETIME NOT NULL
);


CREATE TABLE Audit_AppointmentInfo (
    appointment_id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
    patient_id INTEGER NOT NULL,
    nurse_id INTEGER NOT NULL,
    doctor_id INTEGER NOT NULL,
    start_datetime DATETIME NOT NULL,
    end_datetime DATETIME NOT NULL,
    room_number VARCHAR(50) NOT NULL,
    Action_Performed VARCHAR(50) NOT NULL,
    Action_Time DATETIME NOT NULL
);

CREATE TABLE Audit_PatientProcedure (
	procedure_no INTEGER NOT NULL UNIQUE,
    appointment_id INTEGER NOT NULL,
    procedure_id INTEGER NOT NULL,
    date_ DATETIME NOT NULL,
    doctor_id INTEGER NOT NULL,
    nurse_id INTEGER NOT NULL,
    PRIMARY KEY (appointment_id, procedure_id),
    Action_Performed VARCHAR(50) NOT NULL,
    Action_Time DATETIME NOT NULL
);

CREATE TABLE Audit_ProcedureResults (
    procedure_id INTEGER NOT NULL,
    results VARCHAR(150) NOT NULL,
    summary VARCHAR(200),
    Action_Performed VARCHAR(50) NOT NULL,
    Action_Time DATETIME NOT NULL
);


CREATE TABLE Audit_PatientSymptoms (
    appointment_id INTEGER NOT NULL UNIQUE,
    fever TINYINT NOT NULL,
    flu TINYINT NOT NULL,
    ear_infection TINYINT NOT NULL,
    stomach_pain TINYINT NOT NULL,
    pneumonia TINYINT NOT NULL,
    toothpain TINYINT NOT NULL,
    Action_Performed VARCHAR(50) NOT NULL,
    Action_Time DATETIME NOT NULL
);


CREATE TABLE Audit_PharmacyInventory (
    medicine_id VARCHAR(50) NOT NULL PRIMARY KEY,
    medicine_name VARCHAR(150) NOT NULL,
    supplier VARCHAR(100) NOT NULL,
    description VARCHAR(300),
    price_per_item DECIMAL(8, 2) NOT NULL,
    Action_Performed VARCHAR(50) NOT NULL,
    Action_Time DATETIME NOT NULL
);

CREATE TABLE Audit_MedicalPrescription (
    appointment_id INTEGER NOT NULL,
    medicine_id VARCHAR(50) NOT NULL,
    medicine_dose INT NOT NULL,
    PRIMARY KEY(appointment_id, medicine_id),
   Action_Performed VARCHAR(50) NOT NULL,
    Action_Time DATETIME NOT NULL
);

CREATE TABLE Audit_Bill (
    bill_id INTEGER PRIMARY KEY AUTO_INCREMENT,
    appointment_id INTEGER NOT NULL,
    total_cost DECIMAL(9,3),
    date_ DATETIME NOT NULL,
    Action_Performed VARCHAR(50) NOT NULL,
    Action_Time DATETIME NOT NULL
);


CREATE TABLE Audit_Bill1 (
    bill_id INTEGER PRIMARY KEY AUTO_INCREMENT,
    appointment_id INTEGER NOT NULL,
    total_cost DECIMAL(9,3),
    date_ DATETIME NOT NULL,
    Action_Performed VARCHAR(50) NOT NULL,
    Action_Time DATETIME NOT NULL,
    user_name varchar(75)
);

DROP TABLE audit_bill1;

ALTER TABLE audit_bill ADD user varchar(100);
select * from audit_bill;

ALTER TABLE audit_appointmentinfo ADD user varchar(100);

ALTER TABLE audit_clinicemployee ADD user varchar(100);

ALTER TABLE audit_healthinsurance ADD user varchar(100);

ALTER TABLE audit_medicalprescription ADD user varchar(100);

ALTER TABLE audit_patientinfo ADD user varchar(100);

ALTER TABLE audit_patientprocedure ADD user varchar(100);

ALTER TABLE audit_patientsymptoms ADD user varchar(100);

ALTER TABLE audit_pharmacyinventory ADD user varchar(100);

ALTER TABLE audit_procedureresults ADD user varchar(100);

ALTER TABLE audit_testprocedure ADD user varchar(100);

ALTER TABLE audit_treatmentroom ADD user varchar(100);

