<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>회원가입</title>
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

</head>

<body>

    <div class="container">
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <div class="login-panel panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">회원가입</h3>
                    </div>
                    <div class="panel-body">
                        <form id="joinForm" role="form" action="/member/join" method="post">
                                <div class="form-group">
                                    <input class="form-control" placeholder="ID" id="userId" name="userId" type="text" autofocus>
                                    <button class="btn btn-success" type="button" id="idChk" onclick="fn_idChk();" value="N">중복확인</button>
                                </div>
                                <div class="form-group">
                                    <input class="form-control" placeholder="Password" name="userPw" type="password" value="">
                                </div>
                                <div class="form-group">
                                    <input class="form-control" placeholder="Name" name="userName" type="text" value="">
                                </div>
                                <div class="form-group">
                                    <input class="form-control" placeholder="E-mail" name="userEmail" type="email" value="">
                                </div>
                                <!-- Change this to a button or input when using this as a form -->
                                <button id="submitBtn" type="submit" class="btn btn-lg btn-success btn-block">가입하기</button>                           
                                <button id="cancelBtn" type="button" class="btn btn-lg btn-faul btn-block">취소</button>                          
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

<!--     jQuery -->
<!--     <script src="/resources/vendor/jquery/jquery.min.js"></script> -->

    <!-- Bootstrap Core JavaScript -->
    <script src="/resources/vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="/resources/vendor/metisMenu/metisMenu.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="/resources/dist/js/sb-admin-2.js"></script>

</body>

<script>
$(document).ready(function(){
	
	$("#cancelBtn").click(function(){
		self.location = "/";
	});
	
	$("#submitBtn").click(function(){
		if($("input[name=userId]").val() == ""){
			alert("아이디를 입력해주세요.");
			$("input[name=userId]").focus();
			return false;
		}
		if($("input[name=userPw]").val() == ""){
			alert("비밀번호를 입력해주세요.");
			$("input[name=userPw]").focus();
			return false;
		}
		if($("input[name=userName]").val() == ""){
			alert("이름을 입력해주세요.");
			$("input[name=userName]").focus();
			return false;
		}
		if($("input[name=userEmail]").val() == ""){
			alert("이메일을 입력해주세요.");
			$("input[name=userEmail]").focus();
			return false;
		}
		
		var idChkVal = $("#idChk").val();
		if(idChkVal == "N"){
			alert("중복확인 버튼을 눌러주세요.");
			return false;
		}else if(idChkVal == "Y"){
			$("#joinForm").submit();
		}
		alert("회원가입이 완료되었습니다.");
	});
});
	function fn_idChk(){
		if($("input[name=userId]").val() == ""){
			alert("유효한 아이디를 입력하세요.");
			return;
		}
		
		$.ajax({
			url: "/member/idChk",
			type: "post",
			//dataType: "json",
			data: {"userId" : $("#userId").val()},
			success: function(data){
				if(data == 1){
					alert("중복된 아이디입니다.");
				}else if(data == 0){
					$("#idChk").attr("value", "Y");
					alert("사용가능한 아이디입니다.");
				}
			}
		})
	}
</script>
</html>