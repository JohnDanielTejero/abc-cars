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
            <div class = "w-100">
                <div class ="position-relative w-100 overflow-hidden" style = "height:1000px margin-top:6.5rem;">
                    <div class ="position-absolute h-100 w-100 bg-dark bg-gradient" style = "z-index:-1;">
                    </div>
                    <img src = "/img/error page front.jpg" class = "h-100" style = "opacity:0.05; z-index:-1; width:2000px;">
                    <div class ="position-absolute start-50 translate-middle" style = "z-index:1020; top:30%;">
                        <div class ="d-flex flex-column align-items-center justify-content-between">
                            <span class= "text-light fw-bold display-1 mb-3">
                                ${response.getStatusCode()}
                            </span>
                            <div class = 'my-3'>
                                <p class ="text-light display-6 text-center fw-light">
                                    ${response.getMessage()} Please head back to home page.
                                </p>
                                <p class ="text-light display-6 text-center fw-light">
                                    Reason: ${response.getDescription()}
                                </p>
                            </div>
                            <a href = "/" class = 'btn btn-outline-light p-3 mt-5'>
                                Go to Homepage
                            </a>
                        </div>
                    </div>
                </div>
               
            </div>
        </main>
        <jsp:include page = "components/footer.jsp"/> 
    </body>

</html>