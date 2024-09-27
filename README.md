# Hospital-Database-Design-and-Implementation
## Project Overview 
This repository contains the **Database Design and Implementation** project for **Splendor Infirmary** Patient and Medical Management System, complete by **Splendor Analytics** in September 2024. The system is designed to efficientlt manage hospital data, including patient information, doctor details, medical records, appointments, and department data.

---

## Table of Contents
1. [Introduction](#introduction)
2. [Database Design Process](#database-design-process)
     - [Requirements Gathering](#requirements-gathering)
     - [Conceptual Design](#conceptual-dedsign)
     - [Logical Design](#logical-design)
     - [Physical Design](#physical-design)
3. [Database Schema and Implementation](#database-schema-and-implementation)
   - [Patients Table](#patients-table)
   - [Departments Table](#departments-table)
   - [Medical Records Table](#medical-records-table)
   - [Doctors Table](#doctors-table)
   - [Appointments Table](#appointments-table)
4. [Normalization](#normalization)
   - [First Normal Form](#first-normal-form)
   - [Second Normal Form](#second-normal-form)
   - [Third Normal Form](#third-normal-form)
5. [Triggers and Business Logic](#triggers-and-business-logic)
6. [Justification of Design Choices](#justification-of-design-choices)

---

## Introduction
Splendor Infirmary required a scalable and efficient solution to manage its healthcare operations, including patient registration, appointment scheduling, and medical records management. This system enhances operational efficiency, ensures data integrity, and provides quick access to essential information for medical staff.

---

## Database Design Process
### Requirement Gathering
In collaboration with stakeholders, the following requirements were established:
- Comprehensive details of patients, doctors, and departments.
- Management of medical records (diagnoses, prescriptions, and treatment history).
- Real-time appointment scheduling and tracking.

### Conceptual Design
Using an Entity-Relationship (ER) model, the following entities were defined:
- **Patients**: Personal and contact details.
- **Doctors**: Names, specialties, and availability.
- **Medical Records**: Historical records of diagnoses and medications.
- **Appointments**: Scheduling and status.
- **Departments**: Organizational structure for medical departments.

### Logical Design
The conceptual ER model was translated into structured relational database tables with appropriate relationships. Foreign keys were used to maintain referential integrity.

### Physical Design
The system was implemented using T-SQL on SQL Server. Key features include:
- Triggers for appointment status updates.
- Constraints to ensure data accuracy.
- Optimized queries for performance.

---

## Database Schema and Implementation
### Patients Table
![image](https://github.com/user-attachments/assets/512bdbb1-827c-436e-a518-410d2e8f7a1a)

| Column         | Data Type   | Constraints                   |
|----------------|-------------|-------------------------------|
| PatientId      | INT         | PRIMARY KEY, AUTO-INCREMENT    |
| Prefix         | VARCHAR(10) |                               |
| FirstName      | VARCHAR(50) | NOT NULL                      |
| LastName       | VARCHAR(50) | NOT NULL                      |
| DateOfBirth    | DATE        | NOT NULL                      |
| Insurance      | VARCHAR(50) |                               |
| Gender         | CHAR(1)     | CHECK (Gender IN 'M', 'F', 'O')|
| MaritalStatus  | VARCHAR(20) | CHECK (IN 'Single', 'Married')|
| EmailAddress   | VARCHAR(100)| UNIQUE                        |
| PhoneNumber    | VARCHAR(15) | UNIQUE                        |

### Departments Table

| Column         | Data Type   | Constraints                   |
|----------------|-------------|-------------------------------|
| DepartmentId   | INT         | PRIMARY KEY, AUTO-INCREMENT    |
| DepartmentName | VARCHAR(50) | NOT NULL                      |

### Medical Records Table

| Column          | Data Type   | Constraints                   |
|-----------------|-------------|-------------------------------|
| RecordId        | INT         | PRIMARY KEY, AUTO-INCREMENT    |
| PatientId       | INT         | FOREIGN KEY REFERENCES Patients|
| DepartmentId    | INT         | FOREIGN KEY REFERENCES Departments |
| DiagnosisHistory| TEXT        |                               |
| StartDate       | DATE        |                               |
| EndDate         | DATE        |                               |

### Doctors Table

| Column         | Data Type   | Constraints                   |
|----------------|-------------|-------------------------------|
| DoctorId       | INT         | PRIMARY KEY, AUTO-INCREMENT    |
| FirstName      | VARCHAR(20) |                               |
| Speciality     | VARCHAR(50) |                               |
| DepartmentId   | INT         | FOREIGN KEY REFERENCES Departments|

### Appointments Table

| Column         | Data Type   | Constraints                   |
|----------------|-------------|-------------------------------|
| AppointmentId  | INT         | PRIMARY KEY, AUTO-INCREMENT    |
| DoctorId       | INT         | FOREIGN KEY REFERENCES Doctors |
| PatientId      | INT         | FOREIGN KEY REFERENCES Patients|
| Date           | DATE        | NOT NULL                      |
| Status         | VARCHAR(50) | CHECK (IN 'Scheduled', 'Completed')|

--- 
## Normalization

### First Normal Form (1NF)
- Ensures atomicity of values in each column.

### Second Normal Form (2NF)
- Eliminates partial dependencies by ensuring that non-key attributes depend fully on the primary key.

### Third Normal Form (3NF)
- Eliminates transitive dependencies, ensuring data integrity by linking related tables through foreign keys.

---

## Triggers and Business Logic

A trigger was created to ensure that canceled appointments are rebooked. The trigger is activated after an update operation in the **appointments** table. If an appointment is marked as canceled and not rebooked, the transaction is rolled back, ensuring data integrity.

---

## Justification of Design Choices

- **Separation of Concerns**: Each table manages specific data, reducing redundancy.
- **Data Integrity**: Foreign keys and constraints ensure consistent and valid data.
- **Scalability**: The system can scale with the hospital’s growth.
- **Business Rule Enforcement**: Triggers maintain business logic, ensuring smooth operations.

---

## Conclusion

The Splendor Infirmary Database system is a robust and scalable solution designed to improve operational efficiency and healthcare quality, providing healthcare providers with quick access to essential data while ensuring patient data integrity.
