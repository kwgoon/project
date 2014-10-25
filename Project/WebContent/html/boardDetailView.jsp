<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<script>
var check = false;
$(document).ready(function(){
	$("#replyView").click(function(){
		if(check == false){
		    $.ajax({
	    		url:"controller?action="+$(this).attr("name"),
	    		success:function(result){
	      			$("#reply").html(result);
	      			$("#reply").show();
	      			check = true;
	    		},
	    		error:function(xhr){
	    			msg('댓글 목록을 불러올 수 없습니다.');
				}
	 		});
		}else{
			check = false;
			$("#reply").hide();
		}
	});
	$("#replySubmit").click(function(){
		var contents = document.replyInput.contents.value;
		if(contents != "" && contents != null){
			console.log($("#contents").val());
			$.ajax({
		    	type:"POST",
		    	url:"controller?action=replyInput",
				//data:"contents=" + $("#contents").val() + "&bNo="+$("#bNo").val(),
				data:$("form").serialize(),
	    		success:function(result){
	    			$("#reply").html(result);
	    			document.replyInput.contents.value = "";
	    			msg('댓글 입력 성공');
	    		},
	    		error:function(xhr){
	    			msg('댓글 등록 실패');
				}
	 		});
		}else{
			msg('내용을 입력하세요.');
		}
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
<div style="width: 700px; margin: auto; padding-top: 20px;"><a href="#" id="replyView" name="replyView&bNo=${requestScope.board.no}">댓글</a></div>
<div id="reply"></div>
<br>
<form name="replyInput" method="post"> 
	<input type="hidden" name="bNo" id="bNo" value="${requestScope.board.no}">
	<div align="center" style="margin: 0 auto; vertical-align: middle;">
		<textarea rows="5" style="width: 640px" name="contents" id="contents"></textarea>
		<input id="replySubmit" type="button" value="등록" style="height: 50px;">
	</div>
</form>