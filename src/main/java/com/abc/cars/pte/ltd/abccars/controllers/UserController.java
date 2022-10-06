package com.abc.cars.pte.ltd.abccars.controllers;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.abc.cars.pte.ltd.abccars.exceptions.CarInactiveException;
import com.abc.cars.pte.ltd.abccars.exceptions.CarNotFoundException;
import com.abc.cars.pte.ltd.abccars.exceptions.ExceptionResponse;
import com.abc.cars.pte.ltd.abccars.exceptions.UnauthorizedSearchException;
import com.abc.cars.pte.ltd.abccars.models.Car;
import com.abc.cars.pte.ltd.abccars.models.CarBid;
import com.abc.cars.pte.ltd.abccars.models.User;
import com.abc.cars.pte.ltd.abccars.security.AuthFacade;
import com.abc.cars.pte.ltd.abccars.services.CarService;
import com.abc.cars.pte.ltd.abccars.services.RandomCarSuggestionService;
import com.abc.cars.pte.ltd.abccars.services.UserService;
import com.abc.cars.pte.ltd.abccars.utilities.CarSearchObject;

@Controller
public class UserController {
    
    @Autowired
    AuthFacade authContext;

    @Autowired
    UserService uService;

    @Autowired
	ServletContext context;

    @Autowired
    CarService cService;

    @Autowired
    RandomCarSuggestionService rCarSuggestionService;

    @GetMapping("/home")
    public String authHome(Model model){
        if (authContext.isAuthenticated()){
            model.addAttribute("cars", rCarSuggestionService.recommendedCarsAction());
            return "home";
        }else{
            return "index"; 
        }
    }
    
    @GetMapping("/postcar")
    public String postCar(Model model){
        String[] options = {"Automatic", "Manual"};
        model.addAttribute("carForm", new Car());
        model.addAttribute("options", options);
        return "postcar";
    }

    @GetMapping("/car-listing")
    public String carListing(Model model){ 
        if (model.getAttribute("cars") == null){
            model.addAttribute("cars", cService.retrieveAllActivatedCars());
        }
        return "car-list";
    }

    @GetMapping("/search-car")
    public String searchCar(Model model){
        model.addAttribute("searchForm", new CarSearchObject());
        return "browsecar";
    }

    @GetMapping("/car-details/{carId}")
    public String carDetails(@PathVariable("carId")int id, Model model){

        model.addAttribute("isAuthor", cService.carDetails(id).getUser().getUserId() == uService.findUserbyEmail(authContext.getAuth().getName().toString()).getUserId() ? true : false);
        model.addAttribute("car", cService.carDetails(id));
        model.addAttribute("bidForm", new CarBid());
        return "cardetails";
    }

    @GetMapping("/update-car/{carId}")
    public String updateCar(@PathVariable("carId") int id, Model model){
        String[] options = {"Automatic", "Manual"};
        model.addAttribute("options", options);
        model.addAttribute("carForm", cService.carDetailsForEdit(id));
        return "carupdate";
    }

    @GetMapping("/profile")
    public String userProfile(Model model){
        User user = uService.findUserbyEmail(authContext.getAuth().getName());
        model.addAttribute("userProfile", user);
        return "userprofile";
    }

    @GetMapping("/carposted")
    public String carPostedByUser(Model model){
        User user = uService.findUserbyEmail(authContext.getAuth().getName());
        model.addAttribute("cars", user.getCar());
        return "postedcarlisting";
    }

    @PostMapping("/updateProfileUser")
    public String updateProfile(@RequestParam("userId")int userId, @RequestParam("firstName") String fname, 
    @RequestParam("lastName") String lname, @RequestParam("userBirth")String birth, @RequestParam("city") String city, 
    @RequestParam("image") MultipartFile image, @RequestParam("contactNumber") String contactNumber, RedirectAttributes redirect) throws IOException{
        
        User user = uService.findById(userId);
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
            if(uService.validateName(fname)){
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
            if(uService.validateName(lname)){
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
            if (uService.validateContact(contactNumber)){
                user.setContactNumber(contactNumber);
            }else{
                contactIsValid = false;
                redirect.addFlashAttribute("contactErr", "Invalid Contact Number Format");
            }
        }

        if (contactIsValid && fnameIsValid && lnameIsValid && imageIsValid){
            uService.updateAndInsertUser(user);
            System.out.println(System.getProperty("user.dir") + "/src/main/resources/static/img");
        }

        return "redirect:/profile";
    }

    @PostMapping("/newcarpost")
    public String createCarPost(@ModelAttribute("carForm") Car car, RedirectAttributes redirect) throws IOException{

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
        }
        //model
        if(car.getModel().isEmpty() || car.getModel() == null){
            modelIsValid = false;
            redirect.addFlashAttribute("modelErr", "Field is required");
        }

        //manufacturer
        if (car.getMake().isEmpty() || car.getMake() == null){
            manufacturerIsValid = false;
            redirect.addFlashAttribute("manufacturerErr", "Field is required");
        }

        //transmission type
        if (car.getTransmission().equalsIgnoreCase("default")){
            transmissionIsValid = false;
            redirect.addFlashAttribute("transmissionErr", "Field is required");
        }

        //price
        if (car.getPrice().isEmpty() || car.getPrice() == null){
            priceIsValid = false;
            redirect.addFlashAttribute("priceErr", "Field is required");
        }
        
        //description
        if (car.getDescription().isEmpty() || car.getDescription() == null){
            descIsValid = false;
            redirect.addFlashAttribute("descErr", "Field is required");
        }

        //image
        if (!car.getImage().isEmpty() && car.getImage() != null){
            String extension = FilenameUtils.getExtension(car.getImage().getOriginalFilename());
            
            if (extension.equalsIgnoreCase("jpg") || extension.equalsIgnoreCase("png") || extension.equalsIgnoreCase("jpeg")){
                String userDirectory = new File("").getAbsolutePath().concat("/src/main/webapp");
                String filename = userDirectory.concat("/carPicture/") + car.getImage().getOriginalFilename();
                car.setImagePath(car.getImage().getOriginalFilename());

                try {
                    car.getImage().transferTo(new File(filename));
                } catch (IllegalStateException e) {
                    e.printStackTrace();
                }

            }else{
                imageIsValid = false;
                redirect.addFlashAttribute("imageErr","Invalid file type");
            }
        }else{
            imageIsValid = false;
            redirect.addFlashAttribute("imageErr", "Field is required");
        }

        if (modelIsValid && manufacturerIsValid && transmissionIsValid && 
            priceIsValid && imageIsValid && descIsValid && nameIsValid){
            User user = authContext.getUser();
            car.setUser(user);
            car.setCarRegistration(new SimpleDateFormat("YYYY-MM-dd").format(new Date()));
            car.setCarPostStatus(true);
            cService.saveAndUpdateCar(car);
            return "redirect:/carposted"; 
        }
        return "redirect:/postcar";
    }

    @PostMapping("/carUpdate")
    public String updateCarInformation(@ModelAttribute("carForm")Car car, RedirectAttributes redirect) throws IOException{
        
        Car currentCar = cService.carDetails(car.getCarId());
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
            cService.saveAndUpdateCar(currentCar);
        }

        return "redirect:/update-car/" + car.getCarId();
    }

    @PostMapping("/placeBid/{cid}")
    public String bidAction(@PathVariable("cid") int id, @ModelAttribute("bidForm") CarBid carBid, 
    @RequestParam("registrationDate")String dateRegister, RedirectAttributes redirect) throws ParseException{
        
        boolean dateIsValid = true;
        boolean bidIsValid = true;
        
        if (carBid.getBidAppointment().isEmpty() || carBid.getBidAppointment() == null){
            dateIsValid = false;
            redirect.addFlashAttribute("appointmentErr", "Field is required");
        }else{
            Date dateAppointment= new SimpleDateFormat("YYYY-MM-dd").parse(carBid.getBidAppointment());
            Date dateRegistration = new SimpleDateFormat("YYYY-MM-dd").parse(dateRegister);

            if(dateAppointment.compareTo(dateRegistration) < 0){
                dateIsValid = false;
                redirect.addFlashAttribute("appointmentErr", "Invalid date input");
            }
        }

        if (carBid.getBidAmount().isEmpty() || carBid.getBidAmount() == null){
            bidIsValid = false;
            redirect.addFlashAttribute("bidErr", "Field is required");
        }

        if (dateIsValid && bidIsValid){
            carBid.setUser(authContext.getUser());
            carBid.setCar(cService.carDetails(id));
            carBid.setBidRegistDate(new SimpleDateFormat("YYYY/MM/dd").format(new Date()));
            cService.addBid(carBid);
        }

        return "redirect:/car-details/" + id;
    }

    @PostMapping("/searchFilters")
    public String searchCarsWithFilters(@ModelAttribute("searchForm") CarSearchObject carObj, RedirectAttributes redirect) throws ParseException{
        List<Car> cars = cService.searchForCarFiltered(carObj);
        redirect.addFlashAttribute("filters", carObj);
        redirect.addFlashAttribute("cars", cars);
        return "redirect:/car-listing";
    }

    @PostMapping("/activatePost/{id}")
    public String activateCarPost(@PathVariable("id")int id){
        cService.toggleCarStatus(id);
        return "redirect:/carposted";
    }
    
    @PostMapping("/deactivatePost/{id}")
    public String deactivateCarPost(@PathVariable("id")int id){
        cService.toggleCarStatus(id);
        return "redirect:/carposted";
    }

    @PostMapping("/deleteCar/{id}")
    public String deleteCar(@PathVariable("id")int id){
        cService.deleteCar(id);
        return "redirect:/carposted";
    }
    @ExceptionHandler(CarInactiveException.class)
    public String carInactiveException(CarInactiveException ex, WebRequest webRequest, Model model){
        ExceptionResponse response = new ExceptionResponse();
        response.setDateTime(LocalDateTime.now());
        response.setDescription(ex.getMessage());
        response.setStatusCode(HttpStatus.FORBIDDEN.toString());
        response.setMessage("The car you are looking for is deactivated therefore you have no permission to view");

        model.addAttribute("response", response);
        return "exception";
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

    @ExceptionHandler(UnauthorizedSearchException.class)
    public String unauthorizedSearchException(UnauthorizedSearchException ex, WebRequest webRequest, Model model){
        ExceptionResponse response = new ExceptionResponse();
        response.setDateTime(LocalDateTime.now());
        response.setDescription(ex.getMessage());
        response.setStatusCode(HttpStatus.FORBIDDEN.toString());
        response.setMessage("You are searching using an invalid keyword.");

        model.addAttribute("response", response);
        return "exception";
    }
}
