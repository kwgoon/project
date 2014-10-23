<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="css/style.css" />
<script src="js/jquery-1.11.1.js"></script>
<script src="js/httpRequest.js"></script>
<script>
function viewSubmenu(view){
	
}
</script>
<title>Menu</title>
</head>
<body>
<center>
<nav id="topMenu">
    <ul>
        <li class="topMenuLi">
            <a class="menuLink" href="http://unikys.tistory.com/category/Programming%20Lecture">MENU1</a>
            <ul class="submenu">
				<li><a href="viewSubmenu('board')" class="submenuLink">board</a></li>
				<li><a href="controller?action=about" class="submenuLink">menu2</a></li>
            </ul>
        </li>
        <li class="topMenuLi">
            <a class="menuLink" href="http://unikys.tistory.com/tag">MENU2</a>
            <ul class="submenu">
                <li><a href="http://unikys.tistory.com/tag/%EA%B0%95%EC%A2%8C" class="submenuLink">menu1</a></li>
            </ul>
        </li>
        
        <li class="topMenuLiLogin">
            <a class="menuLink" href="<%=request.getContextPath()%>/controller?action=loginView">로그인</a>
            <ul class="submenu">
                <li><a href="http://unikys.tistory.com/tag/%EA%B0%95%EC%A2%8C" class="submenuLink">로그인</a></li>
                <li><a href="http://unikys.tistory.com/tag/%EA%B0%95%EC%A2%8C" class="submenuLink">회원가입</a></li>
            </ul>
        </li>
    </ul>
</nav>
</center>
</body>
</html>