package com.abc.cars.pte.ltd.abccars.security;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;

import com.abc.cars.pte.ltd.abccars.models.User;
import com.abc.cars.pte.ltd.abccars.repositories.UserRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;

@Component
public class AuthFacade {

	@Autowired
	UserRepository userRepository;

	public Authentication getAuth(){
        return SecurityContextHolder.getContext().getAuthentication();
    }

	public boolean isAuthenticated() {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		 if (authentication == null || AnonymousAuthenticationToken.class.
			      isAssignableFrom(authentication.getClass())) {
			 return false;
		}
		return authentication.isAuthenticated();
	}

	public User getUser(){
		return userRepository.findUserByEmailAddress(SecurityContextHolder.getContext().getAuthentication().getName().toString());
	}
}
