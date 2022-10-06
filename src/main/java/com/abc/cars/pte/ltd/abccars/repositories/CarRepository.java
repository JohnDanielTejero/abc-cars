package com.abc.cars.pte.ltd.abccars.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.abc.cars.pte.ltd.abccars.models.Car;
import com.abc.cars.pte.ltd.abccars.utilities.CarFilterSearchRepository;

@Repository
public interface CarRepository extends JpaRepository<Car, Integer>, CarFilterSearchRepository{
    public List<Car> findAllByCarPostStatus(boolean status);
}
