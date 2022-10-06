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
                    <div id="hero-banner" class="carousel slide carousel-light d-md-block d-none" data-bs-ride="carousel" style="max-height: 30rem;">
                        <div class="carousel-indicators">
                            <button type="button" data-bs-target="#hero-banner" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                            <button type="button" data-bs-target="#hero-banner" data-bs-slide-to="1" aria-label="Slide 2"></button>
                            <button type="button" data-bs-target="#hero-banner" data-bs-slide-to="2" aria-label="Slide 3"></button>
                        </div>
                        <div class="carousel-inner" style="max-height: 30rem; height: 30rem;">
                            <div class="carousel-item active w-100 h-100">
                                <div class="bg-dark bg-gradient bg-opacity-50 px-5 h-100">
                                    <div class="d-flex justify-content-center">
                                        <img src="/img/banner-1.jpg" class="d-block" alt="..." style = "max-width:1000px;">
                                    </div>
                                </div>
                            </div>
                            <div class="carousel-item w-100 h-100">
                                <div class=" bg-dark bg-gradient bg-opacity-50 x-5 h-100">
                                    <div class="d-flex justify-content-center">
                                        <img src="/img/banner-2.jpeg" class="d-block" alt="..." style = "max-width:1000px;">
                                    </div>
                                </div>
                            </div>
                            <div class="carousel-item w-100 h-100">
                                <div class=" bg-dark bg-gradient bg-opacity-50 x-5 h-100">
                                    <div class="d-flex justify-content-center">
                                        <img src="/img/banner-3.jpg" class="d-block" alt="..." style = "max-width:1000px;">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <button class="carousel-control-prev" type="button" data-bs-target="#hero-banner" data-bs-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            <span class="visually-hidden">Previous</span>
                        </button>
                        <button class="carousel-control-next" type="button" data-bs-target="#hero-banner" data-bs-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                            <span class="visually-hidden">Next</span>
                        </button>
                    </div>
                <div class = "container">
                    <div class="my-5">
                        <div class="card mb-3 bg-transparent w-100">
                            <div class="card-header bg-transparent border border-0">
                                <span class="card-title text-uppercase h1 fw-bolder">Featured Cars</span>
                            </div>
                            <div class="card-body">
                                <div class="row gy-3 gx-3">
                                    <c:forEach items = "${cars}" var = "car">
                                        <div class="col-xl-3 col-md-6 col-12">
                                            <div class="card p-2" style = "height:28rem;">
                                                <img src="/carPicture/${car.getImagePath()}" alt ="${car.getImagePath()}" class="card-img-top">
                                                <div class="card-body bg-transparent border border-0">
                                                    <span class ="fw-bold">
                                                        ${car.getCarName()}
                                                    </span>
                                                </div>
                                                <div class ="card-footer bg-transparent border border-0">
                                                    <a href = "/car-details/${car.getCarId()}" class="card-link categ-link text-end d-block">View more</a>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                </div>
                <div class = "mt-4">
                    <div class ="position-relative overflow-hidden" style = "width:100%; min-height:50vw;">
                        <img class = "position-absolute h-100 w-100" src = "/img/Messaging.jpg" alt = "adv" style = "opacity:0.8; z-index:-1;"/>
                        <div class ="position-absolute h-100 w-100 bg-dark bg-opacity-50"  style = "z-index:-1;"></div>
                        <div class ="mx-5 p-5">
                            <h1 class ="fw-bolder text-uppercase text-center">Find a car</h1>
                            <p class = "mb-4 text-center">
                                Communicate with the seller directly by setting appointments and booking test drives.
                                You can also choose to browse cars for sale by our users to decide what's best for you.
                            </p>
                            <p class = "mb-4 text-center">
                                Not looking for a car? You can also choose to sell your car via our auction system.
                            </p>
                        </div>
                        <div class ="d-flex justify-content-center p-5">
                            <a href = "/search-car" class  = "btn btn-outline-light bg-gradient p-3 mx-2">
                                Browse a Car
                            </a>
                            <a href = "/postcar" class  = "btn btn-outline-dark bg-gradient p-3 mx-2">
                                Sell a Car
                            </a>
                            
                        </div>
                    </div>
                </div>
            </div>
        </main>
        <script defer src = "/js/body-nav.js" type = "text/javascript">
        </script>
        <jsp:include page = "components/footer.jsp"/> 
    </body>

</html>