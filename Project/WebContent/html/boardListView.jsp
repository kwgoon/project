<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="js/jquery-1.11.1.js"></script>
<script>
$(document).ready(function(){
	$("tr").click(function(){
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
</table>