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
                        <h1 class = "fw-bolder">Search Car</h1>
                        <div class = "card">
                            <div class ="card-body">
                                <sf:form class = "row g-3 gy-4 p-2 px-3" method = "POST" action = "/searchFilters?${_csrf.parameterName}=${_csrf.token}" modelAttribute = "searchForm"> 
                                    <span class = "text-muted fw-bold h5">
                                        Car Type
                                    </span>
                                    <div class ="col-md-6 col-12 form-floating">
                                        <sf:input class ="form-control" id ="manufacturer" placeholder = "..." path = "manufacturer"/>
                                        <label for ="manufacturer" class = "ms-2">
                                            Car Manufacturer
                                        </label>
                                    </div>
                                    <div class ="col-md-6 col-12 form-floating">
                                        <sf:input class ="form-control" id ="model" placeholder = "SUV, Sedan,..." path = "model"/>
                                        <label for ="model" class = "ms-2">
                                            Car Model
                                        </label>
                                    </div>
                                    <span class = "text-muted fw-bold h5 mt-5">
                                        Registration Date
                                    </span>
                                    <div class ="col-12 form-floating">
                                        <sf:select class ="form-select" id ="year" path = "year" name = "year">
                                            <option selected disabled>
                                                Please Select
                                            </option>
                                        </sf:select>
                                        <label for ="year-begin" class = "ms-2">
                                            Year Registered
                                        </label>
                                    </div>
                                    <span class = "text-muted fw-bold h5 mt-5">
                                        Price Range
                                    </span>
                                    <div class ="col-md-6 col-12 form-floating">
                                        <sf:select class ="form-select" id ="min-price" path = "minPrice" name = "minPrice">
                                            <option selected disabled>
                                                Please Select
                                            </option>
                                            <option value = "0">
                                                0
                                            </option>
                                            <option value = "250000">
                                                250,000
                                            </option>
                                            <option value = "500000">
                                                500,000
                                            </option>
                                            <option value = "750000">
                                                750,000
                                            </option>
                                            <option value = "1000000">
                                                1,000,000
                                            </option>
                                            <option value = "1250000">
                                                1,250,000
                                            </option>
                                            <option value = "1500000">
                                                1,500,000
                                            </option>
                                            <option value = "1750000">
                                                1,750,000
                                            </option>
                                            <option value = "2000000">
                                                2,000,000
                                            </option>
                                            <option value = "2250000">
                                                2,250,000
                                            </option>
                                        </sf:select>
                                        <label for ="min-price" class = "ms-2">
                                            Minimum Price
                                        </label>
                                    </div>
                                    <div class ="col-md-6 col-12 form-floating">
                                        <sf:select class ="form-select" id ="max-price" path = "maxPrice" name = "maxPrice">
                                            <option selected disabled>
                                                Please Select
                                            </option>
                                            <option value = "250000">
                                                250,000
                                            </option>
                                            <option value = "500000">
                                                500,000
                                            </option>
                                            <option value = "750000">
                                                750,000
                                            </option>
                                            <option value = "1000000">
                                                1,000,000
                                            </option>
                                            <option value = "1250000">
                                                1,250,000
                                            </option>
                                            <option value = "1500000">
                                                1,500,000
                                            </option>
                                            <option value = "1750000">
                                                1,750,000
                                            </option>
                                            <option value = "2000000">
                                                2,000,000
                                            </option>
                                            <option value = "2250000">
                                                2,250,000
                                            </option>
                                        </sf:select>
                                        <label for ="max-price" class = "ms-2">
                                            Max Price
                                        </label>
                                    </div>
                                    <div class ="col-12">
                                        <button class ="w-100 btn btn-outline-dark bg-gradient p-3">
                                            Search Car
                                        </button>
                                    </div>
                                </sf:form>
                            </div>
                        </div>
                  </div>
              </div>
            </div>
        </main>
        <script defer src = "/js/body-nav.js">
        </script>
        <script defer>
            let yearCurrent = 1960 + "";
            let yearEnd = new Date().getFullYear() + "";
            const select = document.querySelector("#year");
            while (yearCurrent <= yearEnd){
                const option = document.createElement("option");
                option.innerHTML = yearCurrent;
                option.value = yearCurrent;
                select.appendChild(option);
                yearCurrent++;
            }
        </script>
        <jsp:include page = "components/footer.jsp"/> 
    </body>
</html>