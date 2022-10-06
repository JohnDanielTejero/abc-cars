package com.abc.cars.pte.ltd.abccars.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.stereotype.Component;

import com.abc.cars.pte.ltd.abccars.models.User;
import com.abc.cars.pte.ltd.abccars.repositories.UserRepository;

@Component
public class ErrorAuthenticationHandler implements AuthenticationFailureHandler{

    @Autowired
    UserRepository uRepository;

    PasswordEncoder encoder;

    @Autowired
    public ErrorAuthenticationHandler(PasswordEncoder encoder){
        this.encoder = encoder;
    } 
    @Override
    public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
            AuthenticationException exception) throws IOException, ServletException {
                
                String urlPattern = "";
                if ((request.getParameter("email") != null && !request.getParameter("email").isEmpty())
                    && (request.getParameter("password") != null && !request.getParameter("password").isEmpty())){
                        User user = uRepository.findUserByEmailAddress(request.getParameter("email"));
                    if(user == null){
                        urlPattern = "/loginRedirect?email=invalid&password=invalid";
                    }else{
                        if (!user.getPassword().equals(request.getParameter("password"))){
                            urlPattern = "/loginRedirect?email=satisfied&password=incorrect";
                        }
                    }
                }else{
                    if ((request.getParameter("email") == null || request.getParameter("email").isEmpty()) && 
                        !(request.getParameter("password") == null || request.getParameter("password").isEmpty())){
                            urlPattern = "/loginRedirect?email=empty&password=filled";
                    }else if((request.getParameter("email") == null || request.getParameter("email").isEmpty()) &&
                        !(request.getParameter("password") == null || request.getParameter("password").isEmpty())){
                            urlPattern = "/loginRedirect?email=filled&password=empty";
                    }else{
                        urlPattern = "/loginRedirect?email=empty&password=empty";
                    }  
                }
                new DefaultRedirectStrategy().sendRedirect(request, response, urlPattern);
    }
}
