package com.store.jsa.mysql;

public class Queries {
    
    public static String GET_ALL_PRODUCTS = "SELECT * FROM PRODUCT LEFT JOIN CLOTHING USING (PROD_ID) LEFT JOIN ACCESSORIES USING(PROD_ID) LEFT JOIN BRANDS USING(BRAND_ID);";

    public static String GET_PRODUCTS_BY_ = "";

    public static String GET_CART_BY_CUSTOMERID = "SELECT * FROM CART WHERE CUS_ID = ?;";

    public static String GET_ALL_CUSTOMERS = "SELECT * FROM CUSTOMERS;";

    public static String GET_ALL_EMPLOYEES = "SELECT * FROM EMPLOYEES;";

    public static String GET_ALL_SALES = "SELECT * FROM SALES;";

    public static String GET_SALES_BY_CUSTOMER = "SELECT * FROM SALES WHERE CUST_ID = ?;";

    public static String GET_SALES_BY_EMPLOYEE = "SELECT * FROM SALES WHERE EMP_ID = ?;";

    public static String GET_ALL_INVENTORY = "SELECT * FROM INVENTORY;";

    public static String GET_ALL_PAYROLL = "SELECT * FROM PAYROLL;";

    public static String GET_ALL_DISCOUNT = "SELECT * FROM DISCOUNT;";

    public static String INSERT_CUSTOMER = "INSERT INTO CUSTOMERS VALUES (?, ?, ?, ?, ?', ?, ?);";

    public static String INSERT_EMPLOYEE = "INSERT INTO EMPLOYEES VALUES (?, ?, ?, ?, ?', ?, ?);";

    public static String INSERT_TO_CART = "INSERT INTO CART VALUES (?, ?);";

    public static String MAKE_SALE = "CALL make_sale(?, ?, ?, ?)";

    public static String MAKE_DISCOUNT_SALE = "CALL make_sale_with_discount(?, ?, ?, ?, ?)";


}
