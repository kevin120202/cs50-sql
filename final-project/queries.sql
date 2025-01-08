-- List all active prescriptions for a specific patient:
SELECT p.PrescriptionID, m.Name AS MedicationName, p.Dosage, p.Frequency, d.FirstName || ' ' || d.LastName AS DoctorName
FROM Prescriptions p
JOIN Medications m ON p.MedicationID = m.MedicationID
JOIN Doctors d ON p.DoctorID = d.DoctorID
WHERE p.PatientID = ? AND p.Status = 'Active';

-- Track refill history for a specific medication:
SELECT p.PrescriptionID, pt.FirstName || ' ' || pt.LastName AS PatientName, p.DateIssued, ph.Name AS PharmacyName
FROM Prescriptions p
JOIN Patients pt ON p.PatientID = pt.PatientID
JOIN Pharmacies ph ON p.PharmacyID = ph.PharmacyID
WHERE p.MedicationID = ?
ORDER BY p.DateIssued DESC;

-- Generate reports on medication usage trends:
SELECT m.Name AS MedicationName, COUNT(p.PrescriptionID) AS TotalPrescriptions
FROM Medications m
JOIN Prescriptions p ON m.MedicationID = p.MedicationID
GROUP BY m.Name
ORDER BY TotalPrescriptions DESC;
