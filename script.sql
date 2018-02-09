CREATE TABLE IF NOT EXISTS Person (
    idPerson int NOT NULL AUTO_INCREMENT,
    personFirstName varchar(200) NOT NULL,
    personLastName varchar(200) NOT NULL,
    personEmail varchar(200) NOT NULL,
    personPassword text NOT NULL,
    personIsFromFacebook TINYINT(1) NOT NULL,
    personTelephoneDDI varchar(3) NOT NULL,
    personTelephoneDDD varchar(3) NOT NULL,
    personTelephoneNumber varchar(9) NOT NULL,

    CONSTRAINT person_pk PRIMARY KEY (idPerson)
);

CREATE TABLE IF NOT EXISTS PersonType (
	idPersonType int NOT NULL AUTO_INCREMENT,
	personTypeDescription varchar(100) NOT NULL,
	CONSTRAINT PersonType_pk PRIMARY KEY (idPersonType)
);

CREATE TABLE IF NOT EXISTS Class (
	idClass int NOT NULL AUTO_INCREMENT,
  idClassCreator int NOT NULL,
  classCreatorName varchar(200) NOT NULL,
	className varchar(20) NOT NULL,
	classPassword varchar(16) NOT NULL,
	classInstitution varchar(20),
	classCutOff int NOT NULL,
  classDescription varchar(200) NOT NULL,
  classCreationDate varchar(10) NOT NULL,

	CONSTRAINT Class_pk PRIMARY KEY (idClass)
);

CREATE TABLE IF NOT EXISTS PersonHasClass (
	idPerson int NOT NULL,
	idClass int NOT NULL,
	idPersonType int NOT NULL,
	CONSTRAINT PersonHasClass_Person_fk FOREIGN KEY (idPerson) REFERENCES Person (idPerson),
	CONSTRAINT PersonHasClass_Class_fk FOREIGN KEY (idClass) REFERENCES Class (idClass),
	CONSTRAINT PersonHasClass_PersonType_fk FOREIGN KEY (idPersonType) REFERENCES PersonType (idPersonType)
);

CREATE TABLE IF NOT EXISTS ExamType (
	idExamType int NOT NULL AUTO_INCREMENT,
	ExamTypeDescription varchar(100) NOT NULL,
	CONSTRAINT ExamType_pk PRIMARY KEY (idExamType)
);

CREATE TABLE IF NOT EXISTS Exam (
	idExam int NOT NULL AUTO_INCREMENT,
	ExamDescription varchar(15) NOT NULL,
	idClass int NOT NULL,
	idExamType int NOT NULL,
	CONSTRAINT Exam_pk PRIMARY KEY (idExam),
	CONSTRAINT Exam_Class_fk FOREIGN KEY (idClass) REFERENCES Class (idClass),
	CONSTRAINT ExamType_Class_fk FOREIGN KEY (idExamType) REFERENCES ExamType (idExamType)
);

CREATE TABLE IF NOT EXISTS PersonHasExam (
	idPerson int NOT NULL,
	idExam int NOT NULL,
	CONSTRAINT PersonHasExam_Person_fk FOREIGN KEY (idPerson) REFERENCES Person (idPerson),
	CONSTRAINT PersonHasExam_Exam_fk FOREIGN KEY (idExam) REFERENCES Exam (idExam)
);

CREATE TABLE IF NOT EXISTS PersonGroup (
	idGroup int NOT NULL AUTO_INCREMENT,
	GroupDescription varchar(45) NOT NULL,
	idExam int NOT NULL,
	CONSTRAINT PersonGroup_pk PRIMARY KEY (idGroup),
	CONSTRAINT PersonGroup_Exam_fk FOREIGN KEY (idExam) REFERENCES Exam (idExam)
);

CREATE TABLE IF NOT EXISTS PersonHasGroup (
	idPersonHasGroup int NOT NULL AUTO_INCREMENT,
	idPerson int NOT NULL,
	idGroup int NOT NULL,
	PersonHelper TINYINT(1) NOT NULL,
	CONSTRAINT PersonHasGroup_pk PRIMARY KEY (idPersonHasGroup),
	CONSTRAINT PersonHasGroup_Exam_fk FOREIGN KEY (idPerson) REFERENCES Person (idPerson),
	CONSTRAINT Group_PersonHasGroup_fk FOREIGN KEY (idGroup) REFERENCES PersonGroup (idGroup)
);

CREATE TABLE IF NOT EXISTS RateType (
	idRateType int NOT NULL AUTO_INCREMENT,
	RateTypeDescription varchar(45) NOT NULL,
	CONSTRAINT RateType_pk PRIMARY KEY (idRateType)
);

CREATE TABLE IF NOT EXISTS Rate (
	idRate int NOT NULL AUTO_INCREMENT,
	RatesValue int(1) NOT NULL,
	idRateType int NOT NULL,
	idGroup int NOT NULL,
	idPersonHasGroup int NOT NULL,
	CONSTRAINT Rate_pk PRIMARY KEY (idRate),
	CONSTRAINT Rate_RateType_fk FOREIGN KEY (idRateType) REFERENCES RateType (idRateType),
	CONSTRAINT Rate_PersonGroup_fk FOREIGN KEY (idGroup) REFERENCES PersonGroup (idGroup),
	CONSTRAINT Rate_PersonHasGroup_fk FOREIGN KEY (idPersonHasGroup) REFERENCES PersonHasGroup (idPersonHasGroup)
);

