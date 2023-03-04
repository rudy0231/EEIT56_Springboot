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
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">


</head>
<body>

	<div style="position: relative"><jsp:include page="/front_index/index-FrontToTopMVC.jsp" /></div>
	
	<!--================ Start Course Details Area =================-->
	<div class="popular_courses" style="margin: 50px">
		<div class="container">

			<div class="row justify-content-center">
				<div class="col-lg-5">
					<div class="main_title">
						<h2 class="mb-3">為您準備幾堂不錯的課程</h2>
						<p>集結各領域老師開班授課!</p>
					</div>
				</div>
			</div>


			<!-- single course -->
			<div class="col-lg-12">
				<div class="owl-carousel active_course">
					<c:forEach var="bean" items="${classList}">
						<div class="col-lg-12">
							<div class="single_course">
								<div class="course_head">
									<img class="img-fluid"
										src="t6_21images1.controller/${bean.classId}" alt="" />
								</div>
								<div class="course_content">

									<span class="price">${bean.classPrice}</span> <span
										class="tag mb-4 d-inline-block">${bean.classType}</span>
									<h4 class="mb-3">
										<a href="showClassDetail.controller/${bean.classId}">${bean.className}</a>
									</h4>
									<p>授課老師:${bean.classTeacherName}</p>
									<p>開課時間:${bean.classDate}</p>
									<div style="margin-top: 10px">
									<a style="float:left" href="showClassDetail.controller/${bean.classId}">課程細節</a>
									
									<button style="float:right" id="${bean.classId}" class="btn btn-sm text-dark p-0 addtocart">
									<i class="fas fa-shopping-cart text-primary mr-1"></i>
									加入購物車
									</button>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>

		</div>
	</div>
	<!--================ End Course Details Area =================-->
	<jsp:include page="/front_index/index-FrontToButtonMVC.jsp" />
	<script type="text/javascript">
    $('.addtocart').on('click', function () {
        let MyValue = $(this).attr("id");
        console.log(MyValue);
        $.ajax({
            url: '/onlyaddoneclassToCart.controller/' + MyValue,
            method: "get",
            dataType: "text",
            //這邊的"id"是給controller的變數名
            data: { "classId": MyValue },
        }).done(function () {
//         	alert("成功")
            location.reload();
        }).fail(function () {
//         	alert("失敗")
        	location.reload();
        })
    });
	</script>

</body>
</html>