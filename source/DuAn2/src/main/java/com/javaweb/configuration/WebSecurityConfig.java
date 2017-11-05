package com.javaweb.configuration;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.annotation.Order;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

@Configuration
@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {
	@Autowired
	private UserDetailsService userDetailsService;
	
    @Autowired
    AjaxAuthenticationFailureHandler ajaxAuthenticationFailureHandler;
    
    @Autowired
    AjaxAuthenticationSuccessHandler ajaxAuthenticationSuccessHandler;
	@Bean
	public PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}
	
			/*Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			String username= "";
			if (principal instanceof UserDetails) {
			     username = ((UserDetails) principal).getUsername();
			} else {
			     username = principal.toString();
			}*/
	
	@Autowired
    public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(userDetailsService).passwordEncoder(passwordEncoder());
    }
	
	
	
	
	// Cấu hình phân quyền truy cập vào website bằng Spring Security
	@Override
    protected void configure(HttpSecurity http) throws Exception {
        http
            .authorizeRequests()
            	.antMatchers("/admin/**").hasRole("ADMIN")
                .antMatchers("/home").hasRole("MEMBER")
                .and()
            .formLogin()
            	.loginPage("/login")
            	.usernameParameter("userName")
            	.passwordParameter("password")
            	.failureHandler(ajaxAuthenticationFailureHandler)
            	.successHandler(ajaxAuthenticationSuccessHandler)
            	//.defaultSuccessUrl("/")
            	//.failureUrl("/login?error")      	
            	.and()
            .logout()
            .logoutSuccessUrl("/")
            .and()
        	.exceptionHandling()
    			.accessDeniedPage("/403");
    }
	
}
