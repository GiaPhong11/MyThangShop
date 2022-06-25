<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
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
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap"
	rel="stylesheet">

<!-- Customized Bootstrap Stylesheet -->
<jsp:include page="/WEB-INF/views/user/layout/css2.jsp"></jsp:include>
</head>

<body>
	<!-- Topbar Start -->
	<jsp:include page="/WEB-INF/views/user/layout/menu.jsp"></jsp:include>
	<!-- Navbar End -->


	<!-- Page Header Start -->
	<div class="container-fluid bg-secondary mb-5">
		<div
			class="d-flex flex-column align-items-center justify-content-center"
			style="min-height: 300px">
			<h1 class="font-weight-semi-bold text-uppercase mb-3">Our Shop</h1>
			<div class="d-inline-flex">
				<p class="m-0">
					<a href="">Home</a>
				</p>
				<p class="m-0 px-2">-</p>
				<p class="m-0">Shop</p>
			</div>
		</div>
	</div>
	<!-- Page Header End -->


	<!-- Shop Start -->
	<div class="container-fluid pt-5">
		<div class="row px-xl-5">
			<!-- Shop Sidebar Start -->
			<div class="col-lg-3 col-md-12">
				<!-- Price Start -->
				<div class="border-bottom mb-4 pb-4">
					<h5 class="font-weight-semi-bold mb-4">Filter by price</h5>
					<form>
						<div
							class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
							<input type="checkbox" class="custom-control-input" checked
								id="price-all"> <label class="custom-control-label"
								for="price-all">All Price</label> <span
								class="badge border font-weight-normal">1000</span>
						</div>
						<div
							class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
							<input type="checkbox" class="custom-control-input" id="price-1">
							<label class="custom-control-label" for="price-1">$0 -
								$100</label> <span class="badge border font-weight-normal">150</span>
						</div>
						<div
							class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
							<input type="checkbox" class="custom-control-input" id="price-2">
							<label class="custom-control-label" for="price-2">$100 -
								$200</label> <span class="badge border font-weight-normal">295</span>
						</div>
						<div
							class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
							<input type="checkbox" class="custom-control-input" id="price-3">
							<label class="custom-control-label" for="price-3">$200 -
								$300</label> <span class="badge border font-weight-normal">246</span>
						</div>
						<div
							class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
							<input type="checkbox" class="custom-control-input" id="price-4">
							<label class="custom-control-label" for="price-4">$300 -
								$400</label> <span class="badge border font-weight-normal">145</span>
						</div>
						<div
							class="custom-control custom-checkbox d-flex align-items-center justify-content-between">
							<input type="checkbox" class="custom-control-input" id="price-5">
							<label class="custom-control-label" for="price-5">$400 -
								$500</label> <span class="badge border font-weight-normal">168</span>
						</div>
					</form>
				</div>
				<!-- Price End -->

				<!-- Color Start -->
				<div class="border-bottom mb-4 pb-4">
					<h5 class="font-weight-semi-bold mb-4">Filter by color</h5>
					<form>
						<div
							class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
							<input type="checkbox" class="custom-control-input" checked
								id="color-all"> <label class="custom-control-label"
								for="price-all">All Color</label> <span
								class="badge border font-weight-normal">1000</span>
						</div>
						<div
							class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
							<input type="checkbox" class="custom-control-input" id="color-1">
							<label class="custom-control-label" for="color-1">Black</label> <span
								class="badge border font-weight-normal">150</span>
						</div>
						<div
							class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
							<input type="checkbox" class="custom-control-input" id="color-2">
							<label class="custom-control-label" for="color-2">White</label> <span
								class="badge border font-weight-normal">295</span>
						</div>
						<div
							class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
							<input type="checkbox" class="custom-control-input" id="color-3">
							<label class="custom-control-label" for="color-3">Red</label> <span
								class="badge border font-weight-normal">246</span>
						</div>
						<div
							class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
							<input type="checkbox" class="custom-control-input" id="color-4">
							<label class="custom-control-label" for="color-4">Blue</label> <span
								class="badge border font-weight-normal">145</span>
						</div>
						<div
							class="custom-control custom-checkbox d-flex align-items-center justify-content-between">
							<input type="checkbox" class="custom-control-input" id="color-5">
							<label class="custom-control-label" for="color-5">Green</label> <span
								class="badge border font-weight-normal">168</span>
						</div>
					</form>
				</div>
				<!-- Color End -->

				<!-- Size Start -->
				<div class="mb-5">
					<h5 class="font-weight-semi-bold mb-4">Filter by size</h5>
					<form>
						<div
							class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
							<input type="checkbox" class="custom-control-input" checked
								id="size-all"> <label class="custom-control-label"
								for="size-all">All Size</label> <span
								class="badge border font-weight-normal">1000</span>
						</div>
						<div
							class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
							<input type="checkbox" class="custom-control-input" id="size-1">
							<label class="custom-control-label" for="size-1">XS</label> <span
								class="badge border font-weight-normal">150</span>
						</div>
						<div
							class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
							<input type="checkbox" class="custom-control-input" id="size-2">
							<label class="custom-control-label" for="size-2">S</label> <span
								class="badge border font-weight-normal">295</span>
						</div>
						<div
							class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
							<input type="checkbox" class="custom-control-input" id="size-3">
							<label class="custom-control-label" for="size-3">M</label> <span
								class="badge border font-weight-normal">246</span>
						</div>
						<div
							class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
							<input type="checkbox" class="custom-control-input" id="size-4">
							<label class="custom-control-label" for="size-4">L</label> <span
								class="badge border font-weight-normal">145</span>
						</div>
						<div
							class="custom-control custom-checkbox d-flex align-items-center justify-content-between">
							<input type="checkbox" class="custom-control-input" id="size-5">
							<label class="custom-control-label" for="size-5">XL</label> <span
								class="badge border font-weight-normal">168</span>
						</div>
					</form>
				</div>
				<!-- Size End -->
			</div>
			<!-- Shop Sidebar End -->


			<!-- Shop Product Start -->
			<div class="col-lg-9 col-md-12">
				<div class="row pb-3">
					<div class="col-12 pb-1">
						<div
							class="d-flex align-items-center justify-content-between mb-4">
							<form action="${base }/shop" method="get">
								<div class="input-group">
									<input type="text" name="keywork" class="form-control"
										placeholder="Search by name">
									<div class="input-group-append">
										<span class="input-group-text bg-transparent text-primary">
											<button class="fa fa-search" style="border: none"></button>
										</span>
									</div>
								</div>
							</form>
							<div class="dropdown ml-4">
								<button class="btn border dropdown-toggle" type="button"
									id="triggerId" data-toggle="dropdown" aria-haspopup="true"
									aria-expanded="false">Sort by</button>
								<div class="dropdown-menu dropdown-menu-right"
									aria-labelledby="triggerId">
									<a class="dropdown-item" href="#">Latest</a> <a
										class="dropdown-item" href="#">Popularity</a> <a
										class="dropdown-item" href="#">Best Rating</a>
								</div>
							</div>
						</div>
					</div>
					<c:choose>
						<c:when test="${productPages.size()>0 }">
							<c:forEach var="productShop" items="${productShop.content}">
								<div class="col-lg-4 col-md-6 col-sm-12 pb-1">
									<div class="card product-item border-0 mb-4">
										<div
											class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
											<img class="img-fluid w-100"
												src="${base}/upload/${productShop.avatar}" alt="">
										</div>
										<div
											class="card-body border-left border-right text-center p-0 pt-4 pb-3">
											<h6 class="text-truncate mb-3">${productShop.title}</h6>
											<div class="d-flex justify-content-center">
												<h6>${productShop.price}</h6>
												<h6 class="text-muted ml-2">
													<del>${productShop.priceSale }</del>
												</h6>
											</div>
										</div>
										<div
											class="card-footer d-flex justify-content-between bg-light border">
											<a href="${base }/detail/${productShop.id}"
												class="btn btn-sm text-dark p-0"><i
												class="fas fa-eye text-primary mr-1"></i>View Detail</a> <a
												href="#" class="btn btn-sm text-dark p-0"
												onclick="addToCart(${productShop.id},1)"><i
												class="fas fa-shopping-cart text-primary mr-1"></i>Add To
												Cart</a>
										</div>
									</div>
								</div>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="8" align="center"
									class="pagination justify-content-center mb-3">No Product
									Available</td>
							</tr>
						</c:otherwise>
					</c:choose>


					<div class="col-12 pb-1">
						<nav aria-label="Page navigation">
							<ul class="float-left">
								<c:if test="${productPages.size()>0}">
									<div class="pagination justify-content-center mb-3">
										Showing ${number+1 } to ${size } of ${totalElements} Products</div>
								</c:if>
							</ul>
							<ul class="pagination float-right mb-3">
								<li class="page-item"><a class="page-link"
									href="${base }/shop?page=0" aria-label="Previous"> First </a></li>
								<c:if test="${number>0}">
								<li class="page-item"><a class="page-link"
									href="${base }/shop?page=${productShop.number - 1}"
									aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
										<span class="sr-only">Previous</span>
								</a></li>
								</c:if>
							
								<%-- <li class="page-item"><a class="page-link" href="#">${abv }</a></li> --%>
								<li class="page-item"><a class="page-link"
									href="${base }/shop?page=${productShop.number + 1}"
									aria-label="Next"> <span aria-hidden="true">&raquo;</span>
										<span class="sr-only">Next</span>
								</a></li>
							

								<li class="page-item"><a class="page-link"
									href="${base }/shop?page=${productShop.totalPages - 1}"
									aria-label="Previous"> Last </a></li>
							</ul>
						</nav>
					</div>

				</div>
			</div>
			<!-- Shop Product End -->
		</div>
	</div>
	<!-- Shop End -->

	<script type="text/javascript">
		 function addToCart(productId,quanlity) {
			    let data = {
					productId: productId,
					quanlity: quanlity	
				};
				 jQuery.ajax({
					url : "/cart/add",
					type : "post",
					contentType : "application/json",
					data : JSON.stringify(data),
					dataType : "json", // kieu du lieu tra ve tu controller la json
					success : function(jsonResult) {
						let totalItems = jsonResult.totalItems;
						jQuery("#totalCartItemId").html(totalItems);
						alert(jsonResult.message); 
						
					},
					error : function(jqXhr, textStatus, errorMessage) { // error callback 
						
					} 
				});     
		 }
	</script>
	<!-- Footer Start -->
	<jsp:include page="/WEB-INF/views/user/layout/footer.jsp"></jsp:include>
	<!-- Footer End -->


	<!-- Back to Top -->
    <a href="" onclick="topFunction()" class="btn btn-primary back-to-top" id="myBtn"><i class="fa fa-angle-double-up"></i></a>

	
    <!-- JavaScript Libraries -->
    <jsp:include page="/WEB-INF/views/user/layout/js.jsp"></jsp:include>
    <style>
    	html {
  			scroll-behavior: smooth;
		}
    </style>
    <script type="text/javascript">
    window.onscroll = function() {scrollFunction()};

    function scrollFunction() {
        if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
            document.getElementById("myBtn").style.display = "block";
        } else {
            document.getElementById("myBtn").style.display = "none";
        }
    }
    
    </script>
    <script type="text/javascript">
	    function topFunction() {
	    	$("html,body").animate({scrollTop: 0}, "slow"); 
	         document.body.scrollTop = 0; 
	         document.documentElement.scrollTop = 0;  
	        
	    }
    </script>	

</body>

</html>