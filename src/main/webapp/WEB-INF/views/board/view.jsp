<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!--BS 4 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<title>Insert title here</title>

<style>
.container{
margin-top:50px;
margin-bottom:50px
}
textarea{
width:100%;
border:1px solid #ccc
}
a{
color:#fff
}
</style>
</head>
<body>

<div class="container">
	<h2>글보기</h2>
		<!-- 번호 -->
		<div class="mb-3">
			<label for="no" class="form-label">no</label> 
			<input type="text" class="form-control" name="no" value='<c:out value="${vo.no}"/>' readonly />
		</div>
		<!-- 제목 -->
		<div class="mb-3">
			<label for="title" class="form-label">title</label> 
			<input type="text" class="form-control" name="title" value='<c:out value="${vo.title}"/>' readonly/>
		</div>
		<!-- 작성자 -->
		<div class="mb-3">
			<label for="writer" class="form-label">writer</label> 
			<input type="text" class="form-control" name="writer" value='<c:out value="${vo.writer}"/>' readonly/>
		</div>
		<!-- 내용 -->
		<div class="mb-3">
			<label for="content" class="form-label">content</label> 
<textarea class="form-control" name="content" row="10" readonly>
<c:out value="${vo.content}"/>
</textarea>
		</div>
		
		<form id='actionForm' action="/test/board/list" method='get'>
			<input type="hidden" name="pageNum" value="${cri.pageNum }">
			<input type="hidden" name="amount" value="${cri.amount }">
			<input type="hidden" name="no" value="${vo.no}">
		</form>
	
		<button type="button"  data-oper='update' class="btn btn-primary updateBtn">수정하기</button>	
		<button type="button"  data-oper='list' class="btn btn-info listBtn">목록보기</button>
		
		<script>
		
			var actionForm = $("#actionForm");
			
			$(".updateBtn").click(function(e){
				e.preventDefault();
				actionForm.attr("action","/test/board/update"); 
				actionForm.submit();	
			});
			
			
			$(".listBtn").click(function(e){
				e.preventDefault();
				actionForm.find("input[name='no']").remove(); //리스트에서는 no값 안보이게
				actionForm.submit();	
			});
		</script>
</div>
</body>
</html>