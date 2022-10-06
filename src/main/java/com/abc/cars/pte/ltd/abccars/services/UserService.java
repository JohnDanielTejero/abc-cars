package com.abc.cars.pte.ltd.abccars.services;

import java.util.List;
import java.util.Optional;
import java.util.regex.Pattern;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.abc.cars.pte.ltd.abccars.exceptions.ProfileNotFoundException;
import com.abc.cars.pte.ltd.abccars.models.User;
import com.abc.cars.pte.ltd.abccars.repositories.UserRepository;

@Service
public class UserService {

    @Autowired
    UserRepository userrepo;

    @Transactional
    public String updateAndInsertUser(User user){
        userrepo.save(user);
		return "success"; 
    }

    public User findUserbyEmail(String email){
       return userrepo.findUserByEmailAddress(email);
    }

    public User findById(int id){

		Optional<User> user = userrepo.findById(id);
		if (!user.isPresent()){
			throw new ProfileNotFoundException("No user exists");
		}
        return user.get();
    }

	public Boolean validateName(String name) {
		String regexp ="[a-zA-Z][a-zA-Z ]*"; /*Regular Expression pattern to be tested*/
		return Pattern.matches(regexp, name); /*Returns a true or false if Regex is satisfied*/
	}

	/**
	 * Method for email validation
	 * @param String email parameter will be used to pass email entry needed to be validated
	 * @return boolean to indicate if constraints are satisfied
	 */
	public Boolean validateEmail(String email) { 
		String regexp = "^[a-zA-Z0-9_!#$%&’*+/=?`{|}~^.-]+@[a-zA-Z0-9.-]+$"; /*Regular Expression pattern to be tested*/
		return Pattern.matches(regexp, email); /*Returns a true or false if Regex is satisfied*/
	}
	
	/**
	 * Method to validate contact number entry
	 * @param String contact parameter will be used to pass contact number needed to be validated
	 * @return boolean to indicate if constraints are satisfied
	 */
	public Boolean validateContact(String contact) {
		String allCountryRegex = "^(\\+\\d{1,3}( )?)?((\\(\\d{1,3}\\))|\\d{1,3})[- .]?\\d{3,4}[- .]?\\d{4}$"; /*Regular Expression pattern to be tested*/
		return Pattern.matches(allCountryRegex, contact); /*Returns a true or false if Regex is satisfied*/
	}

	public List<User> searchAllUsersExcludeAdmin(){
		return userrepo.findAllByRoleOrderByUserRegistrationDate("user");
	}

	public void updateUserRole(int id){
		User user = userrepo.findById(id).get();
		user.setRole("admin");
		userrepo.save(user);
	}
}
