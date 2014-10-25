<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<script src="js/httpRequest.js"></script>
<script>
$(document).ready(function(){
	$("#replyView").click(function(){
	    $.ajax({
    		url: "controller?action="+$(this).attr("name"),
    		success:function(result){
      			$("#reply").html(result);
    		},
    		error:function(xhr){
    			alert("댓글 목록을 불러올 수 없습니다.");
			}
 		});
	});
});
</script>

<table class="t_e">
	<tr>
		<td>${requestScope.board.title}</td>
	<tr>
		<td align="right">${requestScope.board.days} ${requestScope.board.id} 조회수:${requestScope.board.count}</td>
	</tr>
	<tr>
		<td>${requestScope.board.contents}</td>
	</tr>
</table>
<a href="#" id="replyView" name="replyView&bNo=${requestScope.board.no}">댓글</a>
<div id="reply"></div>