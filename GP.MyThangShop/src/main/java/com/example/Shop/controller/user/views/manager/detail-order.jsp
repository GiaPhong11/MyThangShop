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
        <title>SaleOrder - SB Admin</title>
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
                        <h1 class="mt-4">SaleOrder</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item"><a href="${base}/admin/index">Dashboard</a></li>
                            <li class="breadcrumb-item active">SaleOrder / Detail-Order</li>
                        </ol>
                        
                        <h3 align="center">Chi tiết hóa đơn</h3>
                        <%-- <form action="${base }/admin/contact" method="get">
                      	<label>Tìm kiếm thông tin: </label>
                        <input type="text" name="keyword" /> <!-- Keyword lấy theo parameter  -->
                        <button type="submit" class="btn btn-info">Search</button> --%>
                        <%-- <a href="${base }/admin/add-category" class="btn btn-primary">Add New Category</a> --%>
                        <p>
                        	<!-- Để dùng đc jstl thì phải include nó vào -->
                        	<table class="table table-striped table-dark">
								  <thead>
								    <tr>
								      <th scope="col">ID</th>
								      <th scope="col">Customer Name</th>
								      <th scope="col">Customer Address</th>
								      <th scope="col">Customer Phone</th>
								      <th scope="col">Customer Email</th>
								      <th scope="col">Action</th>
								    </tr>
								  </thead>
								 
                        			<!-- items ở đây là biến mà ta đẩy từ thằng controller -->
                        		<%-- <p>${category.name }</p>
                        		<p>${category.description }</p> --%>
                        	
								  <tbody>
								    <tr>
								      <th scope="row">${saleOrder.id }</th>
								      <td>${saleOrder.customerName }</td>
								      <td>${saleOrder.customerAddress }</td>
								      <td>${saleOrder.customerPhone }</td>
								      <td>${saleOrder.customerEmail }</td>
								      <td>
								      	<%-- <a href="${base }/admin/del-category/${category.id}" class="btn btn-danger">Delete</a>
								      	<a href="${base }/admin/edit-category/${category.id}" class="btn btn-success">Edit</a> --%>
								      	<a href="${base }/admin/detail-order/${saleOrder.id}" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" >View Detail
											<i class="fas fa-eye" style="margin-left: 5px"></i>
										</a>
								      	
								      	<a href="${base }/admin/delete-order/${saleOrder.id}" class="btn btn-danger">Delete</a>
								      </td>
								    </tr>
								    
								  </tbody>
								</table>
                        		<a class="btn btn-primary" href="${base }/admin/list-order">Back To List</a>
								<!-- Button trigger modal -->


<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content" style="width:650px">
      <div class="modal-header">
        <h2 class="modal-title" id="exampleModalLabel" align="center">Chi tiết hoá đơn</h2>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
  <div class="container-fluid" >
  	<div class="row">
      <div class="col-md-5 offset-md-3" style="font-size: 24px;font-weight: bolder;">Mã hóa đơn: ${saleOrder.id }</div>
    </div>
    <div class="row">
      <div class="col-md-4" style="font-size: 18px;">Name: ${saleOrder.customerName }</div>
      <div class="col-md-8 "style="font-size: 18px;">Phone: ${saleOrder.customerPhone}</div>
    </div>
    <div class="row">
      <div class="col-md-12" style="font-size: 18px;">Address: ${saleOrder.customerAddress }</div>
    </div>
    <div class="row">
      <div class="col-md-12" style="font-size: 18px;">Email: ${saleOrder.customerEmail }</div>
    </div>
    <div class="row">
      <div class="col-md-12" style="font-size: 18px;">Status: ${saleOrder.tinhTrang }</div>
    </div>
    <p></p>
    <p></p>
    <p style="margin-bottom: 3px"><u><i>Thông tin sản phẩm</i></u></p>
    <div class="row">
      <p>
                        	<!-- Để dùng đc jstl thì phải include nó vào -->
                        	<table class="table table-striped table-dark">
								  <thead>
								    <tr>
								    <th scope="col">Product Avatar</th>
								      <th scope="col">Product Title</th>
								      <th scope="col">Price</th>
								      <th scope="col">Quality</th>
								      <th scope="col">Total</th>
								    </tr>
								  </thead>
								   <c:forEach var="s" items="${listOrder }" varStatus="loop"> 
                        			<!-- items ở đây là biến mà ta đẩy từ thằng controller -->
								  <tbody>
								    <tr>
								    <td class="cart-image">
						    				<img src="${base }/upload/${s.product.avatar}" class="" style="width: 60px" alt="">
						    
									</td>
								    	<th scope="row">${s.product.title}</th>
								      	<td>${s.product.priceSale }</td>
								      <td>${s.quality }</td>
								      <td>${s.product.priceSale * s.quality}</td>
								    </tr>
								  </tbody>
								   </c:forEach> 
								    <tfoot>
								  	<tr>
								  		<td colspan="4">
								  			
								  			<h4 align="right"> Tổng thanh toán: ${total }</h4>
								  		</td>
								  	</tr>
								  </tfoot>
								   
								</table>
                        </p>
    </div>
    <div class="row">
      <div class="col-md-12" style="font-size: 18px;"></div>
    </div>
  </div>
</div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        
      </div>
    </div>
  </div>
</div>
                        </p>
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
	