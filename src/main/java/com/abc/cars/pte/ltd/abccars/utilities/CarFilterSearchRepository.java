package com.abc.cars.pte.ltd.abccars.utilities;

import java.util.Date;
import java.util.List;

import com.abc.cars.pte.ltd.abccars.models.Car;
public interface CarFilterSearchRepository {
    List<Car> findAllByMakeAndModelAndCarRegistrationAndPriceAndPrice(String make, String model, Date year, String minPrice, String maxPrice);
}
