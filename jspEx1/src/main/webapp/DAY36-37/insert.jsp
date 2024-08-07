<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	String boardNo = (request.getParameter("boardNo")!=null)?request.getParameter("boardNo"):"";
	String title = (request.getParameter("title")!=null)?request.getParameter("title"):"";
	String content= (request.getParameter("content")!=null)?request.getParameter("content"):"";
	%>
	<form action="insert-result.jsp" method="get" name="mkBoard">
		<input type="hidden" name="boardNo" value=<%=boardNo%>>
	
		<div>
			<label>제목: <input type="text" name="title" value='<%=title%>'></label>
		</div>
		<div>
			<label>내용: <textarea rows="10" cols="50" name="content"><%=content%></textarea></label>
		</div>
		<!-- <input type="button" value="저장" onclick="checkSubmit()"> -->
		<button type="button" onclick="checkSubmit()">저장</button>
	</form>
</body>
</html>
<script>
	function checkSubmit(){
		const form = document.mkBoard;

		if(<%=request.getParameter("boardNo")==null%>){
			if(form.title.value ==='' || form.title.value === undefined){
				alert('제목을 입력해주세요');
				form.title.focus();
				return;
			} else if(form.content.value === '' || form.title.value === undefined){
				alert('내용을 입력해주세요');
				form.content.focus();
				return;
			}
			alert('저장되었습니다')
			form.submit();	
		} else{
			form.action = "board-update.jsp"
			form.submit()
		}
	}
</script>