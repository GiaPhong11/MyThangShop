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
        <title>Thống kê - SB Admin</title>
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
                        <h1 class="mt-4">Chart</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item"><a href="${base}/admin/index">Dashboard</a></li>
                            <li class="breadcrumb-item active">Chart / List-chart</li>
                        </ol>
                        
                        <h3 align="center">Danh sách hóa đơn</h3>
                        <form>
                      	<label>Tìm kiếm hóa đơn: </label>
                        Từ <input type="date" name="date1" id="date1" min="1950-01-01" max="2099-12-31"/> 
                        - Đến <input type="date" name="date2" id="date2" min="1950-01-01" max="2099-12-31"/><!-- Keyword lấy theo parameter  -->
                        <button type="button" class="btn btn-info" id="btn-submit" onclick="getListOrder()" >Search</button>
                        
                  </form>
                  	<div id="getResultDiv" style="padding: 20px 10px 20px 50px">
						
					</div>
                        <form>
                        <p>
                        	<!-- Để dùng đc jstl thì phải include nó vào -->
                        	<table class="table table-striped table-dark">
								  <thead>
								    <tr>
								      <th scope="col">ID</th>
								      <th scope="col">CustomerName</th>
								      <th scope="col">CustomerAddress</th>
								      <th scope="col">CustomerPhone</th>
								      <!-- <th scope="col">Detail</th> -->
								      <th scope="col">TenSanPham</th>
								      <th scope="col">TinhTrang</th>
								      <th scope="col">Quality</th>
								      <th scope="col">Price</th>
								      <th scope="col">Total</th>
								    </tr>
								  </thead>
                        	
								  <tbody id="load_data">
									    
								  </tbody>
								  <tfoot>
								  	<tr>
								  		<td colspan="9" align="right" id="load_data2" style="padding-right: 100px">Tổng sản phẩm bán được: ${totalBan} </td>
								  	</tr>
								  	<tr>
								  		<td colspan="9" align="right" id="load_data3" style="padding-right: 100px">Tổng tiền:  </td>
								  	</tr>
								  </tfoot>
								</table>
                        		<%-- <nav aria-label="Page navigation example">
								  <ul class="pagination">
								    <li class="page-item"><a class="page-link" href="${base }/admin/list-product?page=${p-1 }">Previous</a></li>
								    <c:forEach items="${listPage}" var="p">
								    	  <li class="page-item"><a class="page-link" href="${base }/admin/list-product?page=${p }" >${p }</a></li>
								    </c:forEach>
								   
								    <li class="page-item"><a class="page-link" href="#">Next</a></li>
								  </ul>
								</nav> --%>
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
    
    
    <script type="text/javascript">
    	function getListOrder(){
    		var x =$("#date1").val();
    		var y =  $("#date2").val();
    		if(x > y){
    			alert("Ngày trước không được lớn hơn ngày sau");
    			return;
    		}
    		/* var x = $("#date1").val();
    		var y = document.getElementById("date2").value;
    		alert(x);
    		alert(y); */
    		let data = {
				 x: $("#date1").val(),
				 y:  $("#date2").val()
				};
    		$.ajax({
				type : "GET",
				url : "/admin/chart/thongke?date1="+x+"&&date2="+y,
				success : function(result) {
				alert("success");
					 var str = "";
					 var str2 = 0;
					 var str3 = 0;
					 console.log(result);
					$.each(result, function(i, saleOrderProduct) {
								str +="<tr>";
								str +="<td>"+saleOrderProduct.saleOrderEntity.id + "</td>";
								str +="<td>"+saleOrderProduct.saleOrderEntity.customerName +"</td>";
							    str +="<td>"+saleOrderProduct.saleOrderEntity.customerAddress + "</td>";
								str +="<td>"+saleOrderProduct.saleOrderEntity.customerPhone + "</td>";
								str +="<td>"+saleOrderProduct.product.title + "</td>"; 
								str +="<td>"+saleOrderProduct.saleOrderEntity.tinhTrang + "</td>"; 
								str +="<td>"+saleOrderProduct.quality + "</td>"; 
								 str +="<td>"+saleOrderProduct.product.priceSale + "</td>"; 
								 str +="<td>"+saleOrderProduct.quality * saleOrderProduct.product.priceSale + "</td>"; 
								str +="</tr>";
								/* $("#getResultDiv").append(
										product.title,product.price); */
										str2 += saleOrderProduct.quality;
										str3 += saleOrderProduct.quality * saleOrderProduct.product.priceSale;
							 });
					
					 $('#load_data').html(str); 
					 $('#load_data2').html("Tổng số lượng sản phẩm bán được : "+str2); 
					 $('#load_data3').html("Tổng tiền : "+str3); 
					/* $("#duLieuBanDau").css("display", "none"); */
					/* console.log("Success: ", result); */ 
				},
				error : function(e) {
					 $('#load_data').html("");
					 $('#load_data2').html("Tổng số lượng sản phẩm bán được : "+"");
					 $('#load_data3').html("Tổng tiền : "+""); 
					alert("Không có dữ liệu thỏa mãn");
					
				}
			});
    		
    	}
    </script>
</html>
	