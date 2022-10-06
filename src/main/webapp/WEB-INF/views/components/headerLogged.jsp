<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<header class = "fixed-top" style = "width:100%; margin-bottom:10rem;"  id = "navigation-header">
            <nav class = "nav-wrapper bg-dark bg-gradient">
                <div class = "nav-brand-wrapper h-100">
                    <a class ="nav-brand-clickable text-light text-uppercase" href ="/">
                        <img src = "/img/ABC Cars.png" style = "width:5rem; height:auto; display:inline-block;"/>
                        ABC Cars
                    </a>
                </div>
                
                <input type = "checkbox" id = "nav-button-toggle"/>
                <label for = "nav-button-toggle" class = "nav-toggler">
                    <span class = "nav-burger-menu"></span>
                </label>

                <div class = "nav-main">
                    <ul class = "nav-items-wrapper">
                        <li class = "nav-item-list">
                            <a class  = "nav-item-links text-light" data-nav-item-type = "popup" data-popup-target = "#settings">
                               Support
                            </a>
                        </li>
                        <li class = "nav-item-list">
                            <a href = "/profile" class  = "nav-item-links text-light">Account</a>
                        </li>
                        <li class = "nav-item-list">
                            <a href = "/logout" class = "nav-item-links text-light">Logout</a>
                        </li>
                    </ul>
                </div>
                <div class = "nav-item-popovers pb-5" id = "settings" data-popover-toggled = "false">
                    <div class = "ms-3 d-flex justify-content-start">
                        <button type = "button" class = "popover-dismiss bg-dark bg-gradient text-light" data-popover-dismiss= "#settings">
                            <span class ="bi bi-arrow-left"></span>
                        </button>
                    </div>
                    <span class = "nav-popover-item-list">
                        <a href = "/company#about-us" class = "popover-item">About</a>
                    </span>
                    <span class = "nav-popover-item-list">
                        <a href = "/company#contact-us" class = "popover-item">Contact</a>
                    </span>
                    <span class = "nav-popover-item-list">
                        <a href = "/search-car" class = "popover-item">Car Sales</a>
                    </span>
                    <span class = "nav-popover-item-list">
                        <a href = "/postcar" class = "popover-item">Sell Car</a>
                    </span>
                    <!--
                    <span class = "nav-popover-item-list">
                        <a href = "/company#contact-us" class = "popover-item">Messaging</a>
                    </span>-->
                </div>
            </nav>
    <script defer src = "/js/nav.js">
    </script>
</header>

<!---->