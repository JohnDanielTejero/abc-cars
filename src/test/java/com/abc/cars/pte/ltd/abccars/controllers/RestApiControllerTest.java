package com.abc.cars.pte.ltd.abccars.controllers;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.Mockito.lenient;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.junit.MockitoJUnitRunner;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.security.crypto.password.PasswordEncoder;

import com.abc.cars.pte.ltd.abccars.models.User;
import com.abc.cars.pte.ltd.abccars.repositories.UserRepository;
import com.abc.cars.pte.ltd.abccars.services.UserService;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

@WebMvcTest(controllers = RestAPIController.class)
@RunWith(MockitoJUnitRunner.class)
@AutoConfigureMockMvc
public class RestApiControllerTest {
    
    @InjectMocks
    RestAPIController restAPIController;

    @Mock
    UserService userService;

    @Mock
    UserRepository userRepository;

    @Mock
    PasswordEncoder encoder;

    @Test
    public void registerUserAsync(){

        //setting user field
        User mockUser = new User();
        mockUser.setRole("user");
        mockUser.setFirstName("Daniel");
        mockUser.setLastName("Tejero");
        mockUser.setEmailAddress("ismite8@gmail.com");
        mockUser.setPassword("test");

        //converting object to json
        GsonBuilder gsonBuilder = new GsonBuilder(); 
        Gson gson = gsonBuilder.create();
        String user = gson.toJson(mockUser);

        //registration part
        String resultMessage = restAPIController.registerUserAsync(user);
        assertEquals("inserted", resultMessage);

        String response = null;
        lenient().when(userService.updateAndInsertUser(mockUser)).thenReturn(response);
    }
}
