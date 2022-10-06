package com.abc.cars.pte.ltd.abccars.controllers;

import org.junit.Test;
import org.junit.runner.RunWith;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.Mockito.lenient;

import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.junit.MockitoJUnitRunner;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;

import com.abc.cars.pte.ltd.abccars.models.User;
import com.abc.cars.pte.ltd.abccars.repositories.UserRepository;
import com.abc.cars.pte.ltd.abccars.security.AuthFacade;
import com.abc.cars.pte.ltd.abccars.services.RandomCarSuggestionService;
import com.abc.cars.pte.ltd.abccars.services.UserService;

@WebMvcTest(controllers = UnauthPagesController.class)
@RunWith(MockitoJUnitRunner.class)
@AutoConfigureMockMvc
public class UnauthPagesControllerTest {
  
    @InjectMocks
    UnauthPagesController unauthPagesController;
    
    @Mock
    AuthFacade authContext;

    @Mock
    RandomCarSuggestionService rCarSuggestionService;

    @Mock
    AuthenticationManager authenticationManager;

    @Mock
    UserRepository userRepository;

    @Mock
    UserService userService;

    @Test
	public void loginAction() throws Exception{

        //setting up new user
        User mockUser = new User();
        mockUser.setRole("user");
        mockUser.setFirstName("Daniel");
        mockUser.setLastName("Tejero");
        mockUser.setEmailAddress("johndanieltejero23@gmail.com");
        mockUser.setPassword("test");
        userRepository.save(mockUser);
        
        //user credentials
        String email = "johndanieltejero23@gmail.com";
        String password = "test";
        
        //retrieving return value of loginAction
        String login = unauthPagesController.loginAction(email, password);
        
        assertEquals("/", login);
        lenient().when(authenticationManager.authenticate(new UsernamePasswordAuthenticationToken(email, password)))
        	.thenReturn(SecurityContextHolder.getContext().getAuthentication());

	}

}
