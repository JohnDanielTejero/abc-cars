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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.8/css/intlTelInput.css" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.8/js/intlTelInput.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    </head>
    <body>
        <jsp:include page = "components/header.jsp"/>
        <main>
            <div class = "w-100" style = "padding-top:6.5rem;">
              <div class = "container">
                  <div class = "my-5">
                        <div class ="card">
                            <div class = "card-header bg-transparent border-0">
                                <h1 class = "fw-bolder">
                                    Personal Information
                                </h1>
                            </div>
                            <div class = "card-body">
                                <form class ="row gy-5" enctype = "multipart/form-data" method = "POST" action = "/admin/update-user-profile?${_csrf.parameterName}=${_csrf.token}">
                                    <input type = "hidden" value = "${userProfile.getUserId()}" name = "userId"/>
                                    <div class = "col-md-6 col-12">
                                        <div class = "row gy-3">
                                            <div class = "col-12 form-floating">
                                                <input class ="form-control" id = "fname" name = "firstName" placeholder = ".." value = "${userProfile.getFirstName()}"/>
                                                <label for = "fname" class = "ms-2">
                                                    First Name
                                                </label>
                                                <span class = "d-block text-danger">
                                                    ${fnameErr}
                                                </span>
                                            </div>
                                            <div class = "col-12 form-floating">
                                                <input class ="form-control" id = "lname" name = "lastName" placeholder = "..." value = "${userProfile.getLastName()}"/>
                                                <label for = "lname" class = "ms-2">
                                                    Last Name
                                                </label>
                                                 <span class = "d-block text-danger">
                                                    ${lnameErr}
                                                </span>
                                            </div>
                                            <div class = "col-12 form-floating">
                                                <input class ="form-control" id = "birthdate" type = "date" name = "userBirth" placeholder = ".." value = "${userProfile.getUserBirth()}"/>
                                                <label for = "birthdate" class = "ms-2">
                                                    Birth Date
                                                </label>
                                                <span class = "d-block text-danger">
                                                    ${birthErr}
                                                </span>
                                            </div>
                                            <div class = "col-12 form-floating">
                                                <input class ="form-control" id = "City" placeholder = ".." name = "city" value = "${userProfile.getCity()}"/>
                                                <label for = "City" class = "ms-2">
                                                    City
                                                </label>
                                                
                                            </div>
                                            <div class = "col-12">
                                                <label for = "profile-img" class = "fw-bold mb-2">
                                                    Profile Image (.jpg and .png only)
                                                </label>
                                                <input class ="form-control" id = "profile-img" name = "image" type = "file" placeholder = ".."/>
                                                <span class = "d-block text-danger">
                                                    ${imgErr}
                                                </span>
                                            </div>
                                            <div class = "col-12">
                                                <label for = "phone" class = "d-block fw-bold">
                                                    Contact Number
                                                </label>
                                                <input class ="form-control" type="tel" class="form-control" id="phone" name="contactNumber" value = "${userProfile.getContactNumber()}"/>
                                                <span class = "d-block text-danger">
                                                    ${contactErr}
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class ="col-md-6 col-12 d-flex justify-content-center">
                                        <div class ="d-flex flex-column align-items-center">
                                            <div class ="overflow-hidden border border-dark rounded-circle" style = "height:10rem; width:10rem">
                                                <c:if test = "${userProfile.getImagePath() ne null}">
                                                    <img src = '/profilePicture/${userProfile.getImagePath()}' class ="w-100 h-100"/>
                                                </c:if>
                                                <c:if test = "${userProfile.getImagePath() eq null}">
                                                    <img src = '/img/sampleimage.jpg' class ="w-100 h-100"/>
                                                </c:if>
                                            </div>
                                            <u class = "mt-3">
                                                Current active profile image will appear here
                                            </u>
                                        </div>
                                    </div>
                                    <div class ="col-12 d-flex justify-content-end">
                                        <button class ="btn btn-outline-dark bg-gradient">
                                            Save Changes
                                        </button>
                                    </div>
                                </form>
                            </div>
                        </div>
                  </div>
              </div>
            </div>
        </main>
        <script defer src = "/js/body-nav.js">
        </script>
        <script defer>
            const phoneInputField = document.querySelector("#phone");
            const phoneInput = window.intlTelInput(phoneInputField, {
                utilsScript: "https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.8/js/utils.js",
            });
            $(document).ready(function() {
                $('.iti__flag-container').click(function() {
                    var countryCode = $('.iti__selected-flag').attr('title');
                    var countryCode = countryCode.replace(/[^0-9]/g, '')
                    $('#phone').val("");
                    $('#phone').val("+" + countryCode + " " + $('#phone').val());
                });
            });
        </script>
        <jsp:include page = "components/footer.jsp"/> 
    </body>
</html>