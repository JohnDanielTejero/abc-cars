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
            <div class = "w-100" style = "padding-top:6.5rem;">
                <div class ="container">
                    <div class = "row py-5 px-3">
                        <div class ="col-lg-3 col-12">
                        </div>
                        <div class ="col-lg-6 col-12">
                            <div class ="card shadow-lg">
                                <div class = "card-header bg-transparent border-0">
                                    <span class ="d-block text-center fw-bold text-uppercase mb-5" style = "font-size:1.77rem;">
                                        Login to ABC Cars
                                    </span>
                                    <span class ="text-muted text-center d-block">New to the platform?
                                        <a href = "/Registration" class = "text-dark fw-bold form-links" style = "text-decoration:none !important;">Register</a>
                                    </span>
                                </div>
                                <div class ="card-body">
                                    <div class = "container py-5">
                                        <form method = "POST" action = "/login">
                                            <input type = "hidden" name = "${_csrf.parameterName}" content = "${_csrf.headerName}" value = "${_csrf.token}" id = "csrf"/>
                                            <div class ="row gx-2 gy-3">
                                                <div class ="col-12">
                                                    <div class ="form-floating">
                                                        <input class ="form-control" id = "email-address" name = "email"/>
                                                        <label for = "email-address">Email Address</label>
                                                        <span class ="text-danger">
                                                            ${emailerror}
                                                        </span>
                                                    </div>
                                                </div>
                                                <div class = "col-12">
                                                    <div class ="form-floating">
                                                        <input class ="form-control" type = "password" id = "rpw" name = "password"/>
                                                        <label for = "rpw">Password</label>
                                                        <span class ="text-danger">
                                                            ${passworderror}
                                                        </span>
                                                        <div class ="d-flex justify-content-end mt-2">
                                                            <a href = "/forgot-password" class ="link-dark">Forgot Password?</a>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class = "col-12">
                                                    <button class = "w-100 btn btn-outline-dark bg-gradient border border-dark rounded-pill">
                                                        Login
                                                    </button>
                                                </div>
                                            </div>
                                            
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class ="col-lg-3 col-12">
                        </div>
                    </div>
                </div>
            </div>
        </main>
        <jsp:include page = "components/footer.jsp"/> 
    </body>

</html>