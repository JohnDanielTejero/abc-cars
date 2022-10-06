package com.abc.cars.pte.ltd.abccars.controllers;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.csrf.CsrfToken;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.abc.cars.pte.ltd.abccars.models.User;
import com.abc.cars.pte.ltd.abccars.services.EmailService;
import com.abc.cars.pte.ltd.abccars.services.UserService;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;


@RestController
public class RestAPIController {

    GsonBuilder gsonBuilder = new GsonBuilder();

    @Autowired
    UserService userService;
    
    @Autowired
    private PasswordEncoder passwordEncoder;
    
    @Autowired
    EmailService eService;

    @GetMapping("/validateEmail/{email}")
    public boolean validateEmail(@PathVariable("email") String email){
       if (userService.findUserbyEmail(email) == null){
            return true;
       }else{
            return false;
       }
    }

    @GetMapping("/sendCode")
    public String code(@RequestParam("email")String email){
        //add email implementation here

        int[] numbers = {1, 2, 3, 4, 5, 6, 7, 8, 9, 0};
        String code = "";
        for (int i = 0; i < 4; i++){
            code += numbers[(int) Math.floor(Math.random() * numbers.length)] + "";
        }
        eService.sendVerificationCode(email, "verification code", "your verification code is: " + code);
        return code;
    }

    @PostMapping("/registerUser")
    public String registerUserAsync(@RequestBody String user){
        Gson gson = gsonBuilder.create();
        User userToInsert = gson.fromJson(user, User.class);
        userToInsert.setUserRegistrationDate(new SimpleDateFormat("YYYY-MM-dd hh:mm:ss").format(new Date()));
        userToInsert.setPassword(passwordEncoder.encode(userToInsert.getPassword()));

        userService.updateAndInsertUser(userToInsert);
        return "inserted";
    }

    @Transactional
    @PostMapping("/changePassword")
    public String updatePasswordAsync(@RequestBody String user){
        //System.out.println("here");
        Gson gson = gsonBuilder.create();
        User userToChange = gson.fromJson(user, User.class);
        User currentRecord = userService.findUserbyEmail(userToChange.getEmailAddress());
        currentRecord.setPassword(passwordEncoder.encode(userToChange.getPassword()));
        userService.updateAndInsertUser(currentRecord);

        //return gson.toJson(currentRecord);
        return "\"updated\"";
    }

    @GetMapping("/csrf")
    public CsrfToken csrfGenerator(CsrfToken token){
        return token;
    }
    
}
