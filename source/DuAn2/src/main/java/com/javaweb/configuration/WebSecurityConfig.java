package com.javaweb.configuration;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.annotation.Order;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.social.connect.ConnectionFactoryLocator;
import org.springframework.social.connect.UsersConnectionRepository;
import org.springframework.social.connect.web.ProviderSignInController;

import com.javaweb.service.FacebookConnectionSignup;
import com.javaweb.service.FacebookSignInAdapter;
import org.springframework.social.connect.mem.InMemoryUsersConnectionRepository;
import org.springframework.security.web.AuthenticationEntryPoint;
import org.springframework.security.web.authentication.LoginUrlAuthenticationEntryPoint;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;
import org.springframework.security.web.util.matcher.AnyRequestMatcher;

@Configuration
@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {

	/*
	 * Object principal =
	 * SecurityContextHolder.getContext().getAuthentication().getPrincipal(); String
	 * username= ""; if (principal instanceof UserDetails) { username =
	 * ((UserDetails) principal).getUsername(); } else { username =
	 * principal.toString(); }
	 */

	// Cấu hình phân quyền truy cập vào website bằng Spring Security

	@Autowired
	private UserDetailsService userDetailsService;
	@Autowired
	private ConnectionFactoryLocator connectionFactoryLocator;

	@Autowired
	private UsersConnectionRepository usersConnectionRepository;

	@Autowired
	private FacebookConnectionSignup facebookConnectionSignup;

	@Bean
	public PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}

	@Autowired
	public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
		auth.userDetailsService(userDetailsService).passwordEncoder(passwordEncoder());
	}

	@Autowired
	AjaxAuthenticationFailureHandler ajaxAuthenticationFailureHandler;

	@Autowired
	AjaxAuthenticationSuccessHandler ajaxAuthenticationSuccessHandler;

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.authorizeRequests().antMatchers("/home", "/").permitAll()
				.antMatchers("/admin/**").hasRole("ADMIN")

				.and().formLogin()
				.loginPage("/login")
				.usernameParameter("userName").passwordParameter("password")
				.failureHandler(ajaxAuthenticationFailureHandler).successHandler(ajaxAuthenticationSuccessHandler)

				.and().logout().logoutSuccessUrl("/")
				.deleteCookies("JSESSIONID")
				.and().rememberMe()
				.and().exceptionHandling()
				.accessDeniedPage("/");
		http.sessionManagement().sessionCreationPolicy(SessionCreationPolicy.IF_REQUIRED);
	}

	@Bean
	// @Primary
	public ProviderSignInController providerSignInController() {
		((InMemoryUsersConnectionRepository) usersConnectionRepository).setConnectionSignUp(facebookConnectionSignup);
		return new ProviderSignInController(connectionFactoryLocator, usersConnectionRepository,
				new FacebookSignInAdapter());
	}

}
