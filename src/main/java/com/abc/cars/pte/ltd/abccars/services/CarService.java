package com.abc.cars.pte.ltd.abccars.services;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.abc.cars.pte.ltd.abccars.repositories.CarBidRepository;
import com.abc.cars.pte.ltd.abccars.repositories.CarRepository;
import com.abc.cars.pte.ltd.abccars.utilities.CarSearchObject;
import com.abc.cars.pte.ltd.abccars.exceptions.CarInactiveException;
import com.abc.cars.pte.ltd.abccars.exceptions.CarNotFoundException;
import com.abc.cars.pte.ltd.abccars.exceptions.UnauthorizedSearchException;
import com.abc.cars.pte.ltd.abccars.models.Car;
import com.abc.cars.pte.ltd.abccars.models.CarBid;


@Service
public class CarService {
    
    @Autowired
    CarRepository cRepository;

    @Autowired
    CarBidRepository cBidRepository;

    public Car carDetails(int id){
        Optional <Car> car = cRepository.findById(id);
        
        if (!car.isPresent()){
            throw new CarNotFoundException("car is not found from the system");
        }else if (car.get().getCarPostStatus() == false){
            throw new CarInactiveException("car post is deactivated");
        }
        return car.get();
    }

    public Car carDetailsForEdit(int id){
        Optional <Car> car = cRepository.findById(id);
        return car.get();
    }

    public List<Car> retrieveAllCars(){
        return cRepository.findAll();
    }

    public List<Car> retrieveAllActivatedCars(){
        return cRepository.findAllByCarPostStatus(true);
    }

    @Transactional
    public Car saveAndUpdateCar(Car car){
        return cRepository.save(car);
    }

    @Transactional
    public CarBid addBid(CarBid bid){
        return cBidRepository.save(bid);  
    }

    @Transactional
    public void deleteCar(int id){
        cRepository.delete(cRepository.findById(id).get());
    }

    @Transactional
    public void toggleCarStatus(int id){
        Car car = cRepository.findById(id).get();
        car.setCarPostStatus(!car.getCarPostStatus());
    }

    public List<Car> searchForCarFiltered(CarSearchObject carObject) throws ParseException{

        if ((carObject.getManufacturer() == null || carObject.getManufacturer().isEmpty()) 
        && carObject.getMaxPrice() == null && carObject.getMinPrice() == null && (carObject.getModel() == null 
        || carObject.getModel().isEmpty()) && carObject.getYear() == null){
            return retrieveAllActivatedCars();
        }else{
            
            String notAllowedStrings [] = {"SELECT", "DELETE", "INSERT", "UPDATE"};
            for (String notAllowedString : notAllowedStrings){
                if (carObject.getManufacturer().toLowerCase().contains(notAllowedString.toLowerCase()) || 
                    carObject.getModel().toLowerCase().contains(notAllowedString.toLowerCase())){
                        throw new UnauthorizedSearchException("Forbidden use of SQL");
                }
            }

            List<Car> carsToSend = new ArrayList<>();
            for (Car car : cRepository.findAll()){

               String [] formatDate = car.getCarRegistration().split("-");

               boolean manufacturerCheck = true;
               boolean modelCheck = true;
               boolean yearCheck = true;
               boolean minPriceCheck = true;
               boolean maxPriceCheck = true;

               if (carObject.getManufacturer() != null && !carObject.getManufacturer().isEmpty()){
                    if (!carObject.getManufacturer().toLowerCase().contains(car.getMake().toLowerCase())){
                        manufacturerCheck = false;
                    }
               }
               
               if (carObject.getModel() != null && !carObject.getModel().isEmpty()){
                    if (!carObject.getModel().toLowerCase().contains(car.getModel().toLowerCase())){
                        modelCheck = false;
                    }
               }

               if (carObject.getYear() != null){
                    if (!carObject.getYear().equalsIgnoreCase(formatDate[0])){
                        yearCheck = false;
                    }
               }

               if (carObject.getMinPrice() != null && carObject.getMaxPrice() != null){
                    if(Double.parseDouble(car.getPrice()) >= Double.parseDouble(carObject.getMinPrice()) 
                    && Double.parseDouble(car.getPrice()) <= Double.parseDouble(carObject.getMaxPrice())){
                        minPriceCheck = true;
                        maxPriceCheck = true;
                    }else{
                        minPriceCheck = false;
                        maxPriceCheck = false;
                    }
               }else if(carObject.getMinPrice() != null && carObject.getMaxPrice() == null){
                    if (Double.parseDouble(car.getPrice()) > Double.parseDouble(carObject.getMinPrice())){
                        minPriceCheck = false;
                    }
               }else if(carObject.getMinPrice() == null && carObject.getMaxPrice() != null){
                    if (Double.parseDouble(car.getPrice()) > Double.parseDouble(carObject.getMaxPrice())){
                        maxPriceCheck = false;
                    }
               }

               if(minPriceCheck && maxPriceCheck && yearCheck && manufacturerCheck && modelCheck){
                    carsToSend.add(car);
               }
            }
            
            return carsToSend;
        }
    }
}
