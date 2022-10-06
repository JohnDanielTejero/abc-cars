package com.abc.cars.pte.ltd.abccars.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.abc.cars.pte.ltd.abccars.models.User;

@Repository
public interface UserRepository extends JpaRepository<User, Integer>{
    public User findUserByEmailAddress(String email);
    public List<User> findAllByRoleOrderByUserRegistrationDate(String role);
}
