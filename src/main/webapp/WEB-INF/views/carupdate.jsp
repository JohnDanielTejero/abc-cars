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
                        <h1 class = "fw-bolder">Update Posted Car</h1>
                        <div class = "card">
                            <div class ="card-body">
                               <div class = "d-flex flex-column-reverse">
                                    <sf:form class = "row g-3 p-2 px-3" enctype = "multipart/form-data" modelAttribute = "carForm" method = "POST" action = "/carUpdate?${_csrf.parameterName}=${_csrf.token}">
                                        <div class = "alert alert-info bg-gradient">
                                            <h1>INFO!</h1>
                                            <p>
                                                Please capitalize all text (e.g. "Toyota").
                                            </p>
                                        </div>
                                        <div class = "col-12 d-flex align-items-center justify-content-center">
                                            <div class = "overflow-hidden border rounded-3" style = "height:20rem; width:30rem;">
                                                <c:if test = "${carForm.getImagePath() ne null}">
                                                    <img src = '/carPicture/${carForm.getImagePath()}' alt = "preview" class ="w-100 h-100"/>
                                                </c:if>
                                                <c:if test = "${carForm.getImagePath() eq null}">
                                                    <img src = '/img/sampleimage.jpg' alt = "preview" class ="w-100 h-100"/>
                                                </c:if>
                                            </div>
                                        </div>
                                        <span class ="fw-bolder h4">
                                            Car Information
                                        </span>
                                        <div class ="col-12 form-floating">
                                            <sf:input type = "hidden" Placeholder = "SUV, Sedan,..." path = "carId"/>
                                            <sf:input class ="form-control" id = "name" Placeholder = "SUV, Sedan,..." path = "carName"/>
                                            <label for = "model" class = "ms-2">
                                                Car Name
                                            </label>
                                            <span class = "d-block text-danger">
                                                ${nameErr}
                                            </span>
                                        </div>
                                        <div class ="col-md-6 col-12 form-floating">
                                            <sf:input class ="form-control" id = "model" Placeholder = "SUV, Sedan,..." path = "model"/>
                                            <label for = "model" class = "ms-2">
                                                Car Model
                                            </label>
                                            <span class = "d-block text-danger">
                                                ${modelErr}
                                            </span>
                                        </div>
                                        <div class ="col-md-6 col-12 form-floating">
                                            <sf:input class ="form-control" id = "manufacturer" placeholder = "Toyota, Mitsubishi,..." path = "make"/>
                                            <label for = "manufacturer" class = "ms-2">
                                                Car Manufacturer
                                            </label>
                                            <span class = "d-block text-danger">
                                                ${manufacturerErr}
                                            </span>
                                        </div>
                                        <div class ="col-md-6 col-12 form-floating">
                                            <sf:select class ="form-select" path = "transmission">
                                                <c:forEach items = "${options}" var = "option">
                                                    <option value = "${option}">
                                                        ${option}
                                                    </option>
                                                </c:forEach>
                                            </sf:select>
                                            <label for = "Car-transmission" class = "ms-2">
                                            Car transmission
                                            </label>
                                            <span class = "d-block text-danger">
                                                ${transmissionErr}
                                            </span>
                                        </div>
                                        <div class ="col-md-6 col-121 form-floating">
                                            <sf:input class ="form-control" id = "price" placeholder = "..." path = "price" type = "number" min= "0"/>
                                            <label for = "price" class = "ms-2">
                                                Price
                                            </label>
                                            <span class = "d-block text-danger">
                                                ${priceErr}
                                            </span>
                                        </div>
                                        <div class ="col-12">
                                            <label for = "fileUpload" class = "fw-bold">
                                                Car Image (.jpg and .png only)
                                            </label>
                                            <sf:input class ="form-control" type = "file" id = "fileUpload" path = "image"/>
                                            <span class = "d-block text-danger">
                                                ${imageErr}
                                            </span>
                                        </div>
                                        <div class ="col-12 form-floating">
                                            <sf:textarea class ="form-control" id = "description" style = "min-height:20rem;" placeholder="" path = "description"></sf:textarea>
                                            <label for = "description" class = "ms-2">
                                                Description
                                            </label>
                                            <span class = "d-block text-danger">
                                                ${descErr}
                                            </span>
                                        </div>
                                        
                                        <div class ="col-12 d-flex justify-content-end">
                                            <button class = "btn btn-outline-dark bg-gradient px-3 py-1" style = "font-size:1.23rem;">
                                                Submit
                                            </button>
                                        </div>
                                    </sf:form>
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