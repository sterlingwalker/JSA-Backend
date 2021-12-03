package com.store.jsa.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class StoreController {
    
    @RequestMapping("/")    
    public String index() {  
        return "index.html";  
    }  

    @RequestMapping("/login")  
    public String login() {  
        return "login.html";  
    }  

    @GetMapping("/login-error.html")  
    public String loginError(Model model) {  
        model.addAttribute("loginError", true);  
        return "login.html";  
    }  
}
