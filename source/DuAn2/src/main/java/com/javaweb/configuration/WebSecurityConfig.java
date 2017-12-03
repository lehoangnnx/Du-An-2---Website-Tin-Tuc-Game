/*
* Người Tạo : Nguyễn Lê Hoàng
* Ngày Tạo : 22/10/2017
* Lớp WebSecurityConfig là cấu hình Spring Security
* Để kích hoạt Spring Security, Lớp WebSecurityConfig kế thừa abstract class WebSecurityConfigurerAdapter
* */
package com.javaweb.configuration;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
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

import org.springframework.social.connect.mem.InMemoryUsersConnectionRepository;

import javax.servlet.Servlet;
import javax.servlet.ServletContext;

// Xác định lớp WebSecurityConfig là một lớp dùng để cấu hình
@Configuration
// Đẽ kích hoạt việc tích hợp Spring Security với Spring MVC
@EnableWebSecurity
@EnableGlobalMethodSecurity(prePostEnabled = true)
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {

	/*
     * Object principal =
	 * SecurityContextHolder.getContext().getAuthentication().getPrincipal(); String
	 * username= ""; if (principal instanceof UserDetails) { username =
	 * ((UserDetails) principal).getUsername(); } else { username =
	 * principal.toString(); }
	 */


    // Inject AjaxAuthenticationFailureHandler để cấu hình
    @Autowired
    private AjaxAuthenticationFailureHandler ajaxAuthenticationFailureHandler;

    // Inject AjaxAuthenticationSuccessHandler để cấu hình
    @Autowired
    private AjaxAuthenticationSuccessHandler ajaxAuthenticationSuccessHandler;

    // Inject ConnectionFactoryLocator để cấu hình
    @Autowired
    private ConnectionFactoryLocator connectionFactoryLocator;

    // Inject UsersConnectionRepository để cấu hình
    @Autowired
    private UsersConnectionRepository usersConnectionRepository;

    // Inject AccessDeniedHandlerImpl để cấu hình
    @Autowired
    private AccessDeniedHandlerImpl accessDeniedHandler;

    // Inject UserDetailsService để cấu hình
    @Autowired
    private UserDetailsService userDetailsService;

    // Mã hóa mật khẩu bằng Bcrypt
    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Autowired
    public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(userDetailsService).passwordEncoder(passwordEncoder());
    }
    @Autowired
    CustomLogoutSuccessHandler customLogoutSuccessHandler;
    // Cấu hình và xác thực, quyền truy cập của người dùng
    @Override
    protected void configure(HttpSecurity http) throws Exception {

        http.authorizeRequests().antMatchers("/home", "/").permitAll()
                .antMatchers("/admin/**").hasRole("WRITING")
                .and().formLogin().loginPage("/403.html").loginProcessingUrl("/login").usernameParameter("userName").passwordParameter("password")
                .failureHandler(ajaxAuthenticationFailureHandler).successHandler(ajaxAuthenticationSuccessHandler)

                .and().logout()
                .logoutSuccessHandler(customLogoutSuccessHandler)

                .and().rememberMe().and()
                .exceptionHandling().accessDeniedHandler(accessDeniedHandler);
        http.sessionManagement().sessionCreationPolicy(SessionCreationPolicy.IF_REQUIRED);

    }


}
