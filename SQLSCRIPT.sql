DBMS of Pharmacy Management System (single Store)

MS3: SQL scripts for creation, inserting sample data

-- Create Zip Table
CREATE TABLE Zip (
  zip_code INT NOT NULL PRIMARY KEY,
  city VARCHAR(50) NOT NULL,
  state VARCHAR(50) NOT NULL
);

-- Create Category Table
CREATE TABLE Category (
  category_id INT NOT NULL PRIMARY KEY,
  category_name VARCHAR(50) NOT NULL
);
 
-- Create Supplier Table
CREATE TABLE Supplier (
  supplier_id INT NOT NULL PRIMARY KEY,
  supplier_name VARCHAR(50) NOT NULL,
  contact_name VARCHAR(50) NOT NULL,
  contact_phone VARCHAR(20) NOT NULL,
  address VARCHAR(255) NOT NULL,
  city VARCHAR(50) NOT NULL,
  state VARCHAR(50) NOT NULL,
 zip_code INT NOT NULL REFERENCES Zip(zip_code)
);
 
-- Create Drug Table
CREATE TABLE Drug (
  drug_id INT NOT NULL PRIMARY KEY,
  drug_name VARCHAR(50) NOT NULL,
  description VARCHAR(255) NOT NULL,
  category_id INT NOT NULL REFERENCES Category(category_id),
  supplier_id INT NOT NULL REFERENCES Supplier(supplier_id),
  available_qty INT NOT NULL
);
 
-- Create Doctor Table
CREATE TABLE Doctor (
  doctor_id INT NOT NULL PRIMARY KEY,
  doctor_fname VARCHAR(50) NOT NULL,
  doctor_lname VARCHAR(50) NOT NULL,
  phone VARCHAR(20) NOT NULL,
  fax VARCHAR(20) NOT NULL,
  address VARCHAR(255) NOT NULL,
  city VARCHAR(50) NOT NULL,
  state VARCHAR(50) NOT NULL,
  zip_code INT NOT NULL REFERENCES Zip(zip_code)
);
 
 
-- Create Patients Table
CREATE TABLE Patients (
  patient_id INT NOT NULL PRIMARY KEY,
  patient_fname VARCHAR(50) NOT NULL,
  patient_lname VARCHAR(50) NOT NULL,
  phone VARCHAR(20) NOT NULL,
  address VARCHAR(255) NOT NULL,
  city VARCHAR(50) NOT NULL,
  state VARCHAR(50) NOT NULL,
 zip_code INT NOT NULL REFERENCES Zip(zip_code),
 Ins_id  INT
);

CREATE TABLE Insurance (
  ins_id INT NOT NULL PRIMARY KEY,
  provider_name VARCHAR(50) NOT NULL,
  provider_address VARCHAR(255) NOT NULL,
  provider_phone VARCHAR(20) NOT NULL,
  patient_id INT NOT NULL,
  FOREIGN KEY (patient_id) REFERENCES Patients(patient_id)
);
 
-- Create Order Table
CREATE TABLE Orders (
  order_id INT NOT NULL PRIMARY KEY,
  order_date DATE NOT NULL,
  patient_id INT NOT NULL REFERENCES Patients(patient_id),
  doctor_id INT NOT NULL REFERENCES Doctor(doctor_id),
  total DECIMAL(10, 2) NOT NULL
);
 
-- Create Payment Table
CREATE TABLE Payment (
  payment_id INT NOT NULL PRIMARY KEY,
  order_id INT NOT NULL REFERENCES Orders(order_id),
  payment_type VARCHAR(50) NOT NULL,
  payment_amount DECIMAL(10, 2) NOT NULL
);
 
-- Create Order Detail Table
CREATE TABLE Order_Detail (
  order_id INT NOT NULL,
  drug_id INT NOT NULL,
  quoted_price DECIMAL(10, 2) NOT NULL,
  quantity INT NOT NULL,
  CONSTRAINT PK_Order_Detail PRIMARY KEY (order_id, drug_id),
  FOREIGN KEY (order_id) REFERENCES Orders(order_id),
  FOREIGN KEY (drug_id) REFERENCES Drug(drug_id)
); 
 
-- Insert sample data into Category Table
INSERT INTO Category (category_id, category_name) VALUES (1, 'Antibiotics');
INSERT INTO Category (category_id, category_name) VALUES (2, 'Painkillers');
INSERT INTO Category (category_id, category_name) VALUES (3, 'Vitamins');
 
 
-- Insert sample data into Zip Table
INSERT INTO Zip (zip_code, city, state) VALUES (12345, 'Anytown', 'CA');
INSERT INTO Zip (zip_code, city, state) VALUES (67890, 'Othertown', 'CA');

-- Insert sample data into Supplier Table
INSERT INTO Supplier (supplier_id, supplier_name, contact_name, contact_phone, address, city, state, zip_code) VALUES (1, 'ABC Pharmaceuticals', 'John Smith', '555-1234', '123 Main St', 'Anytown', 'CA', 12345);
INSERT INTO Supplier (supplier_id, supplier_name, contact_name, contact_phone, address, city, state, zip_code) VALUES (2, 'XYZ Vitamins', 'Jane Doe', '555-5678', '456 Oak St', 'Othertown', 'CA', 12345);

-- Insert sample data into Drug Table
INSERT INTO Drug (drug_id, drug_name, description, category_id, supplier_id, available_qty) VALUES (1, 'Amoxicillin', 'Antibiotic for bacterial infections', 1, 1, 100);
INSERT INTO Drug (drug_id, drug_name, description, category_id, supplier_id, available_qty) VALUES (2, 'Ibuprofen', 'Painkiller for headaches and fever', 2, 1, 50);
INSERT INTO Drug (drug_id, drug_name, description, category_id, supplier_id, available_qty) VALUES (3, 'Vitamin C', 'Vitamin for immune system support', 3, 2, 200);


-- Insert sample data into PatientTable
INSERT INTO Patients (patient_id, patient_fname, patient_lname, phone, address, city, state, zip_code, ins_id) VALUES (1, 'Bob', 'Smith', '555-6789', '456 Main St', 'Anytown', 'CA', 12345, 1);
INSERT INTO Patients (patient_id, patient_fname, patient_lname, phone, address, city, state, zip_code, ins_id) VALUES (2, 'Alice', 'Jones', '555-2345', '789 Oak St', 'Othertown', 'CA', 12345, 2);
 
 
-- Insert sample data into Insurance Table
INSERT INTO Insurance (ins_id, provider_name, provider_address, provider_phone, patient_id) VALUES (1, 'Blue Cross', '789 Maple St', '555-9012', 1);
INSERT INTO Insurance (ins_id, provider_name, provider_address, provider_phone, patient_id) VALUES (2, 'Aetna', '456 Oak St', '555-3456', 2);

-- Insert sample data into Doctor Table
INSERT INTO Doctor (doctor_id, doctor_fname, doctor_lname, phone, fax, address, city, state, zip_code) VALUES (1, 'John', 'Doe', '555-7890', '555-7891', '123 Maple St', 'Anytown', 'CA', 12345);
INSERT INTO Doctor (doctor_id, doctor_fname, doctor_lname, phone, fax, address, city, state, zip_code) VALUES (2, 'Jane', 'Smith', '555-2345', '555-2346', '456 Oak St', 'Othertown', 'CA', 12345);
 
-- Insert sample data into Order Table
INSERT INTO Orders (order_id, order_date, patient_id, doctor_id, total) VALUES (1, '2022-04-10', 1, 1, 120.00);
INSERT INTO Orders (order_id, order_date, patient_id, doctor_id, total) VALUES (2, '2022-04-11', 2, 2, 30.00);
 
-- Insert sample data into Payment Table
INSERT INTO Payment (payment_id, order_id, payment_type, payment_amount) VALUES (1, 1, 'Credit Card', 120.00);
INSERT INTO Payment (payment_id, order_id, payment_type, payment_amount) VALUES (2, 2, 'Cash', 30.00);

 

-- Insert sample data into Order_Detail Table
INSERT INTO Order_Detail (order_id, drug_id, quoted_price, quantity) VALUES (1, 1, 10.00, 4);
INSERT INTO Order_Detail (order_id, drug_id, quoted_price, quantity) VALUES (1, 2, 5.00, 8);
INSERT INTO Order_Detail (order_id, drug_id, quoted_price, quantity) VALUES (2, 3, 3.00, 10);
