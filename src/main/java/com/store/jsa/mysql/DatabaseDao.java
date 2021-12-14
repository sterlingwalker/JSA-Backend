package com.store.jsa.mysql;

import java.util.List;

import com.store.jsa.models.CartEntry;
import com.store.jsa.models.Customer;
import com.store.jsa.models.Discount;
import com.store.jsa.models.Employee;
import com.store.jsa.models.InventoryEntry;
import com.store.jsa.models.PayrollEntry;
import com.store.jsa.models.Product;
import com.store.jsa.models.Sale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.jdbc.core.JdbcTemplate;

@Repository
public class DatabaseDao {

    @Autowired private JdbcTemplate jdbc;
    

    public List<Product> getAllProducts() {
        return jdbc.query(Queries.GET_ALL_PRODUCTS, Product.mapper);
    }

    public Product getProductColor(String c) {
        return jdbc.queryForObject("sql", Product.mapper, c);
    }

    public Product getProductSize(String s) {
        return jdbc.queryForObject("sql", Product.mapper, s);
    }

    public Product getProductType(String t) {
        return jdbc.queryForObject("sql", Product.mapper, t);
    }

    public Product getProductGender(String g) {
        return jdbc.queryForObject("sql", Product.mapper, g);
    }

    public Product getProductWeight(String w) {
        return jdbc.queryForObject("sql", Product.mapper, w);
    }

    public List<Sale> getAllSales() {
        return jdbc.query(Queries.GET_ALL_SALES, Sale.mapper);
    }

    public List<Sale> getCustomerOrderHistory(int custId) {
        return jdbc.query(Queries.GET_SALES_BY_CUSTOMER, Sale.mapper, custId);
    }

    public List<Sale> getEmployeeOrderHistory(int empId) {
        return jdbc.query(Queries.GET_SALES_BY_CUSTOMER, Sale.mapper, empId);
    }

    public List<InventoryEntry> getAllInventory() {
        return jdbc.query(Queries.GET_ALL_INVENTORY, InventoryEntry.mapper);
    }

    public List<PayrollEntry> getAllPayroll() {
        return jdbc.query(Queries.GET_ALL_PAYROLL, PayrollEntry.mapper);
    }

    public List<Discount> getAllDiscounts() {
        return jdbc.query(Queries.GET_ALL_DISCOUNT, Discount.mapper);
    }

    public List<Employee> getAllEmployees() {
        return jdbc.query(Queries.GET_ALL_EMPLOYEES, Employee.mapper);
    }

    public List<Customer> getAllCustomers() {
        return jdbc.query(Queries.GET_ALL_CUSTOMERS, Customer.mapper);
    }

    public List<CartEntry> getCustomerCart(int customerId) {
        return jdbc.query(Queries.GET_CART_BY_CUSTOMERID, CartEntry.mapper);
    }

    public void insertEmployee(Employee e) {
        jdbc.update(Queries.INSERT_EMPLOYEE, e.getEmployeeId(), e.getEmpFname(), e.getEmpLname(), e.getEmpDOB(), e.getEmpGender(), e.getEmpPhone(), e.getEmpAddr());
    }

    public void insertCustomer(Customer c) {
        jdbc.update(Queries.INSERT_EMPLOYEE, c.getCustomerId(), c.getCusFname(), c.getCusLname(), c.getCusDOB(), c.getCusGender(), c.getCusPhone(), c.getCusAddr());
    }

    public void addToCart(CartEntry c) {
        jdbc.update(Queries.INSERT_TO_CART, c.getCustomerId(), c.getProductId());
    }

    public void makeSale(int customerId, int productId, int employeeId, String saleType) {
        jdbc.update(Queries.MAKE_SALE, customerId, productId, employeeId, saleType);
    }

    public void makeDiscountSale(int customerId, int productId, int employeeId, String discCode, String saleType) {
        jdbc.update(Queries.MAKE_DISCOUNT_SALE, customerId, productId, employeeId, discCode, saleType);
    }
}
