package com.abc.cars.pte.ltd.abccars.exceptions;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

@ResponseStatus(code = HttpStatus.FORBIDDEN)
public class ProfileNotFoundException extends RuntimeException{
    
    public ProfileNotFoundException(String message){
        super(message);
    }
}
