package com.javaweb.controller;

import com.javaweb.model.Users;
import com.javaweb.service.RolesService;
import com.javaweb.service.UsersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.util.HtmlUtils;

@RestController
public class UsersRestController {
    @Autowired
    UsersService usersService;
    @Autowired
    PasswordEncoder passwordEncoder;
    @PostMapping("/validator-user")
    public String validatorUser(@RequestBody Users user ) {

        String error = "erroremail";
        try {
            Users u = usersService.findByEmail(user.getEmail());
            if(u == null || u.getUserId().equals(user.getUserId())) {
                error = "successemail";
            }
        } catch (Exception e) {
            error = "successemail";
            System.out.println(e.getMessage());

        }
        return error;
    }
    @PostMapping("/validator-password")
    public String validatorPassword(@RequestBody Users user ) {

        String error = "errorpassword";
        try {
            Users u = usersService.findByUserId(user.getUserId());
            System.out.println("PASSSWOrD : "+user.getPassword());

            System.out.println("PASSWORD ENCODING : " + user.getPassword());
            if(passwordEncoder.matches(user.getPassword(),u.getPassword())) {
                error = "successpassword";
            }

        } catch (Exception e) {
            System.out.println(e.getMessage());

        }

        return error;
    }
}
