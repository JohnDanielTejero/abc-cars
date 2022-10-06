package com.abc.cars.pte.ltd.abccars.utilities;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.springframework.stereotype.Repository;

import com.abc.cars.pte.ltd.abccars.models.Car;

@Repository
public class CarFilterSearchRepositoryImplement implements CarFilterSearchRepository{

    @PersistenceContext
    private EntityManager entityManager;
    
    @Override
    public List<Car> findAllByMakeAndModelAndCarRegistrationAndPriceAndPrice(String make, String model, Date yearSelect, String minPrice, String maxPrice){
        CriteriaBuilder cb = entityManager.getCriteriaBuilder();
        CriteriaQuery<Car> cq = cb.createQuery(Car.class);
        Root<Car> car = cq.from(Car.class);
        List<Predicate> predicates = new ArrayList<>();

        if(make != null){
            predicates.add(cb.like(car.get("make"), "%" + make + "%"));
        }

        if (model != null){
            predicates.add(cb.like(car.get("model"), "%" + model + "%"));
        }
      
        if (yearSelect != null && !yearSelect.equals("disable")){
            predicates.add(cb.equal(cb.function("YEAR", Integer.class, 
            car.get("carRegistration")), yearSelect.getYear()));            
        }
        
        if (minPrice != null && maxPrice != null){
            predicates.add(cb.between(car.get("price"), minPrice, maxPrice));
        }else{
            if (minPrice != null && maxPrice == null){  
                predicates.add(cb.greaterThanOrEqualTo(car.get("price"), minPrice));
            }else if (minPrice == null && maxPrice != null){
                predicates.add(cb.lessThanOrEqualTo(car.get("price"), maxPrice));
            }
        }

        cq.where(predicates.toArray(new Predicate[predicates.size()]));
        return entityManager.createQuery(cq).getResultList();
    }
    
}
