/*
* Người Tạo : Nguyễn Lê Hoàng
* Ngày Tạo : 17/11/2017
* */
package com.javaweb.controller;

import com.javaweb.model.Roles;
import com.javaweb.model.Users;
import com.javaweb.service.RolesService;
import com.javaweb.service.SecurityService;
import com.javaweb.service.UsersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.util.HtmlUtils;

import java.util.Date;
import java.util.HashSet;

@RestController
public class RegisterRestController {
    @Autowired
    UsersService usersService;
    @Autowired
    RolesService rolesService;

    @Autowired
    SecurityService securityService;
    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @PostMapping("/register")
    // Kiểm tra username và email đăng ký
    public String register(@RequestBody Users user) {

        Users findByUserName = null;
        Users findByEmail = null;
        try {
            findByUserName = usersService.findByUserName(user.getUserName());
            findByEmail = usersService.findByEmail(user.getEmail());

            if (!user.getUserName().equals("") && findByUserName != null
                    && !user.getEmail().equals("") && findByEmail != null) {
                return "errorUserNameAndEmail";

            } else if (!user.getUserName().equals("") && findByUserName != null) {
                return "errorUserName";
            } else if (!user.getEmail().equals("") && findByEmail != null) {
                return "errorEmail";
            } else if (user.getPassword().equals("")) {

                return "error";

            } else if (user.getUserName().equals("")) {
                return "error";
            } else if (user.getEmail().equals("")) {
                return "error";
            } else {
                Users users = new Users();
                users.setUserName(HtmlUtils.htmlEscape(user.getUserName()));
                users.setEmail(HtmlUtils.htmlEscape(user.getEmail()));
                users.setPassword(passwordEncoder().encode(user.getPassword()));


                users.setAvatar("default.png");
                users.setStatus("active");
                users.setCreatedDate(new Date());
                users.setLoggedInDate(new Date());
                users.setIsOnline((byte) 1);
                HashSet<Roles> roleses = new HashSet<>();
                roleses.add(rolesService.findByName("ROLE_MEMBER"));
                users.setRoleses(roleses);
                usersService.saveorupdate(users);
               securityService.autologin(user.getUserName(), user.getPassword());
                return "success";
            }
        } catch (Exception e) {
            return "error";
        }


    }


}
