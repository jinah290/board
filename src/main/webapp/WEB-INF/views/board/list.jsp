<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!--BS 4 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
<title>Insert title here</title>

<style>
.container{
margin-top:50px;
margin-bottom:50px
}
</style>
</head>
<body>

<div class="container">
	<h2>글목록</h2>
	<button type="button" onclick="location.href='write'"
		class="btn btn-primary">글등록</button>
	<table class="table">
		<thead>
			<tr>
				<th scope="col">번호</th>
				<th scope="col">제목</th>
				<th scope="col">작성자</th>
				<th scope="col">날짜</th>
				<th scope="col">업데이트 날짜</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list}" var="vo">
				<tr>
					<td><c:out value="${vo.no}" /></td>
					<td><a class="move" href='<c:out value="${vo.no}"/>'><c:out value="${vo.title}" /></a></td>
					<td><c:out value="${vo.writer}" /></td>
					<td><fmt:formatDate pattern="yyyy-MM-dd"
							value="${vo.writeDate}" /></td>
					<td><fmt:formatDate pattern="yyyy-MM-dd"
							value="${vo.updateDate}" /></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<button type="button" onclick="location.href='write'"
		class="btn btn-primary">글등록</button>
	<div class='pull-right' style="margin-top:20px">
		<ul class="pagination">
			<c:if test="${pageMaker.prev}">
			<li class="page-item"><a class="page-link" href="${pageMaker.startPage - 1}" >Previous</a></li>
			</c:if>
			
			<c:forEach begin="${pageMaker.startPage }"
						end="${pageMaker.endPage }" var="num">
			<li class="page-item ${pageMaker.cri.pageNum == num? "active" : "" }"><a class="page-link" href="${num }">${num }</a></li>
			</c:forEach>
			
			<c:if test="${pageMaker.next}">
			<li class="page-item"><a class="page-link" href="${pageMaker.endPage + 1 }">Next</a></li>
			</c:if>
		
		</ul>
	</div>
	
	<form id='actionForm' action="/test/board/list" method='get'>
		<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
		<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
	</form>
	
	
</div>


<!-- 모달창 -->
<div class="modal" tabindex="-1" id="messageModal">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Modal title</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <p>Modal body text goes here.</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>

<script>
$(document).ready(function() {
	var result = '<c:out value ="${result}"/>';
	
	//모달창
	checkModal(result);
	
	history.replaceState({}, null, null); //뒤로가기 했을 때 모달창 안보이게
	
	function checkModal(result) {
		if (result === '' || history.state) {
			return;
		}
		if (parseInt(result) > 0) {
			$(".modal-body").html(
					"게시글 : " + parseInt(result) + "번이 등록 되었습니다");
		} else if (result == "success") {
			$(".modal-body").html("정상적으로 처리되었습니다.");
		} else {
			return;
		}

		$("#messageModal").modal("show");
	}	
	
	//페이지번호 클릭시 이동
	var actionForm = $("#actionForm");
	
	$(".page-link").on("click", function(e){
		e.preventDefault();
		
		var targetPage = $(this).attr("href");
		console.log(targetPage);
		
		actionForm.find("input[name='pageNum']").val(targetPage);
		actionForm.submit();
	});
	
	//actionForm 링크연동(.move에 번호만 링크 걸기 위해서)
	$(".move").on("click", function(e){
		e.preventDefault();
		
		var targetNo = $(this).attr("href");
		
		console.log(targetNo);
		
		actionForm.append("<input type='hidden' name='no' value='"+targetNo+"'>");
		actionForm.attr("action","/test/board/view").submit();
	});
});
</script>
</body>
</html>