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
  `EMP_ID` INT NOT NULL,
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
  `CUST_ID` INT NOT NULL,
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
  `BRAND_ID` INT NOT NULL,
  `BRAND_NAME` VARCHAR(45) NULL,
  `BRAND_SPECIALTY` VARCHAR(45) NULL,
  PRIMARY KEY (`BRAND_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `JSA`.`PRODUCT`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `JSA`.`PRODUCT` (
  `PROD_ID` INT NOT NULL,
  `PROD_TYPE` VARCHAR(45) NULL,
  `PROD_PRICE` DECIMAL(8) NULL,
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
  `DISC_ID` INT NOT NULL,
  `DISC_CODE` VARCHAR(45) NULL,
  `DISC_EXPIRY` DATE NULL,
  `DISC_REDEEMED` TINYINT NULL,
  PRIMARY KEY (`DISC_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `JSA`.`SALES`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `JSA`.`SALES` (
  `SALE_ID` INT NOT NULL,
  `SALE_DATE` DATE NULL,
  `SALE_AMOUNT` DECIMAL(8) NULL,
  `SALE_TAX` DECIMAL(8) NULL,
  `SALE_TYPE` VARCHAR(45) NULL,
  `PROD_ID` INT NULL,
  `CUST_ID` INT NOT NULL,
  `SALE_COMMISSION` DECIMAL NULL,
  `EMP_ID` INT NULL,
  `SALE_DISCOUNT` DECIMAL NULL,
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
  `INV_ID` INT NOT NULL,
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
  `CLOTH_ID` INT NOT NULL,
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
  `ACC_ID` INT NOT NULL,
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
  `PAY_RATE` DECIMAL NULL,
  `PAY_HRS_WRK` INT NULL,
  `PAY_COMMISSION` DECIMAL NULL,
  `PAY_TOTAL` DECIMAL NULL,
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
