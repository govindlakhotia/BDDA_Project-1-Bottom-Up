Schengen Visa Application Database Project
Project Overview

This project involves the creation of a relational database designed to manage Schengen Visa applications, focusing on applicants from Southeast Asia. The database was constructed using a bottom-up approach, which involved identifying key data elements from a Schengen Visa application form and organizing them into related entities or tables.

The database is designed to capture all relevant information needed for the visa application process, including applicant details, travel documents, journey information, inviting parties, and more. It ensures data integrity and supports various operations such as inserting, updating, and querying applicant data.
Database Structure
Tables and Relationships
1. Applicant_Info

    Description: Stores the personal details of visa applicants.
    Primary Key: Applicant_ID (VARCHAR(10))
    Columns:
        Surname (VARCHAR(100), NOT NULL)
        Surname_at_birth (VARCHAR(100), NULL)
        First_name (VARCHAR(100), NOT NULL)
        Date_of_birth (DATE, NOT NULL)
        Place_of_birth (VARCHAR(100), NULL)
        Country_of_birth (VARCHAR(100), NULL)
        Current_nationality (VARCHAR(50), NOT NULL)
        Nationality_at_birth (VARCHAR(50), NULL)
        Sex (ENUM('Male', 'Female'), NOT NULL)
        Marital_status (ENUM('Single', 'Married', 'Separated', 'Divorced', 'Widow(er)', 'Other'), NOT NULL)
        National_identity_number (VARCHAR(50), UNIQUE, NULL)
        Home_address (VARCHAR(255), NOT NULL)
        Email_address (VARCHAR(100), UNIQUE, NOT NULL)
        Phone_number (VARCHAR(20), UNIQUE, NOT NULL)

2. Travel_Document

    Description: Stores information about the travel documents provided by applicants.
    Primary Key: Document_ID (VARCHAR(10))
    Foreign Key: Applicant_ID references Applicant_Info(Applicant_ID)
    Columns:
        Document_type (ENUM('Ordinary passport', 'Diplomatic passport', 'Service passport', 'Official passport', 'Special passport', 'Other'), NOT NULL)
        Document_number (VARCHAR(50), UNIQUE, NOT NULL)
        Date_of_issue (DATE, NOT NULL)
        Valid_until (DATE, NOT NULL)
        Issued_by (VARCHAR(100), NOT NULL)

3. Residence_Info

    Description: Captures the residence information for applicants.
    Primary Key: Residence_ID (VARCHAR(10))
    Foreign Key: Applicant_ID references Applicant_Info(Applicant_ID)
    Columns:
        Residence_in_other_country (ENUM('Yes', 'No'), NOT NULL)
        Residence_permit_number (VARCHAR(50), UNIQUE, NULL)
        Permit_valid_until (DATE, NULL)

4. Occupation_Info

    Description: Records the employment details of applicants.
    Primary Key: Occupation_ID (VARCHAR(10))
    Foreign Key: Applicant_ID references Applicant_Info(Applicant_ID)
    Columns:
        Occupation (VARCHAR(100), NOT NULL)
        Employer_name (VARCHAR(100), NULL)
        Employer_address (VARCHAR(255), NULL)
        Employer_phone (VARCHAR(20), NULL)

5. Journey_Details

    Description: Holds the details of the journey the applicant is planning.
    Primary Key: Journey_ID (VARCHAR(10))
    Foreign Keys:
        Applicant_ID references Applicant_Info(Applicant_ID)
        Inviting_ID references Inviting_Info(Inviting_ID)
    Columns:
        Purpose_of_journey (ENUM('Tourism', 'Business', 'Visiting family or friends', 'Cultural', 'Sports', 'Official visit', 'Medical reasons', 'Study', 'Transit', 'Airport transit', 'Other'), NOT NULL)
        Member_state_of_destination (VARCHAR(50), NOT NULL)
        Member_state_of_first_entry (VARCHAR(50), NOT NULL)
        Number_of_entries_requested (ENUM('Single entry', 'Two entries', 'Multiple entries'), NOT NULL)
        Duration_of_stay (INT, NOT NULL)
        Previous_schengen_visas (ENUM('Yes', 'No'), NULL)
        Previous_fingerprint_collected (ENUM('Yes', 'No'), NULL)
        Entry_permit_for_final_destination (ENUM('Yes', 'No'), NULL)

6. Inviting_Info

    Description: Contains details of the person or organization inviting the applicant.
    Primary Key: Inviting_ID (VARCHAR(10))
    Foreign Key: Applicant_ID references Applicant_Info(Applicant_ID)
    Columns:
        Inviting_person_name (VARCHAR(100), NULL)
        Inviting_person_address (VARCHAR(255), NULL)
        Inviting_person_email (VARCHAR(100), NULL)
        Inviting_person_phone (VARCHAR(20), NULL)
        Inviting_organization_name (VARCHAR(100), NULL)
        Inviting_organization_address (VARCHAR(255), NULL)
        Inviting_organization_phone (VARCHAR(20), NULL)
        Inviting_organization_email (VARCHAR(100), NULL)

7. Travel_Costs

    Description: Stores information about how the travel costs will be covered.
    Primary Key: Travel_Costs_ID (VARCHAR(10))
    Foreign Keys:
        Applicant_ID references Applicant_Info(Applicant_ID)
        Sponsor_ID references Inviting_Info(Inviting_ID)
    Columns:
        Costs_covered_by_applicant (ENUM('Yes', 'No'), NOT NULL)
        Means_of_support (VARCHAR(255), NULL)
        Costs_covered_by_sponsor (ENUM('Yes', 'No'), NOT NULL)
        Sponsor_means_of_support (VARCHAR(255), NULL)

8. Family_Member_Info

    Description: Contains details about family members of the applicant.
    Primary Key: Family_Member_ID (VARCHAR(10))
    Foreign Key: Applicant_ID references Applicant_Info(Applicant_ID)
    Columns:
        Family_member_name (VARCHAR(100), NOT NULL)
        Family_member_first_name (VARCHAR(100), NOT NULL)
        Family_member_date_of_birth (DATE, NOT NULL)
        Family_member_nationality (VARCHAR(50), NOT NULL)
        Family_member_travel_document_number (VARCHAR(50), UNIQUE, NOT NULL)
        Family_relationship (ENUM('spouse', 'child', 'grandchild', 'dependent ascendant'), NOT NULL)

9. Visa_Application_Status

    Description: Tracks the status of the visa application.
    Primary Key: Application_Status_ID (VARCHAR(10))
    Foreign Key: Applicant_ID references Applicant_Info(Applicant_ID)
    Columns:
        Application_date (DATE, NOT NULL)
        Visa_decision (ENUM('Issued', 'Refused'), NOT NULL)
        Type_of_visa (ENUM('A', 'C', 'LTV'), NOT NULL)
        File_handled_by (VARCHAR(100), NOT NULL)
        Supporting_documents (VARCHAR(255), NULL)
        Visa_number_of_entries (ENUM('Single entry', 'Two entries', 'Multiple entries'), NOT NULL)
        Visa_duration_of_stay (INT, NOT NULL)

10. Signature_Info

    Description: Stores the applicant's signature information.
    Primary Key: Signature_ID (VARCHAR(10))
    Foreign Key: Applicant_ID references Applicant_Info(Applicant_ID)
    Columns:
        Place (VARCHAR(100), NOT NULL)
        Date (DATE, NOT NULL)
        Signature (VARCHAR(255), NOT NULL)

Relationships Between Tables

    Applicant_Info is the central table, linking directly to all other tables through the Applicant_ID foreign key.
    Journey_Details connects to Inviting_Info through the Inviting_ID foreign key, representing the relationship between an applicant's journey and the inviting person or organization.
    Travel_Costs links to both Applicant_Info and Inviting_Info via Applicant_ID and Sponsor_ID, respectively, representing how travel expenses are covered.
    Family_Member_Info and Visa_Application_Status both reference Applicant_Info to store relevant data about the applicant’s family and application status, respectively.
