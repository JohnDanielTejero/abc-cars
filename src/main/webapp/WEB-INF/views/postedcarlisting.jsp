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
                            <div class = 'card-body position-relative overflow-auto' style = "height: 500px">
                                <c:if test = "${cars.size() ne 0}">
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
                                                    <a href = "/update-car/${car.getCarId()}" class ="btn btn-outline-dark bg-gradient mx-1">
                                                        Edit Post
                                                    </a>
                                                    <c:if test = "${car.getCarPostStatus() eq true}">
                                                        <form method = "POST" action = "/deactivatePost/${car.getCarId()}">
                                                            <input type = "hidden" name = "${_csrf.parameterName}" value = "${_csrf.token}"/>
                                                            <button class ="btn btn-outline-danger bg-gradient mx-1">
                                                                Deactivate Post
                                                            </button>
                                                        </form>
                                                    </c:if>
                                                    <c:if test = "${car.getCarPostStatus() ne true}">
                                                        <form method = "POST" action = "/activatePost/${car.getCarId()}">
                                                            <input type = "hidden" name = "${_csrf.parameterName}" value = "${_csrf.token}"/>
                                                            <button class ="btn btn-outline-success bg-gradient mx-1">
                                                                Activate Post
                                                            </button>
                                                        </form>
                                                    </c:if> 
                                                    <form method = "POST" action = "/deleteCar/${car.getCarId()}">
                                                        <input type = "hidden" name = "${_csrf.parameterName}" value = "${_csrf.token}"/>
                                                        <button class ="btn btn-danger bg-gradient mx-1">
                                                            Delete Post
                                                        </button>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </c:if>
                                <c:if test = "${cars.size() eq 0}">
                                    <div class = "position-absolute top-50 start-50 translate-middle w-100 h-100">
                                       <div class = "d-flex justify-content-center align-items-center w-100 h-100">
                                            <span class ="text-muted display-6">
                                                No car posted yet
                                            </span>
                                       </div>
                                    </div>
                                </c:if>
                            </div>
                        </div>            
                    </div>
                </div>
            </div>
        </main>
        <jsp:include page = "components/footer.jsp"/> 
    </body>

</html>