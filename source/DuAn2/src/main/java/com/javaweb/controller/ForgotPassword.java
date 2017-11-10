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

import java.util.Arrays;

@Controller
public class ForgotPassword {
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

    public String forgotPassword(@PathVariable("key") String key){

    public String forgotPassword(@PathVariable("key") String key, Model model){

        Users user = null;
        try {
            user = usersService.findByForgotpassword(key);
            if (user == null){
                return "redirect:/403";
            }
            model.addAttribute("key", key);
        }catch (Exception e){
            System.out.println(e.getMessage());
        }

        return "forgotpassword";
    }


   

    @PostMapping("/forgotpassword")
    public String forgotPassword(@RequestParam("key") String key, @RequestParam("passwordfg") String password){
        Users user = null;
        System.out.println(key+"KEY");
        try {
            user = usersService.findByForgotpassword(key);
            if (user != null){
                System.out.println(key+"KEY");
                user.setPassword(passwordEncoder().encode(password));
                user.setForgotpassword("");
                usersService.saveorupdate(user);
                System.out.println(user.getUserName()+"------"+ user.getPassword());

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
            return "redirect:/403";
        }

        return "redirect:/";
    }
>>>>>>> 9a1d6d12e7be131e23450e93a8bdef65d7575f91
}
