<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script src="js/jquery-1.11.1.js"></script>
<script>
$(document).ready(function(){
	$(".dropdown").hover(
		function(){
			$(this).addClass("open");
			$(this).children().children().show();
			$(this).css({"background-color":"white"});
			//$(this).children().children().css({"display":"display"});
			//$("img:first", $(this)).attr("src", $("img:first", $(this)).attr("src").replace("_off", "_on")); 
			//$("#main_sub_menu"+$(this).attr("data-no")).show();
		},
		function(){
			$(this).removeClass("open");
			$(this).children().children().hide();
			$(this).css("background-color","#526bbe");
			//$("img:first", $(this)).attr("src", $("img:first", $(this)).attr("src").replace("_on", "_off")); 
			//$("#main_sub_menu"+$(this).attr("data-no")).hide();
		}	
	);
});
</script>
<title>Menu</title>
</head>
<body>
<center>
	<div class="nav">
		<ul>
			<li class="dropdown">
				<a href="controller?action=about">about</a>
				<ul class="dropdown-menu">
					<li><a href="controller?action=about">about</a></li>
					<li><a href="controller?action=about">등등</a></li>
				</ul>
			</li>
			<li class="dropdown">
				<a href="controller?action=about">메뉴2</a>
				<ul class="dropdown-menu">
					<li><a href="controller?action=about">세부메뉴1</a></li>
					<li><a href="controller?action=about">세부메뉴2</a></li>
				</ul>
			</li>
		</ul>
	</div>
</center>
</body>
</html>