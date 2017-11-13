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
import org.springframework.security.web.authentication.www.BasicAuthenticationEntryPoint;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;
import org.springframework.security.web.util.matcher.AnyRequestMatcher;

import javax.servlet.http.HttpServletRequest;

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
		private  AjaxAuthenticationFailureHandler ajaxAuthenticationFailureHandler;

		@Autowired
		private  AjaxAuthenticationSuccessHandler ajaxAuthenticationSuccessHandler;
		@Autowired
		private  ConnectionFactoryLocator connectionFactoryLocator;

		@Autowired
		private  UsersConnectionRepository usersConnectionRepository;

		@Autowired
		private  FacebookConnectionSignup facebookConnectionSignup;
		@Autowired
		private UserDetailsService userDetailsService;


		@Bean
		public PasswordEncoder passwordEncoder() {
			return new BCryptPasswordEncoder();
		}
		@Autowired
		public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
			auth.userDetailsService(userDetailsService).passwordEncoder(passwordEncoder());
		}



		@Override
		protected void configure(HttpSecurity http) throws Exception {



			http.authorizeRequests().antMatchers("/home", "/").permitAll()
					 .antMatchers("/admin/**").hasRole("ADMIN")

					.and().formLogin().loginPage("/403").loginProcessingUrl("/login").usernameParameter("userName").passwordParameter("password")
					.failureHandler(ajaxAuthenticationFailureHandler).successHandler(ajaxAuthenticationSuccessHandler)
					
					.and().logout().logoutSuccessUrl("/")

					.and().rememberMe().and()
					.exceptionHandling().accessDeniedPage("/403");
			http.sessionManagement().sessionCreationPolicy(SessionCreationPolicy.IF_REQUIRED);

		}
		

		

		

		
		@Bean
		// @Primary
		public ProviderSignInController providerSignInController() {
			((InMemoryUsersConnectionRepository) usersConnectionRepository).setConnectionSignUp(facebookConnectionSignup);
			return new ProviderSignInController(connectionFactoryLocator, usersConnectionRepository,
					new FacebookSignInAdapter());
		}
	
	
	/*@Configuration
	@Order(1)
	public static class App1ConfigurationAdapter extends WebSecurityConfigurerAdapter {
		
		public App1ConfigurationAdapter() {
			super();
		}
		@Autowired
		private UserDetailsService userDetailsService;
		@Bean
		public PasswordEncoder passwordEncoder() {
			return new BCryptPasswordEncoder();
		}
		@Autowired
		public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
			auth.userDetailsService(userDetailsService).passwordEncoder(passwordEncoder());
		}
	    @Override
	    protected void configure(HttpSecurity http) throws Exception {
	        http.antMatcher("/admin/**")
	            .authorizeRequests().anyRequest().hasRole("ADMIN")
	            
	            .and().sessionManagement().sessionCreationPolicy(SessionCreationPolicy.STATELESS)
	            
	            .and().httpBasic().realmName("admin realm").authenticationEntryPoint(authenticationEntryPoint());
	    }
	 
	    @Bean
	    public CustomBasicAuthenticationEntryPoint authenticationEntryPoint(){
	        return new CustomBasicAuthenticationEntryPoint();
	    }
	}*/

}
