<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>後臺管理系統</title>
<link
	href="${pageContext.request.contextPath}/background_index/css/index_backgroundOnly.css"
	rel="stylesheet" />

<link
	href="${pageContext.request.contextPath}/background_index/css/styles.css"
	rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js"
	crossorigin="anonymous"></script>
<!--    icon -->
<script src="https://kit.fontawesome.com/8bf3b6e829.js"
	crossorigin="anonymous"></script>
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
	rel="stylesheet">

<!-- 	測試sweetalert -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue@2.x"></script>

<style type="text/css">
.scrollable {
	height: 100px;
	width: 200px;
	overflow: auto;
}
</style>
</head>

<body class="sb-nav-fixed">
	<div>
		<jsp:include page="/background_index/index-backToMVC.jsp" /></div>

	<div id="layoutSidenav_content" style="margin-left: 250px">
		<main>
			<div class="container-fluid px-4">
				<h1 class="mt-4" style="text-align: center">討論區</h1>
				<ol class="breadcrumb mb-4">
					<!--                             <li class="breadcrumb-item"><a href="index.html">Dashboard</a></li> -->
					<!--                             <li class="breadcrumb-item active">Tables</li> -->
				</ol>
				<!--                         <div class="card mb-4"> -->
				<!--                             <div class="card-body"> -->
				<!--                                 DataTables is a third party plugin that is used to generate the demo table below. For more information about DataTables, please visit the -->
				<!--                                 <a target="_blank" href="https://datatables.net/">official DataTables documentation</a> -->
				<!--                                 . -->
				<!--                             </div> -->
				<!--                         </div> -->
				<div class="card mb-4">
					<div class="card-header">
						<i class="fas fa-table me-1"></i>
						<!--                                 DataTable Example -->
					</div>
					<div class="card-body">
						<form action="t6_27addPage.controller">
							<input type="submit" value="新增文章">
						</form>
						<table id="datatablesSimple">
							<thead>
								<tr>
									<th>使用者編號</th>
									<th>文章編號</th>
									<th>文章日期</th>
									<th>看板</th>
									<th>標題</th>
									<th>推</th>
									<th>噓</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="bean" items="${postlist}">
									<tr>
										<td>${bean.usersid}</td>
										<td>${bean.postid}</td>
										<td>${bean.date}</td>
										<td>${bean.board}</td>
										<td>
											<div class="scrollable">
												<a
													href="/t6_27findCommentByPostId.controller/${bean.postid}">
													${bean.title} </a>
											</div>
										</td>
										<td>${bean.good}</td>
										<td>${bean.bad}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</main>
	</div>




	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script
		src="${pageContext.request.contextPath}/background_index/js/scripts.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
		crossorigin="anonymous"></script>
	<script
		src="${pageContext.request.contextPath}/background_index/assets/demo/chart-area-demo.js"></script>
	<script
		src="${pageContext.request.contextPath}/background_index/assets/demo/chart-bar-demo.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"
		crossorigin="anonymous"></script>
	<script
		src="${pageContext.request.contextPath}/background_index/js/datatables-simple-demo.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>


</body>
</html>