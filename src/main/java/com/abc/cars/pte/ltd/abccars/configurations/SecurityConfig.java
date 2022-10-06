package com.abc.cars.pte.ltd.abccars.configurations;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.password.PasswordEncoder;

import com.abc.cars.pte.ltd.abccars.security.ErrorAuthenticationHandler;
import com.abc.cars.pte.ltd.abccars.utilities.UserDetailsSecurity;

@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(prePostEnabled = true, securedEnabled = true)
public class SecurityConfig extends WebSecurityConfigurerAdapter{

    //@Autowired
    //SuccessAuthenticationHandler successHandler;
    
    @Autowired
    ErrorAuthenticationHandler error;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Autowired
    private UserDetailsSecurity details;

    // @Bean
    // public DaoAuthenticationProvider authProvider(){
    //     DaoAuthenticationProvider provider = new DaoAuthenticationProvider();
    //     provider.setUserDetailsService(details);
    //     provider.setPasswordEncoder(passwordEncoder);

    //     return provider;

    // }

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(details).passwordEncoder(passwordEncoder);
    }

    @Override
	@Bean
	public AuthenticationManager authenticationManager() throws Exception {
		return super.authenticationManager();
	}

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http
		.authorizeRequests()
		/*ant matcher add all mapping*/
		.antMatchers("/registerUser", "/sendCode", "/Registration",
			        "/login", "/error","/forgot-password", "/company", "/validateEmail/{email}", 
                    "/car-listing", "/search-car", "/searchFilters", "/loginRedirect", "/changePassword").permitAll()
		.antMatchers("/admin/**").hasRole("ADMIN")
		.antMatchers("/","/css/**","/img/**","/js/**", "/login","/error",
                    "/profilePicture/**","/carPicture/**").permitAll()
		.anyRequest().authenticated()
		.and()
		.formLogin()
		.loginPage("/login")
		.loginProcessingUrl("/login")
		.usernameParameter("email")
		.passwordParameter("password")
		.failureHandler(error);
    }
}
