<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <jsp:include page = "components/headMetadata.jsp"/>
        <link rel = "stylesheet" type = "text/css" href = "/css/body-nav.css">
    </head>
    <body>
        <jsp:include page = "components/header.jsp"/>
        <main>
            <div class = "w-100" style = "padding-top:6.5rem;">
              <div class = "container">
                <div class = "py-5">
                    <div class = "card">
                        <div class = "card-header bg-transparent border-0">
                            <nav class = "nav-tabs-wrapper forget-password-nav">
                                <button class = "nav-forget-password-selector" data-fp-active = "true" data-fp-enabled = "true" data-fp-page = "1" data-fp-target = "#email-verification">
                                    1
                                </button>
                                <button class = "nav-forget-password-selector" data-fp-active = "false" data-fp-enabled = "false" data-fp-page = "2" data-fp-target = "#verification-code">
                                    2
                                </button>
                                <button class = "nav-forget-password-selector" data-fp-active = "false" data-fp-enabled = "false" data-fp-page = "3" data-fp-target = "#change-password">
                                    3
                                </button>
                                <button class = "nav-forget-password-selector" data-fp-active = "false" data-fp-enabled = "false" data-fp-page = "4" data-fp-target = "#thank-you">
                                    4
                                </button>
                            </nav>
                        </div>
                        <div class = "card-body">
                            <input type = "hidden" name = "${_csrf.parameterName}" content = "${_csrf.headerName}" value = "${_csrf.token}" id = "csrf"/>
                            <div class ="nav-tab-container">
                                <div class = "w-100 nav-tab-content tab-animation-fade tab-active" style = "min-height:30rem" id = "email-verification" data-fp-toggled = "true">
                                    <div class ="card bg-transparent border-0">
                                        <div class ="card-header bg-transparent border-0">
                                            <span class = "d-block text-center h3 fw-bolder text-uppercase">
                                                Forgot Your Password?
                                            </span>
                                        </div>
                                        <div class = "card-body">
                                            <p>
                                                For us to determine your identity, please enter your email address on the field below.
                                            </p>
                                            <form class ="form-floating" id = "form-email">
                                                <input class = "form-control" id = "email-address">
                                                <label for = "email-address">Email Address</label>
                                                <div class = "invalid-feedback" id = "email-addressfeedback">
                                                                        
                                                </div>
                                                <button class = "btn btn-outline-dark bg-gradient w-100 mt-3" id = "email-search">
                                                    Search
                                                </button>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                                <div class = "w-100 nav-tab-content tab-animation-fade" style = "min-height:30rem" id = "verification-code" data-fp-toggled = "false">
                                    <div class ="card bg-transparent border-0">
                                        <div class ="card-header bg-transparent border-0">
                                            <span class = "d-block text-center h3 fw-bolder text-uppercase">
                                                Verification Code
                                            </span>
                                        </div>
                                        <div class = "card-body">
                                            <p>
                                                Please enter the verification code sent to your email.
                                            </p>
                                            <form class ="form-floating" id = "form-verification">
                                               
                                                <input class = "form-control" id = "verification-codeinput">
                                                <label for = "verification-code">Verification Code</label>
                                                <div class = "invalid-feedback" id = "verification-codeinputfeedback">
                                                                        
                                                </div>
                                                <button class = "btn btn-outline-dark bg-gradient w-100 mt-3" id = "verification-button">
                                                    Submit
                                                </button>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                                <div class = "w-100 nav-tab-content tab-animation-fade" style = "min-height:30rem" id = "change-password" data-fp-toggled = "false">
                                    <div class ="card bg-transparent border-0">
                                        <div class ="card-header bg-transparent border-0">
                                            <span class = "d-block text-center h3 fw-bolder text-uppercase">
                                                Renew Password
                                            </span>
                                        </div>
                                        <div class = "card-body">
                                            <p>
                                                You have successfully verified your identity, please enter a new password.
                                            </p>
                                            <form class ="row gy-2" id = "form-changepass">
                                                <div class ="col-12 form-floating">
                                                    <input class = "form-control" id = "raw-password" type = "password">
                                                    <label for = "raw-password" class = "ms-2">New Password</label>
                                                    <div class = "invalid-feedback" id = "raw-passwordfeedback">
                                                                        
                                                    </div>
                                                </div>                               
                                                <div class ="col-12 form-floating">
                                                    <input class = "form-control" id = "confirm-password" type = "password">
                                                    <label for = "confirm-password" class = "ms-2">Confirm Password</label>
                                                    <div class = "invalid-feedback" id = "confirm-passwordfeedback">
                                                    </div>
                                                </div>
                                                <div class ="col-12">
                                                    <button class = "btn btn-outline-dark bg-gradient w-100 mt-3" id ="password-change-button">
                                                        Submit
                                                    </button>
                                                </div>                         
                                            </form>
                                        </div>
                                    </div>
                                </div>
                                <div class = "w-100 nav-tab-content tab-animation-fade" style = "min-height:30rem" id = "thank-you" data-fp-toggled = "false">
                                    <div class ="card bg-transparent border-0">
                                        <div class ="card-header bg-transparent border-0">
                                            <span class = "d-block text-center h3 fw-bolder text-uppercase">
                                                Account Recover Success
                                            </span>
                                        </div>
                                        <div class = "card-body">
                                            <p>
                                                You have successfully recovered your account, please proceed to login.
                                            </p>
                                            <p>
                                                Tip: Keep it inside a note or use a password manager app.
                                            </p>
                                            <div class="mt-5">
                                                <p class="text-start fw-bold">Best regards!</p>
                                                <p class="text-start fw-bold">ABC Cars Support Staff</p>
                                            </div>

                                            <a href = "/login" class = "btn btn-outline-dark w-100 border rounded-pill border-dark">Login</a>
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
        <script defer src = "/js/body-nav.js">
        </script>
        <script defer>
            //CSRF
            let CSRF = document.querySelector("#csrf");

            //nav above
            const tabSelector = document.querySelectorAll(".nav-forget-password-selector");
            let activeTabs = document.querySelectorAll("[data-fp-enabled='true']");
            let currentTabsActivated = activeTabs.length;

            //Forms
            const emailVerificationForm = document.querySelector("#form-email");
            const verificationCodeForm = document.querySelector("#form-verification");
            const changePassForm = document.querySelector("#form-changepass");

            //fields
            const emailInput = document.querySelector("#email-address");
            const verificationInput = document.querySelector("#verification-codeinput");
            const rawPassInput = document.querySelector("#raw-password");
            const confPassInput = document.querySelector("#confirm-password");
            
            //buttons
            const emailButton = document.querySelector("#email-search");
            const verificationButton = document.querySelector("#verification-button");
            const passwordChangeButton = document.querySelector("#password-change-button")

            var changePassObj;

            const fields = [emailInput, verificationInput, rawPassInput, confPassInput];
            
            fields.forEach((field) => {
                field.addEventListener("focusout", function(){
                    field.classList.remove("is-invalid");
                    const target = document.querySelector("#" + field.getAttribute("id") + "feedback");
                    target.innerHTML = "";
                });
            })

            emailVerificationForm.addEventListener("submit", function(event){
                event.preventDefault();
                verifyEmail();
            });

            function verifyEmail(response){
                if (response == null){
                    if (emailInput.value.trim().length == 0){
                        emailInput.classList.add("is-invalid");
                        document.querySelector("#" + emailInput.getAttribute("id") + "feedback").innerHTML = "this field is required";
                    }else{
                        ajaxCall("/validateEmail/" + emailInput.value.trim(), "GET", null, null, null, null, verifyEmail);
                    }
                }else{
                    if (response == false){
                        onSubmitNextPage(emailButton);
                        changePassObj = {
                            "emailAddress": emailInput.value,
                            "password" : null,
                            "firstName": null,
                            "lastName": null,
                            "role": null
                        }
                        verifyCode();
                    }else{
                        emailInput.classList.add("is-invalid");
                        document.querySelector("#" + emailInput.getAttribute("id") + "feedback").innerHTML = "No email found";
                    }
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

            function verifyCode(response){
          
            if (response == null){
                verificationButton.setAttribute("disabled", true);
                verificationCodeForm.setAttribute("disabled", true);
                verificationButton.innerHTML= "Sending...";
                ajaxCall("/sendCode?email=" + changePassObj.emailAddress, "GET", null, null, null, null, verifyCode);
            }else{
                verificationButton.removeAttribute("disabled");
                verificationCodeForm.removeAttribute("disabled");
                verificationButton.innerHTML = "Submit";
                verificationCodeForm.addEventListener("submit", function(event){
                    event.preventDefault();
                    if (verificationInput.value.trim().length != 0){
                        if (verificationInput.value.trim() == response){
                            onSubmitNextPage(document.querySelector("#verification-button"));
                            changePass();
                        }else{
                            verificationInput.classList.add("is-invalid");
                            document.querySelector("#" + verificationInput.getAttribute("id") + "feedback").innerHTML = "Incorrect Code";
                        }
                    }else{
                        verificationInput.classList.add("is-invalid");
                        document.querySelector("#" + verificationInput.getAttribute("id") + "feedback").innerHTML = "Field is required";
                    }                 
                }); 
            }          
        }

        function changePass(response){

            if (response == null){
                changePassForm.addEventListener("submit", function(event){
                    event.preventDefault();
                    if (rawPassInput.value.trim().length != 0 && confPassInput.value.trim().length != 0){
                        if (confPassInput.value.trim() != rawPassInput.value.trim()){
                            confPassInput.classList.add("is-invalid");
                            document.querySelector("#" + confPassInput.getAttribute("id") + "feedback").innerHTML = "Mismatching Password";
                        }else{
                            onSubmitNextPage(passwordChangeButton);
                            changePassObj.password = rawPassInput.value.trim();
                            let toSend = JSON.stringify(changePassObj);
                            ajaxCall("/changePassword", "POST", toSend, CSRF.getAttribute("content"), CSRF.getAttribute("value"), null, changePass);
                        }
                    }else{
                        if (rawPassInput.value.trim().length == 0){
                            rawPassInput.classList.add("is-invalid");
                            document.querySelector("#" + rawPassInput.getAttribute("id") + "feedback").innerHTML = "Field is required";
                        }
                        if (confPassInput.value.trim().length == 0){
                            confPassInput.classList.add("is-invalid");
                            document.querySelector("#" + confPassInput.getAttribute("id") + "feedback").innerHTML = "Field is required";
                        }
                    }
                })
            }else{
                console.log(response);
            }
        }

        function ajaxCall(url, method, send, header, token, response, callback){
            
            var xhr = new XMLHttpRequest();
            if (response == null){ 
                xhr.onreadystatechange = () => {
                    if (xhr.readyState == 4 && xhr.status == 200) {
                        console.log(xhr.responseText);
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
        </script>
        <jsp:include page = "components/footer.jsp"/> 
    </body>

</html>