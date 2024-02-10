

/*
create table User_table(
userId int,
CONSTRAINT pk primary key(userId),
user_type varchar(15),
pass_word varchar(20)
);


create table Pharmacist(
ph_id int,
CONSTRAINT pk_pharmacist primary key(ph_id),
pharmacy_name varchar(15),
startDate date,
pass_word varchar(20),
pharmacist_name varchar(20),
years_exp AS (YEAR(CURRENT_TIMESTAMP) - YEAR(startDate)),
CONSTRAINT fk_pharmacist foreign key(ph_id) references User_table(userId) on update cascade on delete cascade
);*/


create table Hospital(
hospital_name varchar(10),
CONSTRAINT pk_hospital primary key(hospital_name),
hospital_location varchar(20),
email varchar(30),
);

create table Nurse(
nurse_id int,
CONSTRAINT pk_nurse primary key(nurse_id),
first_name varchar(15),
middle_name varchar(15),
last_name varchar(15),
nurst_shift varchar(15),
hospital_name varchar(10),
pass_word varchar(20),
CONSTRAINT fk_nurse foreign key(nurse_id) references User_table(userId) on update cascade on delete cascade,
CONSTRAINT fk_hospital_nurse foreign key(hospital_name) references Hospital(hospital_name) on update cascade on delete cascade
);

create table Insurance_Company(
ins_name varchar(20),
CONSTRAINT pk_ins primary key(ins_name)
);

create table Doctor(
doctor_id int,
CONSTRAINT pk_doctor primary key(doctor_id),
working_hours int,
working_days int,
doctor_name varchar(15),
specialization varchar(20),
hospital_name varchar(10),
pass_word varchar(20),
CONSTRAINT fk_hospital_doctor foreign key(hospital_name) references Hospital(hospital_name) on update cascade on delete cascade,
CONSTRAINT fk_user_doctor foreign key(doctor_id) references User_table(userId) on update cascade on delete cascade
);
create table Doctor_Numbers(
doctor_id int,
number varchar(20),
CONSTRAINT pk_doctor_numbers primary key(doctor_id,number),
CONSTRAINT fk_user_doctor foreign key(doctor_id) references User_table(userId) on update cascade on delete cascade
);

create table Patient(
patient_id int,
patient_name varchar(20),
ehr varchar(30),
contact varchar(30),
allergies varchar(30),
diseases varchar(30),
vaccines varchar(30),
drugs varchar(30),
exam_result varchar(30),
pass_word varchar(20),
ins_company varchar(20),
nurse_id int,
CONSTRAINT pk_patient primary key(patient_id),
CONSTRAINT fk_user_patient foreign key(patient_id) references User_table(userId) on update cascade on delete cascade,
CONSTRAINT fk_nurse_patient foreign key(nurse_id) references Nurse(nurse_id) on update cascade on delete cascade,
CONSTRAINT fk_ins_patient foreign key(ins_company) references Insurance_Company(ins_name) on update cascade on delete cascade,

);
create table Prescription(
doctor_id int,
prescription_date date,
CONSTRAINT pk_prescription primary key(doctor_id,prescription_date),
CONSTRAINT fk_doctor_prescription foreign key(doctor_id) references Doctor(doctor_id) on update cascade on delete cascade
);

create table Labtest(
labtest_id int,
patient_id int,
CONSTRAINT pk_labtest primary key(labtest_id,patient_id),
CONSTRAINT fk_patient_labtest foreign key(patient_id) references Patient(patient_id) on update cascade on delete cascade,
);

go
create function check_price(@price int) returns bit as
begin 
declare @res bit
if @price < 200 set @res = 0 else set @res = 1
return @res
end;
go
create table Treatment(
treatment_id int,
price int,
covered bit default (dbo.check_price(price)),
patient_id int,
ins_name varchar(20),
CONSTRAINT pk_teatment primary key(treatment_id),
CONSTRAINT fk_patient_treatment foreign key(patient_id) references Patient(patient_id) on update cascade on delete cascade,
CONSTRAINT fk_ins_treatment foreign key(ins_company) references Insurance_Company(ins_name) on update cascade on delete cascade,
);

create table Medication(
medication_id int,
medication_type varchar(20),
CONSTRAINT pk_medication primary key(medication_id),
CONSTRAINT fk_treatment_medication foreign key(medication_id) references Treatment(treatment_id) on update cascade on delete cascade,
);
create table Surgery(
surgery_id int,
CONSTRAINT pk_surgery primary key(surgery_id),
CONSTRAINT fk_treatment_surgery foreign key(surgery_id) references Treatment(treatment_id) on update cascade on delete cascade
);

create table Emergency_Services(
service_id int,
CONSTRAINT pk_emrgencyServices primary key(service_id),
service_type varchar(20)
);
create table Call_Center(
service_id int,
call_id int,
CONSTRAINT pk_callCenter primary key(service_id,call_id),
CONSTRAINT fk_emrgencyServices_callCenter foreign key(service_id) references Emergency_Services(service_id) on update cascade on delete cascade
);

create table Diet_exercise(
patient_id int,
medication_id int,
CONSTRAINT pk_diet primary key(patient_id,medication_id),
CONSTRAINT fk_patient_diet foreign key(patient_id) references Patient(patient_id) on update cascade on delete cascade,
CONSTRAINT fk_mediaction_diet foreign key(medication_id) references Medication(medication_id) on update cascade on delete cascade,
);
create table Takes_Medication(
patient_id int,
medication_id int,
CONSTRAINT pk_patientAndTreatment primary key(patient_id,treatment_id),
CONSTRAINT fk_patient_takesMedication foreign key(patient_id) references Patient(patient_id) on update cascade on delete cascade,
CONSTRAINT fk_mediaction_takesMediaction foreign key(medication_id) references Medication(medication_id) on update cascade on delete cascade,
);
create table Appointment(
patient_id int,
doctor_id int,
CONSTRAINT pk_patientAndDoctor primary key(patient_id,doctor_id),
CONSTRAINT fk_patient_appointment foreign key(patient_id) references Patient(patient_id) on update cascade on delete cascade,
CONSTRAINT fk_doctor_appointment foreign key(doctor_id) references Doctor(doctor_id) on update cascade on delete cascade,

);
create table Listen_examine(
patient_id int,
doctor_id int,
CONSTRAINT pk_listen primary key(patient_id,doctor_id),
CONSTRAINT fk_patient_listen foreign key(patient_id) references Patient(patient_id) on update cascade on delete cascade,
CONSTRAINT fk_doctor_listen foreign key(doctor_id) references Doctor(doctor_id) on update cascade on delete cascade,

);
create table Diagnosis(
patient_id int,
doctor_id int,
CONSTRAINT pk_diagnosis primary key(patient_id,doctor_id),
CONSTRAINT fk1_patient_diagnosis foreign key(patient_id) references Patient(patient_id) on update cascade on delete cascade,
CONSTRAINT fk2_doctor_diagnosis foreign key(doctor_id) references Doctor(doctor_id) on update cascade on delete cascade,
);
create table View_History(
patient_id int,
doctor_id int,
CONSTRAINT pk_view primary key(patient_id,doctor_id),
CONSTRAINT fk_patient_view foreign key(patient_id) references Patient(patient_id) on update cascade on delete cascade,
CONSTRAINT fk_doctor_view foreign key(doctor_id) references Doctor(doctor_id) on update cascade on delete cascade,
);
create table Checks(
patient_id int,
doctor_id int,
hospital_name varchar(10),
CONSTRAINT pk_checks primary key(patient_id,doctor_id,hospital_name),
CONSTRAINT fk_patient_checks foreign key(patient_id) references Patient(patient_id) on update cascade on delete cascade,
CONSTRAINT fk_doctor_checks foreign key(doctor_id) references Doctor(doctor_id) on update cascade on delete cascade,
CONSTRAINT fk_hospital_checks foreign key(hospital_name) references Hospital(hospital_name) on update cascade on delete cascade,
);

create table Pharmacist_Medication(
ph_id int,
medication_id int,
patient_id int,
CONSTRAINT pk_pharmacistMedication primary key(patient_id,medication_id,ph_id),
CONSTRAINT fk_pharmacist_pharmacistMedication foreign key(ph_id) references Pharmacist(ph_id) on update cascade on delete cascade,
CONSTRAINT fk_mediaction_pharmacistMedication foreign key(medication_id) references Medication(medication_id) on update cascade on delete cascade,
CONSTRAINT fk_patient_pharmacistMedication foreign key(patient_id) references Patient(patient_id) on update cascade on delete cascade,
);

create table Pharmacist_checks_Prescription(
ph_id int,
prescription_date date,
doctor_id int,
patient_id int,
CONSTRAINT pk_checksPrescription primary key(patient_id,prescription_date,doctor_id,ph_id),
CONSTRAINT fk_pharmacist_checksPrescription foreign key(ph_id) references Pharmacist(ph_id) on update cascade on delete cascade,
CONSTRAINT fk_prescription_checksPrescription foreign key(prescription_date,doctor_id) references Prescription(prescription_date,doctor_id) on update cascade on delete cascade,
CONSTRAINT fk_patient_checksPrescription foreign key(patient_id) references Patient(patient_id) on update cascade on delete cascade,
);

create table Services_Call(
hospital_name varchar(10),
service_id int,
CONSTRAINT pk_serviceCall primary key(hospital_name,service_id),
CONSTRAINT fk_hospital_serviceCall foreign key(hospital_name) references Hospital(hospital_name) on update cascade on delete cascade,
CONSTRAINT fk_emergencyServices_serviceCall  foreign key(service_id) references Emergency_Services(service_id) on update cascade on delete cascade
);

create table Insurance_signs(
ins_company varchar(20),
hospital_name varchar(10),
CONSTRAINT pk_insSigns primary key(hospital_name,ins_company),
CONSTRAINT fk_hospital_insSigns foreign key(hospital_name) references Hospital(hospital_name) on update cascade on delete cascade,
CONSTRAINT fk_ins_insSigns foreign key(ins_company) references Insurance_Company(ins_name) on update cascade on delete cascade,
);

create table Writes_Prescription(
prescription_date date,
doctor_id int,
patient_id int,
CONSTRAINT pk_writesPrescription primary key(prescription_date,patient_id,doctor_id),
CONSTRAINT fk_patient_writesPrescription foreign key(patient_id) references Patient(patient_id) on update cascade on delete cascade,
CONSTRAINT fk_doctor_writesPrescription foreign key(doctor_id) references Doctor(doctor_id) on update cascade on delete cascade,
CONSTRAINT fk_prescription_writesPrescription foreign key (doctor_id, prescription_date) references Prescription (doctor_id, prescription_date) on update cascade on delete cascade
);

create table Facilities(
patient_id int,
hospital_name varchar(20),
CONSTRAINT pk_facilities primary key(hospital_name,patient_id),
CONSTRAINT fk_patient_facilities foreign key(patient_id) references Patient(patient_id) on update cascade on delete cascade,
CONSTRAINT fk_hospital_facilities foreign key(hospital_name) references Hospital(hospital_name) on update cascade on delete cascade,
);
create table Admission(
patient_id int,
hospital_name varchar(20),
CONSTRAINT pk_admission primary key(hospital_name,patient_id),
CONSTRAINT fk_patient_admission foreign key(patient_id) references Patient(patient_id) on update cascade on delete cascade,
CONSTRAINT fk_hospital_admission foreign key(hospital_name) references Hospital(hospital_name) on update cascade on delete cascade,
);
create table Hospital_Manages(
patient_id int,
hospital_name varchar(10),
CONSTRAINT pk_hospitalManages primary key(hospital_name,patient_id),
CONSTRAINT fk_patient_hospitalManages foreign key(patient_id) references Patient(patient_id) on update cascade on delete cascade,
CONSTRAINT fk_hospital_hospitalManages foreign key(hospital_name) references Hospital(hospital_name) on update cascade on delete cascade,
);

create table Writes_Treatment(
patient_id int,
treatment_id int,
doctor_id int,
constraint pk_writesTreatment primary key(patient_id,treatment_id,doctor_id),
CONSTRAINT fk_patient_writesTreatment foreign key(patient_id) references Patient(patient_id) on update cascade on delete cascade,
CONSTRAINT fk_treatment_writesTreatment foreign key(treatment_id) references Treatment(treatment_id) on update cascade on delete cascade,
CONSTRAINT fk_doctor_writesTreatment foreign key(doctor_id) references Doctor(doctor_id) on update cascade on delete cascade
);
create table Moniters(
nurse_id int,
patient_id int,
treatment_id int,
constraint pk_monitors primary key(patient_id,treatment_id,nurse_id),
CONSTRAINT fk_patient_monitors foreign key(patient_id) references Patient(patient_id) on update cascade on delete cascade,
CONSTRAINT fk_treatment_monitors foreign key(treatment_id) references Treatment(treatment_id) on update cascade on delete cascade,
CONSTRAINT fk_nurse_monitors foreign key(nurse_id) references Nurse(nurse_id) on update cascade on delete cascade
);
create table Requests_Labtest(
patient_id int,
labtest_id int,
doctor_id int,
constraint pk_requestsLabtest primary key(patient_id,treatment_id,doctor_id),
CONSTRAINT fk_labtest_requestsLabtest foreign key(labtest_id,patient_id) references Labtest(labtest_id,patient_id) on update cascade on delete cascade,
CONSTRAINT fk_doctor_requestsLabtest foreign key(doctor_id) references Doctor(doctor_id) on update cascade on delete cascade
);
