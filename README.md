# PharmacyDatabase

This repository contains the SQL script and Entity relationship diagram for a single 
pharmacy store. The following is a summary of the business rules for the pharmacy
database:

1. A Category can have many Drugs, and each Drug can belong to only one Category. Each
Category must have at least one Drug.
2. A Drug can have only one Category, but one Category can have many Drugs. Each Drug must
have one Supplier, but one Supplier can supply many Drugs.
3. A Supplier can supply many Drugs, but one Drug can be supplied by only one Supplier. Each
Supplier must supply at least one Drug and must have at least one Zip Code in which they
operate.
4. An Insurance provider can have many Customers, and one Customer can have only one
Insurance provider.
5. A Customer can place many Orders, but each Order can be placed by only one Customer.
Each Customer must have one Insurance provider and must place at least one Order.
6. A Doctor can place many Orders, but each Order can be placed by only one Doctor. Each
Order must be placed by one Doctor.
7. An Order can be placed by only one Customer, but one Customer can place many Orders. One
Order can be placed by only one Doctor, but one Doctor can place many Orders. Each Order
must have at least one Order Detail and at least one Payment.
8. A Payment belongs to only one Order, but one Order can have many Payments.
9. An Order Detail belongs to only one Order, but one Order can have many Order Details. One
Order Detail can be associated with only one Drug, but one Drug can have many Order
Details.
10. A Zip Code can be associated with many Customers, Doctors, and Suppliers, but each
Customer, Doctor, and Supplier can be associated with only one Zip Code.


These business rules help to ensure data integrity and maintain consistency in the pharmacy
database. By following these rules, the database can accurately track the various entities involved in
the pharmacy business, such as drugs, suppliers, customers, and orders
