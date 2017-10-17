package com.javaweb.service;

import java.util.HashSet;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.javaweb.model.Roles;
import com.javaweb.model.Users;
import com.javaweb.repository.UsersRepository;


@Service
public class UserDetailsServiceImpl implements UserDetailsService {
	
	@Autowired
	private UsersRepository usersRepository;
	
	@Override
	@Transactional
	public UserDetails loadUserByUsername(String userName) throws UsernameNotFoundException {
		Users user = usersRepository.findByUserName(userName);
		if (user == null) {
			System.out.println("-------------------------------------------------------------------");
            throw new UsernameNotFoundException("User not found");
        }
		
		Set<GrantedAuthority> grantedAuthorities = new HashSet<>();
		Set<Roles> roles = user.getRoleses();
		for (Roles role : roles) {
			grantedAuthorities.add(new SimpleGrantedAuthority(role.getName()));
		}
		
		return new org.springframework.security.core.userdetails.User(
				user.getUserName(), user.getPasword(), grantedAuthorities);
	}

}
