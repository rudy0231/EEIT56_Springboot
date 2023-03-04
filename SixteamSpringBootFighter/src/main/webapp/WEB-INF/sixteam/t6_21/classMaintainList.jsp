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
<link href="../background_index/css/index_backgroundOnly.css"
	rel="stylesheet" />

<link href="../background_index/css/styles.css" rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js"
	crossorigin="anonymous"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
</head>
<style>
.txt {
	width: 200px;
	border: solid 1px #ccc;
	overflow: hidden;
	text-overflow: ellipsis;
	display: -webkit-box;
	-webkit-line-clamp: 3;
	-webkit-box-orient: vertical;
}
</style>
<body class="sb-nav-fixed">
	<div>
		<jsp:include page="/background_index/index-backToMVC.jsp" /></div>

	<div id="layoutSidenav_content" style="margin-left: 250px">
		<main>
			<div class="container-fluid px-4">
				<h1 class="mt-4" style="text-align: center">課程總覽</h1>
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
						<table id="datatablesSimple">
							<thead>
								<tr>
									<th>課程編號</th>
									<th>課程名稱</th>
									<th>課程老師</th>
									<th>課程價錢</th>
									<th>課程圖片</th>
									<!-- 									<th>圖片名字</th> -->
									<th>老師照片</th>
									<!-- 									<th>老師照片名字</th> -->
									<th>課程分類</th>
									<th>課程地址</th>
									<th>課程日期</th>
									<th>人數上限</th>
									<th>報名人數</th>
									<th>課程資訊</th>
									<th>請確認</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="bean" items="${classList}">
									<tr>
										<td>${bean.classId}</td>
										<td>${bean.className}</td>
										<td>${bean.classTeacherName}</td>
										<td>${bean.classPrice}</td>
										<td><img height='100' width='80'
											src="t6_21images1.controller/${bean.classId}"></td>
										<!-- 										<td>${bean.classPictureName}</td> -->
										<td><img height='100' width='80'
											src="t6_21imagesclassteacher.controller/${bean.classId}"></td>
										<!-- 										<td>${bean.classTeacherPictureName}</td> -->
										<td>${bean.classType}</td>
										<td>${bean.classAddress}</td>
										<td>${bean.classDate}</td>
										<td>${bean.classPeople}</td>
										<td>${bean.classApplicant}</td>
										<td><div class="txt">${bean.classInformation}</div></td>
										<td>
											<div style="display: inline">
												<!-- 						<input type="button" class="deleteThisAccount" id="${bean.classId}" value="刪除" /> -->


												<a href="t6_21preupdateClass.controller/${bean.classId}">
													<button class="btn btn-success">
														<i class="fas fa-pen-square"></i>
													</button>
												</a>

												<button id="${bean.classId}"
													class="btn btn-danger deleteThisAccount">
													<i class="fas fa-trash-alt"></i>
												</button>
											</div>
									</tr>

								</c:forEach>
							</tbody>
						</table>
						<div>
							<form action="t6_21insertClass.controller">
								<input type="submit" value="新增紀錄">
							</form>
						</div>
					</div>
				</div>

			</div>
		</main>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="../background_index/js/scripts.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
		crossorigin="anonymous"></script>
	<script src="../background_index/assets/demo/chart-area-demo.js"></script>
	<script src="../background_index/assets/demo/chart-bar-demo.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"
		crossorigin="anonymous"></script>
	<script src="../background_index/js/datatables-simple-demo.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
	<script>
        $(function(){
            $('.deleteThisAccount').click(function(){
			 // 上面那個input標籤的ID屬性
//                   var classId = ('#classId').val(),
                let MyValue=$(this).attr("id");
			 	console.log(MyValue);
                Swal.fire({
                  title: '確定刪除課程?',
                  text: "刪除後將無法復原。",
                  icon: 'warning',
                  //icon:  "success", "error", "warning", "info" or "question" 5種圖示
                  showCancelButton: true,
                  confirmButtonColor: '#007500',
                  cancelButtonColor: '#d33',
                  cancelButtonText: '取消',
                  confirmButtonText: '刪除'
                }).then((result) => {
                    if (result.isConfirmed) {
                        $.ajax({
                         url:'t6_21deleteClass.controller/'+MyValue,
                          method:"get",
                          dataType:"text",
			//這邊的"id"是給controller的變數名
                          data: {"classId":MyValue},
                        })
                            .done(function () {
                                location.reload();
                                console.log("delete")
                             })
                             .fail(function(error) {
                                 console.log(error)
                             })
                    }
                  })
              })
        });
     </script>
</body>
</html>