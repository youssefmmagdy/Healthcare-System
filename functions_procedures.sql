--4.1.a
create procedure PatientRegister 
(@patient_id int,
@patient_name varchar(20),
@ehr varchar(30),
@contact varchar(30),
@allergies varchar(30),
@diseases varchar(30),
@vaccines varchar(30),
@drugs varchar(30),
@exam_result varchar(30),
@password varchar(20),
@nurse_id int,
@ins_company varchar(20),
@nurse_id int
) as
insert into Patient values(@patient_id,@patient_name,
@ehr,
@contact,
@allergies,
@diseases,
@vaccines,
@drugs,
@exam_result,
@password,
@ins_company,
@nurse_id);
go--to seperate batches
--4.1.b
CREATE PROCEDURE DoctorRegister (
    @doctor_id INT,
    @working_hours INT,
    @working_days INT,
    @doctor_name VARCHAR(15),
    @specialization VARCHAR(20),
    @hospital_name VARCHAR(20),
    @password varchar(20)
)
AS
BEGIN
    INSERT INTO Doctor 
    VALUES (
        @doctor_id,
        @working_hours,
        @working_days,
        @doctor_name,
        @specialization,
        @hospital_name,
        @password
    );
END;
go
--4.1.c
CREATE PROCEDURE PharmacistRegister (
    @ph_id int,
    @pharmacy_name varchar(15),
    @startDate date,
    @password varchar(20),
    @pharmacist_name varchar(20)
)
AS
BEGIN
    INSERT INTO Pharmacist
    VALUES (
        @ph_id,
        @ph_name,
        @startDate,
        @password,
        @pharmacist_name
    );
END;
go
--4.1.d
CREATE PROCEDURE NurseRegister (
    @nurse_id int,
    @first_name varchar(15),
    @middle_name varchar(15),
    @last_name varchar(15),
    @nurst_shift varchar(15),
    @hospital_name varchar(10),
    @password varchar(20)
)
AS
BEGIN
    INSERT INTO Nurse
    VALUES (
        @nurse_id,
        @first_name,
        @middle_name,
        @last_name,
        @nurst_shift,
        @hospital_name,
        @passwordw
    );
END;
go
--4.2.a
create function userLogin (@id int,@password varchar(20))
returns bit as
begin
declare @res bit
if(exists (select userId,pass_word from User_table 
where userId = @id and @password = pass_word))set @res = 1
else set @res = 0
return @res
end;

go
--4.2.b
CREATE PROCEDURE addMobile (
	@ID int, 
	@mobile_number varchar(20) 
)
AS 
BEGIN
	INSERT INTO Doctor_Numbers
	VALUES(
		@ID , 
		@mobile_number 
		);
END;
go
--4.3.a
CREATE PROCEDURE PatientList
AS
BEGIN
    SELECT * FROM Patient;
END;
go
--4.3.b
CREATE PROCEDURE DoctorsList
AS
BEGIN
    SELECT * FROM Doctor;
END;
go
--4.3.c
CREATE PROCEDURE PharmacistList
AS
BEGIN
    SELECT * FROM Pharmacist;
END;
go
--4.3.d
create function AdminViewPatientProfile (@patientId int) returns table as
RETURN (
    SELECT *
    FROM Patient p
    where @patientId = p.patient_id
);
go
--4.3.e
create function AdminAddPatientInfo (@patientId int,
@ehr varchar(30),
@contact varchar(30),
@allergies varchar(30),
@diseases varchar(30),
@vaccines varchar(30),
@drugs varchar(30),
@exam_result varchar(30),
@nurse_id int,
@ins_company varchar(20)
) returns bit as
--insert a new entry in table patient,I assumed patient's info contains no patient_id
begin
insert into Patient values(@patient_id,
@ehr,
@contact,
@allergies,
@diseases,
@vaccines,
@drugs,
@exam_result,
@nurse_id,
@ins_company
);
return 1;
end;
go
--4.3.f
create function AdminUpdatePatientInfo (@patientId int,
@ehr varchar(30),
@contact varchar(30),
@allergies varchar(30),
@diseases varchar(30),
@vaccines varchar(30),
@drugs varchar(30),
@exam_result varchar(30),
@nurse_id int,
@ins_company varchar(20)
) returns bit as
--insert a new entry in table patient,I assumed patient's info contains no patient_id
begin
update Patient set ehr = @ehr,
contact = @contact,allergies=@allergies,diseases=@diseases,
vaccines=@vaccines,drugs=@drugs,
exam_result=@exam_result,nurse_id=@nurse_id,ins_company=@ins_company
where patient_id = @patient_id
return 1;
end;
go
--4.3.g
CREATE PROCEDURE AdminViewPatientAndHospitalPerDoc
    @doctor_name varchar(15),
    @PatientName varchar(20),
    @hospital_name varchar(20)
AS
BEGIN
    SELECT D.doctor_name, P.patient_name, D.hospital_name    
    FROM Appointment A
    INNER JOIN Doctor D ON A.doctor_id = D.doctor_id
    INNER JOIN Patient P ON A.patient_id = P.patient_id
    WHERE P.patient_name = @PatientName AND D.doctor_name = @doctor_name AND D.hospital_name = @hospital_name
    GROUP BY D.doctor_id ;
END;go
--4.3.h
CREATE PROCEDURE AdminViewAllPatientsAndMeds
    @PatientName varchar(20),
    @medication_type varchar(20)
AS
BEGIN
    SELECT P.patient_name, M.medication_type    
    FROM Takes_Medication T
    INNER JOIN Patient P ON T.patient_id = P.patient_id
    INNER JOIN Medication M ON M.medication_id = T.medication_id
    WHERE P.patient_name = @PatientName AND M.medication_type = @medication_type
    GROUP BY patient_id ;
END;
go
--4.3.i
CREATE PROCEDURE AdminViewPatientsAndMeds
    @PatientID INT
AS
BEGIN
    SELECT P.patient_name, M.mediaction_type
    FROM Patient AS P
    INNER JOIN Takes_Medication AS TM ON P.patient_id = TM.patient_id
    INNER JOIN Medication AS M ON TM.medication_id = M.medication_id
    WHERE P.patient_id = @PatientID;
END;
go
--4.3.j

CREATE PROCEDURE AdminViewTreatmentPerDocAndPatient
     @TreatmentID INT
AS
BEGIN
    SELECT  treatment_id
	FROM  Writes_Treatmnet
	WHERE treatment_id = @TreatmentID
END;
go
--4.3.k
CREATE PROCEDURE AdminViewLabPerDocAndPatient
     @LabTest INT
AS
BEGIN
    SELECT  labtest_id
	FROM  Labtest
	WHERE labtest_id = @LabTest
END;
go
--4.3.l
CREATE PROCEDURE AdminViewPresPerDocAndPatient
     @prescription_id INT
AS
BEGIN
    SELECT  prescription_id
	FROM  Writes_Prescription
	WHERE prescription_id = @prescription_id
END;
go
--4.3.m
CREATE PROCEDURE AdminViewAllPatientsAndMeds
     @ph_name varchar(20) , @prescription_id varchar(20)
AS
BEGIN
    SELECT  PH.ph_name , PCP.prescription_id
	FROM  Pharmacist PH INNER JOIN Pharmacist_checks_Prescription PCP ON PH.ph_id = PH.ph_id	  
	WHERE PH.ph_name = @ph_name and PCP.prescription_id = @prescription_id
END;
go
--4.3.n
create function AdminViewPharmacistProfile (@PharmacistID int) returns table as
return(select * from Pharmacist ph where ph.ph_id = @PharmacistID);
go

--4.3.o
create function AdminViewNurse() returns table as
return(
select n.first_name,n.middle_name,n.last_name,n.nurse_shift,n.hospital_name,p.patient_name
from Nurse n inner join Patient p on n.nurse_id=p.nurse_id);
go
--4.3.p
create function AdminViewHospital() returns table as
return(
select h.hospital_name,h.hospital_location,h.email,p.patient_name
from Hospital h inner join Hospital_Manages hm 
on h.hospital_name = hm.hospital_name inner join Patient p
on hm.patient_id = p.patient_id
);
go
--4.3.q
CREATE PROCEDURE AdminViewAmb
     @service_type varchar(20) , @hospital_name varchar(20)
AS
BEGIN
    SELECT  ES.service_type , SC.hospital_name
	FROM  Services_Call SC INNER JOIN Emergency_Services ES ON SC.service_id = ES.service_id	  
	WHERE ES.service_type = @service_type and SC.hospital_name = @hospital_name
END;

go
--4.3.r
CREATE PROCEDURE AdminViewCall
     @service_type varchar(20) , @call_id INT
AS
BEGIN
    SELECT  ES.service_type , CC.call_id
	FROM  Call_Center CC INNER JOIN Emergency_Services ES ON CC.service_id = ES.service_id	  
	WHERE ES.service_type = @service_type and CC.call_id = @call_id
END;

go
--4.3.s
CREATE PROCEDURE AdminViewCon
     @ins_company varchar(20) , @hospital_name int
AS
BEGIN
    SELECT  ins_company , hospital_name 
	FROM  Insurance_signs
	WHERE ins_company = @ins_company and hospital_name = @hospital_name
END;
go
--4.3.t
CREATE FUNCTION AdminViewCover (@TreatmentID INT)
RETURNS BIT
AS
BEGIN
    DECLARE @Covered BIT

    SELECT @Covered = covered
    FROM Treatment
    WHERE treatment_id = @TreatmentID;

    RETURN @Covered;
END;

go
--4.4.a
create procedure checkHospitalsAndDoctors as
select hospital_name,doctor_name from Doctor group by hospital_name;
go
--4.4.b
create procedure checkDoctorsOfEachHospital (@hospital_name varchar(10)) as
select hospital_name,doctor_name from Doctor d
where d.hospital_name = @hospital_name group by d.hospital_name;
go
--4.4.c
create function patientsMakeAppointment (@doctor_id int,@patient_id int) returns bit as
begin
declare @res bit
if(exists(select doctor_id,patient_id from Appointment a 
where @doctor_id = a.doctor_id and @patient_id=a.patient_id))set @res = 1 else set @res=0
return @res
end
go
--4.4.d
create proc viewMyProfile @PatientId int output as
select * from Patient p where p.patient_id = @PatientId;
go
--4.4.e
create procedure editMyProfile (@patient_id int,
@ehr varchar(30),
@contact varchar(30),
@allergies varchar(30),
@diseases varchar(30),
@vaccines varchar(30),
@drugs varchar(30),
@exam_result varchar(30),
@nurse_id int,
@ins_company varchar(20)) as
if not (@ehr is null) update Patient set ehr = @ehr;
if not (@contact is null) update Patient set contact = @contact;
if not (@allergies is null) update Patient set allergies = @allergies;
if not (@diseases is null) update Patient set diseases = @diseases;
if not (@vaccines is null) update Patient set vaccines = @vaccines;
if not (@drugs is null) update Patient set drugs = @drugs;
if not (@exam_result is null) update Patient set exam_result = @exam_result;
if not (@nurse_id is null) update Patient set nurse_id = @nurse_id;
if not (@ins_company is null) update Patient set ins_company = @ins_company;

go
--4.5.a
CREATE PROCEDURE DocViewHis
    @PatientID INT
AS
BEGIN
    SELECT * FROM Patient P
    WHERE P.patient_id = @PatientID
END;

go
--4.5.b
CREATE FUNCTION DoctorReqLab (@DoctorID INT,@PatientID INT,@LabtestID INT)
RETURNS BIT as BEGIN

    DECLARE @Result BIT;
    IF EXISTS (
        SELECT Doctor D, Patient P, Labtest L 
        WHERE (D.doctor_id = @DoctorID AND P.patient_id = @PatientID 
            AND L.labtest_id = @LabtestID)) BEGIN SET @Result = 1; END
    ELSE 
        BEGIN SET @Result = 0; END
   RETURN @Result;
END;
go
--4.5.c
CREATE FUNCTION DocWritePres
    (@DoctorID INT,
    @PatientID INT,
    @Date DATE)

RETURNS BIT
AS 
BEGIN

    DECLARE @Result BIT;
    IF EXISTS (
        SELECT 
            Prescription P
        WHERE 
            (P.doctor_id = @DoctorID 
            AND 
            P.patient_id = @PatientID
            AND
            P.prescription_date = @Date)
    ) 
    BEGIN SET @Result = 1; END
    ELSE 
        BEGIN SET @Result = 0; END

    RETURN @Result;
END;
go
--4.6.a
create proc CheckPres @PharmacistID INT, @DoctorID INT, @PatientID INT,@Date Date as
select wp.doctor_id,wp.prescription_date from
Writes_Prescription wp inner join Pharmacist_checks pc 
on wp.prescription_date = pc.prescription_date and wp.doctor_id = pc.doctor_id
go
--4.6.b
create proc PharViewProfile @PharmacistID int as
select * from Pharmacist ph where ph.pharmacist_id=@PharmacistID
--4.6.c
go
create procedure UpdatePharProfile
@pharmacistID int,
@pharmacyName varchar(15),
@startDate date,
@password varchar(20),
@pharmacistName varchar(20) as
if not (@pharmacistID is null) update Pharmacist set ph_id = @pharmacistID;
if not (@pharmacyName is null) update Pharmacist set pharmacy_name = @pharmacyName;
if not (@startDate is null) update Pharmacist set startDate = @startDate;
if not (@password is null) update Pharmacist set pass_word = @password;
if not (@pharmacistName is null) update Pharmacist set pharmacist_name = @pharmacistName;
