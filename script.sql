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
	classPassword text NOT NULL,
	classInstitution varchar(20),
	classCutOff int NOT NULL,
  classDescription varchar(200) NOT NULL,
  classCreationDate varchar(10) NOT NULL,
	CONSTRAINT Class_Person_fk FOREIGN KEY (idClassCreator) REFERENCES Person (idPerson),
	CONSTRAINT Class_pk PRIMARY KEY (idClass)
);

CREATE TABLE IF NOT EXISTS PersonHasClass (
  idPersonHasClass int NOT NULL AUTO_INCREMENT,
	idPerson int NOT NULL,
	idClass int NOT NULL,
	idPersonType int NOT NULL,
	CONSTRAINT PersonHasClass_pk PRIMARY KEY (idPersonHasClass),
	CONSTRAINT PersonHasClass_Person_fk FOREIGN KEY (idPerson) REFERENCES Person (idPerson),
	CONSTRAINT PersonHasClass_Class_fk FOREIGN KEY (idClass) REFERENCES Class (idClass),
	CONSTRAINT PersonHasClass_PersonType_fk FOREIGN KEY (idPersonType) REFERENCES PersonType (idPersonType)
);

CREATE TABLE IF NOT EXISTS Exam (
	idExam int NOT NULL AUTO_INCREMENT,
	ExamDescription varchar(15) NOT NULL,
	idClass int NOT NULL,
	CONSTRAINT Exam_pk PRIMARY KEY (idExam),
	CONSTRAINT Exam_Class_fk FOREIGN KEY (idClass) REFERENCES Class (idClass)
);

CREATE TABLE IF NOT EXISTS PersonHasExam (
  idPersonHasExam int NOT NULL AUTO_INCREMENT,
	idPerson int NOT NULL,
	idExam int NOT NULL,
  idClass int NOT NULL,
  CONSTRAINT PersonHasExam_pk PRIMARY KEY (idPersonHasExam),
	CONSTRAINT PersonHasExam_Person_fk FOREIGN KEY (idPerson) REFERENCES Person (idPerson),
	CONSTRAINT PersonHasExam_Exam_fk FOREIGN KEY (idExam) REFERENCES Exam (idExam),
  CONSTRAINT PersonHasExam_Class_fk FOREIGN KEY (idClass) REFERENCES Class (idClass)
);

CREATE TABLE IF NOT EXISTS PersonGroup (
	idGroup int NOT NULL AUTO_INCREMENT,
	groupNumber int NOT NULL,
	idExam int NOT NULL,
  idClass int NOT NULL,
	CONSTRAINT PersonGroup_pk PRIMARY KEY (idGroup),
	CONSTRAINT PersonGroup_Exam_fk FOREIGN KEY (idExam) REFERENCES Exam (idExam),
  CONSTRAINT PersonGroup_Class_fk FOREIGN KEY (idClass) REFERENCES Class (idClass)
);

CREATE TABLE IF NOT EXISTS PersonHasGroup (
	idPersonHasGroup int NOT NULL AUTO_INCREMENT,
	idPerson int NOT NULL,
	idGroup int NOT NULL,
	personHelper TINYINT(1) NOT NULL,
	CONSTRAINT PersonHasGroup_pk PRIMARY KEY (idPersonHasGroup),
	CONSTRAINT PersonHasGroup_Exam_fk FOREIGN KEY (idPerson) REFERENCES Person (idPerson),
	CONSTRAINT Group_PersonHasGroup_fk FOREIGN KEY (idGroup) REFERENCES PersonGroup (idGroup)
);

CREATE TABLE IF NOT EXISTS Grade (
  idGrade int NOT NULL AUTO_INCREMENT,
  grade decimal(10,3) NOT NULL,
  idPerson int NOT NULL,
  idExam int NOT NULL,
  idGradeType int NOT NULL,
  CONSTRAINT Grade_pk PRIMARY KEY (idGrade),
	CONSTRAINT Grade_Person_fk FOREIGN KEY (idPerson) REFERENCES Person (idPerson),
	CONSTRAINT Grade_Exam_fk FOREIGN KEY (idExam) REFERENCES Exam (idExam),
	CONSTRAINT Grade_GradeType_fk FOREIGN KEY (idGradeType) REFERENCES GradeType (idGradeType)
);

CREATE TABLE IF NOT EXISTS GradeType (
  idGradeType int NOT NULL AUTO_INCREMENT,
  gradeTypeDescription int NOT NULL,
  CONSTRAINT GradeType_pk PRIMARY KEY (idGradeType)
);

CREATE TABLE IF NOT EXISTS Rate (
	idRate int NOT NULL AUTO_INCREMENT,
	ratesValue int(1) NOT NULL,
	idGroup int NOT NULL,
  idPerson int NOT NULL,
  idPersonEvaluated int NOT NULL,
	CONSTRAINT Rate_pk PRIMARY KEY (idRate),
  CONSTRAINT Rate_PersonGroup_fk FOREIGN KEY (idGroup) REFERENCES ṔPersonGroup (idGroup),
	CONSTRAINT Rate_Person_fk FOREIGN KEY (idPerson) REFERENCES Person (idPerson),
	CONSTRAINT Rate_PersonEvaluated_fk FOREIGN KEY (idPersonEvaluated) REFERENCES Person (idPerson)
);
