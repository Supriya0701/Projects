Project 2  ********

*****  Health Analytics
Create database _;
use Health_Records;
-- Create tables

-- Patients table to store patient information
CREATE TABLE Patients (
    PatientID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DateOfBirth DATE,
    Gender VARCHAR(10),
    ContactNumber VARCHAR(15),
    Address VARCHAR(100)
);
insert into Patients values
(1,'Hrushi','Malhotra','1998-01-02','Male','9876543212','Dombivali'),
(2,'Kadmbari','Rane','2016-09-10','Female','8975758431','NewDelhi'),
(3,'Rachana','Tiwari','2012-09-08','Female','9850660773','Mumbai'),
(4,'Tejas','Limaye','1990-09-23','Male','9158987612','Pune'),
(5,'Pooja','Arora','1987-01-12','Female','9675342323','Nashik'),
(6,'Vina','Deshmukh','1978-01-22','Female','9854121234','Sangali'),
(7,'Jotsna','Shinde','1993-02-18','Female','9675341278','Aurangabad'),
(8,'Archana','Kaspate','1980-03-21','Female','8984323214','Hydrabad'),
(9,'Ramesh','Mhatre','2001-06-11','Male','9191875634','Usmanabad'),
(10,'Jiza','Marathe','2002-09-07','Female','9884567832','New-Mumbai');

-- Health Records table to store patient health records
CREATE TABLE HealthRecords (
    RecordID INT PRIMARY KEY,
    PatientID INT,
    RecordDate DATE,
    Diagnosis VARCHAR(100),
    Prescription TEXT,
   
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID)
);
insert into HealthRecords values
(101,1,'2023-01-12','Skinrahshes,Tiredness, fever,joint,Pain','nonsteroidal anti-inflammatory drugs'),
(102,2,'2023-02-11',' upper abdominal pain ','Asparaginase,Aspirin'),
(103,3,'2023-03-12','Extreme thirst,Increased hunger,Blurred version','lifestyle changes such as diet control, medication or insulin'),
(104,4,'2023-04-14',' internal injury or fracture',' Acetaminophen (Tylenol), and non-steroidal anti-inflammatory medications (NSAIDs'),
(105,5,'2023-05-15',' upper abdominal pain ','Asparaginase,Aspirin'),
(106,6,'2023-06-16','Brain Tumors','cancer drugs approved by the FDA for use in brain tumors'),
(107,7,'2023-07-17',' continuous fatigue, uncontrolled bleeding','Nonsteroidal anti-inflammatory drugs (NSAIDs)'),
(108,8,'2023-08-18','heart related issues and disorders','tatins (HMG-CoA reductase inhibitors)Angiotensin-converting enzyme(ACE) inhibitors'),
(109,9,'2023-09-19',' detect infection, arthritis problems, kidney trouble','acetaminophen (Tylenol), which is an analgesic, not an NSAID'),
(110,10,'2023-10-20','hypothyroidism','T3 and T4, T4 is most commonly prescribed to treat hypothyroidism');

-- Vital Signs table to store patient vital signs
CREATE TABLE VitalSigns (
    VitalSignID INT PRIMARY KEY,
    PatientID INT,
    RecordID INT,
    HeartRate INT,
    BloodPressure VARCHAR(20),
    Temperature DECIMAL(5, 2),
    RespiratoryRate INT,
   FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (RecordID) REFERENCES HealthRecords(RecordID)
);
insert into VitalSigns values
(501,1,101,74,92,97.6,40),
(502,2,102,75,93,98.5,35),
(503,3,103,71,94,95.5,36),
(504,4,104,73,90,94.7,41),
(505,5,105,74,93,98.6,60),
(506,5,105,80,90,99.0,60),
(507,6,106,82,91,100.0,55),
(508,7,107,84,94,99.0,56),
(509,8,109,86,94,98.6,59),
(510,10,110,89,90,98.7,50);

-- Lab Results table to store patient lab results
CREATE TABLE LabResults(
    LabResultID INT PRIMARY KEY,
    PatientID INT,
    RecordID INT,
    TestName VARCHAR(50),
    ResultValue DECIMAL(10, 2),
    Units VARCHAR(20),
    ReferenceRange VARCHAR(50),
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (RecordID) REFERENCES HealthRecords(RecordID)
);
insert into LabResults values
(1001,1,101,'ANA TEST',1.40,1,'1 to 5'),
(1002,2,102,'Amylase Test',22.30,22, '30 to 110'),
(1003,3,103,'Blood Sugar test',77.60,77,'70 to 140'),
(1004,4,104,'CT Scans TEST', 22.30,22,'110 to 130'),
(1005,5,105,'MRI SCAN TEST', 34.40,34,'30 to 80'),
(1006,6,106,'PET SCAN',23.90,23,'20 to 180'),
(1007,7,107,'CBC TEST',45.60,45,'40 to 70'),
(1008,8,108,'Hemoglobin A1C',12.9,12,'7 to 14'),
(1009,9,109,'CRP test',50.80,50,'40 to 100'),
(1010,10,110,'Thyroid Function test',43.34,23,'20 to 40');


-- Appointments table to store patient appointments
  CREATE TABLE Appointments (
    AppointmentID INT PRIMARY KEY,
    PatientID INT,
    AppointmentDate DATE,
    DoctorID INT,
    Notes TEXT,
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctor(DoctorID)
);
insert into Appointments values
(301,1,'2023-12-28',2001,'Please arrive 10 minutes early'),
(302,2,'2023-11-28',2002,' bring your insurance card.'),
(303,3,'2023-12-13',2001,'Please call before you reach here'),
(304,4,'2024-01-12',2004,'Please come with last Priscription'),
(305,5,'2024-01-22',2005,'Please call before you reach here'),
(306,6,'2024-02-02',2006,' Please come At Evening'),
(307,7,'2024-02-12',2002, 'Please arrive 10 minutes early'),
(308,8,'2024-02-23',2008,'Please come only at morning'),
(309,9,'2024-03-01',2003,'Please come At Evening' ),
(310,10,'2024-03-12',2003,'Please come At Afternoon');

 
-- Doctors table to store doctor information
CREATE TABLE Doctors(
    DoctorID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Specialization VARCHAR(50),
    ContactNumber VARCHAR(15),
    Address VARCHAR(100)
);
insert into Doctors values
(2001,'Dr.Lalit','Deshmukh','Heart Specialist','9850345567','Pune'),
(2002,'Dr.Akshay','Rane','Endocrinologists','8975753132','Mumbai'),
(2003,'Dr.Rutika','Ohvale','immunologist','9675758712','Nashik'),
(2004,'Dr.Komal','Karale', 'Pancreatic specialist','8475689023','Pune'),
(2005,'Dr.Akshada','Yewale','Diabetologist','9870642334','Nashik'),
(2006,'Dr.Harshad','Tiwari', 'Radiologists ','8976346712','Pune'),
(2007,'Dr.Om','Sahane','Cardiologist','8976456712','Mumbai'),
(2008,'Dr.Mohan','Mokate','Radiologists ','9875893412','Pune'),
(2009,'Dr.Nilima','Lokare','Rheumatologists' ,'8984983232','Mumbai'),
(2010,'Dr.Yogesh','Mhatre','Radiologists ','9158888234','Pune');

 --Indexes for performance optimization
CREATE INDEX idx_patient_dob ON Patients (DateOfBirth);
CREATE INDEX idx_health_record_date ON HealthRecords (RecordDate);
CREATE INDEX idx_vital_signs_date ON VitalSigns (RecordID, HeartRate, BloodPressure, Temperature, RespiratoryRate);
CREATE INDEX idx_lab_results_date ON LabResults (RecordID, TestName, ResultValue, Units);
CREATE INDEX idx_appointment_date ON Appointments (AppointmentDate);


--1. Retrieve all patient information.
select*from Patients; 

--2. Get the names and addresses of patients
select FirstName,LastName,Address
from Patients;

--3. Find the number of health records for each patient
select PatientID,count(RecordID)
from HealthRecords 
group by PatientID;

--4. List patients with vital signs recorded.
select PatientID,Heartrate,BloodPressure,RespiratoryRate
from  vitalSigns;  

--5. Get the diagnosis and prescriptions for each health record.
select P.FirstName,P.LastName,H.Diagnosis,H.Prescription
from Patients P inner join HealthRecords  H
on P.PatientID=H.PatientID


--6. Find the average temperature recorded for all patients.
select PatientID,AVG(Temperature) as avg_temp
from VitalSigns
group by PatientID



--7. Retrieve the number of lab results for each patient.
select PatientID,count(LabResultID)as number_of_LabResults
from LabResults
group by PatientID;

--8. List all appointments along with the corresponding doctor information.
select A.PatientID,A.AppointmentDate,D.FirstName,D.LastName,D.Specialization
from Appointments A left join Doctors D
on A.DoctorID=D.DoctorID

--9. Find patients with appointments on a specific date.
select P.FirstName,P.LastName,A.AppointmentDate
from Patients P inner join Appointments A
on P.PatientID=A.PatientID
where AppointmentDate='2024-02-12';

select P.FirstName,P.LastName,A.AppointmentDate
from Patients P inner join Appointments  A
On P.PatientID=A.PatientID
where AppointmentDate='2024-02-12';

select P.FirstName,P.LastName,A.AppointmentDate
from Patients P inner join Appointments A
on P.PatientID=A.PatientID
where AppointmentDate='2024-02-12';


--10. Get the count of male and female  patients
select count(PatientID)
from Patients
where Gender ='Male'

select  * from Patients

select count(PatientID)
from Patients
where Gender='Female';

--11. Retrieve the doctor with the highest specialization.

SELECT *
FROM Doctors 
WHERE Specialization ='Heart Specialist'
   


--12. Find the most common diagnosis in health records.
SELECT RecordID, COUNT(Diagnosis) AS common_Diagnosis
FROM HealthRecords
GROUP BY RecordID
ORDER BY common_Diagnosis DESC


--13. Get the names and specializations of all doctors.
select FirstName,LastName,Specialization
from Doctors

14. Find patients who have not recorded any vital signs.

--15. Retrieve the most recent health record for each patient.
select PatientID,RecordDate
from HealthRecords
where RecordDate between '2023-12-01'and '2023-12-13'



--16. List the appointments for a specific doctor.
select PatientID,AppointmentDate,DoctorID  
from Appointments
where DoctorID=2001


--17. Find patients with appointments in the future. 
select PatientID,AppointmentDate
from Appointments 
where AppointmentDate >'2024-01-01'

--18. Retrieve patients who had abnormal  VitalSigns
select HeartRate,BloodPressure,Temperature,RespiratoryRate
from VitalSigns
where Temperature=100 ;  

--19. Get the average heart rate for all patients
select PatientID,AVG(HeartRate) as AVG_HeartRate
from VitalSigns
group by PatientID;

--20. Find the oldest patient in the database.
select FirstName,LastName,DateOfBirth
from Patients 
where DateOfBirth<'1980-01-01'


--21. Retrieve lab results with values outside the reference range.
select LabResultID,PatientID,ReferenceRange
from LabResults
where ReferenceRange=20-40;
  

--22. Get the count of health records for each diagnosis.
select Diagnosis,count(RecordID) as Count_OF_records
from HealthRecords
group by Diagnosis

--23. Find the doctor with the most appointments.
select A.DoctorID,A.AppointmentDate,D.FirstName,D.LastName
from Appointments A left join Doctors D
on A.DoctorID=D.DoctorID

--24. Retrieve patients with a specific diagnosis.
select P.FirstName,P.LastName,H.Diagnosis
from Patients P join  HealthRecords H
on P.PatientID=H.PatientID
where Diagnosis=' upper abdominal pain ';

--25. List the doctors and their contact numbers.
select FirstName,LastName,ContactNumber
from Doctors;

--   26. Find patients who had  Appointments with a specific doctor.
select A.PatientID,D.FirstName,D.LastName
from Appointments A join Doctors D
on A.DoctorID=D.DoctorID
where FirstName='Akshay'

--27. Retrieve the appointment notes for a specific patient.
select PatientID,Notes
from Appointments       
where PatientID=7

--28. Get the patients with a specific blood pressure range.
select PatientID,BloodPressure
from VitalSigns
where BloodPressure between 90 and 100 

--29. Find the total number of health records in the database.
select sum(RecordID) as total_number
from HealthRecords

--30. Retrieve lab results ordered by test name.
select TestName,ResultValue
from LabResults
order by TestName

--31. List the patients who had an appointment with a specific doctor
select A.PatientID,A.AppointmentDate,FirstName,D.LastName
from Appointments A join Doctors D
on A.DoctorID=D.DoctorID
where FirstName='Dr.Lalit'

--32. Find patients with a specific age range.
select FirstName,LastName,DateOfBirth
from Patients
where DateOfBirth between '1990-01-01'and '2000-01-01';


--33. Retrieve the average temperature recorded by gender.
select avg(V.Temperature),P.Gender
from VitalSigns V
inner join Patients P 
ON V.PatientID=P.PatientID
Group by Gender;

--34. List doctors with appointments on a specific date.
select D.FirstName,D.LastName,A.AppointmentDate   
From Appointments A join Doctors D
on A.DoctorID=D.DoctorID
where AppointmentDate='2024-02-02'

--35. Get the patient and doctor information for each appointment.
select P.FirstName,P.LastName,A.AppointmentDate,D.FirstName,D.LastName
from Patients P join Appointments A
on P.PatientID=A.PatientID
join Doctors D
on A.DoctorID=D.DoctorID

--36. Find the health records with a specific diagnosis
select RecordID,Diagnosis,RecordDate
 from HealthRecords
where Diagnosis= 'Brain Tumors';

--37. Retrieve appointments scheduled for the next week.
select AppointmentID,AppointmentDate
from Appointments
where AppointmentDate between '2023-12-17'and'2023-12-30'

--38. List patients with appointments scheduled today.
select PatientID, AppointmentID,AppointmentDate
from Appointments
where AppointmentDate='2023-12-13'


--39. Find the patients with the highest and lowest heart rates.
select P.FirstName,P.LastName,V.HeartRate
from VitalSigns V Join Patients P
on P.PatientID=V.PatientID
where HeartRate>85
or HeartRate<75     

--40. Retrieve lab results ordered by the result value.  
select TestName,ResultValue,Units
from LabResults
order by ResultValue

--41. Get the count of patients for each doctor.
select D.DoctorID,D.FirstName,D.LastName, count(P.PatientID) as Total_Patients
from Doctors D join Patients P
on D.DoctorID=P.PatientID
group by D.DoctorID

--42. Find Doctors with a specific specialization.
select FirstName,LastName,Specialization
from Doctors
where Specialization ='Endocrinologists'

--43. Retrieve patients with lab results outside the normal range
select PatientID, ResultValue
from LabResults
WHERE ResultValue>70

--44. List doctors with appointments scheduled for a specific date.
select D.FirstName,D.LastName,A.AppointmentID,A.AppointmentDate
from Doctors D join Appointments A
on D.DoctorID=A.DoctorID
where  AppointmentDate='2023-12-28';

--45. Find the patients who had a specific test in lab results.
select PatientID,TestName
from LabResults
where TestName='ANA Test';

46. Retrieve the appointment date and time for a specific patient.
--47. List doctors with appointments in the past month.
select D.FirstName,D.LastName,A.AppointmentDate
from Appointments A left join Doctors D
on A.DoctorID=D.DoctorID
where AppointmentDate between '2023-11-01'and'2023-11-30';

--48. Find patients with a specific prescription.
SELECT * FROM HealthRecords 
where [Prescription] like'nonsteroidal anti-inflammatory drugs';

--49. Retrieve the appointment notes for a specific doctor.
select D.FirstName,D.LastName,A.Notes
from Doctors D Left join Appointments A
on D.DoctorID=A.DoctorID
where FirstName='Dr.Harshad';

--50. List the patients and doctors for all appointments.
select P.FirstName as PatientFirstName,P.LastName as PatientLastName,A.AppointmentDate,D.FirstName,D.LastName
from Patients P  join Appointments A
on P.PatientID=A.PatientID
  join  Doctors D
on A.DoctorID=D.DoctorID;

                  

Joins:
1. Retrieve a list of patients with their corresponding doctor's name.
2. List all health records with patient names and their appointment dates.
3. Find patients who have appointments with a specific doctor, including 
appointment details.
4. Get the total number of appointments for each doctor along with their
specialization.
5. Retrieve the count of lab results for patients who had appointments on
a specific date.

Stored Procedures:
11. Create a stored procedure to insert a new patient into the database.
12. Implement a stored procedure to update the appointment date for a specific
patient.
13. Write a stored procedure to calculate and return the average temperature for a
given gender.
14. Create a stored procedure to retrieve appointment details for a specific doctor.
15. Implement a stored procedure to delete health records for patients with a
specific diagnosis.

