# Design Document

By Kevin Dela Paz

Video overview: <URL HERE>

## Scope

In this section you should answer the following questions:

The purpose of this database is to track prescriptions, refills, and medication history for patients in a way that ensures accuracy, ease of access, and support for analytical reports. This system can be used by healthcare providers, pharmacies, and patients.

* Patients: Basic information (e.g., name, contact, age, etc.).
* Doctors: Basic information (name, specialty, contact info).
* Prescriptions: Details about issued prescriptions, including dates, dosage, and prescribing doctors.
* Medications: Information about drugs such as name, dosage form, and instructions for use.
* Pharmacies: Details about the pharmacy filling the prescription.

Out of scope are elements such as payments and billing information, insurance details, and real-time inventory tracking for pharmacies.

## Functional Requirements

* Query active prescriptions for a specific patient.
* Track refill history for a specific medication for a patient.
* Generate reports on medication usage trends across patients or specific medications.
* View detailed patient medication history (including inactive prescriptions).

## Representation

### Entities

The `patients` table includes:

`id`, which specifies the unique ID for the patient as an `INTEGER`. This column has the `PRIMARY KEY` constraint applied.
`first_name`, which specifies the patient's first name as `TEXT`, given `TEXT` is appropriate for name fields.
`last_name`, which specifies the patient's last name. `TEXT` is used for the same reason as `first_name`.
`date_of_birth`, which specifies the patient's date of birth. This is stored as `TEXT` in ISO 8601 format (YYYY-MM-DD), which SQLite recommends for date fields.
`email`, which specifies the patient's email address. `TEXT` is used because email addresses are stored as text. A `UNIQUE` constraint ensures no two patients share the same email.
`gender`, which specifies the patient's gender as `TEXT`.

The `doctors` table includes:

`id`, which specifies the unique ID for the doctor as an `INTEGER`. This column has the `PRIMARY KEY` constraint applied.
`first_name`, which specifies the doctor's first name as `TEXT`.
`last_name`, which specifies the doctor's last name. `TEXT` is used for the same reason as `first_name`.
`specialization`, which specifies the doctor's field of expertise (e.g., "Cardiologist", "Pediatrician"). `TEXT` is appropriate for this field.
`email`, which specifies the doctor's email address. `TEXT` is used for the same reason as in the `patients` table. A `UNIQUE` constraint ensures no two doctors have the same email.

The `medications` table includes:

`id`, which specifies the unique ID for the medication as an `INTEGER`. This column has the `PRIMARY KEY` constraint applied.
`name`, which specifies the name of the medication (e.g., "Paracetamol") as `TEXT`.
`dosage_form`, which specifies the form of the medication (e.g., "Tablet", "Capsule"). This is stored as `TEXT`.
`instructions`, which specifies instructions for taking the medication (e.g., "Take one tablet twice daily after meals") as `TEXT`.

The `pharmacies` table includes:

`id`, which specifies the unique ID for the pharmacy as an `INTEGER`. This column has the `PRIMARY KEY` constraint applied.
`name`, which specifies the pharmacy's name as `TEXT`.
`email`, which specifies the pharmacy's email address. `TEXT` is used for the same reason as in the `patients` table. A `UNIQUE` constraint ensures no two pharmacies have the same email.
`address`, which specifies the pharmacy's physical address as `TEXT`.

The `prescriptions` table includes:

`id`, which specifies the unique ID for the prescription as an `INTEGER`. This column has the `PRIMARY KEY` constraint applied.
`patient_id`, which specifies the ID of the patient for whom the prescription is issued. This is an `INTEGER` and is a `FOREIGN KEY` referencing the `patients` table.
`doctor_id`, which specifies the ID of the doctor who issued the prescription. This is an `INTEGER` and is a `FOREIGN KEY` referencing the `doctors` table.
`medication_id`, which specifies the ID of the medication prescribed. This is an `INTEGER` and is a `FOREIGN KEY` referencing the `medications` table.
`pharmacy_id`, which specifies the ID of the pharmacy that filled the prescription. This is an `INTEGER` and is a `FOREIGN KEY`referencing the `pharmacies` table.
`date_issued`, which specifies when the prescription was issued. This is stored as `TEXT` in ISO 8601 format (YYYY-MM-DD).
`dosage`, which specifies the dosage instructions (e.g., "1 tablet"). This is stored as `TEXT`.
`requency`, which specifies how often the medication should be taken (e.g., "Twice daily"). This is stored as `TEXT`.
`status`, which specifies whether the prescription is Active or Inactive. This is stored as `TEXT`, with a `CHECK` constraint ensuring the value is either Active or Inactive.

### Relationships

Patients → Prescriptions:
Type: One-to-Many
Description: Each patient can have multiple prescriptions, but a prescription belongs to one patient.

Doctors → Prescriptions:
Type: Many-to-One
Description: A doctor can issue multiple prescriptions, but each prescription is associated with one doctor by default. If you need to support multiple doctors for a prescription, a join table (PrescriptionDoctors) can be used.

Medications → Prescriptions:
Type: One-to-Many
Description: Each prescription is for one medication, but a medication can appear in multiple prescriptions.

Pharmacies → Prescriptions:
Type: One-to-Many
Description: Each prescription is filled by one pharmacy, but a pharmacy can fill multiple prescriptions.

