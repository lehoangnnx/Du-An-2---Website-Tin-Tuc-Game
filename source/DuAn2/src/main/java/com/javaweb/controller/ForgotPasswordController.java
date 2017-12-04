/*
* Người Tạo : Nguyễn Lê Hoàng
* Ngày Tạo : 15/11/2017
* */
package com.javaweb.controller;

import com.javaweb.model.Users;


import com.javaweb.service.SecurityService;

import com.javaweb.service.UsersService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;



@Controller
public class ForgotPasswordController {
    @Autowired
    UsersService  usersService;
    @Autowired
    UserDetailsService userDetailsService;
    @Autowired
    private AuthenticationManager authenticationManager;
    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @GetMapping("/forgotpassword/{key}")
    // Hiển thị trang lấy lại mật khẩu
    public String forgotPassword(@PathVariable("key") String key, Model model){

        Users user = null;
        try {
            user = usersService.findByForgotpassword(key);
            if (user == null){
                return "redirect:/403.html";
            }
            model.addAttribute("title", "Lấy Lại Mật Khẩu");
            model.addAttribute("key", key);
        }catch (Exception e){
            System.out.println(e.getMessage());
        }

        return "forgotpassword";
    }


   

    @PostMapping("/forgotpassword")
    // Lấy lại mật khẩu
    public String forgotPassword(@RequestParam("key") String key, @RequestParam("passwordfg") String password){
        Users user = null;

        try {
            user = usersService.findByForgotpassword(key);
            if (user != null){

                user.setPassword(passwordEncoder().encode(password));
                user.setForgotpassword("");
                usersService.saveorupdate(user);


                UserDetails userDetails = userDetailsService.loadUserByUsername(user.getUserName());
                UsernamePasswordAuthenticationToken usernamePasswordAuthenticationToken = new UsernamePasswordAuthenticationToken(userDetails, password, userDetails.getAuthorities());

                authenticationManager.authenticate(usernamePasswordAuthenticationToken);

                if (usernamePasswordAuthenticationToken.isAuthenticated()) {
                    SecurityContextHolder.getContext().setAuthentication(usernamePasswordAuthenticationToken);

                }
                return "redirect:/";
            }

        }catch (Exception e){
            System.out.println("Lỗi "+e.getMessage());
            return "redirect:/403.html";
        }

        return "redirect:/";
    }

}
