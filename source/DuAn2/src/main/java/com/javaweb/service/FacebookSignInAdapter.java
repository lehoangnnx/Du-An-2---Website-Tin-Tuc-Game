package com.javaweb.service;

import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.config.core.GrantedAuthorityDefaults;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.social.connect.Connection;
import org.springframework.social.connect.web.SignInAdapter;
import org.springframework.social.facebook.api.Facebook;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.NativeWebRequest;
import org.springframework.security.core.Authentication;
import com.javaweb.model.Roles;
import com.javaweb.model.Users;

@Service
public class FacebookSignInAdapter implements SignInAdapter {
	
	   
	@Override
	public String signIn(String localUserId, Connection<?> connection, NativeWebRequest request) {
		System.out.println(" ====== Sign In adapter" + localUserId);
		System.out.println("THU FACEBOOK :" + connection.getDisplayName());
		System.out.println("THU FACEBOOK 1 :" + connection.getImageUrl());
		System.out.println("THU FACEBOOK 2 :" + connection.getProfileUrl());
		System.out.println("THU FACEBOOK 3 :" + connection.getKey());
		SecurityContextHolder.getContext()
		.setAuthentication(new UsernamePasswordAuthenticationToken(connection.getDisplayName(), 
				null, Arrays.asList(new SimpleGrantedAuthority("ROLE_FACEBOOK"))));
		
		return null;
	}

}
