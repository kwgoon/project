<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("UTF-8"); %>
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
			$.ajax({
		    	type:"POST",
		    	url:"controller?action=replyInput",
				//data:"contents=" + $("#contents").val() + "&bNo="+$("#bNo").val(),
				data:$("#replyInput").serialize(),
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
	$(".boardUpdate").click(function(){
		if($(this).val()=="수정"){
			$(this).val("확인");
			$(".titletd").html("<input type='text' id='title' name='title' value='${requestScope.board.title}'>");
			$("#contents").removeAttr("readonly");
		}else{
			$(this).val("수정");
			$.ajax({
	    		url: "controller?action=boardUpdate",
	    		data: $("#detailBoard").serialize(),
	    		success:function(result){
	      			$(".titletd").text($("#title").val());
	      			$("#contents").attr("readonly","readonly");
	    			msg('게시글 수정 성공');
	    		},
	    		error:function(xhr){
				}
	 		});
		}
	});
	$(".boardDelete").click(function(){
	    $.ajax({
	    	type:"POST",
    		url: "controller?action="+$(this).attr("name"),
    		data: "no="+document.detailBoard.no.value,
    		success:function(result){
      			//$("#main").html(result);
      			console.log(result);
    			msg('게시글 삭제 성공');
    		},
    		error:function(xhr){
			}
 		});
	});
});
</script>
<form name="detailBoard" id="detailBoard">
<table class="t_e">
	<tr>
		<td>
			<table class="t_e">
				<tr>
					<td align="center">제목</td>
					<td class="titletd">${requestScope.board.title}</td>
				</tr>
				<tr height="1" bgcolor="#82B5DF">
					<td colspan="4"><input type="hidden" name="no" value="${requestScope.board.no}"><input type="hidden" name="type" value="${requestScope.board.type}"></td>
				</tr>
				<tr>
					<td align="right" colspan="2">${requestScope.board.days} ${requestScope.board.id} 조회수:${requestScope.board.count}</td>
				</tr>
				<tr height="1" bgcolor="#82B5DF">
					<td colspan="4"></td>
				</tr>
				<tr>
					<td align="center">내용</td>
					<td><textarea name="contents" id="contents" cols="50" rows="13" readonly="readonly">${requestScope.board.contents}</textarea></td>
				</tr>
				<tr height="1" bgcolor="#82B5DF">
					<td colspan="4"></td>
				</tr>
				<c:if test="${sessionScope.id == requestScope.board.id}">
					<tr align="center">
						<td colspan="2">
							<input type="button" class="boardUpdate" name="boardUpdate" value="수정">
							<button class="boardDelete" name="boardDelete">삭제</button>
						</td>
					</tr>
				</c:if>
			</table>
		</td>
	</tr>
</table>
</form>
<div style="width: 700px; margin: auto; padding-top: 20px;"><a href="#" id="replyView" name="replyView&bNo=${requestScope.board.no}">댓글</a></div>
<div id="reply"></div>
<br>
<form id="replyInput" name="replyInput" method="post"> 
	<input type="hidden" name="bNo" id="bNo" value="${requestScope.board.no}">
	<div align="center" style="margin: 0 auto; vertical-align: middle;">
		<textarea rows="5" style="width: 640px" name="contents" id="contents"></textarea>
		<input id="replySubmit" type="button" value="등록" style="height: 50px;">
	</div>
</form>