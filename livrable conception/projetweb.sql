DROP TABLE IF EXISTS STUDENT;
CREATE TABLE STUDENT(
        Id INT NOT NULL AUTO_INCREMENT,
        FirstName Varchar (25) NOT NULL,
        SecondName Varchar (25) NOT NULL,
        Centre Varchar (25) NOT NULL,
        Email Varchar (40) NOT NULL,
        Password Varchar (15) NOT NULL,
        PRIMARY KEY (Id)
)ENGINE=InnoDB;

DROP TABLE IF EXISTS BDE;
CREATE TABLE BDE(
        id INT AUTO_INCREMENT,
        Email Varchar (40),
        Password Varchar (15),
        PRIMARY KEY (id)
)ENGINE=InnoDB;

DROP TABLE IF EXISTS CESI;
CREATE TABLE CESI(
        id INT NOT NULL AUTO_INCREMENT,
        FirstName Varchar (25) NOT NULL,
        SecondName Varchar (25) NOT NULL,
        Centre Varchar (25) NOT NULL,
        Email Varchar (40) NOT NULL,
        Password Varchar (15) NOT NULL,
        PRIMARY KEY (id)
)ENGINE=InnoDB;

DROP TABLE IF EXISTS IdeaBox;
CREATE TABLE IdeaBox(
        id INT AUTO_INCREMENT NOT NULL,
        Description Varchar (100) NOT NULL,
        Image Varchar (50) NOT NULL,
        PRIMARY KEY (id)
)ENGINE=InnoDB;

DROP TABLE IF EXISTS ACTIVITY;
CREATE TABLE ACTIVITY(
        id INT AUTO_INCREMENT NOT NULL,
        Description Varchar (100) NOT NULL,
        Image Varchar (50) NOT NULL,
        Dates Date NOT NULL,
        Status Varchar (25) NOT NULL,
        PRIMARY KEY (id)
)ENGINE=InnoDB;

DROP TABLE IF EXISTS PRODUCT;
CREATE TABLE PRODUCT(
        id INT NOT NULL AUTO_INCREMENT,
        Name Varchar (25) NOT NULL,
        Description Varchar (100) NOT NULL,
        Price Int (25) NOT NULL,
        PRIMARY KEY (id)
);

DROP TABLE IF EXISTS CATEGORY;
CREATE TABLE CATEGORY(
        id INT NOT NULL AUTO_INCREMENT,
        Name Varchar (25) NOT NULL,
        id_PRODUCT INT(25) NOT NULL,
        PRIMARY KEY (id)
);

DROP TABLE IF EXISTS SUGGESTION;
CREATE TABLE SUGGESTION(
        Id_STUDENT INT NOT NULL,
        id_IdeaBox INT NOT NULL,
        PRIMARY KEY (Id_STUDENT,id_IdeaBox)
);

DROP TABLE IF EXISTS LOOK;
CREATE TABLE LOOK(
        id_CESI INT NOT NULL,
        id_ACTIVITY INT NOT NULL,
        Id_STUDENT INT NOT NULL,
        id_BDE INT NOT NULL,
        PRIMARY KEY (id_CESI,id_ACTIVITY,Id_STUDENT,id_BDE)
);

DROP TABLE IF EXISTS MANAGEMENT;
CREATE TABLE MANAGEMENT(
        id INT NOT NULL AUTO_INCREMENT,
        PostDate Date NOT NULL,
        id_BDE INT NOT NULL,
        id_ACTIVITY INT NOT NULL,
        id_PRODUCT INT NOT NULL,
    	PRIMARY KEY (id,id_BDE,id_ACTIVITY,id_PRODUCT)
)ENGINE=InnoDB;

DROP TABLE IF EXISTS INSCRIPTION;
CREATE TABLE INSCRIPTION(
        InscriptionDate Date NOT NULL,
        Id_STUDENT INT NOT NULL,
        id_ACTIVITY INT NOT NULL,
        PRIMARY KEY (Id_STUDENT,id_ACTIVITY)
)ENGINE=InnoDB;

DROP TABLE IF EXISTS PURCHASE;
CREATE TABLE PURCHASE(
        id INT NOT NULL AUTO_INCREMENT,
        PurchaseDate Date NOT NULL,
        id_PRODUCT INT NOT NULL,
        Id_STUDENT INT NOT NULL,
        PRIMARY KEY (id,id_PRODUCT,Id_STUDENT)
)ENGINE=InnoDB;


ALTER TABLE CATEGORY ADD CONSTRAINT FK_CATEGORY_id_PRODUCT FOREIGN KEY (id_PRODUCT) REFERENCES PRODUCT(id);
ALTER TABLE SUGGESTION ADD CONSTRAINT FK_SUGGESTION_Id_STUDENT FOREIGN KEY (Id_STUDENT) REFERENCES STUDENT(Id);
ALTER TABLE SUGGESTION ADD CONSTRAINT FK_SUGGESTION_id_IdeaBox FOREIGN KEY (id_IdeaBox) REFERENCES IdeaBox(id);
ALTER TABLE LOOK ADD CONSTRAINT FK_LOOK_id_CESI FOREIGN KEY (id_CESI) REFERENCES CESI(id);
ALTER TABLE LOOK ADD CONSTRAINT FK_LOOK_id_ACTIVITY FOREIGN KEY (id_ACTIVITY) REFERENCES ACTIVITY(id);
ALTER TABLE LOOK ADD CONSTRAINT FK_LOOK_Id_STUDENT FOREIGN KEY (Id_STUDENT) REFERENCES STUDENT(Id);
ALTER TABLE LOOK ADD CONSTRAINT FK_LOOK_id_BDE FOREIGN KEY (id_BDE) REFERENCES BDE(id);
ALTER TABLE MANAGEMENT ADD CONSTRAINT FK_MANAGEMENT_id_BDE FOREIGN KEY (id_BDE) REFERENCES BDE(id);
ALTER TABLE MANAGEMENT ADD CONSTRAINT FK_MANAGEMENT_id_ACTIVITY FOREIGN KEY (id_ACTIVITY) REFERENCES ACTIVITY(id);
ALTER TABLE MANAGEMENT ADD CONSTRAINT FK_MANAGEMENT_id_PRODUCT FOREIGN KEY (id_PRODUCT) REFERENCES PRODUCT(id);
ALTER TABLE INSCRIPTION ADD CONSTRAINT FK_INSCRIPTION_Id_STUDENT FOREIGN KEY (Id_STUDENT) REFERENCES STUDENT(Id);
ALTER TABLE INSCRIPTION ADD CONSTRAINT FK_INSCRIPTION_id_ACTIVITY FOREIGN KEY (id_ACTIVITY) REFERENCES ACTIVITY(id);
ALTER TABLE PURCHASE ADD CONSTRAINT FK_PURCHASE_id_PRODUCT FOREIGN KEY (id_PRODUCT) REFERENCES PRODUCT(id);
ALTER TABLE PURCHASE ADD CONSTRAINT FK_PURCHASE_Id_STUDENT FOREIGN KEY (Id_STUDENT) REFERENCES STUDENT(Id);