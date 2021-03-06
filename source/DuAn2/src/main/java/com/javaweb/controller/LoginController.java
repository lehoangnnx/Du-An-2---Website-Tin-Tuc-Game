/*
* Người Tạo : Nguyễn Lê Hoàng
* Ngày Tạo : 17/11/2017
* */
package com.javaweb.controller;

import java.io.IOException;
import java.security.GeneralSecurityException;
import java.util.Arrays;
import java.util.Collections;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.converter.json.GsonFactoryBean;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.social.connect.ConnectionRepository;
import org.springframework.social.facebook.api.Facebook;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken.Payload;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdTokenVerifier;
import com.google.api.client.http.HttpTransport;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.api.client.json.JsonFactory;
import com.google.api.client.json.jackson2.JacksonFactory;

@Controller
public class LoginController {
	 private Facebook facebook;
	 private ConnectionRepository connectionRepository;
	 
	
	@GetMapping("/login")
	String login(Model model, String error) {
		if (error != null) {
            model.addAttribute("error", "Tài Khoản Hoặc Mật Khẩu Không Đúng");
		}
		
		return "adminlogin";
	}
	@GetMapping("/admin/login")
	String loginadmin(Model model, String error) {
		if (error != null) {
            model.addAttribute("error", "Tài Khoản Hoặc Mật Khẩu Không Đúng");
		}
		
		return "adminlogin";
	}
	  
	/*
	@PostMapping(value="/logout")
	public String logoutPage (HttpServletRequest request, HttpServletResponse response) {
	    Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String uri = request.getScheme() + "://" +
				request.getServerName() +
				("http".equals(request.getScheme()) && request.getServerPort() == 80 || "https".equals(request.getScheme()) && request.getServerPort() == 443 ? "" : ":" + request.getServerPort() ) +
				request.getRequestURI() +
				(request.getQueryString() != null ? "?" + request.getQueryString() : "");
	    if (auth != null){
			System.out.println("AAAAAAAAAAAAAAAAAAAAAA"+auth.getName() + auth.getAuthorities());
			new SecurityContextLogoutHandler().logout(request, response, auth);
	    }
		System.out.println("HTYPPPPPPPPPPPPPPPPPPP"+uri);
		return "redirect:/"+uri;
	}
*/
	
}
