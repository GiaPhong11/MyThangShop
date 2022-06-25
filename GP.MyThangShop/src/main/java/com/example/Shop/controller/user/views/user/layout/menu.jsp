
<!-- directive cua JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="container-fluid">
	<div class="row bg-secondary py-2 px-xl-5">
		<div class="col-lg-6 d-none d-lg-block">
			<div class="d-inline-flex align-items-center">
				<a class="text-dark" href="">FAQs</a> <span class="text-muted px-2">|</span>
				<a class="text-dark" href="">Help</a> <span class="text-muted px-2">|</span>
				<a class="text-dark" href="">Support</a>
			</div>
		</div>
		<div class="col-lg-6 text-center text-lg-right">
			<div class="d-inline-flex align-items-center">
				<a class="text-dark px-2" href=""> <i class="fab fa-facebook-f"></i>
				</a> <a class="text-dark px-2" href=""> <i class="fab fa-twitter"></i>
				</a> <a class="text-dark px-2" href=""> <i
					class="fab fa-linkedin-in"></i>
				</a> <a class="text-dark px-2" href=""> <i class="fab fa-instagram"></i>
				</a> <a class="text-dark pl-2" href=""> <i class="fab fa-youtube"></i>
				</a>
			</div>
		</div>
	</div>
	<div class="row align-items-center py-3 px-xl-5">
		<div class="col-lg-3 d-none d-lg-block">
			<a href="${base }/index"> <img
				style="height: 120px; padding-left: 80px"
				src="${base}/user/img/LogoMT.png" alt="">
			</a>
		</div>
		<div class="col-lg-6 col-6 text-left">
			<form action="">
				<div class="input-group">
					<input type="text" class="form-control"
						placeholder="Search for products">
					<div class="input-group-append">
						<span class="input-group-text bg-transparent text-primary">
							<i class="fa fa-search"></i>
						</span>
					</div>
				</div>
			</form>
		</div>
		<div class="col-lg-3 col-6 text-right">
			 <a href="${base }/cart/view" class="btn border"> 
			 <i class="fas fa-shopping-cart text-primary"></i> <span
				id="totalCartItemId" class="badge">${totalItems }</span>
			</a>
		</div>
	</div>
</div>
<div class="container-fluid">
	<div class="row border-top px-xl-5">
		<div class="col-lg-3 d-none d-lg-block">
			<a
				class="btn shadow-none d-flex align-items-center justify-content-between bg-primary text-white w-100"
				data-toggle="collapse" href="#navbar-vertical"
				style="height: 65px; margin-top: -1px; padding: 0 30px;">
				<h6 class="m-0">Categories</h6> <i
				class="fa fa-angle-down text-dark"></i>
			</a>
			<nav
				class="collapse position-absolute navbar navbar-vertical navbar-light align-items-start p-0 border border-top-0 border-bottom-0 bg-light"
				id="navbar-vertical" style="width: calc(100% - 30px); z-index: 1;">
				<div class="navbar-nav w-100 overflow-hidden" style="height: 205px">
					<!-- <div class="nav-item dropdown">
						<a href="#" class="nav-link" data-toggle="dropdown">Dresses <i
							class="fa fa-angle-down float-right mt-1"></i></a>
						<div
							class="dropdown-menu position-absolute bg-secondary border-0 rounded-0 w-100 m-0">
							<a href="" class="dropdown-item">Men's Dresses</a> <a href=""
								class="dropdown-item">Women's Dresses</a> <a href=""
								class="dropdown-item">Baby's Dresses</a>
						</div>
					</div> -->
					 <c:forEach var="cate" items="${categories }">
                        <a href="" class="nav-item nav-link">${cate.name }</a>
                      </c:forEach>
				</div>
			</nav>
		</div>
		<div class="col-lg-9">
			<nav
				class="navbar navbar-expand-lg bg-light navbar-light py-3 py-lg-0 px-0">
				<a href="" class="text-decoration-none d-block d-lg-none">
					<h1 class="m-0 display-5 font-weight-semi-bold">
						<span class="text-primary font-weight-bold border px-3 mr-1">E</span>Shopper
					</h1>
				</a>
				<button type="button" class="navbar-toggler" data-toggle="collapse"
					data-target="#navbarCollapse">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse justify-content-between"
					id="navbarCollapse">
					<div class="navbar-nav mr-auto py-0">
						<a href="${base }/index" class="nav-item nav-link" style="width:130px">Home</a>
						<a href="${base }/shop" class="nav-item nav-link" style="width:130px">Shop</a>
						<div class="nav-item dropdown">
							<a href="#" class="nav-link dropdown-toggle"
								data-toggle="dropdown" style="width:130px">Pages</a>
							<div class="dropdown-menu rounded-0 m-0">
								<a href="${base }/cart/view" class="dropdown-item" >Shopping
									Cart</a> 
									<a href="${base }/cart/checkout" class="dropdown-item">Checkout</a>
							</div>
						</div>
						<a href="${base }/contact" class="nav-item nav-link" style="width:130px">Contact</a>
						<a href="${base }/new" class="nav-item nav-link" style="width:130px">News</a>
					</div>
					  <c:choose>
                       <c:when test="${isLogined }">
                      <a class="nav-item nav-link">WelCome ${userLogined.username }</a>
                       <a href="${base }/logout" class="nav-item nav-link">Logout</a>
                        </c:when>
                        <c:otherwise>
                         <div class="navbar-nav ml-auto py-0">
                            <a href="${base }/login" class="nav-item nav-link">Login</a>
                            </div>
                            </c:otherwise>
                         </c:choose>
				</div>
			</nav>
		</div>
	</div>
</div>