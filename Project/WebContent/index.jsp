<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" type="text/css" href="css/style.css" />
<link rel="stylesheet" type="text/css" href="css/table.css" />
<link rel="stylesheet" type="text/css" href="css/result.css" />
<script src="js/jquery-1.11.1.js"></script>
<title>Project</title>
</head>
<body>
<script>
function readying(){
	alert("준비중입니다.");
}
function msg(str){
	$("#topMenu").append("<div class='result'>"+str+"</div>");
		$(".result").animate({opacity:100},'slow').fadeIn('slow',function (){ 
		setTimeout("$('.result').remove()", 3000);});
} 
</script>
	<div id="container">
		<div id="header"><jsp:include page="menu.jsp"/></div>
		<div id="content"><jsp:include page="content.jsp"/></div>
		<div id="main"><jsp:include page="main.jsp"/></div>
	</div>
</body>
</html>