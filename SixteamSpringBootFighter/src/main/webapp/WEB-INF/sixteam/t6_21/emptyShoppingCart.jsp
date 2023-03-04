<%@page import="sixteam.t6_21.model.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/front_index/css/bootstrap.css" />
<link rel="stylesheet" href="/front_index/css/flaticon.css" />
<link rel="stylesheet" href="/front_index/css/themify-icons.css" />
<link rel="stylesheet"
	href="/front_index/vendors/owl-carousel/owl.carousel.min.css" />
<link rel="stylesheet"
	href="/front_index/vendors/nice-select/css/nice-select.css" />
<!-- main css -->
<link rel="stylesheet" href="/front_index/css/style.css" />

</head>
<body>

	<jsp:include page="/front_index/index-FrontToTopMVC.jsp" />






			<div class="container-fluid pt-5" style="color: #002347">
				<div class="row px-xl-5">
					<div class="col-lg-8 table-responsive mb-5">
						<table class="table table-bordered text-center mb-0">
							<thead class="bg-secondary text-dark">
								<tr>
									<th>導師+課程名稱</th>
									<th>單價</th>
									<th>數量</th>
									<th>價格</th>
									<th>移除?</th>
								</tr>
							</thead>
							<tbody class="align-middle">
							

							</tbody>
						</table>
					</div>
					<div class="col-lg-4">
						<!-- 				<form class="mb-5" action=""> -->
						<!-- 					<div class="input-group"> -->
						<!-- 						<input type="text" class="form-control p-4" -->
						<!-- 							placeholder="Coupon Code"> -->
						<!-- 						<div class="input-group-append"> -->
						<!-- 							<button class="btn btn-primary">Apply Coupon</button> -->
						<!-- 						</div> -->
						<!-- 					</div> -->
						<!-- 				</form> -->
						<div class="card border-secondary mb-5">
							<div class="card-header bg-secondary border-0">
								<h4 class="font-weight-semi-bold m-0">購物車總覽</h4>
							</div>
							<div class="card-body">
								<div class="d-flex justify-content-between mb-3 pt-1">
									<h6 class="font-weight-medium">Subtotal</h6>
									<h6 class="font-weight-medium"></h6>
								</div>
								<div class="d-flex justify-content-between">
									<h6 class="font-weight-medium">購買課程數量:</h6>
									<h6 class="font-weight-medium"></h6>
								</div>
							</div>
							<div class="card-footer border-secondary bg-transparent">
								<div class="d-flex justify-content-between mt-2">
									<h5 class="font-weight-bold">總計:</h5>
									<h5 class="font-weight-bold"></h5>
								</div>
								<button class="btn btn-block btn-primary my-3 py-3 checkout">
									<a href="" style="color: white">Proceed
										To Checkout</a>
								</button>
							</div>
						</div>
					</div>
				</div>
			</div>


	<jsp:include page="/front_index/index-FrontToButtonMVC.jsp" />

</body>
</html>