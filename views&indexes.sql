Create view empinfo_v
as select Employee_id,First_Name, Last_Name, Designation from 
clinic_employee;

SELECT * from empinfo_v;

Create view testprocedure_v as
select name, description from test_procedure;

select * from testprocedure_v;

Create view patientinfo_v as 
select patient_id, First_Name, Last_Name, Gender
from patient_info;

select * from patientinfo_v;

Create view insurancedetails_v as
select insurance_id, insurance_provider, policy_no, end_date
from health_insurance;

select * from insurancedetails_v;

Create view appointmentInfo_v as
select patient_id, nurse_id, room_number from appointment_info;

select * from appointmentinfo_v;


CREATE INDEX employee_name_info
ON clinic_employee(first_name DESC);

SHOW INDEX FROM clinic_employee;


CREATE INDEX treatmentRoom
ON clinic_treatment_room(room_type);

SHOW INDEX FROM clinic_treatment_room;

CREATE INDEX patient_insurance ON
patient_info(Insurance_id DESC);

CREATE INDEX patient_id ON
patient_info(patient_id );

SHOW INDEX FROM patient_info;

SHOW TRIGGERS;