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
        <title>Add-Category - SB Admin</title>
        
        
		
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
                        <h1 class="mt-4">Add - Category</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item"><a href="${base}/admin/index">Dashboard</a></li>
                            <li class="breadcrumb-item active">Category / Add-Category</li>
                        </ol>
    <div class="col-md-9 contact-form">
    
    <sf:form action="${base }/admin/add-category" modelAttribute="category" method="POST">
     <%-- 	<sf:hidden path="id"/>  --%>
     <c:if test="${not empty loi }">
							<div class="alert alert-primary text-center" role="alert" style="font-size: 24px; color: red">
								${loi }
							</div>
		</c:if>
        <div class="col-md-12 ">
        <!-- <form class="register-form" role="form"> -->
            
        <!-- </form> -->
        </div>
        <div class="col-md-12 ">
        <!-- <form class="register-form" role="form"> -->
            <div class="form-group">
            <label class="info-title" for="exampleInputName">Name (required) <span></span></label>
            <sf:input path="name" type="text" class="form-control unicase-form-control text-input" id="exampleInputName" placeholder="Tên danh mục"/>
          </div>
        <!-- </form> -->
    </div>
    
    <div class="col-md-12">
        <div class="register-form" role="form">
            <div class="form-group">
            <label class="info-title" for="exampleInputDetail">Description (required) </label>
            <sf:textarea path="description" class="form-control unicase-form-control" id="exampleInputDetail" placeholder="Mô tả chi tiết"></sf:textarea>
          </div>
        </div>
    </div>
    
    
    <div class="col-md-12 outer-bottom-small m-t-20">
        <a href="${base }/admin/categories" class="btn-upper btn btn-secondary checkout-page-button">Back To List</a>

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
	