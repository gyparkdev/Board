<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<%@include file="../includes/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
 	<title>게시판</title>
</head>
<body>
	<div id="root">
		<header>
			<h1>댓글 수정</h1>
		</header>
		<hr>
		<section id="container">
			<form name="updateForm" action="/board/replyUpdate" method="post">
				<input type="hidden" name="bno" value="${replyUpdate.bno }">
				<input type="hidden" name="rno" value="${replyUpdate.rno }">
				<input type="hidden" name="pageNum" value="${cri.pageNum }">
				<input type="hidden" name="amount" value="${cri.amount }">
				<input type="hidden" name="type" value="${cri.type}">
				<input type="hidden" name="keyword" value="${cri.keyword }">
			
				<div class="form-group">
              		<label for="content" class="col-sm-2 control-label">댓글 내용</label>
	              		<div class="col-sm-10">
	              			<input type="text" id="replyContent" class="form-control" name="content" value="${replyUpdate.content }">
								<button type="submit" class="updateBtn btn btn-success">저장</button>
								<button type="button" class="cancelBtn btn btn-danger">취소</button>
						</div>
                </div>
			</form>
		</section>
	</div>
</body>
<script>
	$(document).ready(function(){
		$(".cancelBtn").click(function(){
			location.href="/board/get?bno=${replyUpdate.bno }"
						+ "&pageNum=${cri.pageNum}"
						+ "&amount=${cri.amount}"
						+ "&type=${cri.type}"
						+ "&keyword=${cri.keyword}";
		})
	})
</script>
</html>