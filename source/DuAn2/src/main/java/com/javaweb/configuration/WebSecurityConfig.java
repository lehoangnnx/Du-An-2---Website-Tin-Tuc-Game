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

// Xác định lớp WebSecurityConfig là một lớp dùng để cấu hình
@Configuration
// Đẽ kích hoạt việc tích hợp Spring Security với Spring MVC
@EnableWebSecurity
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

    // Inject FacebookConnectionSignup để cấu hình
    @Autowired
    private FacebookConnectionSignup facebookConnectionSignup;

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

    // Cấu hình và xác thực, quyền truy cập của người dùng
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

    // Cấu hình đăng nhập bằng Facebook
    @Bean
    // @Primary
    public ProviderSignInController providerSignInController() {
        ((InMemoryUsersConnectionRepository) usersConnectionRepository).setConnectionSignUp(facebookConnectionSignup);
        return new ProviderSignInController(connectionFactoryLocator, usersConnectionRepository,
                new FacebookSignInAdapter());
    }


}
