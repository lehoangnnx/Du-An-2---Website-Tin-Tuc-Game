package com.javaweb.controller;

import com.javaweb.model.Users;
import com.javaweb.service.UsersService;
import org.apache.catalina.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class ForgotPassword {
    @Autowired
    UsersService  usersService;
    @GetMapping("/forgotpassword/{key}")
    public String forgotPassword(@PathVariable("key") String key){
        Users user = null;
        try {
            user = usersService.findByForgotpassword(key);
            if (user == null){
                return "redirect:/403";
            }
        }catch (Exception e){
            System.out.println(e.getMessage());
        }

        return "forgotpassword";
    }

   
}
