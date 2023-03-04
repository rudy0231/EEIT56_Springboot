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


								<c:forEach var="anEntry" items="${ShoppingCart.getContent()}">
									<tr>
										<td class="align-middle" style="float: left;"><img
											src="t6_21images1.controller/${anEntry.value.classNumber}"
											alt="" style="width: 20%; float: left;">
											${anEntry.value.description}</td>

										<td class="align-middle">${anEntry.value.unitPrice}</td>

										<td class="align-middle">
											<div class="input-group quantity mx-auto update"
												style="width: 100px;">


												<!-- 										<div class="input-group-btn" onclick="reducesNum()"> -->
												<!-- 											<button class="btn btn-sm btn-primary btn-minus" name="add" onclick="reducesNum()"> -->
												<!-- 												<i class="fa fa-minus"></i> -->
												<!-- 											</button> -->
												<!-- 										</div> -->
												<input type="number" min="1" max="5"
													class="form-control form-control-sm bg-secondary text-center addtext"
													value="${anEntry.value.quantity}" name="newQty"
													id="${anEntry.value.classNumber}">
												<!-- 											<input type="hidden" name="classId" class="classId" -->
												<!-- 												value="${anEntry.value.classNumber}"> -->

											</div>
										</td>

										<td class="align-middle">${anEntry.value.unitPrice*anEntry.value.quantity}</td>

										<td class="align-middle">
											<button class="btn btn-sm btn-primary deleteClass"
												id="${anEntry.value.classNumber}">
												<i class="fa fa-times"></i>
											</button>
										</td>

									</tr>
								</c:forEach>
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
									<h6 class="font-weight-medium">${ShoppingCart.getSubtotal()}</h6>
								</div>
								<div class="d-flex justify-content-between">
									<h6 class="font-weight-medium">購買課程數量:</h6>
									<h6 class="font-weight-medium">${ShoppingCart.getItemNumber()}</h6>
								</div>
							</div>
							<div class="card-footer border-secondary bg-transparent">
								<div class="d-flex justify-content-between mt-2">
									<h5 class="font-weight-bold">總計:</h5>
									<h5 class="font-weight-bold">${ShoppingCart.getSubtotal()}</h5>
								</div>
								<button class="btn btn-block btn-primary my-3 py-3 checkout">
									<a href="shoppingCartCheckout.controller" style="color: white">Proceed
										To Checkout</a>
								</button>
								<a href="abandonshopping.controller" onClick="return Abort();"
									style="float: right">放棄購物?</a>
							</div>
						</div>
					</div>
				</div>
			</div>


	<jsp:include page="/front_index/index-FrontToButtonMVC.jsp" />
	<script type="text/javascript">
		// 	$('.checkout').on('click', function () {

		// 		$.ajax({
		//             url: '/shoppingCartCheckout.controller',
		//             method: "post",
		//             dataType: "text",
		//             //這邊的"id"是給controller的變數名
		// //             data: { "classId": MyValue },
		//         })

		// 	  });

		function Abort() {
			if (confirm("確定放棄購物 ? ")) {
				return true;
			} else {
				return false;
			}
		}

		//     $('.abandonshopping').on('click', function () {
		//     	var result = confirm('是否確定刪除?');
		//     	if(result == true){
		// //         let MyValue = $(this).attr("id");
		// //         console.log(MyValue);
		//         $.ajax({
		//             url: '/abandonshopping.controller',
		//             method: "get",
		//             dataType: "text",
		//             //這邊的"id"是給controller的變數名
		// //             data: { "classId": MyValue },
		//         }).done(function () {
		//             location.reload();
		//         })}else{
		//         	return;
		//         }
		//     });

		$('.deleteClass').on('click', function() {
			var result = confirm('是否確定刪除?');
			if (result == true) {
				let MyValue = $(this).attr("id");
				console.log(MyValue);
				$.ajax({
					url : '/deleteshoppingitem.controller/' + MyValue,
					method : "get",
					dataType : "text",
					//這邊的"id"是給controller的變數名
					data : {
						"classId" : MyValue
					},
				}).done(function() {
					location.reload();
				})
			} else {
				return;
			}
		});

		$(".addtext").change(function() {
			let MyValue = $(this).attr("id");
			var inputValue = $(this).val();
			console.log(MyValue);
			console.log(inputValue);
			$.ajax({
				url : '/updateshoppingqty.controller/' + MyValue,
				method : "post",
				dataType : "text",
				//這邊的"id"是給controller的變數名
				data : {
					"classId" : MyValue,
					"newQty" : inputValue
				},
			}).done(function() {
				location.reload();
			})

		});
	</script>
</body>
</html>