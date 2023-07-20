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
</style>
</head>
<body>

<div class="container">
	<h2>글수정</h2>
	<form>
		<!-- 수정완료 후 보던 페이지로 이동(7페이지에서 수정시 수정완료 후에도 7페이지) -->
		<input type='hidden' name='pageNum' value='${cri.pageNum }'>
		<input type='hidden' name='amount' value='${cri.amount }'>
		<!-- 번호 -->
		<div class="mb-3">
			<label for="no" class="form-label">no</label> 
			<input type="text" class="form-control" name="no" value='<c:out value="${vo.no}"/>' readonly />
		</div>
		<!-- 제목 -->
		<div class="mb-3">
			<label for="title" class="form-label">title</label> 
			<input type="text" class="form-control" name="title" value='<c:out value="${vo.title}"/>'/>
		</div>
		<!-- 작성자 -->
		<div class="mb-3">
			<label for="writer" class="form-label">writer</label> 
			<input type="text" class="form-control" name="writer" value='<c:out value="${vo.writer}"/>'/>
		</div>
		<!-- 내용 -->
		<div class="mb-3">
			<label for="content" class="form-label">content</label> 
<textarea class="form-control" name="content" row="10">
<c:out value="${vo.content}"/>
</textarea>
		</div>
			
		<button data-oper='update' class="btn btn-primary">수정완료</button>
		<button data-oper='delete' class="btn btn-danger">삭제하기</button>
		<button data-oper='list' class="btn btn-info">목록보기</button>
	</form>
</div>

<script>

//버튼처리
$(document).ready(function() {
	
	var formobj = $("form");
	
	$('.btn').click(function(e){
	
		e.preventDefault(); //기본동작 막기(버튼,링크 등등)
	
		var operation = $(this).data("oper")
	
		console.log(operation);
		
		if(operation === "list"){ //operation이 list일 때 
			self.location="/test/board/list?pageNum=${cri.pageNum }"
		} else if(operation === 'delete'){
			formobj.attr("action", "/test/board/delete")
					.attr("method", "post");
				formobj.submit();
		} else if(operation === 'update'){
			formobj.attr("action", "/test/board/update")
			.attr("method", "post");
		formobj.submit();
		}
	});
	
});
</script>
</body>
</html>