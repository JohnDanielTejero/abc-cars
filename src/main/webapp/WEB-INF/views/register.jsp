<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <jsp:include page="components/headMetadata.jsp" />
    <link rel="stylesheet" type="text/css" href="/css/body-nav.css" />

</head>

<body>
    <jsp:include page="components/header.jsp" />
    <main>
        <div class="w-100" style="padding-top:6.5rem;">
            <div class="container">
                <div class="py-5">
                    <div class="card">
                        <div class="card-header bg-transparent border-0">
                            <nav class="nav-tabs-wrapper forget-password-nav">
                                <button class="nav-forget-password-selector" data-fp-active="true" data-fp-enabled="true" data-fp-page="1" data-fp-target="#registration">
                                    1
                                </button>
                                <button class="nav-forget-password-selector" data-fp-active="false" data-fp-enabled="false" data-fp-page="2" data-fp-target="#verification-code">
                                    2
                                </button>
                                <button class="nav-forget-password-selector" data-fp-active="false" data-fp-enabled="false" data-fp-page="3" data-fp-target="#thank-you">
                                    3
                                </button>
                            </nav>
                        </div>
                        <div class="card-body">
                            <input type = "hidden" name = "${_csrf.parameterName}" content = "${_csrf.headerName}" value = "${_csrf.token}" id = "csrf"/>
                            <div class="nav-tab-container">
                                <div class="w-100 nav-tab-content tab-animation-fade tab-active" style="min-height:30rem" id="registration" data-fp-toggled="true">
                                    <div class="row py-5 px-3">
                                        <div class="col-lg-3 col-12">
                                        </div>
                                        <div class="col-lg-6 col-12">
                                            <div class="card shadow-lg">
                                                <div class="card-header bg-transparent border-0">
                                                    <span class="d-block text-center fw-bold text-uppercase mb-5" style="font-size:1.77rem;">
                                                        Register to ABC Cars
                                                    </span>
                                                    <span class="text-muted text-center d-block">Already have an account? 
                                                        <a href = "/login" class = "text-dark fw-bold form-links" style = "text-decoration:none !important;">login</a>
                                                    </span>
                                                </div>
                                                <div class="card-body" style="min-height:30rem;">
                                                    <div class="container">
                                                        <form id = "register-form">
                                                            <div class="row gx-2 gy-3">
                                                                <div class="col-12">
                                                                    <div class="form-floating">
                                                                        <input class="form-control" id="email-address"/>
                                                                        <label for="email-address">Email Address</label>
                                                                        <div class = "invalid-feedback" id = "email-addressfeedback">
                                                                        
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-6 col-12">
                                                                    <div class="form-floating">
                                                                        <input class="form-control" id="fname" />
                                                                        <label for="fname">First Name</label>
                                                                        <div class = "invalid-feedback" id = "fnamefeedback">
                                                                        
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-6 col-12">
                                                                    <div class="form-floating">
                                                                        <input class="form-control" id="lname" />
                                                                        <label for="lname">Last Name</label>
                                                                        <div class = "invalid-feedback" id = "lnamefeedback">
                                                                        
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-12">
                                                                    <div class="form-floating">
                                                                        <input class="form-control" id="rpw" type = "password" />
                                                                        <label for="rpw">Password</label>
                                                                        <div class = "invalid-feedback" id = "rpwfeedback">
                                                                        
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-12">
                                                                    <div class="form-floating">
                                                                        <input class="form-control" id="cpw" type = "password"/>
                                                                        <label for="cpw">Confirm Password</label>
                                                                        <div class = "invalid-feedback" id = "cpwfeedback">
                                                                        
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-12">
                                                                    <button id = "register-button" class="w-100 btn btn-outline-dark bg-gradient border border-dark rounded-pill">
                                                                        Register
                                                                    </button>
                                                                </div>
                                                            </div>
                                                        </form>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-3 col-12">
                                        </div>
                                    </div>
                                </div>
                                <div class="w-100 nav-tab-content tab-animation-fade" style="min-height:30rem" id="verification-code" data-fp-toggled="false">
                                    <div class="card bg-transparent border-0">
                                        <div class="card-header bg-transparent border-0">
                                            <span class="d-block text-center h3 fw-bolder text-uppercase">
                                                Verification Code
                                            </span>
                                        </div>
                                        <div class="card-body">
                                            <p>
                                                Please enter the verification code sent to your email.
                                            </p>
                                            <form class="form-floating">
                                                <input class="form-control" id="verification-input" />
                                                <label for="verification-code">Verification Code</label>
                                                <div class = "invalid-feedback" id = "verification-inputfeedback">
                                                                        
                                                </div>
                                                <button class="btn btn-outline-dark bg-gradient w-100 mt-3" id ='verification-button'>
                                                    Submit
                                                </button>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                                <div class="w-100 nav-tab-content tab-animation-fade" style="min-height:30rem" id="thank-you" data-fp-toggled="false">
                                    <div class="card bg-transparent border-0">
                                        <div class="card-header bg-transparent border-0">
                                            <span class="d-block text-center h3 fw-bolder text-uppercase">
                                                All Set!
                                            </span>
                                        </div>
                                        <div class="card-body">
                                            <p>
                                                You have successfully registered to the platform, please proceed to login.
                                            </p>
                                            <div class="mt-5">
                                                <p class="text-start fw-bold">Best regards!</p>
                                                <p class="text-start fw-bold">ABC Cars Support Staff</p>
                                            </div>
                                            <a href="/login" class="btn btn-outline-dark w-100 border rounded-pill border-dark">Login</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </main>
    <script defer src="/js/body-nav.js"></script>
    <script type = "text/javascript" defer>

        //CSRF
        let CSRF = document.querySelector("#csrf");

        //nav above
        const tabSelector = document.querySelectorAll(".nav-forget-password-selector");
        let activeTabs = document.querySelectorAll("[data-fp-enabled='true']");
        let currentTabsActivated = activeTabs.length;

        //forms
        const registrationForm = document.querySelector("#register-form");
        const verificationForm = document.querySelector("#verification-code");
        
        //registration fields
        const emailaddress = document.querySelector("#email-address");
        const fname =  document.querySelector("#fname");
        const lname = document.querySelector("#lname");
        const rawPass = document.querySelector("#rpw");
        const confPass = document.querySelector("#cpw");
        const regButton = document.querySelector("#register-button");

        const verificationButton = document.querySelector("#verification-button");
        //verification code field
        const verifyInput = document.querySelector("#verification-input");

        const fields =  [emailaddress, fname, lname, rawPass, confPass, verifyInput];

        fields.forEach(element => {
            element.addEventListener("focusout", function(){
                element.classList.remove("is-invalid");
                const feedback = document.querySelector("#" + element.getAttribute("id") + "feedback");
                feedback.innerHTML = "";
            })
        });

        //feedback
        const emailaddressfeedback = document.querySelector("#email-addressfeedback");
        const fnamefeedback =  document.querySelector("#fnamefeedback");
        const lnamefeedback = document.querySelector("#lnamefeedback");
        const rawPassfeedback = document.querySelector("#rpwfeedback");
        const confPassfeedback = document.querySelector("#cpwfeedback");

        //object
        let regObj;

        registrationForm.addEventListener("submit", function(e){
            e.preventDefault();
            registrationAction();
            
        });
        
        function validateName(name) {
            var regex = /^[A-Z][a-z]*$/;
            return regex.test(name);
        }

        //email validator
        function validateEmail(email) {
            var regex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
            return regex.test(email);
        }

        function emailExist(validate, callback){
            ajaxCall("/validateEmail/" + validate, "GET", null, null, null, null, callback);
        }

        function ajaxCall(url, method, send, header, token, response, callback){
            
            var xhr = new XMLHttpRequest();
            if (response == null){ 
                xhr.onreadystatechange = () => {
                    if (xhr.readyState == 4 && xhr.status == 200) {
                        let responseDetails = JSON.parse(xhr.responseText);
                        ajaxCall(url, method, send, header, token, responseDetails, callback);
                    }
                }
                xhr.open(method, url, true);

                if (method == "POST"){
				    xhr.setRequestHeader(header, token);
			    }

                xhr.send(send);
           }else{  
               if (callback != null){   
                    callback(response);
                }
           }
            
        }

        function registrationAction(response){
            if (response == null){
                if (emailaddress.value.trim().length == 0 || fname.value.trim().length == 0 || lname.value.trim().length == 0 
                    || rawPass.value.trim().length == 0 || confPass.value.trim().length == 0){

                    if (emailaddress.value.trim().length == 0){
                        emailaddress.classList.add("is-invalid");
                        emailaddressfeedback.innerHTML = "this field is required";
                    }

                    if (fname.value.trim().length == 0){
                        fname.classList.add("is-invalid");
                        fnamefeedback.innerHTML = "this field is required";
                    }

                    if (lname.value.trim().length == 0){
                        lname.classList.add("is-invalid");
                        lnamefeedback.innerHTML = "this field is required";
                    }

                    if (rawPass.value.trim().length == 0){
                        rawPass.classList.add("is-invalid");
                        rawPassfeedback.innerHTML = "this field is required";
                    }

                    if (confPass.value.trim().length == 0){
                        confPass.classList.add("is-invalid");
                        confPassfeedback.innerHTML = "this field is required";
                    }
                    
                }else{
                    if (!validateName(fname.value) || !validateName(lname.value) || !validateEmail(emailaddress.value) 
                            || rawPass.value != confPass.value){
                    
                        if (!validateName(fname.value.trim())){
                            fname.classList.add("is-invalid");
                            fnamefeedback.innerHTML = "invalid name format";
                        }

                        if (!validateName(lname.value.trim())){
                            lname.classList.add("is-invalid");
                            lnamefeedback.innerHTML = "invalid name format";
                        }

                        if (!validateEmail(emailaddress.value.trim())){
                            emailaddress.classList.add("is-invalid");
                            emailaddressfeedback.innerHTML = "invalid email format";
                        }

                        if (rawPass.value.trim() != confPass.value.trim()){
                            confPass.classList.add("is-invalid");
                            confPassfeedback.innerHTML = "mismatching password"
                        }

                    }else{
                        emailExist(emailaddress.value.trim(), registrationAction);
                    }
                }
            }else{
                if (response == true){
                    onSubmitNextPage(regButton);
                    regObj = {
                        "emailAddress": emailaddress.value,
                        "password": rawPass.value,
                        "firstName": fname.value,
                        "lastName": lname.value,
                        "role": "user"
                    }
                    verify();                
                }else{
                    emailaddress.classList.add("is-invalid");
                    emailaddressfeedback.innerHTML = "email in use";
                }
            
            }
        }

        function verify(response){
            if (response == null){
                verificationForm.setAttribute("disabled", true);
                verificationButton.innerHTML= "Sending...";
                verificationButton.setAttribute("disabled", true);
                ajaxCall("/sendCode?email=" + regObj.emailAddress, "GET", null, null, null, null, verify);
            }else{
                verificationForm.removeAttribute("disabled");
                verificationButton.innerHTML = "Submit";
                verificationButton.removeAttribute("disabled");
                verificationForm.addEventListener("submit", function (event){
                    event.preventDefault();
                    if (verifyInput.value.trim().length != 0){
                        if (verifyInput.value.trim() == response){
                            onSubmitNextPage(document.querySelector("#verification-button"));

                            //add insertion code 
                            let toSend = JSON.stringify(regObj);
                            ajaxCall("/registerUser", "POST", toSend, CSRF.getAttribute("content"), CSRF.getAttribute("value"), null, null);

                        }else{
                            verifyInput.classList.add("is-invalid");
                            document.querySelector("#" + verifyInput.getAttribute("id") + "feedback").innerHTML = "Incorrect Code";
                        }
                    }else{
                        verifyInput.classList.add("is-invalid");
                        document.querySelector("#" + verifyInput.getAttribute("id") + "feedback").innerHTML = "Field is required";
                    }
                   
                }); 
            }
            
        }

        function onSubmitNextPage(button){
            button.setAttribute("disabled", true);
            currentTabsActivated++;
            let nextPage = document.querySelector("[data-fp-page = '" + currentTabsActivated + "']");
            nextPage.setAttribute("data-fp-enabled", true);
            tabSelector.forEach(e => {
                e.setAttribute("data-fp-active", false);
            });
            nextPage.setAttribute("data-fp-active", true);
            switchForgetPasswordTab(tabSelector, nextPage);
        }
    </script>
    <jsp:include page="components/footer.jsp" />
</body>

</html>