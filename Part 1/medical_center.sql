-- from the terminal run:
-- psql < medical_center.sql

DROP DATABASE IF EXISTS medical_center;

CREATE DATABASE medical_center;

\c medical_center

CREATE TABLE diseases
(
    disease_id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE patients
(
    patient_id SERIAL PRIMARY KEY,
    full_name TEXT NOT NULL
);

CREATE TABLE patients_diseases
(
    id SERIAL PRIMARY KEY,
    patient_id INT REFERENCES patients(patient_id),
    disease_id INT REFERENCES diseases(disease_id)
);

CREATE TABLE doctors
(
    doctor_id SERIAL PRIMARY KEY,
    full_name TEXT NOT NULL
);

CREATE TABLE appointments
(
    appointment_id SERIAL PRIMARY KEY,
    doctor_id INT REFERENCES doctors(doctor_id),
    patient_id INT REFERENCES patients(patient_id)
);

CREATE TABLE medical_centers
(
    med_center_id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    doctor_id INT REFERENCES doctors(doctor_id)
);

-- insert diseases
INSERT INTO diseases (name) 
VALUES 
('Diabetes'), 
('Asthma'),
('Hypertension'),
('Influenza'),
('Malaria'),
('Tuberculosis'),
('Alzheimers'),
('Parkinsons'),
('Multiple Sclerosis'),
('Leukemia');

-- insert patients
INSERT INTO patients (full_name)
VALUES 
('John Smith'),
('Emily Johnson'),
('Sarah Davis'),
('Michael Thompson'),
('Olivia Rodriguez'),
('William Lee'),
('Emma Hernandez'),
('Joseph Brown'),
('Sofia Garcia'),
('Daniel Martin'),
('Isabella Anderson'),
('Ethan Nguyen'),
('Mia Perez'),
('James Wilson'),
('Grace Taylor'),
('Benjamin Martinez'),
('Charlotte Jackson'),
('Samuel Davis'),
('Amelia Rodriguez'),
('Alexander Wilson');

-- insert patients_diseases
INSERT INTO patients_diseases (patient_id, disease_id) 
VALUES 
(1, 1), (1, 4), (1, 7), (1, 10),
(2, 2), (2, 5), (2, 8), 
(3, 2), (3, 3), (3, 6), (3, 9),
(4, 1), (4, 3), (4, 5), (4, 7), (4, 9),
(5, 2), (5, 4), (5, 6), (5, 8), (5, 10),
(6, 1), (6, 4), (6, 7),
(7, 2), (7, 5), (7, 8), (7, 10),
(8, 1), (8, 3), (8, 6), (8, 9),
(9, 2), (9, 4),(9, 7),(9, 10),
(10, 3), (10, 5), (10, 8),
(11, 1), (11, 5), (11, 9),
(12, 2), (12, 6), (12, 10),
(13, 1), (13, 3), (13, 7),
(14, 4), (14, 6), (14, 8),
(15, 2), (15, 5), (15, 9),
(16, 1), (16, 4), (16, 10),
(17, 3), (17, 6), (17, 8),
(18, 5), (18, 7), (18, 9),
(19, 2), (19, 4), (19, 7),
(20, 1), (20, 3), (20, 5), (20, 7), (20, 9);

-- insert doctors
INSERT INTO doctors (full_name)
VALUES 
('Dr. Jane Smith'),
('Dr. Matthew Kim'),
('Dr. Rebecca Chen'),
('Dr. David Patel'),
('Dr. Sarah Lee'),
('Dr. Michael Nguyen'),
('Dr. Emily Brown'),
('Dr. Thomas Davis'),
('Dr. Olivia Rodriguez'),
('Dr. William Garcia');

-- Insert appointments
INSERT INTO appointments (doctor_id, patient_id) 
VALUES 
(1, 1), (1, 2),
(2, 3), (2, 4),
(3, 5), (3, 6),
(4, 7), (4, 8),
(5, 9), (5, 10),
(6, 11), (6, 12),
(7, 13), (7, 14),
(8, 15), (8, 16),
(9, 17), (9, 18),
(10, 19), (10, 20);

-- Insert medical centers
INSERT INTO medical_centers (name, doctor_id) 
VALUES 
('ABC Medical Center', 1),
('ABC Medical Center', 2),
('XYZ Medical Center', 3),
('XYZ Medical Center', 4),
('PQR Medical Center', 5),
('PQR Medical Center', 6),
('ABC Medical Center', 7),
('PQR Medical Center', 8),
('XYZ Medical Center', 9),
('ABC Medical Center', 10);