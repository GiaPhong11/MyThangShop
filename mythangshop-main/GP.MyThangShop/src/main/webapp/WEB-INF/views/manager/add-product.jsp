<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	
	<!-- directive SPRING-FORM -->
	<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Add-Product - SB Admin</title>
        <!-- VARIABLES -->
		<jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>
		
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
                        <h1 class="mt-4">Add - Product</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item"><a href="${base}/admin/index">Dashboard</a></li>
                            <li class="breadcrumb-item active">Product / Add-Product</li>
                        </ol>
    <div class="col-md-9 contact-form">
    
    <sf:form method="POST" action="${base}/admin/add-product" modelAttribute="product" enctype="multipart/form-data">
    	<%-- <sf:hidden path="id"/>  --%>
        <div class="col-md-12 "> 
        <!-- <form class="register-form" role="form"> -->
            <div class="form-group">
            <label class="info-category" for="exampleInputCategory">Category (required)<span></span></label>
            <%-- <sf:select path="categories.id" name="" id="" style="width: 100%;height: 40px;border: 1px solid #eee;border-radius: 5px; outline: none;">
                <sf:options value ="${categories }" itemValue ="id" itemLabel ="name"/>
                
            </sf:select> --%>
            <sf:select path="categories.id" class="form-control" id="category">
       			<sf:options items="${categories }" itemValue="id" itemLabel="name" />
			</sf:select>
          </div>
        <!-- </form> -->
        </div>
        <div class="col-md-12 ">
        <!-- <form class="register-form" role="form"> -->
            <div class="form-group">
            <label class="info-title" for="exampleInputTitle">Title (required) <span></span></label>
            <sf:input path="title" type="text" class="form-control unicase-form-control text-input" id="exampleInputEmail" placeholder="title"/>
          </div>
        <!-- </form> -->
    </div>
    <div class="col-md-12 ">
        <!-- <form class="register-form" role="form"> -->
            <div class="form-group">
            <label class="info-title" for="exampleInputPrice">Price (required) </label>
            <sf:input path="price" type="number" class="form-control unicase-form-control text-input" id="exampleInputTitle" placeholder="Price"/>
          </div>
        <!-- </form> -->
    </div>
    <div class="col-md-12">
        <div class="register-form" role="form">
            <div class="form-group">
            <label class="info-title" for="exampleInputEmail1">Price sale (required) </label>
            <sf:input path="priceSale" type="input" class="form-control unicase-form-control text-input" id="exampleInputPriceSale" placeholder="Price sale"/>
          </div>
        </div>
    </div>
    <div class="col-md-12">
        <div class="register-form" role="form">
            <div class="form-group">
            <label class="info-title" for="exampleInputTitle">Description (required) </label>
            <sf:textarea path="shortDescription" class="form-control unicase-form-control" id="exampleInputDescription" placeholder="Short Description"></sf:textarea>
          </div>
        </div>
    </div>
    <div class="col-md-12">
        <div class="register-form" role="form">
            <div class="form-group">
            <label class="info-title" for="exampleInputDetail">Detail (required) </label>
            <%-- <sf:textarea path="details" class="form-control unicase-form-control" id="exampleInputDetail" placeholder="Mô tả chi tiết vấn đề của bạn"></sf:textarea> --%>
            <!-- <div id="summernote">Summernote</div> -->
             <sf:textarea path="details" id="summernote" name="editordata"></sf:textarea>
          </div>
        </div>
    </div>
    <div class="col-md-12">
        <div class="register-form" role="form">
            <div class="form-group">
                <sf:checkbox path="isHot" name="exampleInputCheckbox"/>
                <label class="info-title" for="exampleInputCheckbox">Is Hot Product? </label>
            
          </div>
        </div>
    </div>
    <div class="col-md-12">
    <div class="form-group">
        <label for="inputFile">Avatar</label>
        <input id="inputFile" name="inputAvatar" type="file" class="form-control-file" ">
    </div>
    </div>
    <div class="col-md-12">
    <div class="form-group">
        <label for="inputFile">Picture(Multiple)</label>
        <input id="inputFile" name="inputPictures" type="file" class="form-control-file" multiple="multiple">
    </div>
    </div>
    <div class="col-md-12 outer-bottom-small m-t-20">
    	<a href="${base }/admin/list-product" class="btn-upper btn btn-secondary checkout-page-button">Back To List</a>
        <a href="${base }/admin/list-product"><sf:button  class="btn-upper btn btn-primary checkout-page-button" >Gửi</sf:button></a>
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
        <link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-bs4.css" rel="stylesheet">
		<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-bs4.js"></script>
		<script type="text/javascript">
			//$('#summernote').summernote();
			$(document).ready(function() {
			    $('#summernote').summernote({
			      placeholder: 'Enter content....',
			      tabsize: 2,
			      height: 200,
			      minHeight: 100,
			      maxHeight: 300,
			      focus: true,
			      
			    });
			  
			});
		</script>
    </body>
</html>
