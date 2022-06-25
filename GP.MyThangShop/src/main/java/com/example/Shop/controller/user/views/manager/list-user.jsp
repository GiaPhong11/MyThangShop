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
        <title>User - SB Admin</title>
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
                        <h1 class="mt-4">User</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item"><a href="${base}/admin/index">Dashboard</a></li>
                            <li class="breadcrumb-item active">User / List-User</li>
                        </ol>
                        
                        <h3 align="center">Danh sách User</h3>
                        <form action="${base }/admin/user" method="get">
                      	<label>Tìm kiếm người dùng: </label>
                        <input type="text" name="keyword" /> <!-- Keyword lấy theo parameter  -->
                        <button type="submit" class="btn btn-info">Search</button>
                        <%-- <a href="${base }/admin/add-category" class="btn btn-primary">Add New Category</a> --%>
                        <p>
                        	<!-- Để dùng đc jstl thì phải include nó vào -->
                        	<table class="table table-striped table-dark">
								  <thead>
								    <tr>
								      <th scope="col">ID</th>
								      <th scope="col">User Name</th>
								      <th scope="col">Password</th>
								      <th scope="col">Email</th>
								      <th scope="col">Role</th>
								      <th scope="col">Action</th>
								    </tr>
								  </thead>
								  <c:forEach var="u" items="${listPage.content }" varStatus="loop">
                        			<!-- items ở đây là biến mà ta đẩy từ thằng controller -->
                        		<%-- <p>${category.name }</p>
                        		<p>${category.description }</p> --%>
                        	
								  <tbody>
								    <tr>
								      <th scope="row">${u.id }</th>
								      <td>${u.username }</td>
								      <td>${u.password }</td>
								      <td>${u.email }</td>
								      
								      	<c:forEach items="${u.roles}" var="r">
											<td>${r.name }</td>
										</c:forEach>
								      <td>
								      	<%-- <a href="${base }/admin/del-category/${category.id}" class="btn btn-danger">Delete</a>
								      	<a href="${base }/admin/edit-category/${category.id}" class="btn btn-success">Edit</a> --%>
								      	
								      	<%-- <a href="${base }/admin/detail-contact/${c.id}" class="btn btn-primary">View Detail<i class="fas fa-eye" style="margin-left: 5px"></i></a> --%>
								      	<a href="${base }/admin/edit-user/${u.id}" class="btn btn-success">Edit</a>
								      	<a href="${base }/admin/delete-user/${u.id}" class="btn btn-danger">Delete</a>
								      </td>
								    </tr>
								    
								  </tbody>
								  </c:forEach>
								</table>
                        	
								<!-- Button trigger modal -->
<%-- <a href="${base }/admin/detail-contact/${c.id}" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" >
  												Launch demo modal
</a>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        ...
        <p>${contactEntity.firstName }</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        
      </div>
    </div>
  </div>
</div> --%>
                        </p>
                        </form>
                    </div>
                    
                    <!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h2 class="modal-title" id="exampleModalLabel" align="center">Chi tiết</h2>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <input type="text" value="${u.id }"/>
        <p>FullName: ${contactEntity.firstName} ${contactEntity.lastName } </p>
        <p>Email: ${contactEntity.email} </p>
        <p>Message: ${contactEntity.message}</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        
      </div>
    </div>
  </div>
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
	