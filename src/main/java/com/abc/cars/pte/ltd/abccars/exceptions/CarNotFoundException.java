package com.abc.cars.pte.ltd.abccars.exceptions;


public class CarNotFoundException extends RuntimeException{
    public CarNotFoundException(String message){
        super(message);
    }
}