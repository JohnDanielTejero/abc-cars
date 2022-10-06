package com.abc.cars.pte.ltd.abccars.controllers;

import java.io.File;
import java.io.IOException;
import java.time.LocalDateTime;

import javax.servlet.ServletContext;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.abc.cars.pte.ltd.abccars.exceptions.CarNotFoundException;
import com.abc.cars.pte.ltd.abccars.exceptions.ExceptionResponse;
import com.abc.cars.pte.ltd.abccars.exceptions.ProfileNotFoundException;
import com.abc.cars.pte.ltd.abccars.models.Car;
import com.abc.cars.pte.ltd.abccars.models.User;
import com.abc.cars.pte.ltd.abccars.services.CarService;
import com.abc.cars.pte.ltd.abccars.services.UserService;

@Controller
@RequestMapping("/admin")
public class AdminController {
    
    @Autowired
    UserService userService;

    @Autowired
    CarService carService;

    @Autowired
	ServletContext context;

    @GetMapping("/dashboard")
    public String adminPage(Model model){
        model.addAttribute("users", userService.searchAllUsersExcludeAdmin());
        model.addAttribute("cars", carService.retrieveAllCars());
        return "admin";
    }
 
    @GetMapping("/profile/{id}")
    public String userProfileAdmin(@PathVariable("id")int userId, Model model){
        model.addAttribute("userProfile", userService.findById(userId));
        return "adminuserprofile";
    }

    @GetMapping("/update-car/{carid}")
    public String updateCarAdmin(@PathVariable("carid")int carId, Model model){
        String[] options = {"Automatic", "Manual"};
        model.addAttribute("options", options);
        model.addAttribute("carForm", carService.carDetailsForEdit(carId));
        return "admincarupdate";
    }

    @PostMapping("/makeAdmin/{userId}")
    public String makeAdminAction(@PathVariable("userId")int userId){
        userService.updateUserRole(userId);
        return "redirect:/admin/dashboard";
    }

    @PostMapping("/update-user-profile")
    public String updateProfileAction(@RequestParam("userId")int userId, @RequestParam("firstName") String fname, 
    @RequestParam("lastName") String lname, @RequestParam("userBirth")String birth, @RequestParam("city") String city, 
    @RequestParam("image") MultipartFile image, @RequestParam("contactNumber") String contactNumber, RedirectAttributes redirect) throws IOException{
        
        User user = userService.findById(userId);
        //boolean for checking
        boolean imageIsValid = true;
        boolean lnameIsValid = true;
        boolean fnameIsValid = true;
        boolean contactIsValid = true;

        //check for image
        if (image != null && !image.isEmpty()) {
			
            String extension = FilenameUtils.getExtension(image.getOriginalFilename());
            
            if (extension.equalsIgnoreCase("jpg") || extension.equalsIgnoreCase("png") || extension.equalsIgnoreCase("jpeg")){
                String filename = context.getRealPath("/").concat("/profilePicture/") + image.getOriginalFilename();
                user.setImagePath(image.getOriginalFilename());

                try {
                    image.transferTo(new File(filename));
                } catch (IllegalStateException e) {
                    e.printStackTrace();
                }

            }else{
                imageIsValid = false;
                redirect.addFlashAttribute("imgErr", "Invalid file type");
            }
		}

        //check for first name
        if (!fname.isEmpty() && fname != null){
            if(userService.validateName(fname)){
                user.setFirstName(fname);
            }else{
                fnameIsValid = false;
                redirect.addFlashAttribute("fnameErr", "Invalid name format");
            }
        }else{
            fnameIsValid = false;
            redirect.addFlashAttribute("fnameErr", "Field is required");
        }

        //check for last name
        if (!lname.isEmpty() && lname != null){
            if(userService.validateName(lname)){
                user.setLastName(lname);
            }else{
                lnameIsValid = false;
                redirect.addFlashAttribute("lnameErr", "Invalid name format");
            }
        }else{
            lnameIsValid = false;
            redirect.addFlashAttribute("lnameErr", "Field is required");
        }

        //check for birth date
        if (!birth.isEmpty() && birth != null){
            user.setUserBirth(birth);
        }

        //check city
        if (!city.isEmpty() && city != null){
            user.setCity(city);
        }

        //contact number
        if (!contactNumber.isEmpty() && contactNumber != null){
            if (userService.validateContact(contactNumber)){
                user.setContactNumber(contactNumber);
            }else{
                contactIsValid = false;
                redirect.addFlashAttribute("contactErr", "Invalid Contact Number Format");
            }
        }

        if (contactIsValid && fnameIsValid && lnameIsValid && imageIsValid){
            userService.updateAndInsertUser(user);
        }
        return "redirect:/admin/profile/" + userId;
    }

    @PostMapping("/updateCar")
    public String updateCarAction(@ModelAttribute("carForm")Car car, RedirectAttributes redirect) throws Exception{
        Car currentCar = carService.carDetails(car.getCarId());
        //validators
        boolean nameIsValid = true;
        boolean modelIsValid = true;
        boolean manufacturerIsValid = true;
        boolean transmissionIsValid = true;
        boolean descIsValid = true;
        boolean priceIsValid = true;
        boolean imageIsValid = true;
        
        //name
        if(car.getCarName().isEmpty() || car.getCarName() == null){
            nameIsValid = false;
            redirect.addFlashAttribute("nameErr", "Field is required");
        }else{
            currentCar.setCarName(car.getCarName());
        }

        //model
        if(car.getModel().isEmpty() || car.getModel() == null){
            modelIsValid = false;
            redirect.addFlashAttribute("modelErr", "Field is required");
        }else{
            currentCar.setModel(car.getModel());
        }

        //manufacturer
        if (car.getMake().isEmpty() || car.getMake() == null){
            manufacturerIsValid = false;
            redirect.addFlashAttribute("manufacturerErr", "Field is required");
        }else{
            currentCar.setMake(car.getMake());
        }

        //transmission type
        if (car.getTransmission().equalsIgnoreCase("default")){
            transmissionIsValid = false;
            redirect.addFlashAttribute("transmissionErr", "Field is required");
        }else{
            currentCar.setTransmission(car.getTransmission());
        }

        //price
        if (car.getPrice().isEmpty() || car.getPrice() == null){
            priceIsValid = false;
            redirect.addFlashAttribute("priceErr", "Field is required");
        }else{
            currentCar.setPrice(car.getPrice());
        }
        
        //description
        if (car.getDescription().isEmpty() || car.getDescription() == null){
            descIsValid = false;
            redirect.addFlashAttribute("descErr", "Field is required");
        }else{
            currentCar.setDescription(car.getDescription());
        }

        //image
        if (!car.getImage().isEmpty() && car.getImage() != null){
            String extension = FilenameUtils.getExtension(car.getImage().getOriginalFilename());
            
            if (extension.equalsIgnoreCase("jpg") || extension.equalsIgnoreCase("png") || extension.equalsIgnoreCase("jpeg")){
                String filename = context.getRealPath("/").concat("/carPicture/") + car.getImage().getOriginalFilename();
                currentCar.setImagePath(car.getImage().getOriginalFilename());

                try {
                    car.getImage().transferTo(new File(filename));
                } catch (IllegalStateException e) {
                    e.printStackTrace();
                }

            }else{
                imageIsValid = false;
                redirect.addFlashAttribute("imageErr","Invalid file type");
            }
        }

        if (modelIsValid && manufacturerIsValid && transmissionIsValid && 
            priceIsValid && imageIsValid && descIsValid && nameIsValid){
            carService.saveAndUpdateCar(currentCar);
        }

        return "redirect:/admin/update-car/" + car.getCarId();
    }
    
    @PostMapping("/deleteCar/{id}")
    public String deleteCarAction(@PathVariable("id")int id){
        carService.deleteCar(id);
        return "redirect:/admin/dashboard";
    }

    
    @PostMapping("/activatePost/{id}")
    public String activateCarPost(@PathVariable("id")int id){
        carService.toggleCarStatus(id);
        return "redirect:/admin/dashboard";
    }
    
    @PostMapping("/deactivatePost/{id}")
    public String deactivateCarPost(@PathVariable("id")int id){
        carService.toggleCarStatus(id);
        return "redirect:/admin/dashboard";
    }
    
    @ExceptionHandler(CarNotFoundException.class)
    public String carNotFoundException(CarNotFoundException ex, WebRequest webRequest, Model model){
        ExceptionResponse response = new ExceptionResponse();
        response.setDateTime(LocalDateTime.now());
        response.setDescription(ex.getMessage());
        response.setStatusCode(HttpStatus.NOT_FOUND.toString());
        response.setMessage("The car you are looking for does not exist");
        
        model.addAttribute("response", response);
        return "exception";
    }
    
    @ExceptionHandler(ProfileNotFoundException.class)
    public String noProfileFound(ProfileNotFoundException ex, WebRequest webRequest, Model model){
        ExceptionResponse response = new ExceptionResponse();
        response.setDateTime(LocalDateTime.now());
        response.setDescription(ex.getMessage());
        response.setStatusCode(HttpStatus.NOT_FOUND.toString());
        response.setMessage("The car you are looking for does not exist");
    
        model.addAttribute("response", response);
        return "exception";
    }
}
