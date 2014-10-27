<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="css/style.css" />
<script src="js/jquery-1.11.1.js"></script>
<script src="js/httpRequest.js"></script>
<script>
$(document).ready(function(){
	$(".submenuLink").click(function(){
	    $.ajax({
    		url: "controller?action="+$(this).attr("name"),
    		success:function(result){
      			$("#main").html(result);
      		},
    		error:function(xhr){
    			alert("error 발생시 호출되는 블록");
			}
 		});
	});
	$(".menuLink").click(function(){
	    $.ajax({
    		url: "controller?action="+$(this).attr("name"),
    		success:function(result){
      			$("#main").html(result);
      		},
    		error:function(xhr){
    			alert("error 발생시 호출되는 블록");
			}
 		});
	});
	$("#galleryView").click(function(){
	    $.ajax({
    		url: "controller?action=galleryView",
    		success:function(result){
      			$("#main").html(result);
      		},
    		error:function(xhr){
    			alert("error 발생시 호출되는 블록");
			}
 		});
	});
	$("#classView").click(function(){
	    $.ajax({
    		url: "controller?action=classView",
    		success:function(result){
      			$("#main").html(result);
      		},
    		error:function(xhr){
    			alert("error 발생시 호출되는 블록");
			}
 		});
	});
});
</script>
<title>Menu</title>
</head>
<body>
<center>
<nav id="topMenu">
    <ul>
        <li class="topMenuLi">
            <a class="menuLink">MENU1</a>
            <ul class="submenu">
				<li><a href="#" class="submenuLink" name="boardListView" id="click">board</a></li>
            </ul>
        </li>
        <li class="topMenuLi">
            <a class="menuLink">MENU2</a>
            <ul class="submenu">
                <li><a href="#" id="galleryView" class="submenuLink">gallery</a></li>
                <li><a href="#" id="classView" class="submenuLink">class</a></li>
            </ul>
        </li>
    </ul>
	<div class="topMenuLiLogin">
	<c:choose>
		<c:when test="${empty sessionScope.id}">
		<ul>
			<li><a href="#" class="menuLink" name="loginView">로그인</a>
			<ul class="submenu">
				<li><a class="submenuLink" id="click">로그인</a></li>
				<li><a class="submenuLink" id="click">회원가입</a></li>
			</ul>
			</li>
		</ul>
		</c:when>
		<c:otherwise>
			<a class="menuLink" href="controller?action=logout" name="logout">로그아웃</a>
		</c:otherwise>
	</c:choose>
	</div>
</nav>
</center>
</body>
</html>