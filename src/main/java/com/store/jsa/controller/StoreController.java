package com.store.jsa.controller;

import java.util.List;

import com.store.jsa.models.Customer;
import com.store.jsa.models.Employee;
import com.store.jsa.models.InventoryEntry;
import com.store.jsa.models.PayrollEntry;
import com.store.jsa.models.Product;
import com.store.jsa.models.Sale;
import com.store.jsa.mysql.DatabaseDao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class StoreController {

    @Autowired private DatabaseDao databaseDao;
    
    @GetMapping("/")    
    public String index() {  
        return "index.html";  
    }  

    @GetMapping("/login")  
    public String login() {  
        return "login.html";  
    }
    
    @GetMapping("/cart")
    public String cart() {
        return "cart.html";
    }

    @GetMapping("/admin")
    public String admin() {
        return "admin.html";
    }

    @GetMapping("/login-error.html")  
    public String loginError(Model model) {  
        model.addAttribute("loginError", true);  
        return "login.html";  
    }
    
    @GetMapping("/products")
    @ResponseBody
    public List<Product> getAllProducts() {
        return databaseDao.getAllProducts();
    }

    @GetMapping("/sales")
    @ResponseBody
    public List<Sale> getAllSales() {
        return databaseDao.getAllSales();
    }

    @GetMapping("/inventory")
    @ResponseBody
    public List<InventoryEntry> getAllInventory() {
        return databaseDao.getAllInventory();
    }

    @GetMapping("/payroll")
    @ResponseBody
    public List<PayrollEntry> getAllPayroll() {
        return databaseDao.getAllPayroll();
    }

    @PostMapping("/employee")
    @ResponseBody
    public void addNewEmployee(@RequestBody Employee employee) {
        databaseDao.insertEmployee(employee);
    }

    @PostMapping("/customer")
    @ResponseBody
    public void addNewCustomer(@RequestBody Customer customer) {
        databaseDao.insertCustomer(customer);
    }
}
