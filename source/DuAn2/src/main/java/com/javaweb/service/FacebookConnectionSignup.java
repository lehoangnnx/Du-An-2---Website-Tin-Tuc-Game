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
    private UsersService usersService;
    @Autowired
    RolesService rolesService;
    
   

    @Override
    public String execute(Connection<?> connection) {
        System.out.println("signup === FACEBOKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKK ");
         Users user = null;
        if(usersService.findByUserName(connection.getDisplayName()) == null ) {
	        user = new Users();
	        user.setUserName(connection.getDisplayName());
	        user.setPasword(randomAlphabetic(8));
	        user.setEmail(connection.getDisplayName()+"@gmail.com");
	        user.setStatus("active");
	        user.setCreatedDate(new Date());
	        user.setLoggedInDate(new Date());
	        user.setIsOnline((byte) 1);
	        HashSet<Roles> roleses = new  HashSet<>();
	        roleses.add(rolesService.findByName("ROLE_FACEBOOK"));
	        user.setRoleses(roleses);
	        usersService.saveorupdate(user);
        }else {
        	user = usersService.findByUserName(connection.getDisplayName());
        	
        }
       
        
       Set<GrantedAuthority> grantedAuthorities = new HashSet<>();
		Set<Roles> roles = user.getRoleses();
		for (Roles role : roles) {
			grantedAuthorities.add(new SimpleGrantedAuthority(role.getName()));
		}
		
		 new org.springframework.security.core.userdetails.User(user.getUserName(), user.getPasword(), true, 
				true, true, true, grantedAuthorities);
		
				
		
        
        return user.getUserName();
    }
   /* public void autologin(String username, String password) {
        UserDetails userDetails = userDetailsService.loadUserByUsername(username);
        UsernamePasswordAuthenticationToken usernamePasswordAuthenticationToken = new UsernamePasswordAuthenticationToken(userDetails, password, userDetails.getAuthorities());

        authenticationManager.authenticate(usernamePasswordAuthenticationToken);

        if (usernamePasswordAuthenticationToken.isAuthenticated()) {
            SecurityContextHolder.getContext().setAuthentication(usernamePasswordAuthenticationToken);
            //logger.debug(String.format("Auto login %s successfully!", username));
        }
    } */


	
	

}
