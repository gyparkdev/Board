<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
	<!-- 합쳐지고 최소화된 최신 CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<!-- 부가적인 테마 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
 	
 	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<title>회원탈퇴</title>
</head>
<body>
	<div class="container">
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <div class="login-panel panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">회원탈퇴</h3>
                    </div>
                    <div class="panel-body">
					<form id="delForm" action="/member/delete" method="post">
						<div class="form-group has feedback">
							<label class="control-label" for="userId">아이디</label>
							<input class="form-control" type="text" id="userId" name="userId" value="${member.userId }" readonly="readonly">
						</div>		
						<div class="form-group has-feedback">
							<label class="control-label" for="userPw">비밀번호</label>
							<input class="form-control" type="password" id="userPw" name="userPw">
						</div>		
						<div class="form-group has-feedback">
							<label class="control-label" for="userName">성명</label>
							<input class="form-control" type="text" id="userName" name="userName" value="${member.userName }" readonly="readonly">
						</div>		
						<div class="form-group has-feedback">
							<button id="submitBtn" class="btn btn-success" type="submit">회원탈퇴</button>
							<button class="cancel btn btn-danger" type="button">취소</button>
						</div>		
					</form>
					</div>
                </div>
            </div>
        </div>
    </div>
					
<!-- 		<div> -->
<%-- 			<c:if test="${result == false }"> --%>
<!-- 				비밀번호가 틀렸습니다. -->
<%-- 			</c:if> --%>
<!-- 		</div> -->
</body>
<script type="text/javascript">
	$(document).ready(function(){
		//취소
		$(".cancel").click(function(){
			location.href="/";
		})
		
		$("#submitBtn").click(function(){
			if($("#userPw").val()==""){
				alert("비밀번호를 입력해주세요.");
				$("#userPw").focus();
				return false;
			}
			$.ajax({
				url: "/member/pwChk",
				type: "post",
				//dataType: "json",
				data: $("#delForm").serializeArray(),
				success: function(data){
					
					if(data == 0){
						alert("비밀번호가 틀렸습니다.");
						return;
					}else{
						if(confirm("회원탈퇴하시겠습니까?")){
							$("#delForm").submit();
						}
					}
				}
			})
		});
	});
</script>
</html>