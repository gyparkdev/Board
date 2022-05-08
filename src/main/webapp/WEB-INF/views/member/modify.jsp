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
	<title>회원정보 수정</title>
</head>
<body>
	<div class="container">
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <div class="login-panel panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">회원정보수정</h3>
                    </div>
                    <div class="panel-body">
                    
						<form action="/member/modify" method="post">
							<div class="form-group has feedback">
								<label class="control-label" for="userId">아이디</label>
								<input class="form-control" type="text" id="userId" name="userId" readonly="readonly" value="${member.userId }">
							</div>		
							<div class="form-group has-feedback">
								<label class="control-label" for="userPw">비밀번호</label>
								<input class="form-control" type="password" id="userPw" name="userPw">
							</div>		
							<div class="form-group has-feedback">
								<label class="control-label" for="userName">성명</label>
								<input class="form-control" type="text" id="userName" name="userName" readonly="readonly" value="${member.userName }">
							</div>		
							<div class="form-group has-feedback">
								<button id="submitBtn" class="btn btn-success" type="submit">수정</button>
								<button id="cancelBtn" class="cancel btn btn-danger" type="button">취소</button>
							</div>		
						</form>
					</div>
                </div>
            </div>
        </div>
    </div>
</body>
<script type="text/javascript">
	$(document).ready(function(){

		$("#submitBtn").click(function(){
			if($("#userPw").val() == ""){
				alert("수정할 내용을 입력하세요.");
				$("#userPw").focus();
				return false;
			}
			
			alert("수정이 완료되었습니다. 홈 화면으로 이동합니다.");
		})
		
		$("#cancelBtn").click(function(){
			self.location = "/";
		})
	})
</script>
</html>