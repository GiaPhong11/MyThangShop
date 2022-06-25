<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	
<!-- directive cua JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- directive SPRING-FORM -->
	<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<!-- VARIABLES -->
<jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Edit-Order - SB Admin</title>
        
        
		
		<!-- CSS -->
		<jsp:include page="/WEB-INF/views/manager/layout/css.jsp"></jsp:include>
		
    </head>
    <body class="sb-nav-fixed">
        <!-- HEADER -->
        <jsp:include page="/WEB-INF/views/manager/layout/header.jsp"></jsp:include>
        
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <!-- MENU -->
                <jsp:include page="/WEB-INF/views/manager/layout/menu.jsp"></jsp:include>
            </div>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid">
                        <h1 class="mt-4">Edit sale order</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item"><a href="${base}/admin/index">Dashboard</a></li>
                            <li class="breadcrumb-item active">SaleOrder / Edit - Order</li>
                        </ol>
    <div class="col-md-9 contact-form">
    
    <sf:form action="${base }/admin/edit-order" modelAttribute="sales" method="POST">
     	<sf:hidden path="id"/> 
     	<sf:hidden path="code"/> 
        <div class="col-md-12 ">
        <!-- <form class="register-form" role="form"> -->
            
        <!-- </form> -->
        </div>
        <div class="col-md-12 ">
        <!-- <form class="register-form" role="form"> -->
            <div class="form-group">
            <label class="info-title" for="exampleInputName">Customer Name (required) <span></span></label>
            <sf:input path="customerName" readonly="true" type="text" class="form-control unicase-form-control text-input" id="exampleInputName" placeholder="Tên danh mục"/>
          </div>
        <!-- </form> -->
    </div>
    <div class="col-md-12 ">
        <!-- <form class="register-form" role="form"> -->
            <div class="form-group">
            <label class="info-title" for="exampleInputName">Customer Address (required) <span></span></label>
            <sf:input path="customerAddress" readonly="true" type="text" class="form-control unicase-form-control text-input" id="exampleInputName" placeholder="Tên danh mục"/>
          </div>
        <!-- </form> -->
    </div>
    
    <div class="col-md-12 ">
        <!-- <form class="register-form" role="form"> -->
            <div class="form-group">
            <label class="info-title" for="exampleInputName">Customer Phone (required) <span></span></label>
            <sf:input path="customerPhone" type="text" readonly="true" class="form-control unicase-form-control text-input" id="exampleInputName" placeholder="Tên danh mục"/>
          </div>
        <!-- </form> -->
    </div>
    
    <div class="col-md-12 ">
        <!-- <form class="register-form" role="form"> -->
            <div class="form-group">
            <label class="info-title" for="exampleInputName">Customer Email (required) <span></span></label>
            <sf:input path="customerEmail" type="text" readonly="true" class="form-control unicase-form-control text-input" id="exampleInputName" placeholder="Tên danh mục"/>
          </div>
        <!-- </form> -->
    </div>
    
    <div class="col-md-12 ">
        <!-- <form class="register-form" role="form"> -->
            <div class="form-group">
            <label class="info-title" for="exampleInputName">Trạng thái đơn hàng (required) <span></span></label><br>
            <%-- <sf:input path="tinhTrang" type="text" class="form-control unicase-form-control text-input" id="exampleInputName" placeholder="Tên danh mục"/> --%>
			<select name="tinhTrangg" style="width:734px;height: 42px;border-radius: 10px ">
				<option value="Chưa thanh toán">Chưa thanh toán</option>
				<option value="Đã thanh toán">Đã thanh toán</option>
				<option value="Đã nhận hàng">Đã nhận hàng</option>
				<option value="Đang giao hàng">Đang giao hàng</option>
			</select>
          </div>
        <!-- </form> -->
    </div>
    
    
    
    <div class="col-md-12 outer-bottom-small m-t-20">
        <a href="${base }/admin/list-order" class="btn-upper btn btn-secondary checkout-page-button">Back To List</a>

        <sf:button  class="btn-upper btn btn-primary checkout-page-button">Gửi</sf:button>
    </div>
    </sf:form>
</div>
                    </div>
                </main>
                <!-- FOOTER -->
        		<jsp:include page="/WEB-INF/views/manager/layout/footer.jsp"></jsp:include>
            </div>
        </div>
        <!-- JAVASCRIPT -->
        <jsp:include page="/WEB-INF/views/manager/layout/js.jsp"></jsp:include>
    </body>
</html>
	