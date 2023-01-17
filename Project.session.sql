use project;

SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS branch_inventory;
DROP TABLE IF EXISTS branch_office;
DROP TABLE IF EXISTS company;
DROP TABLE IF EXISTS employee;
DROP TABLE IF EXISTS product;
DROP TABLE IF EXISTS purchases;
DROP TABLE IF EXISTS requests;
DROP TABLE IF EXISTS vendors;
DROP TABLE IF EXISTS warehouse;
DROP TABLE IF EXISTS warehouse_inventory;
SET FOREIGN_KEY_CHECKS = 1;

CREATE TABLE Company (
	Company_id int UNSIGNED AUTO_INCREMENT,
	Company_name varchar(255),
	PRIMARY KEY (Company_id)
);

CREATE TABLE Employee (
	Employee_id varchar(255), 
	Name varchar(255),
	Age int,
	PRIMARY KEY (Employee_id)
);

CREATE TABLE Product (
	Product_id int,
	Product_name varchar(255),
	PRIMARY KEY (Product_id, Product_name)
);

CREATE TABLE Branch_Office (
	Branch_id int UNSIGNED AUTO_INCREMENT,
	Branch_name varchar(255),
	Branch_address varchar(255),
	PRIMARY KEY (Branch_id)
);

CREATE TABLE Branch_inventory (
	Branch_id int UNSIGNED AUTO_INCREMENT,
	Product_id int,
	Product_name varchar(255),
	Total_quantity int,
 	PRIMARY KEY (Branch_id, Product_id),
	FOREIGN KEY (Branch_id) REFERENCES Branch_office(Branch_id),
	FOREIGN KEY (Product_id, Product_name) REFERENCES Product(Product_id,
Product_name)
);

CREATE TABLE Warehouse (
	Warehouse_id int UNSIGNED AUTO_INCREMENT,
	Warehouse_address varchar(255),
	Transaction_date varchar(255),
	PRIMARY KEY (Warehouse_id)
);

CREATE TABLE Warehouse_inventory (
	Warehouse_id int UNSIGNED AUTO_INCREMENT,
	Product_id int,
	Product_name varchar(255),
	Total_quantity int,
	PRIMARY KEY (Warehouse_id, Product_id),
  FOREIGN KEY (Warehouse_id) REFERENCES Warehouse(Warehouse_id),	FOREIGN KEY (Product_id, Product_name) REFERENCES Product(Product_id, Product_name)
);

CREATE TABLE Vendors (
	Vendor_id int UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	Transaction_date varchar(255),
	Product_name varchar(255),
	Product_id int,
	Vendor_name varchar(255),
	Price int,
	FOREIGN KEY (Product_id, Product_name) REFERENCES Product(Product_id, Product_name)
);

CREATE TABLE requests (
    Product_name varchar(255), Quantity int
    );
CREATE TABLE purchases (
    Product_name varchar(255), Vendor_name varchar(255), 
    Price double
    );


INSERT INTO Company (Company_name)
VALUES (
	"FirstCompany"
);

INSERT INTO employee (Employee_id, Name, Age)
VALUES (
    "ABC12345",
    "FirstGuy",
    21
  );

INSERT INTO employee (Employee_id, Name, Age)
VALUES (
    "DEF67890",
    "SecondGuy",
    42
  );

INSERT INTO branch_office (branch_name, branch_address)
VALUES (
    "FirstBranch",
    "FirstStreet"
);

INSERT INTO warehouse (
    Warehouse_address,
    Transaction_date
  )
VALUES (
    "FirstWarehouseStreet",
    "November11"
);

INSERT INTO product (Product_id, Product_name)
VALUES (
    1,
    "Apple"
  );

INSERT INTO product (Product_id, Product_name)
VALUES (
    2,
    "Banana"
  );

INSERT INTO product (Product_id, Product_name)
VALUES (
    3,
    "Orange"
  );

INSERT INTO vendors (
    Transaction_date,
    Product_name,
    Product_id,
    Vendor_name,
    Price
  )
VALUES (
    "November13",
    "Apple",
    1,
    "AppleVendor",
    1
  );

INSERT INTO vendors (
    Transaction_date,
    Product_name,
    Product_id,
    Vendor_name,
    Price
  )
VALUES (
    "November13",
    "Banana",
    2,
    "BananaVendor",
    1
  );

INSERT INTO vendors (
    Transaction_date,
    Product_name,
    Product_id,
    Vendor_name,
    Price
  )
VALUES (
    "November13",
    "Orange",
    3,
    "OrangeVendor",
    2
  );

INSERT INTO branch_inventory (
    Branch_id,
    Product_id,
    Product_name,
    Total_quantity
  )
VALUES (
    1,
    1,
    "Apple",
    100
  );

INSERT INTO branch_inventory (
    Branch_id,
    Product_id,
    Product_name,
    Total_quantity
  )
VALUES (
    1,
    2,
    "Banana",
    50
  );

INSERT INTO branch_inventory (
    Branch_id,
    Product_id,
    Product_name,
    Total_quantity
  )
VALUES (
    1,
    3,
    "Orange",
    25
  );

INSERT INTO warehouse_inventory (
    Warehouse_id,
    Product_id,
    Product_name,
    Total_quantity
  )
VALUES (
    1,
    1,
    "Apple",
    200
  );

INSERT INTO warehouse_inventory (
    Warehouse_id,
    Product_id,
    Product_name,
    Total_quantity
  )
VALUES (
    1,
    2,
    "Banana",
    150
  );

INSERT INTO warehouse_inventory (
    Warehouse_id,
    Product_id,
    Product_name,
    Total_quantity
  )
VALUES (
    1,
    3,
    "Orange",
    50
  );