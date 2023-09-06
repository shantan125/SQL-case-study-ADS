CREATE TABLE PatientDetails (
    patientid INT PRIMARY KEY,
    patientname VARCHAR(255) NOT NULL,
    address VARCHAR(255),
    DOB DATE,
    contact_info VARCHAR(255)
);
-- Inserting sample data into the PatientDetails table
INSERT INTO PatientDetails (patientid, patientname, address, DOB, contact_info)
VALUES
    (1, 'John Doe', '123 Main St, Cityville, USA', '1990-05-15', 'john.doe@email.com'),
    (2, 'Jane Smith', '456 Elm St, Townsville, USA', '1985-09-28', 'jane.smith@email.com'),
    (3, 'Robert Johnson', '789 Oak St, Villageton, USA', '1995-03-10', 'robert.johnson@email.com');
CREATE TABLE MedicalHistory (
    historyid INT PRIMARY KEY,
    patientid INT,
    diagnosis VARCHAR(255),
    treatment VARCHAR(255),
    surgeon VARCHAR(255),
    diagnosis_date DATE,
    FOREIGN KEY (patientid) REFERENCES PatientDetails(patientid)
);
-- Inserting sample data into the MedicalHistory table
INSERT INTO MedicalHistory (historyid, patientid, diagnosis, treatment, surgeon, diagnosis_date)
VALUES
    (1, 1, 'Hypertension', 'Prescribed medication', 'Dr. Smith', '2022-02-10'),
    (2, 2, 'Fractured wrist', 'Casted the wrist', 'Dr. Johnson', '2021-07-15'),
    (3, 1, 'Influenza', 'Prescribed antiviral medication', 'Dr. Brown', '2023-01-25'),
    (4, 3, 'Appendicitis', 'Performed appendectomy', 'Dr. Wilson', '2022-11-05');
    -- Create the LabResult table
CREATE TABLE LabResult (
    resultid INT PRIMARY KEY,
    patientid INT,
    patient_lab_result VARCHAR(255),
    blood_test_result VARCHAR(255),
    urine_test_result VARCHAR(255),
    imaging_test_result VARCHAR(255),
    FOREIGN KEY (patientid) REFERENCES PatientDetails(patientid)
);

-- Insert sample data into the LabResult table
INSERT INTO LabResult (resultid, patientid, patient_lab_result, blood_test_result, urine_test_result, imaging_test_result)
VALUES
    (1, 1, 'Normal', '120/80 mmHg', 'Normal', 'No abnormalities detected'),
    (2, 2, 'Abnormal', '140/90 mmHg', 'Normal', 'No abnormalities detected'),
    (3, 1, 'Normal', '130/85 mmHg', 'Abnormal', 'X-ray shows a fracture'),
    (4, 3, 'Abnormal', '135/88 mmHg', 'Normal', 'MRI shows no abnormalities');
-- Create the Prescription table
CREATE TABLE Prescription (
    prescriptionid INT PRIMARY KEY,
    patientid INT,
    medication_name VARCHAR(255),
    dosage VARCHAR(50),
    frequency VARCHAR(50),
    FOREIGN KEY (patientid) REFERENCES PatientDetails(patientid)
);

-- Insert sample data into the Prescription table
INSERT INTO Prescription (prescriptionid, patientid, medication_name, dosage, frequency)
VALUES
    (1, 1, 'Aspirin', '100mg', 'Once daily'),
    (2, 2, 'Ibuprofen', '200mg', 'Twice daily'),
    (3, 1, 'Amoxicillin', '500mg', 'Three times daily'),
    (4, 3, 'Lisinopril', '10mg', 'Once daily');
-- Create the Outcome table
CREATE TABLE Outcome (
    outcomeid INT PRIMARY KEY,
    patientid INT,
    readmission_rate DECIMAL(5, 2),
    outcome_date DATE,
    discharge_status VARCHAR(255),
    FOREIGN KEY (patientid) REFERENCES PatientDetails(patientid)
);

-- Insert sample data into the Outcome table
INSERT INTO Outcome (outcomeid, patientid, readmission_rate, outcome_date, discharge_status)
VALUES
    (1, 1, 0.05, '2022-03-15', 'Discharged'),
    (2, 2, 0.10, '2022-06-20', 'Discharged'),
    (3, 1, 0.08, '2023-01-10', 'Discharged'),
    (4, 3, 0.15, '2022-11-30', 'Discharged');

    

