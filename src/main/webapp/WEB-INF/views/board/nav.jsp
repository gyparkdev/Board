<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<style>
	li{list-style:none; display:inline; padding:6px;}
</style>
<ul>
	<li><a href="/">홈</a></li>
<!-- 	<li> -->
<%-- 		<c:if test="${member != null }"><a href="/member/logout">로그아웃</a></c:if> --%>
<%-- 		<c:if test="${member == null }"><a href="/">로그인</a></c:if> --%>
<!-- 	</li> -->
	<li>
		<c:if test="${member != null }">
			<p>${member.userName}님 (${member.userId }) 접속...</p>
		</c:if>
		<c:if test="${member == null }">
			<p>손님회원 입니다.</p>
		</c:if>
	</li>
</ul>

<div>
	<div>
	</div>
</div>