create database SchengenVisa;

use SchengenVisa;

-- Applicant Information Table
CREATE TABLE Applicant_Info (
    Applicant_ID CHAR(10) PRIMARY KEY,
    Surname VARCHAR(100) NOT NULL,
    Surname_at_birth VARCHAR(100),
    First_name VARCHAR(100) NOT NULL,
    Date_of_birth DATE NOT NULL,
    Place_of_birth VARCHAR(100),
    Country_of_birth VARCHAR(100),
    Current_nationality VARCHAR(50) NOT NULL,
    Nationality_at_birth VARCHAR(50),
    Sex ENUM('Male', 'Female') NOT NULL,
    Marital_status ENUM('Single', 'Married', 'Separated', 'Divorced', 'Widow(er)', 'Other') NOT NULL,
    National_identity_number VARCHAR(50) UNIQUE,
    Home_address VARCHAR(255) NOT NULL,
    Email_address VARCHAR(100) UNIQUE NOT NULL,
    Phone_number VARCHAR(20) UNIQUE NOT NULL
);

-- Travel Document Table
CREATE TABLE Travel_Document (
    Document_ID CHAR(10) PRIMARY KEY,
    Applicant_ID CHAR(10) NOT NULL,
    Document_type ENUM('Ordinary passport', 'Diplomatic passport', 'Service passport', 'Official passport', 'Special passport', 'Other') NOT NULL,
    Document_number VARCHAR(50) UNIQUE NOT NULL,
    Date_of_issue DATE NOT NULL,
    Valid_until DATE NOT NULL,
    Issued_by VARCHAR(100) NOT NULL,
    FOREIGN KEY (Applicant_ID) REFERENCES Applicant_Info(Applicant_ID)
);

-- Residence Information Table
CREATE TABLE Residence_Info (
    Residence_ID CHAR(10) PRIMARY KEY,
    Applicant_ID CHAR(10) NOT NULL,
    Residence_in_other_country ENUM('Yes', 'No') NOT NULL,
    Residence_permit_number VARCHAR(50) UNIQUE,
    Permit_valid_until DATE,
    FOREIGN KEY (Applicant_ID) REFERENCES Applicant_Info(Applicant_ID)
);

-- Occupation Information Table
CREATE TABLE Occupation_Info (
    Occupation_ID CHAR(10) PRIMARY KEY,
    Applicant_ID CHAR(10) NOT NULL,
    Occupation VARCHAR(100) NOT NULL,
    Employer_name VARCHAR(100),
    Employer_address VARCHAR(255),
    Employer_phone VARCHAR(20),
    FOREIGN KEY (Applicant_ID) REFERENCES Applicant_Info(Applicant_ID)
);

-- Inviting Person/Organization Table
CREATE TABLE Inviting_Info (
    Inviting_ID CHAR(10) PRIMARY KEY,
    Applicant_ID CHAR(10) NOT NULL,
    Inviting_person_name VARCHAR(100),
    Inviting_person_address VARCHAR(255),
    Inviting_person_email VARCHAR(100),
    Inviting_person_phone VARCHAR(20),
    Inviting_organization_name VARCHAR(100),
    Inviting_organization_address VARCHAR(255),
    Inviting_organization_phone VARCHAR(20),
    Inviting_organization_email VARCHAR(100),
    FOREIGN KEY (Applicant_ID) REFERENCES Applicant_Info(Applicant_ID)
);

-- Journey Details Table
CREATE TABLE Journey_Details (
    Journey_ID CHAR(10) PRIMARY KEY,
    Applicant_ID CHAR(10) NOT NULL,
    Inviting_ID CHAR(10),
    Purpose_of_journey ENUM('Tourism', 'Business', 'Visiting family or friends', 'Cultural', 'Sports', 'Official visit', 'Medical reasons', 'Study', 'Transit', 'Airport transit', 'Other') NOT NULL,
    Member_state_of_destination VARCHAR(50) NOT NULL,
    Member_state_of_first_entry VARCHAR(50) NOT NULL,
    Number_of_entries_requested ENUM('Single entry', 'Two entries', 'Multiple entries') NOT NULL,
    Duration_of_stay INT NOT NULL,
    Previous_schengen_visas ENUM('Yes', 'No'),
    Previous_fingerprint_collected ENUM('Yes', 'No'),
    Entry_permit_for_final_destination ENUM('Yes', 'No'),
    FOREIGN KEY (Applicant_ID) REFERENCES Applicant_Info(Applicant_ID),
    FOREIGN KEY (Inviting_ID) REFERENCES Inviting_Info(Inviting_ID)
);


-- Travel Costs Table
CREATE TABLE Travel_Costs (
    Travel_Costs_ID CHAR(10) PRIMARY KEY,
    Applicant_ID CHAR(10) NOT NULL,
    Costs_covered_by_applicant ENUM('Yes', 'No') NOT NULL,
    Means_of_support VARCHAR(255),
    Costs_covered_by_sponsor ENUM('Yes', 'No') NOT NULL,
    Sponsor_ID CHAR(10),
    Sponsor_means_of_support VARCHAR(255),
    FOREIGN KEY (Applicant_ID) REFERENCES Applicant_Info(Applicant_ID),
    FOREIGN KEY (Sponsor_ID) REFERENCES Inviting_Info(Inviting_ID)
);


-- Family Member Information Table
CREATE TABLE Family_Member_Info (
    Family_Member_ID CHAR(10) PRIMARY KEY,
    Applicant_ID CHAR(10) NOT NULL,
    Family_member_name VARCHAR(100) NOT NULL,
    Family_member_first_name VARCHAR(100) NOT NULL,
    Family_member_date_of_birth DATE NOT NULL,
    Family_member_nationality VARCHAR(50) NOT NULL,
    Family_member_travel_document_number VARCHAR(50) UNIQUE NOT NULL,
    Family_relationship ENUM('spouse', 'child', 'grandchild', 'dependent ascendant') NOT NULL,
    FOREIGN KEY (Applicant_ID) REFERENCES Applicant_Info(Applicant_ID)
);

-- Visa Application Status Table
CREATE TABLE Visa_Application_Status (
    Application_Status_ID CHAR(10) PRIMARY KEY,
    Applicant_ID CHAR(10) NOT NULL,
    Application_date DATE NOT NULL,
    Visa_decision ENUM('Issued', 'Refused') NOT NULL,
    Type_of_visa ENUM('A', 'C', 'LTV') NOT NULL,
    File_handled_by VARCHAR(100) NOT NULL,
    Supporting_documents VARCHAR(255),
    Visa_number_of_entries ENUM('Single entry', 'Two entries', 'Multiple entries') NOT NULL,
    Visa_duration_of_stay INT NOT NULL,
    FOREIGN KEY (Applicant_ID) REFERENCES Applicant_Info(Applicant_ID)
);

-- Signature Table
CREATE TABLE Signature_Info (
    Signature_ID CHAR(10) PRIMARY KEY,
    Applicant_ID CHAR(10) NOT NULL,
    Place VARCHAR(100) NOT NULL,
    Date DATE NOT NULL,
    Signature VARCHAR(255) NOT NULL,
    FOREIGN KEY (Applicant_ID) REFERENCES Applicant_Info(Applicant_ID)
);

INSERT INTO Applicant_Info VALUES
('AP001', 'Nguyen', NULL, 'Minh', '1990-03-12', 'Ho Chi Minh City', 'Vietnam', 'Vietnam', 'Male', 'Single', 'VN123456789', '123 Main St, Ho Chi Minh City', 'minh.nguyen@example.com', '+84987654321'),
('AP002', 'Kumar', NULL, 'Rahul', '1985-07-19', 'Mumbai', 'India', 'India', 'Male', 'Married', 'IN987654321', '456 Park Ave, Mumbai', 'rahul.patel@example.com', '+919876543210'),
('AP003', 'Yati', NULL, 'Putri', '1993-05-24', 'Jakarta', 'Indonesia', 'Indonesia', 'Female', 'Single', 'ID1122334455', '789 Sunset Blvd, Jakarta', 'putri.yati@example.com', '+628123456789'),
('AP004', 'Lee', 'Kim', 'Jong', '1988-11-11', 'Seoul', 'South Korea', 'South Korea', 'Male', 'Married', 'KR2233445566', '101 Maple Dr, Seoul', 'jong.lee@example.com', '+821234567890'),
('AP005', 'Than', NULL, 'Aung', '1995-02-02', 'Yangon', 'Myanmar', 'Myanmar', 'Male', 'Single', 'MM9988776655', '202 Elm St, Yangon', 'aung.than@example.com', '+959876543210');

INSERT INTO Travel_Document VALUES
('TD001', 'AP001', 'Ordinary passport', 'VN987654321', '2015-06-01', '2025-06-01', 'Vietnam Immigration Department'),
('TD002', 'AP002', 'Ordinary passport', 'IN123456789', '2014-09-15', '2024-09-15', 'Indian Passport Office'),
('TD003', 'AP003', 'Ordinary passport', 'ID9988776655', '2016-12-20', '2026-12-20', 'Indonesian Immigration'),
('TD004', 'AP004', 'Ordinary passport', 'KR6655443322', '2017-03-25', '2027-03-25', 'Korean Immigration Office'),
('TD005', 'AP005', 'Ordinary passport', 'MM5544332211', '2018-08-10', '2028-08-10', 'Myanmar Immigration Office');

INSERT INTO Residence_Info VALUES
('RI001', 'AP001', 'No', NULL, NULL),
('RI002', 'AP002', 'No', NULL, NULL),
('RI003', 'AP003', 'No', NULL, NULL),
('RI004', 'AP004', 'No', NULL, NULL),
('RI005', 'AP005', 'No', NULL, NULL);

INSERT INTO Occupation_Info VALUES
('OC001', 'AP001', 'Software Engineer', 'FPT Software', '789 IT Park, Ho Chi Minh City', '+84987654321'),
('OC002', 'AP002', 'Marketing Manager', 'Reliance Industries', '456 Business St, Mumbai', '+919876543210'),
('OC003', 'AP003', 'Graphic Designer', 'Go-Jek', '101 Startup Hub, Jakarta', '+628123456789'),
('OC004', 'AP004', 'Professor', 'Seoul National University', '202 Academic Rd, Seoul', '+821234567890'),
('OC005', 'AP005', 'Civil Engineer', 'Yoma Construction', '303 Engineering Lane, Yangon', '+959876543210');

INSERT INTO Journey_Details VALUES
('JD001', 'AP001', 'IN001', 'Tourism', 'France', 'Germany', 'Single entry', 15, 'No', 'No', 'No'),
('JD002', 'AP002', 'IN002', 'Business', 'Netherlands', 'Belgium', 'Multiple entries', 30, 'Yes', 'Yes', 'No'),
('JD003', 'AP003', 'IN003', 'Visiting family or friends', 'Italy', 'Spain', 'Single entry', 10, 'No', 'No', 'No'),
('JD004', 'AP004', 'IN004', 'Cultural', 'Austria', 'Switzerland', 'Two entries', 20, 'Yes', 'No', 'No'),
('JD005', 'AP005', 'IN005', 'Study', 'Norway', 'Denmark', 'Multiple entries', 60, 'No', 'Yes', 'No');

INSERT INTO Inviting_Info VALUES
('IN001', 'AP001', 'John Doe', '123 Paris St, Paris, France', 'johndoe@frenchcompany.com', '+33123456789', 'French Company', '123 Paris St, Paris, France', '+33123456789', 'contact@frenchcompany.com'),
('IN002', 'AP002', 'Anna Smith', '456 Amsterdam Ave, Amsterdam, Netherlands', 'annasmith@dutchbiz.com', '+31234567890', 'Dutch Business Corp', '456 Amsterdam Ave, Amsterdam, Netherlands', '+31234567890', 'info@dutchbiz.com'),
('IN003', 'AP003', 'Carlos Rivera', '789 Rome Rd, Rome, Italy', 'carlos.italy@romehotel.com', '+390123456789', 'Rome Hotel', '789 Rome Rd, Rome, Italy', '+390123456789', 'booking@romehotel.com'),
('IN004', 'AP004', 'Hans Mueller', '202 Vienna St, Vienna, Austria', 'hans@viennacultural.com', '+431234567890', 'Vienna Cultural Org', '202 Vienna St, Vienna, Austria', '+431234567890', 'info@viennacultural.com'),
('IN005', 'AP005', 'Olav Eriksen', '303 Oslo St, Oslo, Norway', 'olav.norway@osloedu.com', '+472345678910', 'Oslo Education Institute', '303 Oslo St, Oslo, Norway', '+472345678910', 'admin@osloedu.com');

INSERT INTO Travel_Costs VALUES
('TC001', 'AP001', 'Yes', 'Credit card', 'No', NULL, NULL),
('TC002', 'AP002', 'Yes', 'Pre-paid accommodation', 'No', NULL, NULL),
('TC003', 'AP003', 'No', NULL, 'Yes', 'IN003', 'All expenses covered during the stay'),
('TC004', 'AP004', 'Yes', 'Cash', 'No', NULL, NULL),
('TC005', 'AP005', 'No', NULL, 'Yes', 'IN005', 'Pre-paid transport');

INSERT INTO Family_Member_Info VALUES
('FM001', 'AP001', 'Nguyen', 'Anh', '1955-02-10', 'Vietnam', 'VN111223344', 'father'),
('FM002', 'AP002', 'Patel', 'Sita', '1980-08-30', 'India', 'IN667788990', 'spouse'),
('FM003', 'AP003', 'Putri', 'Rani', '1970-09-15', 'Indonesia', 'ID334455667', 'mother'),
('FM004', 'AP004', 'Kim', 'Hana', '1990-12-12', 'South Korea', 'KR998877665', 'spouse'),
('FM005', 'AP005', 'Aung', 'Myo', '1952-01-05', 'Myanmar', 'MM556677889', 'father');

INSERT INTO Visa_Application_Status VALUES
('VS001', 'AP001', '2024-09-01', 'Issued', 'C', 'Ho Chi Minh Embassy', 'Travel document, Means of subsistence', 'Single entry', 15),
('VS002', 'AP002', '2024-08-15', 'Issued', 'C', 'Mumbai Consulate', 'Travel document, Invitation', 'Multiple entries', 30),
('VS003', 'AP003', '2024-08-20', 'Issued', 'C', 'Jakarta Consulate', 'Travel document', 'Single entry', 10),
('VS004', 'AP004', '2024-09-05', 'Issued', 'C', 'Seoul Embassy', 'Travel document, Means of transport', 'Two entries', 20),
('VS005', 'AP005', '2024-09-10', 'Issued', 'C', 'Yangon Consulate', 'Travel document, Study permit', 'Multiple entries', 60);

INSERT INTO Signature_Info VALUES
('SG001', 'AP001', 'Ho Chi Minh City', '2024-09-01', 'Minh Nguyen'),
('SG002', 'AP002', 'Mumbai', '2024-08-15', 'Rahul Kumar'),
('SG003', 'AP003', 'Jakarta', '2024-08-20', 'Putri Yati'),
('SG004', 'AP004', 'Seoul', '2024-09-05', 'Jong Lee'),
('SG005', 'AP005', 'Yangon', '2024-09-10', 'Aung Than');

-- Grant privileges on the Applicant_Info table
GRANT SELECT, INSERT, UPDATE, DELETE ON Applicant_Info TO 'db_user'@'localhost';

-- Grant privileges on the Travel_Document table
GRANT SELECT, INSERT, UPDATE, DELETE ON Travel_Document TO 'db_user'@'localhost';

-- Grant privileges on the Residence_Info table
GRANT SELECT, INSERT, UPDATE, DELETE ON Residence_Info TO 'db_user'@'localhost';

-- Grant privileges on the Occupation_Info table
GRANT SELECT, INSERT, UPDATE, DELETE ON Occupation_Info TO 'db_user'@'localhost';

-- Grant privileges on the Journey_Details table
GRANT SELECT, INSERT, UPDATE, DELETE ON Journey_Details TO 'db_user'@'localhost';

-- Grant privileges on the Inviting_Info table
GRANT SELECT, INSERT, UPDATE, DELETE ON Inviting_Info TO 'db_user'@'localhost';

-- Grant privileges on the Travel_Costs table
GRANT SELECT, INSERT, UPDATE, DELETE ON Travel_Costs TO 'db_user'@'localhost';

-- Grant privileges on the Family_Member_Info table
GRANT SELECT, INSERT, UPDATE, DELETE ON Family_Member_Info TO 'db_user'@'localhost';

-- Grant privileges on the Visa_Application_Status table
GRANT SELECT, INSERT, UPDATE, DELETE ON Visa_Application_Status TO 'db_user'@'localhost';

-- Grant privileges on the Signature_Info table
GRANT SELECT, INSERT, UPDATE, DELETE ON Signature_Info TO 'db_user'@'localhost';

GRANT CREATE ON *.* TO 'db_user'@'localhost';