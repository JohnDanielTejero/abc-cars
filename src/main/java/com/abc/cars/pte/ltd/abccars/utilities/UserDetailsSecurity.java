package com.abc.cars.pte.ltd.abccars.utilities;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;

import com.abc.cars.pte.ltd.abccars.models.User;
import com.abc.cars.pte.ltd.abccars.repositories.UserRepository;

@Component
public class UserDetailsSecurity implements UserDetailsService {

    private final UserRepository uRepository;

    @Autowired
    public UserDetailsSecurity(UserRepository uRepository){
        this.uRepository = uRepository;
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        
        User user = this.uRepository.findUserByEmailAddress(username);
        
        if (user == null){
            throw new UsernameNotFoundException("email does not exist");
        } 
        return new UserPrincipals(user);
    }
    
}
