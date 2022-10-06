package com.abc.cars.pte.ltd.abccars.controllers;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.Mockito.lenient;
import static org.mockito.Mockito.times;
import static org.mockito.Mockito.verify;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.junit.MockitoJUnitRunner;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.mock.web.MockMultipartFile;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.abc.cars.pte.ltd.abccars.models.Car;
import com.abc.cars.pte.ltd.abccars.models.CarBid;
import com.abc.cars.pte.ltd.abccars.models.User;
import com.abc.cars.pte.ltd.abccars.repositories.CarRepository;
import com.abc.cars.pte.ltd.abccars.repositories.UserRepository;
import com.abc.cars.pte.ltd.abccars.security.AuthFacade;
import com.abc.cars.pte.ltd.abccars.services.CarService;
import com.abc.cars.pte.ltd.abccars.services.UserService;
import com.abc.cars.pte.ltd.abccars.utilities.CarSearchObject;

@WebMvcTest(controllers = UserController.class)
@RunWith(MockitoJUnitRunner.class)
@AutoConfigureMockMvc
public class UserControllerTest {
    
    @InjectMocks
    UserController userController;

    @Mock
    UserService uService;

    @Mock
    CarService cService;

    @Mock
    RedirectAttributes rAttributes;

    @Mock
    UserRepository userRepository;

    @Mock
    UserService userService;
    
    @Mock
    AuthFacade authContext;

    @Mock
    AuthenticationManager authenticationManager;
    
    @Mock
    CarRepository cRepository;

    @Autowired
    MockMvc mock;

    @Autowired
	ServletContext context;
    
    @Test
    public void postCarTest() throws IOException{

        //setup
        Path path = Paths.get("D:\\Lithan Stuff\\ADP\\Summative\\abc-cars\\src\\main\\resources\\static\\img\\honda oddyssey.jpg");
        String name = "honda oddyssey.jpg";
        String originalFileName = "honda oddyssey.jpg";
        String contentType = "image/jpg";
        byte[] content = null;
        try {
            content = Files.readAllBytes(path);
        } catch (final IOException e) {
        }
        MultipartFile result = new MockMultipartFile(name,
                     originalFileName, contentType, content);

        Car car = new Car();
        car.setImage(result);
        car.setDescription("test description");
        car.setModel("Sedan");
        car.setCarName("2022 Toyota Corolla");
        car.setPrice("400000");
        car.setMake("Toyota");
        car.setTransmission("Automatic");
        
        //setting up new user
        User mockUser = new User();
        mockUser.setRole("user");
        mockUser.setFirstName("Daniel");
        mockUser.setLastName("Tejero");
        mockUser.setEmailAddress("johndanieltejero23@gmail.com");
        mockUser.setPassword("test");
        userRepository.save(mockUser);
         
        //setup authentication
        Authentication auth = authenticationManager
						.authenticate(new UsernamePasswordAuthenticationToken(mockUser.getEmailAddress(), mockUser.getPassword()));
				SecurityContextHolder.getContext().setAuthentication(auth);

        String resultView = userController.createCarPost(car, rAttributes);
        assertEquals("redirect:/carposted", resultView);

        String response = null;
        //lenient().when(cService.saveAndUpdateCar(car)).thenReturn(response);
    }

    @Test
    public void searchCarTest() throws ParseException{

        //setup
        List<Car> cars = cService.retrieveAllActivatedCars();

        Car car = new Car();
        car.setImagePath("Toyota Corolla.jpg");
        car.setDescription("test description");
        car.setModel("Sedan");
        car.setCarName("2022 Toyota Corolla");
        car.setPrice("400000");
        car.setMake("Toyota");
        car.setTransmission("Automatic");
        cService.saveAndUpdateCar(car);
        cars.add(car);

        Car car2 = new Car();
        car2.setImagePath("Honda Civic.jpg");
        car2.setDescription("test description");
        car2.setModel("Sedan");
        car2.setCarName("2022 Honda Civic");
        car2.setPrice("400000");
        car2.setMake("Honda");
        car2.setTransmission("Automatic");
        cService.saveAndUpdateCar(car2);
        cars.add(car2);

        Car car3 = new Car();
        car3.setImagePath("Nissan Versa.jpg");
        car3.setDescription("test description");
        car3.setModel("Sedan");
        car3.setCarName("2022 Nissan Versa");
        car3.setPrice("400000");
        car3.setMake("Nissan");
        car3.setTransmission("Automatic");
        cService.saveAndUpdateCar(car3);
        cars.add(car3);

        assertEquals(3, cars.size());
        CarSearchObject carObj = new CarSearchObject();
        String searchResult = userController.searchCarsWithFilters(carObj, rAttributes);
        verify(rAttributes, times(1)).addFlashAttribute("cars", cService.searchForCarFiltered(carObj));
        assertEquals("redirect:/car-listing", searchResult);
        
        lenient().when(cService.searchForCarFiltered(carObj)).thenReturn(cars);
    }

    @Test
    public void postBidTest() throws ParseException{

        Car car = new Car();
        car.setCarId(1);
        car.setImagePath("Toyota Corolla.jpg");
        car.setDescription("test description");
        car.setModel("Sedan");
        car.setCarName("2022 Toyota Corolla");
        car.setPrice("400000");
        car.setMake("Toyota");
        car.setTransmission("Automatic");
        car.setCarRegistration("2022-05-01");
        cRepository.save(car);
        cService.saveAndUpdateCar(car);
        
        //setting up new user
        User mockUser = new User();
        mockUser.setRole("user");
        mockUser.setFirstName("Daniel");
        mockUser.setLastName("Tejero");
        mockUser.setEmailAddress("johndanieltejero23@gmail.com");
        mockUser.setPassword("test");
        userRepository.save(mockUser);
        
        //setup authentication
        Authentication auth = authenticationManager
                        .authenticate(new UsernamePasswordAuthenticationToken(mockUser.getEmailAddress(), mockUser.getPassword()));
                SecurityContextHolder.getContext().setAuthentication(auth);
        
        //setup carBid
        CarBid carBid = new CarBid();
        carBid.setBidAppointment(new SimpleDateFormat("YYYY-MM-dd").format(new Date()));
        carBid.setBidAmount("300000");

        String message = userController.bidAction(1, carBid, car.getCarRegistration(), rAttributes);
        assertEquals("redirect:/car-details/" + 1, message);

        String response = null;
        //lenient().when(cService.addBid(carBid)).thenReturn(response);
    }
}
