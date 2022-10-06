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
    </head>
   
    <body>
        <jsp:include page = "components/header.jsp"/>
        <main>
            <div class = "w-100" style = "min-height:1000px; padding-top:6.5rem;">
                <div class = 'container py-5'>
                        <div class ="card">
                            <div class ="card-header bg-transparent border-0">
                            <ul class="nav nav-tabs">
                                    <li class="nav-item">
                                        <a class="nav-link active text-dark" data-bs-toggle="tab" href="#users">Registered Users</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link text-dark" data-bs-toggle="tab" href="#cars-posted">Cars Posted</a>
                                    </li>
                                </ul>
                            </div>
                            <div class = 'card-body'>
                                <div class="tab-content">
                                    <div class="tab-pane container active" id="users">
                                        <c:forEach items = "${users}" var = "user">
                                            <div class ="card mb-3">
                                                <div class ='card-body'>
                                                    <div class ="d-flex flex-md-row flex-column align-items-center justify-content-between">
                                                        <div class = "overflow-hidden border rounded-circle" style = "height:10rem; width:10rem;">
                                                            <c:if test = "${user.getImagePath() ne null}">
                                                                <img src = "/profilePicture/${user.getImagePath()}" alt = "${user.getFirstName().concat(" ".concat(user.getLastName().concat("'s image")))}" class = "w-100 h-100"/>
                                                            </c:if>
                                                            <c:if test = "${user.getImagePath() eq null}">
                                                                <img src = '/img/sampleimage.jpg' alt = "${user.getFirstName().concat(" ".concat(user.getLastName().concat("'s image")))}" class ="w-100 h-100"/>
                                                            </c:if>
                                                        </div>
                                                        <div class = "flex-fill p-3" style = "min-height:10rem;">
                                                            <div class ="card">
                                                                <div class ="card-body">
                                                                    <div class ="row gy-2">
                                                                        <div class ="col-12">
                                                                            <span class ="fw-bold">
                                                                                Name:
                                                                            </span>
                                                                            <span class ="text-dark">
                                                                                ${user.getFirstName().concat(" ".concat(user.getLastName()))}
                                                                            </span>
                                                                        </div>
                                                                        <div class ="col-12">
                                                                            <span class ="fw-bold">
                                                                                City:
                                                                            </span>
                                                                            <span class ="text-dark">
                                                                                ${user.getCity()}
                                                                            </span>
                                                                        </div>
                                                                        <div class ="col-12">
                                                                            <span class ="fw-bold">
                                                                                Contact number:
                                                                            </span>
                                                                            <span class ="text-dark">
                                                                                ${user.getContactNumber()}
                                                                            </span>
                                                                        </div>
                                                                        <div class ="col-12">
                                                                            <span class ="fw-bold">
                                                                                birthdate:
                                                                            </span>
                                                                            <span class ="text-dark">
                                                                                ${user.getUserBirth()}
                                                                            </span>
                                                                        </div>
                                                                        <div class ="col-12">
                                                                            <span class ="fw-bold">
                                                                                date registered:
                                                                            </span>
                                                                            <span class ="text-dark">
                                                                                ${user.getUserRegistrationDate()}
                                                                            </span>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class = "card-footer bg-transparent border-0">
                                                    <div class ="d-flex justify-content-end">
                                                        <a href ="/admin/profile/${user.getUserId()}" class ="btn btn-outline-dark bg-gradient mx-1">
                                                            Edit Profile
                                                        </a>
                                                        <form method = "post" action = "/admin/makeAdmin/${user.getUserId()}">
                                                            <input type = "hidden" name = "${_csrf.parameterName}" value = "${_csrf.token}"/>
                                                            <button class = "btn btn-dark bg-gradient mx-1">
                                                                Make admin
                                                            </button>
                                                        </form>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </div>
                                    <div class="tab-pane container fade" id="cars-posted">
                                        <c:forEach items = "${cars}" var = "car">
                                            <div class ="card mb-3">
                                                <div class = "card-header bg-transparent">
                                                    <h1 class ="display-6 fw-bold">
                                                        ${car.getCarName()}
                                                    </h1>
                                                </div>
                                                <div class ="card-body">
                                                    <div class = "d-flex flex-row my-1">
                                                        <span class = "fw-bold mx-2">
                                                            Car Model:
                                                        </span>
                                                        <span>
                                                            ${car.getModel()}
                                                        </span>
                                                    </div>
                                                    <div class = "d-flex flex-row my-1">
                                                        <span class = "fw-bold mx-2">
                                                            Car Manufacturer:
                                                        </span>
                                                        <span>
                                                            ${car.getMake()}
                                                        </span>
                                                    </div>
                                                    <div class = "d-flex flex-row my-1">
                                                        <span class = "fw-bold mx-2">
                                                            Price:
                                                        </span>
                                                        <span>
                                                            P${car.getPrice()}
                                                        </span>
                                                    </div>
                                                    <div class = "d-flex flex-row my-1">
                                                        <span class = "fw-bold mx-2">
                                                            Car transimission:
                                                        </span>
                                                        <span>
                                                            ${car.getTransmission()}
                                                        </span>
                                                    </div>
                                                    <div class = "d-flex flex-row my-1">
                                                        <span class = "fw-bold mx-2">
                                                            Seller:
                                                        </span>
                                                        <span>
                                                            ${car.getUser().getFirstName()} ${car.getUser().getLastName()}
                                                        </span>
                                                    </div>
                                                    <div class = "d-flex flex-row my-1">
                                                        <span class = "fw-bold mx-2">
                                                            Registered Date:
                                                        </span>
                                                        <span>
                                                            ${car.getCarRegistration()}
                                                        </span>
                                                    </div>
                                                    <div class = "d-flex flex-row my-1">
                                                        <span class = "fw-bold mx-2">
                                                            Status:
                                                        </span>
                                                        <span>
                                                            <c:if test = "${car.getCarPostStatus() eq true}">
                                                                Active
                                                            </c:if>
                                                            <c:if test = "${car.getCarPostStatus() ne true}">
                                                                Inactive
                                                            </c:if>
                                                        </span>
                                                    </div>
                                                </div>
                                                <div class = "card-footer bg-transparent border-0">
                                                    <div class = "d-flex justify-content-end w-100">
                                                        <a href = "/admin/update-car/${car.getCarId()}" class ="btn btn-outline-dark bg-gradient mx-1">
                                                            Edit Post
                                                        </a>
                                                        <a href = "/car-details/${car.getCarId()}" class ="btn btn-outline-dark bg-gradient mx-1">
                                                            View Car Post
                                                        </a>

                                                         <c:if test = "${car.getCarPostStatus() eq true}">
                                                            <form method = "POST" action = "/admin/deactivatePost/${car.getCarId()}">
                                                                <input type = "hidden" name = "${_csrf.parameterName}" value = "${_csrf.token}"/>
                                                                <button class ="btn btn-outline-danger bg-gradient mx-1">
                                                                    Deactivate Post
                                                                </button>
                                                            </form>
                                                        </c:if>
                                                        <c:if test = "${car.getCarPostStatus() ne true}">
                                                            <form method = "POST" action = "/admin/activatePost/${car.getCarId()}">
                                                                <input type = "hidden" name = "${_csrf.parameterName}" value = "${_csrf.token}"/>
                                                                <button class ="btn btn-outline-success bg-gradient mx-1">
                                                                    Activate Post
                                                                </button>
                                                            </form>
                                                        </c:if> 
                                                        <form method = "POST" action = "/admin/deleteCar/${car.getCarId()}">
                                                            <input type = "hidden" name = "${_csrf.parameterName}" value = "${_csrf.token}"/>
                                                            <button class ="btn btn-danger bg-gradient mx-1">
                                                                Delete Post
                                                            </button>
                                                        </form>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </div>
                            </div>
                        </div>            
                    </div>
                </div>
            </div>
        </main>
        <jsp:include page = "components/footer.jsp"/> 
    </body>

</html>