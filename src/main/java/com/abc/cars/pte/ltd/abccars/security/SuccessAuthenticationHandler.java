package com.abc.cars.pte.ltd.abccars.security;

import java.io.IOException;
import java.util.Collection;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

@Component
public class SuccessAuthenticationHandler implements AuthenticationSuccessHandler {

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
            Authentication authentication) throws IOException, ServletException {
                Collection <? extends GrantedAuthority> grantedAuth= authentication.getAuthorities();

                String urlPattern = null;
                for (GrantedAuthority auth : grantedAuth){
                    if (auth.getAuthority().equals("ROLE_ADMIN")){
                        urlPattern = "admin/dashboard/";
                        break;
                    }else{
                        urlPattern = "/home";
                        break;
                    }
                }

                new DefaultRedirectStrategy().sendRedirect(request, response, urlPattern);
    }
    
}
