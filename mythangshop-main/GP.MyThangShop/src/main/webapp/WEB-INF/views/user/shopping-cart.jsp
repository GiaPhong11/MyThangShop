<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!-- directive cua JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
            <h1 class="font-weight-semi-bold text-uppercase mb-3">Shopping Cart</h1>
            <div class="d-inline-flex">
                <p class="m-0"><a href="">Home</a></p>
                <p class="m-0 px-2">-</p>
                <p class="m-0">Shopping Cart</p>
            </div>
        </div>
    </div>
    <!-- Page Header End -->


    <!-- Cart Start -->
    <div class="container-fluid pt-5">
        <div class="row px-xl-5">
            <div class="col-lg-8 table-responsive mb-5">
                <table class="table table-bordered text-center mb-0">
                    <thead class="bg-secondary text-dark">
                        <tr>
                            <th>Products</th>
                            <th>Price</th>
                            <th>Quantity</th>
                            <th>Total</th>
                            <th>Remove</th>
                        </tr>
                    </thead>
                    <tbody class="align-middle">
                   	<c:forEach var="cartItem" items="${cart.cartItems }">
                        <tr>
                            <td class="align-middle"><img src="${base }/upload/${cartItem.productImage}" alt="" style="width: 50px;">${cartItem.productName }</td>
                            <td class="align-middle">${cartItem.priceUnit }</td>
                            <td class="align-middle">
                                <div class="input-group quantity mx-auto" style="width: 100px;">
                                    <!-- <div class="input-group-btn">
                                        <button class="btn btn-sm btn-primary btn-minus" >
                                        <i class="fa fa-minus"></i>
                                        </button>
                                    </div> -->
                                    <input type="" class="form-control form-control-sm bg-secondary text-center" value="${cartItem.quanlity}">
                                  <!--   <div class="input-group-btn">
                                        <button class="btn btn-sm btn-primary btn-plus">
                                            <i class="fa fa-plus"></i>
                                        </button>
                                    </div> -->
                                </div>
                            </td>
                            <td class="align-middle">${cartItem.quanlity * cartItem.priceUnit}</td>
                            <td class="align-middle">
                            <a href="#" title="cancel" class="icon btn-delete" onclick="deleteProduct(${cartItem.productId})">
                            <button class="btn btn-sm btn-primary"><i class="fa fa-times"></i></button></a>
                            </td>
                        </tr>
                        </c:forEach>
                    </tbody>
                </table>
                </br>
                <div class="input-group-append">
                <a href="${base }/shop">
                    <button class="btn btn-primary">Continue Shopping</button>
                    </a>
                </div>
            </div>
            <div class="col-lg-4">
                <form class="mb-5" action="">
                    <div class="input-group">
                        <input type="text" class="form-control p-4" placeholder="Coupon Code">
                        <div class="input-group-append">
                            <button class="btn btn-primary">Apply Coupon</button>
                        </div>
                    </div>
                </form>
		
                <div class="card border-secondary mb-5">
                    <div class="card-header bg-secondary border-0">
                        <h4 class="font-weight-semi-bold m-0">Cart Summary</h4>
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
                        <a href="${base }/cart/checkout">
                        <button class="btn btn-block btn-primary my-3 py-3">
                        Proceed To Checkout</button></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Cart End -->


    <!-- Footer Start -->
  <!-- Footer Start -->
    <jsp:include page="/WEB-INF/views/user/layout/footer.jsp"></jsp:include>	
    <!-- Footer End -->

    <!-- Footer End -->


    <!-- Back to Top -->
    <a href="#" class="btn btn-primary back-to-top"><i class="fa fa-angle-double-up"></i></a>


    <!-- JavaScript Libraries -->
  <jsp:include page="/WEB-INF/views/user/layout/js.jsp"></jsp:include>	
  	<script type="text/javascript">
	function deleteProduct(productId) {
		// javascript object.
		// data la du lieu ma day len action cua controller
		//alert(1);
		let data = {
			/* txtYourName: $("#exampleInputName").val(), // lay theo id
			txtEmail: $("#exampleInputEmail1").val(), // lay theo id
			txtTitle: $("#exampleInputTitle").val(),
			txtComments: $("#exampleInputComments").val(), */
			productId: productId
		};
		
		// $ === jQuery
		// json == javascript object
		$.ajax({
			url : "/cart-delete",
			type : "post",
			contentType : "application/json",
			data : JSON.stringify(data),//biến trong (stringify) là phần trên khai báo let data;

			dataType : "json", // kieu du lieu tra ve tu controller la json
			success : function(jsonResult) {
			//	alert("Chuc mung! da luu thanh cong dia chi email " + jsonResult.message.txtTitle);
				//message: ở bên contact controller có chỗ phần json.put
				$("#totalCartItemId").html(jsonResult.totalItems);
				alert('Successfully removed !');
				location.reload();
			},
			error : function(jqXhr, textStatus, errorMessage) { // error callback 
				
			}
		});}
	</script>
</body>

</html>