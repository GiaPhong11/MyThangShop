 
 <%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
 <!-- directive cua JSTL -->
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	 
 <!-- directive cua SpringForm -->
	<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>${projectTitle }</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="Free HTML Templates" name="keywords">
    <meta content="Free HTML Templates" name="description">
   
    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet"> 
	<!-- CSS -->
    <jsp:include page="/WEB-INF/views/user/layout/css.jsp"></jsp:include>   

</head>

<body>
    <!-- Topbar + Navbar Start -->
   
	<jsp:include page="/WEB-INF/views/user/layout/menu.jsp"></jsp:include>   
   
    <!-- Topbar + Navbar End -->


    <!-- Page Header Start -->
    <div class="container-fluid bg-secondary mb-5">
        <div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 300px">
            <h1 class="font-weight-semi-bold text-uppercase mb-3">Contact Us</h1>
            <div class="d-inline-flex">
                <p class="m-0"><a href="">Home</a></p>
                <p class="m-0 px-2">-</p>
                <p class="m-0">Contact</p>
            </div>
        </div>
    </div>
    <!-- Page Header End -->


    <!-- Contact Start -->
    <div class="container-fluid pt-5">
        <div class="text-center mb-4">
            <h2 class="section-title px-5"><span class="px-2">Contact For Any Queries</span></h2>
        </div>
        <div class="row px-xl-5">
            <div class="col-lg-7 mb-5">
                <div class="contact-form">
                    <div id="success"></div>
                    
                    <c:if test="${not empty thongbao }">
                    	 <div class="alert alert-primary" role="alert">
  							${thongbao}
						</div>
                    </c:if>
                   
                    
                    <sf:form  id="contactForm" novalidate="novalidate" action="${base }/contact" method="POST" modelAttribute="contact" enctype="multipart/form-data">
                        <div class="control-group">
                            <sf:input type="text" path="firstName" name="txtFirstName" class="form-control" id="exampleInputName" placeholder="Your First Name"
                                required="required" data-validation-required-message="Please enter your name" />
                            <p class="help-block text-danger"></p>
                        </div>
                        <div class="control-group">
                            <sf:input type="text" path="lastName" class="form-control" name="txtYourName" id="exampleInputName" placeholder="Your Last Name"
                                required="required" data-validation-required-message="Please enter your Last Name" />
                            <p class="help-block text-danger"></p>
                        </div>
                         <div class="control-group">
                            <sf:input type="text" path="email" class="form-control" name="txtEmail" id="exampleInputEmail1" placeholder="Your Email"
                                required="required" data-validation-required-message="Please enter your email" />
                            <p class="help-block text-danger"></p>
                        </div>
                         <div class="control-group">
                            <sf:input type="text" path="requestType" class="form-control" name="txtEmail" id="exampleInputTitle" placeholder="Your Title"
                                required="required" data-validation-required-message="Please enter your Title" />
                            <p class="help-block text-danger"></p>
                        </div>
                        <div class="control-group">
                            <sf:textarea class="form-control" path="message" rows="6" name="txtComments"  id="exampleInputComments" placeholder="Message"
                                required="required"
                                data-validation-required-message="Please enter your message"></sf:textarea>
                            <p class="help-block text-danger"></p>
                        </div>
                      
                        </br>
                        <div>
                            <button class="btn btn-primary py-2 px-4" type="submit" id="sendMessageButton">Send
                                Message</button>
                        </div>
                    </sf:form>
                    
                </div>
            </div>
            <div class="col-lg-5 mb-5">
                <h5 class="font-weight-semi-bold mb-3">Get In Touch</h5>
                <p>Justo sed diam ut sed amet duo amet lorem amet stet sea ipsum, sed duo amet et. Est elitr dolor elitr erat sit sit. Dolor diam et erat clita ipsum justo sed.</p>
                <div class="d-flex flex-column mb-3">
                    <h5 class="font-weight-semi-bold mb-3">Store 1</h5>
                    <p class="mb-2"><i class="fa fa-map-marker-alt text-primary mr-3"></i>123 Street, New York, USA</p>
                    <p class="mb-2"><i class="fa fa-envelope text-primary mr-3"></i>info@example.com</p>
                    <p class="mb-2"><i class="fa fa-phone-alt text-primary mr-3"></i>+012 345 67890</p>
                </div>
                <div class="d-flex flex-column">
                    <h5 class="font-weight-semi-bold mb-3">Store 2</h5>
                    <p class="mb-2"><i class="fa fa-map-marker-alt text-primary mr-3"></i>123 Street, New York, USA</p>
                    <p class="mb-2"><i class="fa fa-envelope text-primary mr-3"></i>info@example.com</p>
                    <p class="mb-0"><i class="fa fa-phone-alt text-primary mr-3"></i>+012 345 67890</p>
                </div>
            </div>
        </div>
    </div>
    <!-- Contact End -->


    <!-- Footer Start -->
   <jsp:include page="/WEB-INF/views/user/layout/footer.jsp"></jsp:include>
    <!-- Footer End -->


    <!-- Back to Top -->
    <a href="#" class="btn btn-primary back-to-top"><i class="fa fa-angle-double-up"></i></a>


    <!-- JavaScript  -->
	<jsp:include page="/WEB-INF/views/user/layout/js.jsp"></jsp:include>
</body>

</html>