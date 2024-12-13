begin transaction;
CREATE SCHEMA Library;

SET SEARCH_PATH to Library;

CREATE TABLE Library.Locations (
    ID_Location SERIAL PRIMARY KEY,
    Opening_hours VARCHAR(50) NOT NULL,
    Address VARCHAR(255) NOT NULL
);

CREATE TABLE Library.Locations_history (
    ID_Location SERIAL,
    Opening_hours VARCHAR(50) NOT NULL,
    Address VARCHAR(255) NOT NULL,
    History_DTTM timestamp NOT NULL,
    CONSTRAINT PK_Location_Update PRIMARY KEY (ID_Location, History_DTTM)
);

CREATE TABLE Library.Employees (
    ID_Employee SERIAL PRIMARY KEY,
    Full_name VARCHAR(100) NOT NULL,
    Role VARCHAR(50) NOT NULL,
    Date_of_hire DATE NOT NULL
);

CREATE TABLE Library.Readers (
    ID_Reader SERIAL PRIMARY KEY,
    Full_name VARCHAR(100) NOT NULL,
    Contact_info VARCHAR(255) NOT NULL,
    Date_of_registration DATE NOT NULL
);

CREATE TABLE Library.Books (
    ID_Book SERIAL PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Author VARCHAR(100) NOT NULL,
    Genre VARCHAR(50) NOT NULL,
    Year_of_publication INT NOT NULL
);

CREATE TABLE Library.Checkouts (
    ID_Checkout SERIAL PRIMARY KEY,
    ID_Reader INT NOT NULL,
    ID_Book INT NOT NULL,
    ID_Employee INT NOT NULL,
    ID_Location INT NOT NULL,
    Checkout_date DATE NOT NULL,
    Return_date DATE NOT NULL,
    Return_period INT NOT NULL,
    CONSTRAINT FK_Book FOREIGN KEY (ID_Book) REFERENCES Library.Books(ID_Book),
    CONSTRAINT FK_Reader FOREIGN KEY (ID_Reader) REFERENCES Library.Readers(ID_Reader),
    CONSTRAINT FK_Employee FOREIGN KEY (ID_Employee) REFERENCES Library.Employees(ID_Employee),
    CONSTRAINT FK_Location FOREIGN KEY (ID_Location) REFERENCES Library.Locations(ID_Location)
);

CREATE TABLE Library.Reviews (
    ID_Review SERIAL PRIMARY KEY,
    ID_Reader INT NOT NULL,
    ID_Book INT NOT NULL,
    Grade INT CHECK (Grade BETWEEN 1 AND 10),
    Short_description TEXT,
    CONSTRAINT FK_ReviewReader FOREIGN KEY (ID_Reader) REFERENCES Library.Readers(ID_Reader),
    CONSTRAINT FK_ReviewBook FOREIGN KEY (ID_Book) REFERENCES Library.Books(ID_Book)
);

CREATE TABLE Library.Location_X_Employee (
    ID_Location INT NOT NULL,
    ID_Employee INT NOT NULL,
    CONSTRAINT PK_Location_Employee PRIMARY KEY (ID_Location, ID_Employee),
    CONSTRAINT FK_Location FOREIGN KEY (ID_Location) REFERENCES Library.Locations(ID_Location),
    CONSTRAINT FK_Employee FOREIGN KEY (ID_Employee) REFERENCES Library.Employees(ID_Employee)
);
commit;
