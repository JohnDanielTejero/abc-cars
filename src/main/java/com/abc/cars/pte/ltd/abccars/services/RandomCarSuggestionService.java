package com.abc.cars.pte.ltd.abccars.services;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.abc.cars.pte.ltd.abccars.models.Car;
import com.abc.cars.pte.ltd.abccars.repositories.CarRepository;

@Service
public class RandomCarSuggestionService {
    
    @Autowired
    CarRepository cRepository;

    public List<Car> recommendedCarsAction(){
        List<Car> carsFromDb = cRepository.findAllByCarPostStatus(true);
        if (carsFromDb.size() <= 8){
            return carsFromDb;
        }else{
            List<Car> recommendedCars = new ArrayList<>();
            int i = 0;
            Car placeholder = null;

            while (i < 8){
                placeholder = carsFromDb.get((int) Math.floor(Math.random()*carsFromDb.size()));

                if (placeholder != null){
                    if (recommendedCars.size() == 0){
                        recommendedCars.add(placeholder);
                        i++;
                    }else{
                        for (Car car : recommendedCars){
                            if (placeholder.getCarId() == car.getCarId()){
                                placeholder = carsFromDb.get((int) Math.floor(Math.random()*carsFromDb.size()));
                            }
                        }
                        recommendedCars.add(placeholder);
                        i++;
                    }
                }
            }
            return recommendedCars;
        }
    }
}
