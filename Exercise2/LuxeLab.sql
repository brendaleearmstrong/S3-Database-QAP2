-- Database: LuxeLab Client and Product Management System (3NF)
-- Create Tables

CREATE TABLE Province (
    ProvinceID SERIAL PRIMARY KEY,
    Name VARCHAR(255) NOT NULL
);

CREATE TABLE Client (
    ClientID SERIAL PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Email VARCHAR(255),
    Phone VARCHAR(255),
    Address VARCHAR(255),
    ProvinceID INT,
    FOREIGN KEY (ProvinceID) REFERENCES Province(ProvinceID)
);

CREATE TABLE EyelashStyle (
    EyelashStyleID SERIAL PRIMARY KEY,
    Type VARCHAR(255) NOT NULL,
    Length VARCHAR(255),
    Curl VARCHAR(255),
    Color VARCHAR(255)
);

CREATE TABLE HairExtensionStyle (
    HairExtensionStyleID SERIAL PRIMARY KEY,
    Color VARCHAR(255) NOT NULL,
    Length VARCHAR(255),
    Style VARCHAR(255),
    Type VARCHAR(255)
);

CREATE TABLE Preference (
    PreferenceID SERIAL PRIMARY KEY,
    ClientID INT,
    EyelashStyleID INT,
    HairExtensionStyleID INT,
    AdditionalNotes TEXT,
    FOREIGN KEY (ClientID) REFERENCES Client(ClientID),
    FOREIGN KEY (EyelashStyleID) REFERENCES EyelashStyle(EyelashStyleID),
    FOREIGN KEY (HairExtensionStyleID) REFERENCES HairExtensionStyle(HairExtensionStyleID)
);

CREATE TABLE Stylist (
    StylistID SERIAL PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Email VARCHAR(255),
    Phone VARCHAR(255),
    Expertise VARCHAR(255)
);

CREATE TABLE Service (
    ServiceID SERIAL PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Description TEXT,
    Duration INTERVAL,
    Price DECIMAL(10, 2)
);

CREATE TABLE Appointment (
    AppointmentID SERIAL PRIMARY KEY,
    ClientID INT,
    StylistID INT,
    AppointmentDate TIMESTAMP NOT NULL,
    ServiceID INT,
    Notes TEXT,
    FOREIGN KEY (ClientID) REFERENCES Client(ClientID),
    FOREIGN KEY (StylistID) REFERENCES Stylist(StylistID),
    FOREIGN KEY (ServiceID) REFERENCES Service(ServiceID)
);

CREATE TABLE Supplier (
    SupplierID SERIAL PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    ContactInfo VARCHAR(255),
    Email VARCHAR(255),
    Phone VARCHAR(255),
    Address VARCHAR(255)
);

CREATE TABLE Product (
    ProductID SERIAL PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Description TEXT,
    Price DECIMAL(10, 2) NOT NULL,
    Quantity INT NOT NULL,
    SupplierID INT,
    FOREIGN KEY (SupplierID) REFERENCES Supplier(SupplierID)
);

CREATE TABLE ProductInventory (
    InventoryID SERIAL PRIMARY KEY,
    ProductID INT,
    StockLevel INT NOT NULL,
    LastUpdated TIMESTAMP NOT NULL,
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);

CREATE TABLE AppointmentProduct (
    AppointmentProductID SERIAL PRIMARY KEY,
    AppointmentID INT,
    ProductID INT,
    Quantity INT,
    FOREIGN KEY (AppointmentID) REFERENCES Appointment(AppointmentID),
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);

CREATE TABLE ClientHistory (
    HistoryID SERIAL PRIMARY KEY,
    ClientID INT,
    AppointmentID INT,
    ServiceDetails TEXT,
    Date TIMESTAMP NOT NULL,
    FOREIGN KEY (ClientID) REFERENCES Client(ClientID),
    FOREIGN KEY (AppointmentID) REFERENCES Appointment(AppointmentID)
);
