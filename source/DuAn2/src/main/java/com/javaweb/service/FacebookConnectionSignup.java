package com.javaweb.service;
import static org.apache.commons.lang3.RandomStringUtils.randomAlphabetic;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.social.connect.Connection;
import org.springframework.social.connect.ConnectionSignUp;
import org.springframework.stereotype.Service;

import com.javaweb.model.Roles;
import com.javaweb.model.Users;

@Service
public class FacebookConnectionSignup implements ConnectionSignUp {

    @Autowired
     UsersService usersService;
    @Autowired
    RolesService rolesService;
    
   

    @Override
    public String execute(Connection<?> connection) {
        System.out.println("signup === FACEBOKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKK ");
         Users user = null;
         try {
			user = usersService.findByUserName(connection.getKey().toString());
			if(user == null ) {
		        user = new Users();
		        user.setUserName(connection.getKey().toString());
		        user.setPassword(randomAlphabetic(8));
		        user.setEmail(connection.getKey()+"@gmail.com");
		        user.setFirstName(connection.getDisplayName());
		        user.setAvatar(connection.getImageUrl());
		        user.setStatus("active");
		        user.setCreatedDate(new Date());
		        user.setLoggedInDate(new Date());
		        user.setIsOnline((byte) 1);
		        HashSet<Roles> roleses = new  HashSet<>();
		        roleses.add(rolesService.findByName("ROLE_FACEBOOK"));
		        user.setRoleses(roleses);
		        usersService.saveorupdate(user);
	        }
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
        
       
        return user.getUserName();
    }
 
	
	

}
