package com.abc.cars.pte.ltd.abccars.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.abc.cars.pte.ltd.abccars.models.CarBid;

@Repository
public interface CarBidRepository extends JpaRepository <CarBid, Integer>{
    
}
