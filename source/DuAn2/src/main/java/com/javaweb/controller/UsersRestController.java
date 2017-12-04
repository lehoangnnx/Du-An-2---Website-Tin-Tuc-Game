/*
* Người Tạo : Nguyễn Lê Hoàng
* Ngày Tạo : 15/11/2017
* */
package com.javaweb.controller;

import com.javaweb.model.Users;
import com.javaweb.service.RolesService;
import com.javaweb.service.UsersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.util.HtmlUtils;

import java.util.Arrays;

@RestController
public class UsersRestController {
    @Autowired
    UsersService usersService;
    @Autowired
    PasswordEncoder passwordEncoder;
    @PostMapping("/validator-user")
    // Kiểm tra email người dùng bị trùng
    public String validatorUser(@RequestBody Users user,Authentication authentication ) {

        String error = "erroremail";
        try {
            Users u = usersService.findByEmail(user.getEmail());
            if(u == null || u.getUserId().equals(usersService.findByUserName(authentication.getName()).getUserId())) {
                error = "successemail";
            }
        } catch (Exception e) {
            error = "successemail";
            System.out.println(e.getMessage());

        }
        return error;
    }
    @PostMapping("/validator-password")
    // Kiểm tra mật khẩu cũ
    public String validatorPassword(@RequestBody Users user,Authentication authentication ) {

        String error = "errorpassword";
        try {
            Users u = usersService.findByUserName(authentication.getName());
            if(passwordEncoder.matches(user.getPassword(),u.getPassword())) {
                error = "successpassword";
            }

        } catch (Exception e) {
            System.out.println(e.getMessage());

        }

        return error;
    }
    @PostMapping("/changepassword")
    // Sửa mật khẩu
    public String changePassword(@RequestBody Users user,Authentication authentication ) {

        String error = "error";
        try {
            Users u = usersService.findByUserName(authentication.getName());

            u.setPassword(passwordEncoder.encode(user.getPassword()));
            usersService.saveorupdate(u);

            error = "success";
        } catch (Exception e) {
            System.out.println(e.getMessage());

        }
        return error;
    }
}
