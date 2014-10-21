<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" type="text/css" href="css/style.css" />
<script src="js/jquery-1.11.1.js"></script>
<title>Menu</title>
</head>
<body>
<center>
<nav id="topMenu">
    <ul>
        <li class="topMenuLi">
            <a class="menuLink" href="http://unikys.tistory.com/category/Programming%20Lecture">MENU1</a>
            <ul class="submenu">
               	<li><a href="controller?action=about" class="submenuLink">menu1</a></li>
                <li><a href="controller?action=about" class="submenuLink">menu2</a></li>
            </ul>
        </li>
        <li class="topMenuLi">
            <a class="menuLink" href="http://unikys.tistory.com/tag">MENU2</a>
            <ul class="submenu">
                <li><a href="http://unikys.tistory.com/tag/%EA%B0%95%EC%A2%8C" class="submenuLink">menu1</a></li>
                <li><a href="http://unikys.tistory.com/tag/K100D" class="submenuLink">menu2</a></li>
            </ul>
        </li>
    </ul>
</nav>
</center>
</body>
</html>