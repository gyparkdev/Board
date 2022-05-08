<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    
<%@include file="../includes/header.jsp" %>

            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">글보기</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                        	글보기
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
							<div class="form-group">
                       			<label>글번호</label>
                       			<input class="form-control" name='bno' readonly="readonly" value='<c:out value="${board.bno }"/>'>
                       		</div>
							<div class="form-group">
                       			<label>제목</label>
                       			<input class="form-control" name='title' readonly="readonly" value='<c:out value="${board.title }"/>'>
                       		</div>
							<div class="form-group">
                       			<label>내용</label>
                       			<textarea class="form-control" rows="5" cols="50" name="content"readonly="readonly" ><c:out value="${board.content }"/></textarea>
                       		</div>
							<div class="form-group">
                       			<label>작성자</label>
                       			<input class="form-control" name='writer' readonly="readonly" value='<c:out value="${board.writer }"/>'>
                       		</div>
							<div class="form-group">
                       			<label>조회수</label>
                       			<input class="form-control" name='viewCnt' readonly="readonly" value='<c:out value="${board.viewCnt }"/>'>
                       		</div>
                       		
                       		<form id="actionForm" action="/board/list" method="get">
								<input type="hidden" name="pageNum" value="${cri.pageNum }">
								<input type="hidden" name="amount" value="${cri.amount }">
								<input type="hidden" name="bno" value="${board.bno }">
								<input type="hidden" name="type" value="${cri.type}">
								<input type="hidden" name="keyword" value="${cri.keyword }">
							</form>
                       		
                       		<button type="button" class="btn btn-default modBtn"><a href='/board/modify?bno=<c:out value="${board.bno }"/>'>글 수정</a></button>
                       		<button type="button" class="btn btn-default listBtn"><a href="/board/list">글 목록</a></button>
                        </div>
                        <!-- /.panel-body -->
                        
                        <!-- 댓글 -->
                        <div id="reply">
                        	<ol class="replyList">
                        		<c:forEach items="${replyList }" var="reply">
                        			<li>
                        				<p>
	                        			작성자: ${reply.writer } <br>
	                        			등록일: <fmt:formatDate value="${reply.regdate }"/>
                        				</p>
                        				<p>${reply.content }</p>
                        				<div>
                        					<button type="button" class="replyUpdateBtn btn btn-warning" data-rno="${reply.rno }">수정</button>
                        					<button type="button" class="replyDeleteBtn btn btn-danger" data-rno="${reply.rno }">삭제</button>
                        					<hr>
                        				</div>
                        			</li>
                        		</c:forEach>
                        	</ol>
                        </div>
                        
                        <form class="form-horizontal">
                        	<div class="form-group">
                        		<label for="writer" class="col-sm-2 control-label">댓글 작성자</label>
                        		<div class="col-sm-10">
	                        		<input type="text" id="replyWriter" name="writer" class="form-control" value="${member.userId }" readonly="readonly">
                        		</div>
                        	</div>
                        	<div class="form-group">
                        		<label for="content" class="col-sm-2 control-label">댓글 내용</label>
                        		<div class="col-sm-10">
                        			<textarea id="replyContent" class="form-control" rows="5" cols="5" name="content"></textarea>
								</div>
                        	</div>
                        	<div class="form-group">
                        		<div class="col-sm-offset-2 col-sm-10">
                        			<button type="button" class="replyWriteBtn btn btn-success">등록</button>
                        		</div>
                        	</div>
                       </form>
                        
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            
<script type="text/javascript">
$(document).ready(function(){
	
	var actionForm = $("#actionForm");
	
	$(".listBtn").click(function(e){
		e.preventDefault();
		actionForm.find("input[name='bno']").remove();
		actionForm.submit();
	})
	
	$(".modBtn").click(function(e){
		if(${member == null}){
			alert("로그인 후에 이용가능 합니다.");
			return false;
		}else{
			e.preventDefault();
			actionForm.attr("action", "/board/modify");
			actionForm.submit();
		}
	});
	
	//댓글 작성
	$(".replyWriteBtn").click(function(e){
		e.preventDefault();
		
		if($("#replyContent").val() == ""){
			alert("댓글 내용을 입력하세요.");
			$("#replyContent").focus();
			return false;
		}
		
		var content = $("#replyContent").val();
		var writer = $("#replyWriter").val();
		
		actionForm.append("<input type='hidden' name='content' value='" + content + "'>'");
		actionForm.append("<input type='hidden' name='writer' value='" + writer + "'>'");
		actionForm.attr("action", "/board/replyWrite")
		.attr("method", "post").submit();
		
// 		var formObj = $("form[name='replyForm']");
// 		formObj.attr("action", "/board/replyWrite");
// 		formObj.submit();
	})
	
// 	$(".replyUpdateBtn").click(function(){
// 		location.href="/board/replyUpdateView?bno=${board.bno}"
// 						+ "&pageNum=${cri.pageNum}"
// 						+ "&amount=${cri.amount}"
// 						+ "&type=${cri.type}"
// 						+ "&keyword=${cri.keyword}"
// 						+ "&rno="+$(this).attr("data-rno");
// 	})

	$(".replyUpdateBtn").click(function(){
		var rno = $(this).attr("data-rno");
		actionForm.append("<input type='hidden' name='rno' value='" + rno + "'>'");
		actionForm.attr("action", "/board/replyUpdateView").submit();
	})
	
	$(".replyDeleteBtn").click(function(){
		var rno = $(this).attr("data-rno");
		actionForm.append("<input type='hidden' name='rno' value='" + rno + "'>'");
		
		var deleteYN = confirm("삭제하시겠습니까?");
		if(deleteYN == true){
			actionForm.attr("action", "/board/replyDelete")
			.attr("method", "post").submit();
		}
	})
	
});

</script>                       
  
<%@include file="../includes/footer.jsp" %>
