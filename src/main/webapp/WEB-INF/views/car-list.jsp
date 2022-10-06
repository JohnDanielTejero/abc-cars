<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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
                    <div class="my-5">
                        <div class = "p-3 w-100 mb-5 border rounded-3" style = "min-height:10rem;">
                            <form disabled class = "row gy-2 gx-2">
                                <h1 class = "fw-bolder">
                                    Car Search Filter
                                </h1>
                                <div class ="col-6 form-floating">
                                    <input class ="form-control" id = "manufacturer" disabled value = "${filters.getManufacturer()}"/>
                                    <label for = "manufacturer"> Car Manufacturer</label>
                                </div>
                                <div class ="col-6 form-floating">
                                    <input class ="form-control" id = "model" disabled value = "${filters.getModel()}"/>
                                    <label for = "model"> Car Model</label>
                                </div>
                                <div class ="col-12 form-floating">
                                    <input class ="form-control" id = "min-date" disabled value = "${filters.getYear()}"/>
                                    <label for = "min-date">Year</label>
                                </div>
                                <div class ="col-6 form-floating">
                                    <input class ="form-control" id = "min-price" disabled value = "${filters.getMinPrice()}"/>
                                    <label for = "min-price">Min Price</label>
                                </div>
                                <div class ="col-6 form-floating">
                                    <input class ="form-control" id = "max-price" disabled value = "${filters.getMaxPrice()}"/>
                                    <label for = "max-price">Max Price</label>
                                </div>
                            </form>
                            <div class ="d-flex justify-content-end mt-3">
                                <a href = "/search-car" class = "btn btn-outline-dark text-capitalize">
                                    Change car filter
                                </a>
                            </div>
                        </div>
                        <div class="card mb-3 bg-transparent w-100">
                            <div class="card-header bg-transparent border border-0">
                                <span class="card-title text-uppercase h1 fw-bolder">Car Listing</span>
                            </div>
                            <div class="card-body">
                                <div class="row gy-3 gx-3">
                                    <c:forEach var = "car" items = "${cars}">
                                        <div class="col-md-6 col-12">
                                            <div class="card overflow-hidden p-2" style = "min-height:40rem;">
                                                <img src="/carPicture/${car.getImagePath()}" alt = "${car.getImagePath()}" class="card-img-top">
                                                <div class = "card-body">
                                                    <div class ="row">
                                                        <div class ="col-12">
                                                            <span class ="fw-bold">
                                                                ${car.getCarName()}
                                                            </span>
                                                        </div>
                                                        <div class = "col-12">
                                                            <span class ="fw-bold me-2">Car Price</span>${car.getPrice()}
                                                        </div>
                                                        <div class ="col-12">
                                                            <span class ="fw-bold me-2">Model</span> ${car.getModel()}
                                                        </div>
                                                        <div class ="col-12">
                                                            <span class ="fw-bold me-2">Manufacturer</span>${car.getMake()}
                                                        </div>                                                
                                                    </div>
                                                </div>
                                                <div class="card-footer bg-transparent border border-0">
                                                    <span class = "text-muted">
                                                        ${car.getCarRegistration()}
                                                    </span>
                                                    <div class ="d-flex justify-content-end">
                                                        <a class="card-link categ-link" href = "/car-details/${car.getCarId()}">
                                                            View More
                                                        </a>
                                                    </div>
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
        </main>
        <script defer src = "/js/body-nav.js">
        </script>
        <jsp:include page = "components/footer.jsp"/> 
    </body>
</html>