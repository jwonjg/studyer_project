<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<nav class="navbar navbar-custom" role="navigation">
	<div class="container">
		<div class="navbar-header">
			<a class="navbar-brand" href="index.do">STUDYER</a>
		</div>
		<div class="collapse navbar-collapse" id="custom-collapse">
			<ul class="nav navbar-nav navbar-right">
			<c:choose>
				<c:when test="${ empty authUser }">
					<li><a style="cursor: pointer" data-toggle="modal" data-target="#signUpModal">Sign Up</a></li>
					<li><a style="cursor: pointer" data-toggle="modal" data-target="#loginModal">Sign In</a></li>
				</c:when>
				<c:otherwise>
					<li><a style="cursor: pointer" data-toggle="modal" data-target="#signUpModal" id="showSignModal">welcome ${ authUser.name }</a></li>
					<li><a style="cursor: pointer" id="logoutA">LOG OUT</a></li>
				</c:otherwise>
			</c:choose>
			</ul>
		</div>
	</div>
</nav> 