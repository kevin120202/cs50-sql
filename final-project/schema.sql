CREATE TABLE Patients (
    PatientID INTEGER PRIMARY KEY AUTOINCREMENT,
    FirstName TEXT NOT NULL,
    LastName TEXT NOT NULL,
    DateOfBirth TEXT NOT NULL, -- Use ISO format (YYYY-MM-DD)
    ContactInfo TEXT, -- Can store phone or email as a single field
    Address TEXT
);

CREATE TABLE Doctors (
    DoctorID INTEGER PRIMARY KEY AUTOINCREMENT,
    FirstName TEXT NOT NULL,
    LastName TEXT NOT NULL,
    Specialization TEXT, -- Example: 'Cardiologist', 'General Practitioner'
    ContactInfo TEXT, -- Can store phone or email as a single field
    ClinicAddress TEXT
);

CREATE TABLE Medications (
    MedicationID INTEGER PRIMARY KEY AUTOINCREMENT,
    Name TEXT NOT NULL,
    DosageForm TEXT NOT NULL, -- Example: 'Tablet', 'Capsule', 'Syrup'
    Instructions TEXT -- Example: 'Take 1 tablet twice daily after meals'
);

CREATE TABLE Pharmacies (
    PharmacyID INTEGER PRIMARY KEY AUTOINCREMENT,
    Name TEXT NOT NULL,
    ContactInfo TEXT, -- Can store phone or email
    Address TEXT
);

CREATE TABLE Prescriptions (
    PrescriptionID INTEGER PRIMARY KEY AUTOINCREMENT,
    PatientID INTEGER NOT NULL,
    DoctorID INTEGER NOT NULL,
    MedicationID INTEGER NOT NULL,
    PharmacyID INTEGER,
    DateIssued TEXT NOT NULL, -- Use ISO format (YYYY-MM-DD)
    Dosage TEXT NOT NULL, -- Example: '1 tablet'
    Frequency TEXT, -- Example: 'Twice daily'
    Status TEXT NOT NULL CHECK (Status IN ('Active', 'Inactive')), -- Constrains to only 'Active' or 'Inactive'
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID),
    FOREIGN KEY (MedicationID) REFERENCES Medications(MedicationID),
    FOREIGN KEY (PharmacyID) REFERENCES Pharmacies(PharmacyID)
);

-- Create an index on PatientID in the Prescriptions table for faster queries filtering by patient
CREATE INDEX idx_prescriptions_patient_id ON Prescriptions (PatientID);

-- Create an index on MedicationID in the Prescriptions table for faster queries filtering by medication
CREATE INDEX idx_prescriptions_medication_id ON Prescriptions (MedicationID);

-- Create an index on DoctorID in the Prescriptions table for faster queries filtering by doctor
CREATE INDEX idx_prescriptions_doctor_id ON Prescriptions (DoctorID);

-- Create an index on PharmacyID in the Prescriptions table for faster queries filtering by pharmacy
CREATE INDEX idx_prescriptions_pharmacy_id ON Prescriptions (PharmacyID);

-- Create an index on DateIssued in the Prescriptions table to optimize queries involving date ranges
CREATE INDEX idx_prescriptions_date_issued ON Prescriptions (DateIssued);

-- Create an index on Name in the Medications table for faster searches by medication name
CREATE INDEX idx_medications_name ON Medications (Name);

-- Create an index on Name in the Pharmacies table for faster searches by pharmacy name
CREATE INDEX idx_pharmacies_name ON Pharmacies (Name);

-- Create an index on Email in the Patients table to ensure quick lookups by email
CREATE INDEX idx_patients_email ON Patients (ContactInfo);

-- Create an index on Email in the Doctors table to ensure quick lookups by email
CREATE INDEX idx_doctors_email ON Doctors (ContactInfo);
