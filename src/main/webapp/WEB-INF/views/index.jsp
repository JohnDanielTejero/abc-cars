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
        <link rel = "stylesheet" type = "text/css" href = "/css/typing.css"/>
    </head>
   
    <body>
        <jsp:include page = "components/header.jsp"/>
        <main>
            <div class = "w-100" style = "height:110vh; padding-top:6.5rem;">
                <div class = "w-100 h-100 p-2 bg-dark bg-gradient bg-opacity-50">
                    <div class = "position-relative w-100 h-100" style = "overflow:hidden;">
                        <div class = "position-absolute bg-dark w-100 h-100 start-50 translate-middle-x"></div>
                        <img src = "/img/car background.jpg" class = "w-100 h-100 position-absolute" alt ="background-image" style = "opacity:0.3;"/>
                        <div class = "position-absolute w-100 h-100 start-0 ps-4 py-2">
                            <h1 class = "text-light text-uppercase fw-bold" style = "font-size:7vh; display:inline-block;">ABC Cars</h1>
                        </div>
                        <div class = "position-absolute end-0 translate-middle-y w-100" style = "top:60vh;">
                            <div class="row text-end pe-4 text-light" style = "font-size:3vh;">
                                <div class = "col-12">
                                    <span id = "dynamic-typing" class = "text-uppercase"></span>
                                    <span id = "typing-cursor" style = "display:inline-block; height:3vh; background-color:white; width:3px;"></span>
                                </div>
                                <div class="col-12 mt-3">
                                    <a href = "/Registration" class="btn btn-outline-danger p-3 text-uppercase landing-starter" style = "font-size:2.55vh;">
                                        <span> Get Started </span>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class = "w-100 bg-light bg-opacity-10">
                <div class ="container py-5">
                    <div class = "card border-0">
                        <div class = "card-header bg-transparent border-0">
                            <h1 class = "text-center text-uppercase fw-bolder">Why ABC Cars</h1>
                        </div>
                        <div class ="card-body">
                            <div class ="row w-100 g-2">
                                <div class = "col-md-6 col-12 h-100">
                                    <div class = "card p-5">
                                        <div class = "card-header border-0 bg-transparent">
                                            <h1 class= "text-center text-capitalize">Looking for a new car?</h1>
                                        </div>
                                        <div class = "card-body">
                                            <p class = "h4 text-center fw-normal">All cars being sold go through rigorous checks and tests before to ensure you, our dear customers will not encounter any defect from the cars.</p>
                                        </div>      
                                    </div>            
                                </div>
                                <div class = "col-md-6 col-12 h-100">
                                    <div class = "card p-5">
                                        <div class = "card-header border-0 bg-transparent">
                                            <h1 class= "text-center text-capitalize">Selling a Car?</h1>
                                        </div>
                                        <div class = "card-body">
                                            <p class = "h4 text-center fw-normal">Our platform offers a way for users to sell their car by real-time bidding, and to convince you, our platform offers setting an appointment for test drives.</p>
                                        </div>      
                                    </div>            
                                </div>
                                <div class = "col-md-6 col-12 h-100">
                                    <div class = "card p-5">
                                        <div class = "card-header border-0 bg-transparent">
                                            <h1 class= "text-center text-capitalize">Chat with Seller</h1>
                                        </div>
                                        <div class = "card-body">
                                            <p class = "h4 text-center fw-normal">You can ensure that the product is in safe hands through our support with communication with the seller.</p>
                                        </div>      
                                    </div>            
                                </div>
                                <div class = "col-md-6 col-12 h-100">
                                    <div class = "card p-5">
                                        <div class = "card-header border-0 bg-transparent">
                                            <h1 class= "text-center text-capitalize">Peace of Mind</h1>
                                        </div>
                                        <div class = "card-body">
                                            <p class = "h4 text-center fw-normal">Our team is frequently monitoring all transactions before approving to ensure that the price is affordable and right for buyer.</p>
                                        </div>      
                                    </div>            
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div> 
            <div class = "bg-dark bg-gradient bg-opacity-25 p-5 d-md-block d-none">
                <div>
                    <div class = "card bg-transparent border border-0">
                        <div class ="card-header bg-transparent border border-0">
                            <h1 class = "text-center text-uppercase fw-bolder">Featured Cars</h1>
                        </div>
                        <div class ="card-body">
                            <div class ="row g-3">
                                <div class = "col-xl-3 col-md-6 col-12" style = "height:14rem">
                                    <div class="h-100 card border border-dark rounded-3 shadow-lg overflow-hidden">
                                        <img src = "/img/chevrolet tahoe.jpg" alt = "car-image-featured" class ="w-100 h-100"/>
                                    </div>
                                </div>
                                <div class = " col-xl-3 col-md-6 col-12" style = "height:14rem">
                                    <div class="h-100 card border border-dark rounded-3 shadow-lg overflow-hidden">
                                        <img src = "/img/dodge charger.jpg" alt = "car-image-featured" class ="w-100 h-100"/>
                                    </div>
                                </div>
                                <div class = "col-xl-3 col-md-6 col-12" style = "height:14rem">
                                    <div class="h-100 card border border-dark rounded-3 shadow-lg overflow-hidden">
                                        <img src = "/img/honda civic.jpg" alt = "car-image-featured" class ="w-100 h-100"/>
                                    </div>
                                </div>
                                <div class = "col-xl-3 col-md-6 col-12" style = "height:14rem">
                                    <div class="h-100 card border border-dark rounded-3 shadow-lg overflow-hidden">
                                        <img src = "/img/chrysler pacifica.jpg" alt = "car-image-featured" class ="w-100 h-100"/>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        <jsp:include page = "components/footer.jsp"/> 
        <script>
            const words = ["Explore, the nature.", "Travel, the world.", "Adventure, through the terrains.", "ABC cars, drive to your dreams."];
            let dynamicTyping = document.querySelector("#dynamic-typing");
            let cursorTyping = document.querySelector("#typing-cursor");
            let currentText = "";
            let typed = "";
            let index = 0;
            let count = 0;

            typing();

            function typing(backspace){
            
                if (words.length == index){
                    index = 0;
                }
                
                if (backspace == null){
                    
                    currentText = words[index];
                    typed = currentText.slice(0, ++count);
                    dynamicTyping.innerHTML = typed;

                    if (currentText.length === typed.length){

                        cursorTyping.classList.add("typing");

                        setTimeout(()=>{
                            cursorTyping.classList.remove("typing");
                            typing(true);
                        }, 5000);

                    }else{
                        
                        setTimeout(()=>{
                            typing();
                        }, 100);
                    }
                }else{
                      if(typed.length != 0){
                         typed = currentText.slice(0, --count);
                         dynamicTyping.innerHTML = typed;

                          setTimeout(()=>{
                            typing(true);
                        }, 100);
                      }else{

                        cursorTyping.classList.add("typing");
                        setTimeout (()=>{
                            cursorTyping.classList.remove("typing");
                            index++;
                            typing();
                        },5000);
                        
                      }

                }
                
            }   
        </script>
    </body>

</html>