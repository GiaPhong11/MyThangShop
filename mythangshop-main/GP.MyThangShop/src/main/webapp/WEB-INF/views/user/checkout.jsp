<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!-- directive cua JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- directive SPRING-FORM -->
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

    <!-- Customized Bootstrap Stylesheet -->
    <jsp:include page="/WEB-INF/views/user/layout/css2.jsp"></jsp:include>
</head>

<body>
    <!-- Topbar Start -->
    <jsp:include page="/WEB-INF/views/user/layout/menu.jsp"></jsp:include>
    <!-- Navbar End -->



    <!-- Page Header Start -->
    <div class="container-fluid bg-secondary mb-5">
        <div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 300px">
            <h1 class="font-weight-semi-bold text-uppercase mb-3">Checkout</h1>
            <div class="d-inline-flex">
                <p class="m-0"><a href="">Home</a></p>
                <p class="m-0 px-2">-</p>
                <p class="m-0">Checkout</p>
            </div>
        </div>
    </div>
    <!-- Page Header End -->

 <c:if test="${not empty thongbao }">
		<div class="alert alert-primary" role="alert" style="color: #c5837c;font-size:16px;font-weight: bold;font-family:Sans-Serif ;">
			${thongbao }
		</div>
	</c:if>
    <!-- Checkout Start -->
     <form action="${base }/cart/finish" method="post">
    <div class="container-fluid pt-5">
        <div class="row px-xl-5">
        	<c:choose>
  		<c:when test="${isLogined }">
            <div class="col-lg-8">
                <div class="mb-4">
                    <h4 class="font-weight-semi-bold mb-4">Billing Address</h4>
                   
                    <div class="row">
                        <div class="col-md-6 form-group">
                            <label>Customer Name</label>
                            <input class="form-control" name="customerName" type="text" placeholder="Enter Name" value="${userLogined.username }">
                        </div>  
                                   
                        <div class="col-md-6 form-group">
                            <label>Customer Email</label>
                            <input class="form-control" name="customerEmail" type="text" placeholder="example@email.com" value="${userLogined.email }">
                        </div>
                        <div class="col-md-6 form-group">
                            <label>Customer Phone</label>
                            <input class="form-control" name="customerPhone" type="text" placeholder="+123 456 789">
                        </div>
                        <div class="col-md-6 form-group">
                            <label>Customer Address</label>
                            <input class="form-control" name="customerAddress" type="text" placeholder="123 Street">
                        </div>                  
                    </div>
                    
                </div>
                
            </div>
            	</c:when>
  		<c:otherwise>
  		 <div class="col-lg-8">
                <div class="mb-4">
                    <h4 class="font-weight-semi-bold mb-4">Billing Address</h4>
                   
                    <div class="row">
                        <div class="col-md-6 form-group">
                            <label>Customer Name</label>
                            <input class="form-control" name="customerName" type="text" placeholder="Enter Name">
                        </div>  
                                   
                        <div class="col-md-6 form-group">
                            <label>Customer Email</label>
                            <input class="form-control" name="customerEmail" type="text" placeholder="example@email.com">
                        </div>
                        <div class="col-md-6 form-group">
                            <label>Customer Phone</label>
                            <input class="form-control" name="customerPhone" type="text" placeholder="+123 456 789">
                        </div>
                        <div class="col-md-6 form-group">
                            <label>Customer Address</label>
                            <input class="form-control" name="customerAddress" type="text" placeholder="123 Street">
                        </div>                  
                    </div>
                    
                </div>
                
            </div>
            </c:otherwise>
            </c:choose>
            <div class="col-lg-4">
                <div class="card border-secondary mb-5">
                    <div class="card-header bg-secondary border-0">
                        <h4 class="font-weight-semi-bold m-0">Order Total</h4>
                    </div>
                    <div class="card-body">
                        
                        
                        <div class="d-flex justify-content-between mb-3 pt-1">
                            <h6 class="font-weight-medium">Subtotal</h6>
                            <h6 class="font-weight-medium">${totalprice }</h6>
                        </div>
                        
                    </div>
                    <div class="card-footer border-secondary bg-transparent">
                        <div class="d-flex justify-content-between mt-2">
                            <h5 class="font-weight-bold">Total</h5>
                            <h5 class="font-weight-bold">${totalprice }</h5>
                        </div>
                    </div>
                 
                                        <div class="card-footer border-secondary bg-transparent">
                        <button type="submit" class="btn btn-lg btn-block btn-primary font-weight-bold my-3 py-3">Place Order</button>
                  
                </div>
                </div>
                
            </div>
        </div>
        
    </div>
     </form>
    
    <!-- Checkout End -->

 <!-- Footer Start -->
  <!-- Footer Start -->
    <jsp:include page="/WEB-INF/views/user/layout/footer.jsp"></jsp:include>	
    <!-- Footer End -->

    <!-- Footer End -->


    <!-- Back to Top -->
    <a href="#" class="btn btn-primary back-to-top"><i class="fa fa-angle-double-up"></i></a>


    <!-- JavaScript Libraries -->
  <jsp:include page="/WEB-INF/views/user/layout/js.jsp"></jsp:include>	
</body>

</html>