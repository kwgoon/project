<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="js/jquery-1.11.1.js"></script>
<script>
$(document).ready(function(){
	$("button").click(function(){
		$(this).parent().parent().remove();
		$.ajax({
    		url: "controller?action=replyDel&no="+$(this).attr("name"),
    		success:function(result){
    			msg('댓글 삭제 성공');
      		},
    		error:function(xhr){
    			msg('댓글 삭제 실패');
			}
 		});
	});
});
</script>
<div class="replyAll">
<c:forEach items="${requestScope.allList}" var="reply">
	<div class="reply" style="width: 700px; margin: auto;"><div style="text-align: right;">${reply.days} <b>${reply.id}</b>
	<c:if test="${reply.id == sessionScope.id}">
		<button name="${reply.no}">삭제</button>
	</c:if>
	</div>
	<textarea rows="5" style="width: 700px;" name="contents" readonly="readonly">${reply.contents}</textarea><br></div>
</c:forEach>
</div>