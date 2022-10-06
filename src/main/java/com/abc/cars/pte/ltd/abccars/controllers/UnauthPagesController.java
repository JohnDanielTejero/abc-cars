package com.abc.cars.pte.ltd.abccars.controllers;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.abc.cars.pte.ltd.abccars.security.AuthFacade;
import com.abc.cars.pte.ltd.abccars.services.RandomCarSuggestionService;
import com.abc.cars.pte.ltd.abccars.services.UserService;

@Controller
public class UnauthPagesController implements ErrorController{
    
    @Autowired
    AuthFacade authContext;

    @Autowired
    RandomCarSuggestionService rCarSuggestionService;

    @Autowired
    UserService userService;

    @Autowired
    AuthenticationManager authenticationManager;

    SecurityContextLogoutHandler logoutHandler = new SecurityContextLogoutHandler();

    @Autowired
    HttpServletRequest request;
    
    @Autowired
    HttpServletResponse response;

    @GetMapping("/")
    public String home(Model model){
        if (authContext.isAuthenticated()){
            model.addAttribute("cars", rCarSuggestionService.recommendedCarsAction());
            return "home";
        }
        return "index";
    }

    @GetMapping("/Registration")
    public String registration(){
        if (authContext.isAuthenticated()){
            return "redirect:/";
        }
        return "register";
    }

    @GetMapping("/login")
    public String login(Model model){
        if (authContext.isAuthenticated()){
            return "redirect:/";
        }
        return "login";
    }

    @GetMapping("/loginRedirect")
    public String redirectErrorLogin(@RequestParam("email")String email, 
        @RequestParam("password")String password, RedirectAttributes model){
            if (authContext.isAuthenticated()){
                return "redirect:/";
            }else{
                if (email.equals("empty")){
                    model.addFlashAttribute("emailerror", "field is required");
                }else if(email.equals("invalid")){
                    model.addFlashAttribute("emailerror", "invalid email address");
                }
    
                if (password.equals("empty")){
                    model.addFlashAttribute("passworderror", "field is required");
                }else if(password.equals("incorrect")){
                    model.addFlashAttribute("passworderror", "incorrect password");
                }
            }
        return "redirect:/login";
    }

    @GetMapping("/company")
    public String companyInformation(){
        return "company";
    }

    @GetMapping("/forgot-password")
    public String forgotPassword(){
        if (authContext.isAuthenticated()){
            return "redirect:/";
        }
        return "forgotpassword";
    }

    @GetMapping("/error")
    public String errorPage(HttpServletRequest req, Model model){
        model.addAttribute("errorcode", Integer.parseInt(req.getAttribute(RequestDispatcher.ERROR_STATUS_CODE) + ""));
        return "errorPage";
    }

    @PostMapping("/login")
    public String loginAction(@RequestParam("email")String email, 
    @RequestParam("password")String password){
		String redirectURL = "redirect:/login";
		
		if ((!email.isEmpty() && email != null) && (!password.isEmpty() && password != null)) {
			try {
				Authentication auth = authenticationManager
						.authenticate(new UsernamePasswordAuthenticationToken(email, password));
				SecurityContextHolder.getContext().setAuthentication(auth);
                SecurityContextHolder.getContext().setAuthentication(null);
                redirectURL = "/";
                // if(userService.findUserbyEmail(email).getRole().equals("admin")){
                //     redirectURL = "/admin/dashboard";
                // }else{
                //     redirectURL = "/home";
                // }
				
			} catch (BadCredentialsException ex) {
				
			}
		}
		return redirectURL;
    }


    @GetMapping("/logout")
    public String logout(){
        logoutHandler.logout(request, response, SecurityContextHolder.getContext().getAuthentication());
        logoutHandler.setInvalidateHttpSession(true);
        return "redirect:/";
    }

}
