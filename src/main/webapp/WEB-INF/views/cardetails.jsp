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
                  <div class = "my-5">   
                        <div class = "card">
                            <div class = "card-header border-0 bg-transparent">
                                <h1 class = "text-center fw-bolder text-uppercase">
                                    Car Details
                                </h1>
                            </div>
                            <div class ="card-body">
                                <div class = "card">
                                    <div class = "card-body">
                                        <div class ="row g-3">
                                            <div class ="col-md-6 col-12">
                                                <img src = "/carPicture/${car.getImagePath()}" alt = "${car.getImagePath()}" class="card-img-top border rounded-3">
                                                <h1 class ="text-center">
                                                    Image Preview
                                                </h1>
                                            </div>
                                            <div class ="col-md-6 col-12">
                                                <div class = "d-flex flex-column g-2">
                                                    <div class = "d-flex flex-row my-1">
                                                        <span class = "fw-bold  mx-2 h1">
                                                           ${car.getCarName()}
                                                        </span>
                                                    </div>
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
                                                            P ${car.getPrice()}
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
                                                            ${car.getUser().getFirstName().concat(" ".concat(car.getUser().getLastName()))}
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
                                                    <div class = "d-flex flex-column my-1">
                                                        <span class = "fw-bold ms-2 mb-2">
                                                            Description
                                                        </span>
                                                        <span class = "border rounded-3 p-2" style = "min-height:20rem;">
                                                            ${car.getDescription()}
                                                        </span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div> 
                                    </div>
                                    <div class = "card-footer bg-transparent border-0">
                                        <div class = "d-flex justify-content-md-end justify-content-center">
                                            <a href = "#bidding" class = "btn btn-outline-dark bg-gradient mx-1">
                                                See Bidding
                                            </a>    
                                            <!--
                                            <a href = "/message" class = "btn btn-dark bg-gradient bg-opacity-10 mx-1">
                                                Message Seller
                                            </a>   --> 
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div id  ="bidding" class ="card mt-3 p-3">
                            <div class = "card-header border-0 bg-transparent">
                                <h1>
                                     Bidding History
                                </h1>
                            </div>
                            <div class = "card-body">
                                <div class ="row gy-3">
                                    <div class ="col-lg-6 col-12 flex-fill">
                                        <div class ="card">
                                            <div class ="card-body overflow-auto" style = "height:30rem;">
                                                <c:forEach items = "${car.getBids()}" var = "bid">
                                                    <div class ='card w-100 my-2'>
                                                        <div class = "card-body">
                                                            <div class ="d-flex flex-md-row align-items-md-center flex-column justify-content-center">
                                                                <div class = "overflow-hidden border rounded-circle" style = "width:5rem; height:5rem;">
                                                                    <c:if test = "${bid.getUser().getImagePath() ne null}">
                                                                        <img src = '/profilePicture/${bid.getUser().getImagePath()}' class ="w-100 h-100"/>
                                                                    </c:if>
                                                                    <c:if test = "${bid.getUser().getImagePath() eq null}">
                                                                        <img src = '/img/sampleimage.jpg' class ="w-100 h-100"/>
                                                                    </c:if>
                                                                </div>
                                                                <div class ="ms-4 d-flex flex-column">
                                                                    <span class = "fw-bold">
                                                                        ${bid.getUser().getFirstName().concat(" ".concat(bid.getUser().getLastName()))}
                                                                    </span>
                                                                    <span>
                                                                        Bid Amount: ${bid.getBidAmount()}
                                                                    </span>
                                                                    <span>
                                                                        Appointment: ${bid.getBidAppointment()}
                                                                    </span>
                                                                </div>
                                                                <div class = "flex-fill d-flex justify-content-end">
                                                                    <span class ="text-muted">
                                                                        ${bid.getBidRegistDate()}
                                                                    </span> 
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </c:forEach>
                                                
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <c:if test = "${isAuthor ne true}">
                                        <div class ="col-lg-6 col-12 border rounded-3 p-3">
                                            <sf:form class = "row gy-3" method = "POST" action = "/placeBid/${car.getCarId()}?${_csrf.parameterName}=${_csrf.token}" modelAttribute = "bidForm">
                                                <div class = "col-12">
                                                    <span class ="h5">
                                                        Bid Now
                                                    </span>
                                                </div>
                                                <input type = "hidden" value  = "${car.getCarRegistration()}" name = "registrationDate"/>
                                                <div class ="form-floating col-12">
                                                    <sf:input class ="form-control" id = "bidding-price" type = "number" value = "${car.getPrice()}" min = "${car.getPrice()}" path = "bidAmount"/>
                                                    <label for = "bidding-price" class = "ms-2">
                                                        Bidding Amount
                                                    </label>
                                                    <span class = "text-danger d-block">
                                                        ${bidErr}
                                                    </span>
                                                </div>
                                                <div class ="form-floating col-12">
                                                    <sf:input class ="form-control" id = "appointment-date" type = "date" path = "bidAppointment"/>
                                                    <label for = "appointment-date" class = "ms-2">
                                                        Appoint Date For Test Drive
                                                    </label>
                                                    <span class = "text-danger d-block">
                                                        ${appointmentErr}
                                                    </span>
                                                </div>
                                                <div class = "col-12 d-flex justify-content-end">
                                                    <button class ="btn btn-outline-dark bg-gradient">
                                                        Place Bid
                                                    </button>
                                                </div>
                                            </sf:form>
                                        </div>
                                    </c:if>
                                   
                                </div>
                            </div>
                        </div>
                  </div>
              </div>
            </div>
        </main>
        <script defer src = "/js/body-nav.js">
        </script>
        <jsp:include page = "components/footer.jsp"/> 
    </body>
</html>