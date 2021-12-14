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