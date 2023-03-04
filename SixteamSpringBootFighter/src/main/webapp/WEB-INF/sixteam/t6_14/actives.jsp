<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.util.List"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="en">

<head>
		<jsp:include page="${pageContext.request.contextPath}/front_index/index-FrontToTopMVC.jsp" />

    <meta charset="utf-8">
    <title>活動頁面</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

<!-- 手寫 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
   
</head>

<body>

<div class="container">
<hr>
<div>${act.activeDescription}</div> 

<a  id="signUpLink" href="/EventRegist/${act.activeID}">
													<button id="signUpButton" class="btn btn-success">
														我要報名</i>
													</button>
												</a><hr>
												
       </div> 
   
   <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script type="text/javascript">
axios.get("/EventRegist/checkSignUp/" + ${act.activeID})
.then(function (response) {
 let isSignUpAllowed = response.data;
    console.log(isSignUpAllowed)
  if (isSignUpAllowed) {
    document.getElementById("signUpButton").style.backgroundColor = "green";
    document.getElementById("signUpButton").disabled = false;
    document.getElementById("signUpLink").href = "/EventRegist/${act.activeID}";
  } else {
    document.getElementById("signUpButton").style.backgroundColor = "grey";
    document.getElementById("signUpButton").disabled = true;
    document.getElementById("signUpLink").removeAttribute("href");
  }
});
</script>
   
   
   
</body>

</html>
		<jsp:include page="/front_index/index-FrontToButtonMVC.jsp" />
