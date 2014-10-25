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
    			msg('�� ����� �ҷ��� �� �����ϴ�.');
			}
 		});
	});
});
</script>
<table class="t_e">
	<tr>
		<th width="10%">��ȣ</th>
		<th width="40%">����</th>
		<th width="15%">��¥</th>
		<th width="20%">�ۼ���</th>
		<th width="10%">��ȸ��</th>
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