<%@page import="sixteam.t6_21.model.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../front_index/css/bootstrap.css" />
<link rel="stylesheet" href="../front_index/css/flaticon.css" />
<link rel="stylesheet" href="../front_index/css/themify-icons.css" />
<link rel="stylesheet"
	href="../front_index/vendors/owl-carousel/owl.carousel.min.css" />
<link rel="stylesheet"
	href="../front_index/vendors/nice-select/css/nice-select.css" />
<!-- main css -->
<link rel="stylesheet" href="../front_index/css/style.css" />
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>


</head>
<body>

	<jsp:include page="/front_index/index-FrontToTopMVC.jsp" />

	<!--================ Start Course Details Area =================-->
	<section class="course_details_area section_gap">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 course_details_left">
					<div class="main_image">
						<img class="img-fluid" height='80' width='650'
							src="<c:url value='/t6_21images1.controller/${bean.classId}'/>"
							alt="">
					</div>
					<div class="content_wrapper">
						<h4 class="title">師資介紹</h4>
						<div class="content">
							<img class="img-fluid" height='100' width='200'
								src="/t6_21imagesclassteacher.controller/${bean.classId}" alt="">
						</div>


						<!-- 						<h4 class="title">${bean.className}</h4> -->
						<!-- 						<div class="content"> -->
						<!-- 							When you enter into any new area of science, you almost always -->
						<!-- 							find yourself with a baffling new language of technical terms to -->
						<!-- 							learn before you can converse with the experts. This is certainly -->
						<!-- 							true in astronomy both in terms of terms that refer to the cosmos -->
						<!-- 							and terms that describe the tools of the trade, the most -->
						<!-- 							prevalent being the telescope. <br> <br> Lorem ipsum -->
						<!-- 							dolor sit amet, consectetur adipisicing elit, sed do eiusmod -->
						<!-- 							tempor incididunt ut labore et dolore magna aliqua. Ut enim ad -->

						<!-- 						</div> -->

						<h4 class="title">課程資訊</h4>

						<div class="content">${bean.classInformation}</div>


					</div>
				</div>


				<div class="col-lg-4 right-contents">
					<ul>
						<li><a class="justify-content-between d-flex" href="#">
								<p>授課老師:</p> <span class="or">${bean.classTeacherName}</span>
						</a></li>
						<li><a class="justify-content-between d-flex" href="#">
								<p>課程價錢:</p> <span>${bean.classPrice}</span>
						</a></li>
						<li><a class="justify-content-between d-flex" href="#">
								<p>課程人數:</p> <span>${bean.classPeople}</span>
						</a></li>
						<li><a class="justify-content-between d-flex" href="#">
								<p>課程時間:</p> <span>${bean.classDate}</span>
						</a></li>


						<form action="<c:url value='/addToCart.controller'/>"
							method="post">
							<li><a class="justify-content-between d-flex">
									<p>購買數量:</p> <span> <input type="number" min="0" max="5"
										name="qty" id="qty" value="${qty}" required> <Input
										type='hidden' name='classId' id="classId"
										value='${bean.classId}'>
								</span>
							</a></li> <input type="submit" id="addtocart"
								class="primary-btn2 text-uppercase enroll rounded-0 text-white addtocart"
								value='加入購物車'>

						</form>
					</ul>

					<!-- 這些隱藏欄位都會送到後端 -->

				</div>
			</div>
		</div>
	</section>
	<!--================ End Course Details Area =================-->
	<jsp:include page="/front_index/index-FrontToButtonMVC.jsp" />
	<script type="text/javascript">
		//     $('#addtocart').on('click', function () {
		//         alert('hello');
		//         var qty = document.getElementById("qty").value;
		//         var classid = document.getElementById("classId").value;
		//         console.log(qty);
		//         console.log(classid);

		//         $.ajax({
		//             url: '/addToCart.controller',
		//             method: "post",
		//             dataType: "text",
		//             //這邊的"id"是給controller的變數名
		//             data: { "classId": classid, "qty": qty },
		//         }).done(function () {
		//             location.reload();
		//         }
		//         ).fail(function () {
		//             return;
		//         })
		//     }

		//     );

		//    $('#addtocart').on('click', function validateForm() {
		// 	 var qty = document.getElementById("qty").value
		// 	 console.log(qty)
		//        if(qty == ''){
		// //     	   alert('請輸入數量!')
		//     	   return false;
		//        }else if(qty == 0){
		//     	   alert('請輸入數量!')
		//     	   return false;
		//        }else{
		//     	   return true;
		//        }

		//     });

		//  $(document).ready(function(){
		//     $("#addtocart").click(function(){
		//         if($("#qty").val()==""){
		//             alert("你尚未填寫姓名");
		//             eval("document.form1['name'].focus()");       
		//         }else if($("#qty").val()= 0){
		//             alert("你尚未填寫姓名");
		//             eval("document.form1['name'].focus()");       
		//         }
		//     })
		//  })
	</script>

</body>
</html>