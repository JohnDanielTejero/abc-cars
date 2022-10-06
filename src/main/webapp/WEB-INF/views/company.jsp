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
                <div id = "about-us" class ="bg-light">
                    <div class = "container py-5">
                        <nav class = "nav-tabs-wrapper">
                            <button class = "nav-tab-selector" data-navtabs-selected = "true" data-navtabs-target = "#our-company">About Us</button>
                            <button class = "nav-tab-selector" data-navtabs-selected = "false" data-navtabs-target = "#our-mission">Our Mission</button>
                            <button class = "nav-tab-selector" data-navtabs-selected = "false" data-navtabs-target = "#our-vision">Our Vision</button>
                        </nav>
                        <div class = "nav-tab-container" style = "min-height:20rem;">
                            <div class = "nav-tab-content tab-animation-fade tab-active p-3" data-navtab-toggled ="true" id = "our-company">
                                <h1 class = "fw-bolder text-uppercase">About the Company</h1>
                                <div class ="row gy-2">
                                    <p class = "col-12">
                                        ABC Cars, founded in 2000 by ABC Pte Ltd, aiming to reduce the struggles of the community
                                        when it comes to transportation. 
                                    </p>
                                    <p class ="col-12">
                                        The platform is designed for people who are browsing for a car at a reasonable price, and 
                                        for users who seeks to market their car. 
                                    </p>
                                    <p class = "col-12">
                                        We strive to deliver an exceptional customer experience; our employees are highly trained, enthusiastic,
                                        knowledgeable and driven to deliver our fundamental commitment to our customers; of getting it right first
                                        time and making each and every interaction special.
                                    </p>
                                </div>
                            </div>
                            <div class = "nav-tab-content tab-animation-fade p-3" data-navtab-toggled ="false" id = "our-mission">
                                <h1 class = "fw-bolder text-uppercase">Our purpose</h1>
                                <div class = "row">
                                    <div class ="col-12">
                                        <h5>Driven by the will to serve, we commit ourselves to:</h5>
                                    </div>
                                    <div class ="col-12">
                                        <ul class = "row gy-3">
                                            <li class = "col-12">
                                                To improve the quality of life of our users by selling
                                                vehicles at a reasonable price, with excelent customer
                                                service and continuous pursuit for improvement.
                                            </li>
                                            <li class = "col-12">
                                                To sustain company profitability, stability, and growth by
                                                efficient engagement with users and engaging in effective
                                                financial and resource management, and attracting of new potential users
                                                for continuous improvement of service.
                                            </li>
                                            <li class = "col-12">
                                                To ensure the quality of goods being sold is up to quality standards
                                                for the users' peace of mind, and to promote road safety for all users.
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class = "nav-tab-content tab-animation-fade p-3" data-navtab-toggled ="false" id = "our-vision">
                               <h1 class = "fw-bolder text-uppercase">Our Vision</h1>
                                <div>
                                    To be the leading company for car dealership industry where customers are provided
                                    with the best products, services, and experiences where the company is both loved
                                    by the customers and the team while providing a positive impact towards the community
                                    the company is serving and expand the reach of the services nationwide.    
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div id = "contact-us" class  ="bg-dark bg-opacity-10">
                    <div class ="container py-5">
                        <h1 class = "text-center fw-bold">Let's Talk</h1>
                        <p class =  "text-center px-5"style = "font-size:1.4rem;">
                            Your voice matters to us. In order for us to improve our service,
                            your feedbacks, suggestions, and complaints are appreciated. You can
                            send them through the fields below. We thank you for your never-ending support to the
                            platform. 
                        </p>
                        <div class ="mt-5 px-2">
                            <form class = "row gy-3 bg-light px-3 pt-3 pb-5 bg-gradient border rounded-3 border-dark shadow-lg">
                                <div class ="col-md-4 col-12 form-floating">
                                    <input class ="form-control bg-muted" id = "name"/>
                                    <label for = "name" class ="ms-2">
                                        Name
                                    </label>
                                </div>
                                <div class ="col-md-4 col-12 form-floating">
                                    <input class ="form-control bg-muted" id = "email-address"/>
                                    <label for = "email-address" class ="ms-2">
                                        Email Address
                                    </label>
                                </div>
                                <div class ="col-md-4 col-12 form-floating">
                                    <input class ="form-control bg-muted" id = "subject"/>
                                    <label for = "subject" class ="ms-2">
                                        Subject
                                    </label>
                                </div>
                                 <div class ="col-12 form-floating">
                                    <textarea class ="form-control bg-muted" id = "content" style ="height:20rem;">
                                    </textarea>
                                    <label for = "content" class ="ms-2">
                                        Content
                                    </label>
                                </div>
                            </form>
                        </div>
                        <div class ="w-100 mt-5">
                            <div class = "d-flex flex-column h5 fw-normal">
                                <div class ="d-inline">
                                    <span class ="bi bi-geo-alt-fill">
                                        <span class ="ms-1">
                                            Mileguas, Makati, Philippines
                                        </span>
                                    </span>
                                </div>
                                <div class ="d-inline">
                                    <span class ="bi bi-envelope">
                                        <span class ="ms-1">
                                            info.cars.abc@gmail.com
                                        </span>
                                    </span>
                                </div>
                                <div class ="d-inline">
                                    <span class ="bi bi-telephone-fill">
                                        <span class ="ms-1">
                                            +63-929-555-6296
                                        </span>
                                    </span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        <jsp:include page = "components/footer.jsp"/> 
        <script defer src = "/js/body-nav.js">
        </script>
    </body>

</html>