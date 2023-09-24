-- creating receptionist
CREATE USER Clinic_Receptionist@localhost 
IDENTIFIED BY 'Baby@123';
GRANT SELECT ON royale_baby_clinic.* 
TO Clinic_Receptionist@localhost 
WITH GRANT OPTION;


CREATE USER ITAdmin1@localhost 
IDENTIFIED BY 'Admin@123';

GRANT ALL PRIVILEGES ON royale_baby_clinic.* 
TO ITAdmin1@localhost 
WITH GRANT OPTION;


CREATE USER ITAdmin2@localhost 
IDENTIFIED BY 'Admin@1234';

GRANT ALL PRIVILEGES ON royale_baby_clinic.* 
TO ITAdmin2@localhost 
WITH GRANT OPTION;

CREATE USER SeniorDoctor@localhost
IDENTIFIED BY 'Doctor@123';
GRANT ALL PRIVILEGES ON royale_baby_clinic.medical_prescription 
TO SeniorDoctor@localhost 
WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON royale_baby_clinic.patient_info
TO SeniorDoctor@localhost 
WITH GRANT OPTION;


CREATE USER pharmacist@localhost
IDENTIFIED BY 'pharma@123';

GRANT ALL PRIVILEGES ON royale_baby_clinic.pharmacy_inventory
TO pharmacist@localhost 
WITH GRANT OPTION;