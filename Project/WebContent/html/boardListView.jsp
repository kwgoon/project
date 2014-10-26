<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="js/jquery-1.11.1.js"></script>
<script type="text/javascript" src="js/jquery-1.10.1.min.js"></script>
<script type="text/javascript" src="source/jquery.fancybox.js?v=2.1.5"></script>
<link rel="stylesheet" type="text/css" href="source/jquery.fancybox.css?v=2.1.5" media="screen" />
<script>
$(document).ready(function(){
	$(".c1").click(function(){
	    $.ajax({
    		url: "controller?action="+$(this).attr("id"),
    		success:function(result){
      			$("#main").html(result);
    		},
    		error:function(xhr){
    			msg('글 목록을 불러올 수 없습니다.');
			}
 		});
	});
	$("#boardWrite").click(function(){
		$(".fancybox").fancybox(  {href : 'html/boardWrite.jsp'} ); 
	});
});
</script>
<table class="t_e">
	<tr>
		<th width="10%">번호</th>
		<th width="40%">제목</th>
		<th width="15%">날짜</th>
		<th width="20%">작성자</th>
		<th width="10%">조회수</th>
	</tr>
	<c:forEach items="${requestScope.allList}" var="board">		
	<tr class="c1" id="boardDetailView&no=${board.no}">
		<td>${board.no}</td>
		<td>${board.title}</td>
		<td>${board.days}</td>
		<td>${board.id}</td>
		<td>${board.count}</td>
	</tr>
	</c:forEach>
	<c:if test="${sessionScope.g=='t'}">
		<tr>
			<td align="center" colspan="5"><button id="boardWrite" class="fancybox fancybox.ajax">등록하기</button></td>
		</tr>
	</c:if>
</table>