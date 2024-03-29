<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<link rel="icon" href="img/favicon.png" type="image/png" />
<title>神明便利店</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/front_index/css/bootstrap.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/front_index/css/flaticon.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/front_index/css/themify-icons.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/front_index/vendors/owl-carousel/owl.carousel.min.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/front_index/vendors/nice-select/css/nice-select.css" />
<!-- main css -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/front_index/css/style.css" />
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
	rel="stylesheet">
<style>
input[type=text] {
	width: 100%;
	box-sizing: border-box;
	border: 2px solid #ccc;
	border-radius: 4px;
	font-size: 16px;
	background-color: white;
	background-image:
		url('https://static.runoob.com/images/mix/searchicon.png');
	background-position: 10px 10px;
	background-repeat: no-repeat;
	padding: 12px 20px 12px 40px;
}
</style>

</head>

<body>
	<!--================ Start Header Menu Area =================-->
	<jsp:include page="/front_index/index-FrontToTopMVC.jsp" />

	<!--================Blog Area =================-->


	<section class="blog_area section_gap">
		<div class="main_title">
			<h2 class="mb-3">神明文章列表</h2>
		</div>
		<div class="container">
			<Form action="<c:url value='../t6_27showFrontforumPage.controller'/>"
				method="GET" name="loginForm">
				<input type="submit" value="回論壇首頁">
			</Form>

			<div class="row">
				<div class="col-lg-8">
					<div class="blog_left_sidebar">
						<!-- 						<div id="data-container"> -->
						<article class="row blog_item">
							<table>
								<c:forEach var="bean" items="${board}">
									<div class="col-md-3">
										<div class="blog_info text-right">
											<ul class="blog_meta list">
												<li><a
													href="/t6_27findFontPostDetail.controller/${bean.postid}">${bean.date}<i
														class="ti-calendar"></i></a></li>
												<li><a
													href="/t6_27findFontPostDetail.controller/${bean.postid}">${bean.board}<i
														class="ti-book"></i></a></li>
												<li><a
													href="/t6_27findFontPostDetail.controller/${bean.postid}">${bean.good}<i
														class="ti-heart"></i></a></li>
											</ul>
										</div>
									</div>
									<div class="col-md-9">
										<div class="blog_post">
											<div class="blog_details">
												<a href="/t6_27findFontPostDetail.controller/${bean.postid}">
													<h2>${bean.title}</h2>
												</a> <img height='120' width='150'
													src="<c:url value='../t6_27img.controller/${bean.postid}' />">
												<p></p>
												<a href="/t6_27findFontPostDetail.controller/${bean.postid}"
													class="blog_btn">閱讀全文 ...</a>
											</div>
											<hr>
										</div>
									</div>
								</c:forEach>
							</table>
						</article>
<!-- 						<nav class="blog-pagination justify-content-center d-flex"> -->

<!-- 							<ul class="pagination"> -->
<%-- 								<c:forEach var="i" begin="1" end="${totalPages}" step="1"> --%>
<%-- 									<li class="page-item"><a class="page-link" href="${i}">${i}</a></li> --%>
<%-- 								</c:forEach> --%>
<!-- 							</ul> -->
<!-- 						</nav> -->

					</div>
				</div>
				<div class="col-lg-4">



					<div id="checklogin_area">
						<form action="<c:url value='../t6_27showFontAddPage.controller'/>">
							<input type="submit" id="loginCheck" name="usersid"
								class="forumpost_btn" value="新增文章">
						</form>
					</div>

					<p></p>
					<div class="blog_right_sidebar">
						<h3 class="widget_title">尋找文章</h3>
						<aside class="single_sidebar_widget search_widget">
							<div class="input-group">
								<form action="../t6_27showboard.controller" method="GET"
									enctype="multipart/form-data">
									<input type="text" class="" placeholder="按下 Enter 送出"
										name="title" required="required"> <input type="hidden"
										name="board">
								</form>
							</div>
							<!-- /input-group -->
							<div class="br"></div>
						</aside>

						<aside class="single_sidebar_widget popular_post_widget">
							<h3 class="widget_title">熱門文章</h3>
							<c:forEach var="bean" items="${hotpostlist}">
								<div class="media post_item">
									<img height='120' width='120'
										src="<c:url value='../t6_27img.controller/${bean.postid}'/>">
									<div class="media-body">
										<a href="../t6_27findFontPostDetail.controller/${bean.postid}">
											<h3>${bean.title}</h3>
										</a>
										<p>${bean.date}</p>
									</div>
								</div>
							</c:forEach>

							<div class="br"></div>
						</aside>

						<aside class="single_sidebar_widget ads_widget">
							<a href="#"><img class="img-fluid" src="img/blog/add.jpg"
								alt=""></a>
						</aside>
						<aside class="single_sidebar_widget post_category_widget">
							<h4 class="widget_title">論壇看板</h4>
							<ul class="list cat-list">
								<li><a href="../t6_27showboard.controller?board=星座運勢"
									title="星座運勢" class="d-flex justify-content-between">
										<p>星座運勢</p>
								</a></li>
								<li><a href="/t6_27showboard.controller?board=紫微斗數"
									title="紫微斗數" class="d-flex justify-content-between">
										<p>紫微斗數</p>
								</a></li>
								<li><a href="/t6_27showboard.controller?board=塔羅愛情"
									title="塔羅愛情" class="d-flex justify-content-between">
										<p>塔羅愛情</p>
								</a></li>
								<li><a href="/t6_27showboard.controller?board=十二生肖"
									title="十二生肖" class="d-flex justify-content-between">
										<p>十二生肖</p>
								</a></li>
								<li><a href="/t6_27showboard.controller?board=九星命卦"
									title="九星命卦" class="d-flex justify-content-between">
										<p>九星命卦</p>
								</a></li>
								<li><a href="/t6_27showboard.controller?board=心理測驗"
									title="心理測驗" class="d-flex justify-content-between">
										<p>心理測驗</p>
								</a></li>
							</ul>
							<div class="br"></div>
						</aside>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--================Blog Area =================-->

	<!--================ Start footer Area  =================-->
	<footer class="footer-area section_gap">
		<div class="container">
			<div class="row">
				<div class="col-lg-2 col-md-6 single-footer-widget">
					<h4>Top Products</h4>
					<ul>
						<li><a href="#">Managed Website</a></li>
						<li><a href="#">Manage Reputation</a></li>
						<li><a href="#">Power Tools</a></li>
						<li><a href="#">Marketing Service</a></li>
					</ul>
				</div>
				<div class="col-lg-2 col-md-6 single-footer-widget">
					<h4>Quick Links</h4>
					<ul>
						<li><a href="#">Jobs</a></li>
						<li><a href="#">Brand Assets</a></li>
						<li><a href="#">Investor Relations</a></li>
						<li><a href="#">Terms of Service</a></li>
					</ul>
				</div>
				<div class="col-lg-2 col-md-6 single-footer-widget">
					<h4>Features</h4>
					<ul>
						<li><a href="#">Jobs</a></li>
						<li><a href="#">Brand Assets</a></li>
						<li><a href="#">Investor Relations</a></li>
						<li><a href="#">Terms of Service</a></li>
					</ul>
				</div>
				<div class="col-lg-2 col-md-6 single-footer-widget">
					<h4>Resources</h4>
					<ul>
						<li><a href="#">Guides</a></li>
						<li><a href="#">Research</a></li>
						<li><a href="#">Experts</a></li>
						<li><a href="#">Agencies</a></li>
					</ul>
				</div>
				<div class="col-lg-4 col-md-6 single-footer-widget">
					<h4>Newsletter</h4>
					<p>You can trust us. we only send promo offers,</p>
					<div class="form-wrap" id="mc_embed_signup">
						<form target="_blank"
							action="https://spondonit.us12.list-manage.com/subscribe/post?u=1462626880ade1ac87bd9c93a&amp;id=92a4423d01"
							method="get" class="form-inline">
							<input class="form-control" name="EMAIL"
								placeholder="Your Email Address" onfocus="this.placeholder = ''"
								onblur="this.placeholder = 'Your Email Address'" required=""
								type="email" />
							<button class="click-btn btn btn-default">
								<span>subscribe</span>
							</button>
							<div style="position: absolute; left: -5000px;">
								<input name="b_36c4fd991d266f23781ded980_aefe40901a"
									tabindex="-1" value="" type="text" />
							</div>

							<div class="info"></div>
						</form>
					</div>
				</div>
			</div>
			<div class="row footer-bottom d-flex justify-content-between">
				<p class="col-lg-8 col-sm-12 footer-text m-0 text-white">
					<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
					Copyright &copy;
					<script>
						document.write(new Date().getFullYear());
					</script>
					All rights reserved | This template is made with <i
						class="ti-heart" aria-hidden="true"></i> by <a
						href="https://colorlib.com" target="_blank">Colorlib</a>
					<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
				</p>
				<div class="col-lg-4 col-sm-12 footer-social">
					<a href="#"><i class="ti-facebook"></i></a> <a href="#"><i
						class="ti-twitter"></i></a> <a href="#"><i class="ti-dribbble"></i></a>
					<a href="#"><i class="ti-linkedin"></i></a>
				</div>
			</div>
		</div>
	</footer>
	<!--================ End footer Area  =================-->

	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="front_index/js/jquery-3.2.1.min.js"></script>
	<script src="front_index/js/popper.js"></script>
	<script src="front_index/js/bootstrap.min.js"></script>
	<script
		src="front_index/vendors/nice-select/js/jquery.nice-select.min.js"></script>
	<script src="front_index/vendors/owl-carousel/owl.carousel.min.js"></script>
	<script src="front_index/js/owl-carousel-thumb.min.js"></script>
	<script src="front_index/js/jquery.ajaxchimp.min.js"></script>
	<script src="front_index/js/mail-script.js"></script>
	<!--gmaps Js-->
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCjCGmQ0Uq4exrzdcL6rvxywDDOvfAu6eE"></script>
	<script src="front_index/js/gmaps.min.js"></script>
	<script src="front_index/js/theme.js"></script>

	<!--檢查是否登入會員-->
	<script>
		var check = '${LoginOK}'
		if (check != '') {
		} else {
			$('#loginCheck').hide();
			$('#checklogin_area')
					.append(
							'<a href="/login" style="font-size: 18px; font-weight: bold">請施主先登入會員後，再新增文章</a>');

		}
	</script>

	<!-- 
	<script>
	// 	分頁功能
	
		// 全部数据
		var allData = [];

		// 当前页的数据
		var currentPageData = [];

		// 分页大小
		var pageSize = 10;

		// 当前页数
		var currentPage = 1;

		// 创建分页控件
		function createPagination() {
			var pagination = $('#pagination-container');
			pagination.empty();
			var pageCount = Math.ceil(allData.length / pageSize);
			for (var i = 1; i <= pageCount; i++) {
				var html = '<a href="#" onclick="showData(' + i + ')">' + i
						+ '</a>';
				pagination.append(html);
			}
		}

		// 显示数据
		function showData(page) {
			currentPage = page;
			currentPageData = allData.slice((page - 1) * pageSize, page
					* pageSize);
			var container = $('#data-container');
			container.empty();
			for (var i = 0; i < currentPageData.length; i++) {
				var html = '<div>' + currentPageData[i].content + '</div>';
				container.append(html);
			}
		}

		// 初始化
		function init() {
			// 获取所有数据
			$.ajax({
				type : 'GET',
				url : '/t6_27showboard.controller?board='+encodeURIComponent('星座運勢'),
				dataType : 'json',
				success : function(data) {
					allData = data;
					createPagination();
					showData(currentPage);
				},
				error : function() {
					console.log('获取数据失败！');
				}
			});
		}

		$(document).ready(function() {
			init();
		});
	</script>
-->

</body>
</html>