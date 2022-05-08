<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<title>Home</title>
	   <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

    <!-- Bootstrap Core CSS -->
    <link href="/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="/resources/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="/resources/dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="/resources/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    
	<!-- Bootstrap Core JavaScript -->
    <script src="/resources/vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="/resources/vendor/metisMenu/metisMenu.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="/resources/dist/js/sb-admin-2.js"></script>
	
</head>
<body>
	<form name='homeForm' method="post" action="/member/login">
		<c:if test="${member == null}">
			<div class="container">
	        <div class="row">
	            <div class="col-md-4 col-md-offset-4">
	                <div class="login-panel panel panel-default">
	                    <div class="panel-heading">
	                        <h3 class="panel-title">로그인</h3>
	                    </div>
	                    <div class="panel-body">
	                        <div class="form-group">
	                            <input class="form-control" placeholder="ID" name="userId" type="text" autofocus>
	                        </div>
	                        <div class="form-group">
	                            <input class="form-control" placeholder="Password" name="userPw" type="password" value="">
	                        </div>
	                        <!-- Change this to a button or input when using this as a form -->
	                        <button id="submitBtn" type="submit" class="btn btn-lg btn-success btn-block">로그인</button>
	                        <button id="joinBtn" type="button" class="btn btn-lg btn-success btn-block">회원가입</button>
	                    </div>
	                </div>
	            </div>
	        </div>
	  	  	</div>
		</c:if>
		<c:if test="${result == false}">
			<p style="color: red;">로그인 실패! 아이디와 비밀번호를 확인해주세요.</p>
		</c:if>
		<c:if test="${member != null }">
			<div>
				<p>${member.userName}(${member.userId })님 환영합니다.</p>
				<button id="logoutBtn" type="button">로그아웃</button>
				<div class="container">
					<div class="jumbotron">
						<div class="container">
							<h1>웹 사이트 소개</h1>
							<p>이 웹 사이트는 부트스트랩으로 만든 스프링 웹 사이트입니다. 게시판, 댓글, 회원관리, 검색, 페이징 기술을 적용했습니다.</p>
							<p><a class="btn btn-primary btn-pull" href="/board/list" role="button">게시판 보기</a></p>
						</div>
					</div>
				</div>
			</div>
			<div class="container">
				<div id="myCarousel" class="carousel slide" data-ride="carousel">
					<ol class="carousel-indicators">
						<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
						<li data-target="#myCarousel" data-slide-to="1"></li>
						<li data-target="#myCarousel" data-slide-to="2"></li>
					</ol>
					<div class="carousel-inner">
						<div class="item active">
							<img src="/resources/images/1.jpg">
						</div>			
						<div class="item">
							<img src="/resources/images/2.jpg">
						</div>			
						<div class="item">
							<img src="/resources/images/3.jpg">
						</div>			
					</div>
					<a class="left carousel-control" href="#myCarousel" data-slide="prev">
						<span class="glyphicon glyphicon-chevron-left"></span>
					</a>
					<a class="right carousel-control" href="#myCarousel" data-slide="next">
						<span class="glyphicon glyphicon-chevron-right"></span>
					</a>
				</div>
		</c:if>
	</form>
	
</body>

<script type="text/javascript">
$(document).ready(function(){

	$("#submitBtn").click(function(){
		if($("input[name=userId]").val() == ""){
			alert("아이디를 입력해주세요.");
			$("input[name='userId']").focus();
			return false;
		}
		if($("input[name=userPw]").val() == ""){
			alert("비밀번호를 입력해주세요.");
			$("input[name='userPw']").focus();
			return false;
		}
	});

	$("#logoutBtn").on("click", function(){
		self.location="/member/logout";
	});
	
	$("#joinBtn").click(function(){
		self.location = "/member/join";
	});
})
</script>
</html>

