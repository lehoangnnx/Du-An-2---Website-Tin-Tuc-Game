/*
* Người Tạo : Nguyễn Lê Hoàng
* Ngày Tạo : 17/11/2017
* */
package com.javaweb.controller;

import static org.apache.commons.lang3.RandomStringUtils.randomAlphabetic;

import java.io.IOException;
import java.security.GeneralSecurityException;
import java.util.Arrays;
import java.util.Collections;
import java.util.Date;
import java.util.HashSet;
import java.util.List;

import com.javaweb.service.SecurityService;
import com.restfb.DefaultFacebookClient;
import com.restfb.FacebookClient;
import com.restfb.Parameter;
import com.restfb.types.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdTokenVerifier;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken.Payload;
import com.google.api.client.http.HttpTransport;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.api.client.json.JsonFactory;
import com.google.api.client.json.jackson2.JacksonFactory;
import com.javaweb.model.Roles;
import com.javaweb.model.Users;
import com.javaweb.service.RolesService;
import com.javaweb.service.UsersService;

@RestController
public class LoginRestController {
    @Autowired
    UsersService usersService;
    @Autowired
    RolesService rolesService;
    @Autowired
    PasswordEncoder passwordEncoder;
    private static final HttpTransport TRANSPORT = new NetHttpTransport();
    private static final JsonFactory JSON_FACTORY = new JacksonFactory();



    @PostMapping("/signin-google")
    // Đăng nhập bằng google
    public String String(@RequestBody String idtoken

    ) {
        System.out.println("idtoken :" + idtoken);

        GoogleIdTokenVerifier verifier = new GoogleIdTokenVerifier.Builder(TRANSPORT, JSON_FACTORY)
                .setAudience(Collections
                        .singletonList("957067339527-2a7jir87qgufa498et556ke87d8lv5sb.apps.googleusercontent.com"))
                // Or, if multiple clients access the backend:
                // .setAudience(Arrays.asList(CLIENT_ID_1, CLIENT_ID_2, CLIENT_ID_3))
                .build();

        GoogleIdToken idToken;
        Users user = null;
        try {
            idToken = verifier.verify(idtoken);
            if (idToken != null) {
                Payload payload = idToken.getPayload();

                // Print user identifier
                String userId = payload.getSubject();
                System.out.println("User ID: " + userId);

                // Get profile information from payload
                String email = payload.getEmail();

                boolean emailVerified = Boolean.valueOf(payload.getEmailVerified());
                String name = (String) payload.get("name");
                String pictureUrl = (String) payload.get("picture");
                String locale = (String) payload.get("locale");
                String familyName = (String) payload.get("family_name");
                String givenName = (String) payload.get("given_name");
                System.out.println("GOOOGLE NEF : " + givenName +"--"+ familyName);
                user = usersService.findByUserName(userId);
                if (user == null) {
                    user = new Users();
                    user.setUserName(userId);
                    user.setPassword(passwordEncoder.encode(randomAlphabetic(8)));
                    user.setEmail(userId+"-"+email);
                    user.setFirstName(givenName);
                    user.setLastName(familyName);
                    user.setAvatar(pictureUrl);
                    user.setStatus("active");
                    user.setCreatedDate(new Date());
                    user.setLoggedInDate(new Date());
                    user.setIsOnline((byte) 1);
                    HashSet<Roles> roleses = new HashSet<>();
                    roleses.add(rolesService.findByName("ROLE_GOOGLE"));
                    user.setRoleses(roleses);
                    usersService.saveorupdate(user);
                }

                SecurityContextHolder.getContext().setAuthentication(new UsernamePasswordAuthenticationToken(userId,
                        null, Arrays.asList(new SimpleGrantedAuthority("ROLE_GOOGLE"))));
            } else {
                System.out.println("Invalid ID token.");

            }
        } catch (GeneralSecurityException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();

        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();

        }

        return "success";
    }

    @PostMapping("/signin-facebook")

    // Đăng Nhập bằng facebook
    public  String signinFacebook(@RequestBody String accessToken ){
        System.out.println("THU ACE BOOK NEG : " +accessToken);
        FacebookClient fbClient = new DefaultFacebookClient(accessToken);
        User me = fbClient.fetchObject("me", User.class,
                Parameter.with("fields", "picture,first_name,last_name,gender,name,email"));

        System.out.println("MAIL :" +me.getPicture().getUrl()+me.getId()+me.getName()+me.getFirstName()
        +me.getEmail()+me.getLastName()+me.getAbout()+me.getBio()+me.getBirthday()
        +me.getGender()+me.getHometownName()+me.getHometown()+me.getLink()+me.getLocale());
        Users user = null;
        try {
            user = usersService.findByUserName(me.getId());
            if(user == null ) {
                user = new Users();
                user.setUserName(me.getId());
                user.setPassword(passwordEncoder.encode(randomAlphabetic(8)));
                user.setEmail(me.getId()+"-"+me.getEmail());
                user.setFirstName(me.getFirstName());
                user.setLastName(me.getLastName());
                user.setAvatar(me.getPicture().getUrl());
                user.setStatus("active");
                user.setCreatedDate(new Date());
                user.setLoggedInDate(new Date());
                user.setIsOnline((byte) 1);
                HashSet<Roles> roleses = new  HashSet<>();
                roleses.add(rolesService.findByName("ROLE_FACEBOOK"));
                user.setRoleses(roleses);
                usersService.saveorupdate(user);
            }
            SecurityContextHolder.getContext().setAuthentication(new UsernamePasswordAuthenticationToken(me.getId(),
                    null, Arrays.asList(new SimpleGrantedAuthority("ROLE_FACEBOOK"))));
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return "success";
    }
}
