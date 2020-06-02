<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add to Cart</title>
<!-- Favicon -->
<link rel="shortcut icon" href="favicon.ico">
<c:url value="/view/client/static" var="url"></c:url>

<!-- Web Fonts -->
<link rel='stylesheet' type='text/css'
	href='//fonts.googleapis.com/css?family=Open+Sans:400,300,600&amp;subset=cyrillic,latin'>

<!-- CSS Global Compulsory -->
<link rel="stylesheet"
	href="${url}/plugins/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="${url}/css/shop.style.css">

<!-- CSS Header and Footer -->
<link rel="stylesheet" href="${url}/css/headers/header-v5.css">
<link rel="stylesheet" href="${url}/css/footers/footer-v4.css">

<!-- CSS Implementing Plugins -->
<link rel="stylesheet" href="${url}/plugins/animate.css">
<link rel="stylesheet" href="${url}/plugins/line-icons/line-icons.css">
<link rel="stylesheet"
	href="${url}/plugins/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet"
	href="${url}/plugins/jquery-steps/css/custom-jquery.steps.css">
<link rel="stylesheet"
	href="${url}/plugins/scrollbar/css/jquery.mCustomScrollbar.css">

<!-- Style Switcher -->
<link rel="stylesheet" href="${url}/css/plugins/style-switcher.css">

<!-- CSS Theme -->
<link rel="stylesheet" href="${url}/css/theme-colors/default.css"
	id="style_color">

<!-- CSS Customization -->
<link rel="stylesheet" href="${url}/css/custom.css">
</head>
<body>
<body class="header-fixed">
	<div class="wrapper">
		<!--=== Header v5 ===-->
		<div class="header-v5 header-static">
			<!-- Topbar v3 -->
			<jsp:include page="topbar.jsp"></jsp:include>
			<!-- End Topbar v3 -->

			<!-- Navbar -->
			<jsp:include page="navbar.jsp"></jsp:include>
			<!-- End Navbar -->
		</div>
		<!--=== End Header v5 ===-->

		<!--=== Breadcrumbs v4 ===-->
		<div class="breadcrumbs-v4">
			<div class="container">
				<span class="page-name">Check Out</span>
				<h1>
					Maecenas <span class="shop-green">enim</span> sapien
				</h1>
				<ul class="breadcrumb-v4-in">
					<li><a href="index.html">Home</a></li>
					<li><a href="">Product</a></li>
					<li class="active">Shopping Cart</li>
				</ul>
			</div>
			<!--/end container-->
		</div>
		<!--=== End Breadcrumbs v4 ===-->

		<!--=== Content Medium Part ===-->
		<div class="content-md margin-bottom-30">
			<div class="container">
				<form class="shopping-cart" action="#">
					<div>
						<div class="header-tags">
							<div class="overflow-h">
								<h2>Shopping Cart</h2>
								<p>Review &amp; edit your product</p>
								<i class="rounded-x fa fa-check"></i>
							</div>
						</div>
						<section>
							<div class="table-responsive">
								<table class="table table-striped">
									<thead>
										<tr>
											<th>Sản phẩm</th>
											<th>Giá bán</th>
											<th>Số lượng</th>
											<th>Giá tiền</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${sessionScope.cart}" var="map">
											<fmt:setLocale value="vi_VN" />
											<tr>
												<c:url value="/image?fname=${map.value.product.image }"
													var="imgUrl"></c:url>
												<td class="product-in-table">
													<%-- <img class="img-responsive" src="${imgUrl}" alt=""> --%>
													<div class="">
														<h3>${map.value.product.name }</h3>
														<span>${map.value.product.des }</span>
													</div>
												</td>
												<td><fmt:formatNumber
														value="${map.value.product.price}" type="currency" /></td>
												<td>${map.value.quantity }</td>
												<td class="shop-red">$ ${map.value.product.price * map.value.quantity }</td>
												<td><a
													href="${pageContext.request.contextPath}/member/cart/remove?pId=${map.value.product.id}"><button
															type="button" class="close">
															<span>&times;</span><span class="sr-only">Close</span>
														</button></a></td>
											</tr>
										</c:forEach>

									</tbody>
								</table>
							</div>
						</section>
							<div class="coupon-code">
								<div class="row">
									<div class="col-sm-3 col-sm-offset-5">
										<ul class="list-inline total-result">
											<li>
												<h4>Giá tiền:</h4> <c:set var="total" value="${0}" /> <c:forEach
													items="${sessionScope.cart}" var="map">
												<c:set var="total"
														value="${total + map.value.quantity * map.value.product.price}" />
												</c:forEach>
												<div class="total-result-in">
													<span><fmt:formatNumber value="${total}" type="currency" /></span>
												</div>
											</li>
											<li>
												<h4>Shipping:</h4>
												<div class="total-result-in">
													<span class="text-right">- - - -</span>
												</div>
											</li>
											<li class="divider"></li>
											<li class="total-price">
												<h4>Tổng tiền:</h4>
												<div class="total-result-in">
													<span><fmt:formatNumber value="${total}"
															type="currency" /></span>
												</div>
											</li>
										</ul>									
									</div>

								</div>
							</div>
					</div>
				</form>
				<a class="btn-u btn-u-sea-shop btn-u-lg" style="margin-left: 53%" href="${pageContext.request.contextPath }/member/order">Thanh toán</a>
<%-- 				<form action="<c:url value="/member/order"></c:url>" method="post">
					<button type="submit" class="btn-u btn-u-sea-shop btn-u-lg" style="margin-left: 125px">Thanh toán</button>
				</form> --%>
			</div>
			<!--/end container-->
		</div>
		<!--=== End Content Medium Part ===-->

		<!--=== Footer v4 ===-->
		<jsp:include page="footer.jsp"></jsp:include>
		<!--=== End Footer v4 ===-->
	</div>
	<!--/wrapper-->

	<!-- JS Global Compulsory -->
	<script src="${url}/plugins/jquery/jquery.min.js"></script>
	<script src="${url}/plugins/jquery/jquery-migrate.min.js"></script>
	<script src="${url}/plugins/bootstrap/js/bootstrap.min.js"></script>
	<!-- JS Implementing Plugins -->
	<script src="${url}/plugins/back-to-top.js"></script>
	<script src="${url}/plugins/smoothScroll.js"></script>
	<script src="${url}/plugins/jquery-steps/build/jquery.steps.js"></script>
	<script
		src="${url}/plugins/scrollbar/js/jquery.mCustomScrollbar.concat.min.js"></script>
	<script
		src="${url}/plugins/sky-forms-pro/skyforms/js/jquery.validate.min.js"></script>
	<!-- JS Customization -->
	<script src="${url}/js/custom.js"></script>
	<!-- JS Page Level -->
	<script src="${url}/js/shop.app.js"></script>
	<script src="${url}/js/forms/page_login.js"></script>
	<script src="${url}/js/plugins/stepWizard.js"></script>
	<script src="${url}/js/forms/product-quantity.js"></script>
	<script>
		jQuery(document).ready(function() {
			App.init();
			Login.initLogin();
			App.initScrollBar();
			StepWizard.initStepWizard();
			StyleSwitcher.initStyleSwitcher();
		});
	</script>

	<!--[if lt IE 9]>
    <script src="${url}/plugins/respond.js"></script>
    <script src="${url}/plugins/html5shiv.js"></script>
    <script src="${url}/plugins/sky-forms-pro/skyforms/js/sky-forms-ie8.js"></script>
<![endif]-->
	<!--[if lt IE 10]>
    <script src="${url}/plugins/sky-forms-pro/skyforms/js/jquery.placeholder.min.js"></script>
<![endif]-->

</body>

</body>
</html>