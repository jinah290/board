<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<title>글수정</title>

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
	<form action="write" method="post">
		<!-- 제목 -->
		<div class="mb-3">
			<label for="title" class="form-label" name="title">title</label> 
			<input type="text" class="form-control" name="title" />
		</div>
		<!-- 작성자 -->
		<div class="mb-3">
			<label for="writer" class="form-label" name="writer">writer</label> 
			<input type="text" class="form-control" name="writer" />
		</div>
		<!-- 내용 -->
		<div class="mb-3">
			<label for="content" class="form-label" name="content">content</label> 
			<textarea class="form-control" name="content" row="10"></textarea>
		</div>
			
		<button type="submit" class="btn btn-primary">작성완료</button>
		<button type="reset" class="btn btn-danger">취소</button>
		<button type="button" onclick="location.href='list'" class="btn btn-info">목록보기</button>
	</form>
</div>
</body>
</html>