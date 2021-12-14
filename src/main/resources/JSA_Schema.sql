-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema JSA
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema JSA
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `JSA` DEFAULT CHARACTER SET utf8 ;
USE `JSA` ;

-- -----------------------------------------------------
-- Table `JSA`.`EMPLOYEES`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `JSA`.`EMPLOYEES` (
  `EMP_ID` INT NOT NULL AUTO_INCREMENT,
  `EMP_FNAME` VARCHAR(45) NULL,
  `EMP_LNAME` VARCHAR(45) NULL,
  `EMP_DOB` DATE NULL,
  `EMP_GENDER` VARCHAR(6) NULL,
  `EMP_PHONE` VARCHAR(45) NULL,
  `EMP_ADDR` VARCHAR(45) NULL,
  PRIMARY KEY (`EMP_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `JSA`.`CUSTOMERS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `JSA`.`CUSTOMERS` (
  `CUST_ID` INT NOT NULL AUTO_INCREMENT,
  `CUST_FNAME` VARCHAR(45) NULL,
  `CUST_LNAME` VARCHAR(45) NULL,
  `CUST_DOB` DATE NULL,
  `CUST_GENDER` VARCHAR(6) NULL,
  `CUST_PHONE` VARCHAR(45) NULL,
  `CUST_ADDR` VARCHAR(45) NULL,
  PRIMARY KEY (`CUST_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `JSA`.`BRANDS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `JSA`.`BRANDS` (
  `BRAND_ID` INT NOT NULL AUTO_INCREMENT,
  `BRAND_NAME` VARCHAR(45) NULL,
  `BRAND_SPECIALTY` VARCHAR(45) NULL,
  PRIMARY KEY (`BRAND_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `JSA`.`PRODUCT`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `JSA`.`PRODUCT` (
  `PROD_ID` INT NOT NULL AUTO_INCREMENT,
  `PROD_TYPE` VARCHAR(45) NULL,
  `PROD_PRICE` DECIMAL(6,2) NULL,
  `PROD_COLOR` VARCHAR(45) NULL,
  `BRAND_ID` INT NULL,
  PRIMARY KEY (`PROD_ID`),
  INDEX `BRAND_ID_idx` (`BRAND_ID` ASC) VISIBLE,
  CONSTRAINT `PROD_BRAND_ID`
    FOREIGN KEY (`BRAND_ID`)
    REFERENCES `JSA`.`BRANDS` (`BRAND_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `JSA`.`DISCOUNT`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `JSA`.`DISCOUNT` (
  `DISC_ID` INT NOT NULL AUTO_INCREMENT,
  `DISC_CODE` VARCHAR(45) NULL,
  `DISC_EXPIRY` DATE NULL,
  `DISC_REDEEMED` TINYINT NULL,
  `DISC_AMT` DECIMAL(6,2) NULL,
  PRIMARY KEY (`DISC_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `JSA`.`SALES`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `JSA`.`SALES` (
  `SALE_ID` INT NOT NULL AUTO_INCREMENT,
  `SALE_DATE` DATE NULL,
  `SALE_AMOUNT` DECIMAL(8) NULL,
  `SALE_TAX` DECIMAL(6,2) NULL,
  `SALE_TYPE` VARCHAR(45) NULL,
  `PROD_ID` INT NULL,
  `CUST_ID` INT NOT NULL,
  `SALE_COMMISSION` DECIMAL(6,2) NULL,
  `EMP_ID` INT NULL,
  `SALE_DISCOUNT` DECIMAL(6,2) NULL,
  `DISC_ID` INT NULL,
  PRIMARY KEY (`SALE_ID`, `CUST_ID`),
  INDEX `CUST_ID_idx` (`CUST_ID` ASC) VISIBLE,
  INDEX `PROD_ID_idx` (`PROD_ID` ASC) VISIBLE,
  INDEX `EMP_ID_idx` (`EMP_ID` ASC) VISIBLE,
  INDEX `DISC_ID_idx` (`DISC_ID` ASC) VISIBLE,
  CONSTRAINT `SALE_PROD_ID`
    FOREIGN KEY (`PROD_ID`)
    REFERENCES `JSA`.`PRODUCT` (`PROD_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `SALE_CUST_ID`
    FOREIGN KEY (`CUST_ID`)
    REFERENCES `JSA`.`CUSTOMERS` (`CUST_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `SALE_EMP_ID`
    FOREIGN KEY (`EMP_ID`)
    REFERENCES `JSA`.`EMPLOYEES` (`EMP_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `SALE_DISC_ID`
    FOREIGN KEY (`DISC_ID`)
    REFERENCES `JSA`.`DISCOUNT` (`DISC_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `JSA`.`SUPPLIERS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `JSA`.`SUPPLIERS` (
  `SUPP_ID` INT NOT NULL,
  `SUPP_NAME` VARCHAR(45) NULL,
  `SUPP_PRODUCTS` VARCHAR(45) NULL,
  PRIMARY KEY (`SUPP_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `JSA`.`INVENTORY`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `JSA`.`INVENTORY` (
  `INV_ID` INT NOT NULL AUTO_INCREMENT,
  `INV_STOCK_AMT` INT NULL,
  `INV_BACKORDER_AMT` INT NULL,
  `INV_NEXT_SHIPMENT_DATE` DATE NULL,
  `PROD_ID` INT NULL,
  PRIMARY KEY (`INV_ID`),
  INDEX `PRODUCT_ID_idx` (`PROD_ID` ASC) VISIBLE,
  CONSTRAINT `INV_PROD_ID`
    FOREIGN KEY (`PROD_ID`)
    REFERENCES `JSA`.`PRODUCT` (`PROD_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `JSA`.`CLOTHING`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `JSA`.`CLOTHING` (
  `CLOTH_ID` INT NOT NULL AUTO_INCREMENT,
  `CLOTH_SIZE` VARCHAR(45) NULL,
  `CLOTH_MATERIAL` VARCHAR(45) NULL,
  `CLOTH_GENDER` VARCHAR(45) NULL,
  `PROD_ID` INT NULL,
  PRIMARY KEY (`CLOTH_ID`),
  INDEX `PROD_ID_idx` (`PROD_ID` ASC) VISIBLE,
  CONSTRAINT `CLOTH_PROD_ID`
    FOREIGN KEY (`PROD_ID`)
    REFERENCES `JSA`.`PRODUCT` (`PROD_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `JSA`.`ACCESSORIES`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `JSA`.`ACCESSORIES` (
  `ACC_ID` INT NOT NULL AUTO_INCREMENT,
  `ACC_NAME` VARCHAR(45) NULL,
  `ACC_TYPE` VARCHAR(45) NULL,
  `PROD_ID` INT NULL,
  `ACC_SIZE` VARCHAR(45) NULL,
  `ACC_WEIGHT` VARCHAR(45) NULL,
  PRIMARY KEY (`ACC_ID`),
  INDEX `PROD_ID_idx` (`PROD_ID` ASC) VISIBLE,
  CONSTRAINT `ACC_PROD_ID`
    FOREIGN KEY (`PROD_ID`)
    REFERENCES `JSA`.`PRODUCT` (`PROD_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `JSA`.`DISTRIBUTORS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `JSA`.`DISTRIBUTORS` (
  `DIST_ID` INT NOT NULL,
  `SUPP_ID` INT NULL,
  `PROD_ID` INT NULL,
  `DIST_PROD_COST` DECIMAL NULL,
  PRIMARY KEY (`DIST_ID`),
  INDEX `SUPP_ID_idx` (`SUPP_ID` ASC) VISIBLE,
  INDEX `PROD_ID_idx` (`PROD_ID` ASC) VISIBLE,
  CONSTRAINT `DIST_SUPP_ID`
    FOREIGN KEY (`SUPP_ID`)
    REFERENCES `JSA`.`SUPPLIERS` (`SUPP_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `DIST_PROD_ID`
    FOREIGN KEY (`PROD_ID`)
    REFERENCES `JSA`.`PRODUCT` (`PROD_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `JSA`.`PAYROLL`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `JSA`.`PAYROLL` (
  `EMP_ID` INT NOT NULL,
  `PAY_RATE` DECIMAL(6,2) NULL,
  `PAY_HRS_WRK` INT NULL,
  `PAY_COMMISSION` DECIMAL(6,2) NULL,
  `PAY_TOTAL` DECIMAL(6,2) NULL,
  PRIMARY KEY (`EMP_ID`),
  CONSTRAINT `PAY_EMP_ID`
    FOREIGN KEY (`EMP_ID`)
    REFERENCES `JSA`.`EMPLOYEES` (`EMP_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `JSA`.`CART`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `JSA`.`CART` (
  `CUS_ID` INT NOT NULL,
  `PROD_ID` INT NOT NULL,
  INDEX `CART_CUS_ID_idx` (`CUS_ID` ASC) VISIBLE,
  INDEX `CART_PROD_ID_idx` (`PROD_ID` ASC) VISIBLE,
  CONSTRAINT `CART_CUS_ID`
    FOREIGN KEY (`CUS_ID`)
    REFERENCES `JSA`.`CUSTOMERS` (`CUST_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `CART_PROD_ID`
    FOREIGN KEY (`PROD_ID`)
    REFERENCES `JSA`.`PRODUCT` (`PROD_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
SET SQL_SAFE_UPDATES = 0; 

-- Procedures
DROP PROCEDURE IF EXISTS make_sale;
DELIMITER $$
CREATE PROCEDURE make_sale (
	IN cus_id INT,
    IN prod_id INT,
    IN emp_id INT,
    IN sale_type VARCHAR(45)
    )
BEGIN
DECLARE prod_price DECIMAL(8) DEFAULT 0.0;
DECLARE emp_commission DECIMAL(8) DEFAULT 0.0;
DECLARE tax DECIMAL(8) DEFAULT 0.0;
DECLARE total_amt DECIMAL(8) DEFAULT 0.0;

SELECT PROD_PRICE INTO prod_price FROM PRODUCT WHERE PROD_ID = prod_id;
SET emp_commission = prod_price * .2;
SET tax = prod_price * .06;
SET total_amt = prod_price + tax;

INSERT INTO SALES (SALE_ID, SALE_DATE, SALE_AMOUNT, SALE_TAX, SALE_TYPE, PROD_ID, CUST_ID, SALE_COMMISSION, EMP_ID)
	VALUES (FLOOR(RAND()*(100000-1000+1))+1000, CURDATE(), total_amt, tax, sale_type, prod_id, cus_id, emp_commission, emp_id);
    
UPDATE PAYROLL SET PAY_COMMISSION = PAY_COMMISSION + emp_commission, PAY_TOTAL = PAY_TOTAL + emp_commission
	WHERE EMP_ID = emp_id;

UPDATE INVENTORY SET INV_STOCK_AMT = INV_STOCK_AMT - 1 WHERE PROD_ID = prod_id;

DELETE FROM CART WHERE CUS_ID = cus_id AND PROD_ID = prod_id;

END$$
DELIMITER ;


DROP PROCEDURE IF EXISTS make_sale_with_discount;
DELIMITER $$
CREATE PROCEDURE make_sale_with_discount (
	IN cus_id INT,
    IN prod_id INT,
    IN emp_id INT,
    IN disc_code VARCHAR(45),
    IN sale_type VARCHAR(45)
    )
BEGIN
DECLARE prod_price DECIMAL(8) DEFAULT 0.0;
DECLARE emp_commission DECIMAL(8) DEFAULT 0.0;
DECLARE disc_expiry DATE;
DECLARE disc_redeemed TINYINT;
DECLARE disc_amt DECIMAL(8) DEFAULT 0.0;
DECLARE disc_id INT;
DECLARE tax DECIMAL(8) DEFAULT 0.0;
DECLARE total_amt DECIMAL(8) DEFAULT 0.0;

SELECT DISC_ID, DISC_EXPIRY, DISC_REDEEMED, DISC_AMT INTO disc_id, disc_expiry, disc_redeemed, disc_amt
FROM DISCOUNT WHERE DISC_CODE = disc_code;

SELECT PROD_PRICE INTO prod_price FROM PRODUCT WHERE PROD_ID = prod_id;

SET prod_price = prod_price - disc_amt;
SET emp_commission = prod_price * .2;
SET tax = prod_price * .06;
SET total_amt = prod_price + tax;

INSERT INTO SALES 
	VALUES (FLOOR(RAND()*(100000-1000+1))+1000, CURDATE(), total_amt, tax, sale_type, prod_id, cus_id, emp_commission, emp_id, disc_amt, disc_id);
    
UPDATE PAYROLL SET PAY_COMMISSION = PAY_COMMISSION + emp_commission, PAY_TOTAL = PAY_TOTAL + emp_commission
	WHERE EMP_ID = emp_id;

UPDATE INVENTORY SET INV_STOCK_AMT = INV_STOCK_AMT - 1 WHERE PROD_ID = prod_id;

DELETE FROM CART WHERE CUS_ID = cus_id AND PROD_ID = prod_id;

END$$
DELIMITER ;

-- Sample Data

INSERT INTO CUSTOMERS VALUES (
'1979', 'John', 'Doe', '1998-08-17', 'Male', '313-555-8952', '123 Forest Hills Drive'
);
INSERT INTO CUSTOMERS VALUES (
'1825', 'Jane', 'James', '1982-10-05', 'Female', '313-852-2233',  '630 Mulberry Lane'
);
 
INSERT INTO EMPLOYEES VALUES (
'2867', 'Sam', 'Davis', '1992-11-10', 'Male', '313-456-7890',  '841 Sleepy Hollow Road'
);
INSERT INTO EMPLOYEES VALUES (
'2889', 'Jessica', 'Johnson', '1988-01-17', 'Female', '313-123-5555', '2215 Woodward'
);

INSERT INTO BRANDS (BRAND_ID, BRAND_NAME, BRAND_SPECIALTY) VALUES (
899, 'Adidas' , 'Athletic Wear');
 
INSERT INTO PRODUCT (PROD_ID, PROD_TYPE, PROD_PRICE, PROD_COLOR, BRAND_ID) VALUES
(255, 'Shirt' , 25.99, 'purple', 899);
 
INSERT INTO INVENTORY (INV_ID, INV_STOCK_AMT, PROD_ID) VALUES
(422, 50 , 255);
-- ======================================================================
INSERT INTO BRANDS (BRAND_ID, BRAND_NAME, BRAND_SPECIALTY) VALUES
(865, 'Champion' , 'Athletic Wear');
 
INSERT INTO PRODUCT (PROD_ID, PROD_TYPE, PROD_PRICE, PROD_COLOR, BRAND_ID) VALUES
(211, 'Hoodie', 59.99, 'red' , 865);
 
INSERT INTO INVENTORY (INV_ID, INV_STOCK_AMT, PROD_ID) VALUES
(431, 20 , 211);
-- =====================================================================
INSERT INTO BRANDS (BRAND_ID, BRAND_NAME, BRAND_SPECIALTY) VALUES
(874, 'NordicTrack' , 'Workout Equipment');
 
INSERT INTO PRODUCT (PROD_ID, PROD_TYPE, PROD_PRICE, PROD_COLOR, BRAND_ID) VALUES
(284, 'dumbbell', 16.00, 'black', 874);
 
INSERT INTO INVENTORY (INV_ID, INV_STOCK_AMT, PROD_ID) VALUES
(455, 15, 284);
 
-- ==================================================================================
 
INSERT INTO BRANDS (BRAND_ID, BRAND_NAME, BRAND_SPECIALTY) VALUES
(842, 'Nike' , 'Athletic Wear');
 
INSERT INTO PRODUCT (PROD_ID, PROD_TYPE, PROD_PRICE, PROD_COLOR, BRAND_ID) VALUES
(288, 'shorts', 32.00, 'gray', 842);
 
INSERT INTO INVENTORY (INV_ID, INV_STOCK_AMT, PROD_ID) VALUES
(401 , 100 , 288);
-- =================================================================================
INSERT INTO BRANDS (BRAND_ID, BRAND_NAME, BRAND_SPECIALTY) VALUES
(817, 'Under Armor' , 'Accessories');
 
INSERT INTO PRODUCT (PROD_ID, PROD_TYPE, PROD_PRICE, PROD_COLOR, BRAND_ID) VALUES
(214, 'duffle bag', 40.00, 'blue', 817);
 

INSERT INTO INVENTORY (INV_ID, INV_STOCK_AMT, PROD_ID) VALUES
(489, 40, 214);