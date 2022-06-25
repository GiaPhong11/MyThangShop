<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!-- directive cua JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Category - SB Admin</title>
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
                        <h1 class="mt-4">Category</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item"><a href="${base}/admin/index">Dashboard</a></li>
                            <li class="breadcrumb-item active">Category / List-Category</li>
                        </ol>
                        
                        <h3 align="center">Danh sách category</h3>
                        <form action="${base }/admin/categories" method="get">
                      	<label>Tìm kiếm danh mục: </label>
                        <input type="text" name="keywork" /> <!-- Keyword lấy theo parameter  -->
                        <button type="submit" class="btn btn-info">Search</button>
                        <a href="${base }/admin/add-category" class="btn btn-primary">Add New Category</a>
                        <p>
                        	<!-- Để dùng đc jstl thì phải include nó vào -->
                        	<table class="table table-striped table-dark">
								  <thead>
								    <tr>
								      <th scope="col">ID</th>
								      <th scope="col">Name</th>
								      <th scope="col">Description</th>
								      <th scope="col">Action</th>
								    </tr>
								  </thead>
								  <c:forEach var="category" items="${categoriesPage.content }">
                        			<!-- items ở đây là biến mà ta đẩy từ thằng controller -->
                        		<%-- <p>${category.name }</p>
                        		<p>${category.description }</p> --%>
                        	
								  <tbody>
								    <tr>
								      <th scope="row">${category.id }</th>
								      <td>${category.name }</td>
								      <td>${category.description }</td>
								      
								      <td>
								      	<a href="${base }/admin/del-category/${category.id}" class="btn btn-danger">Delete</a>
								      	<a href="${base }/admin/edit-category/${category.id}" class="btn btn-success">Edit</a>
								      </td>
								    </tr>
								    
								  </tbody>
								  </c:forEach>
								</table>
                        		 <nav aria-label="Page navigation example">
								  <ul class="pagination">
								  <c:if test="${number > 0 }">
								    <li class="page-item"><a class="page-link" href="${base }/admin/categories?page=0">First</a></li>					    
								    <li class="page-item"><a class="page-link" href="${base }/admin/categories?page=${categoriesPage.number - 1}">Previous</a></li>
								    </c:if>
								    <li class="page-item"><a class="page-link" href="${base }/admin/categories?page=${categoriesPage.number + 1}">Next</a></li>
								    <li class="page-item"><a class="page-link" href="${base }/admin/categories?page=${categoriesPage.totalPages - 1}">Last</a></li>
								  </ul>
								</nav>
                        </p>
                        </form>
                    </div>
                </main>
                
                <!-- Footer -->
                <jsp:include page="/WEB-INF/views/manager/layout/footer.jsp"></jsp:include>
            </div>
        </div>
        <!-- JAVASCRIPT -->
        <jsp:include page="/WEB-INF/views/manager/layout/js.jsp"></jsp:include>
    </body>
</html>
	