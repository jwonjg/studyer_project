<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div style="margin: 30px; min-height: 0px;" class="navbar navbar-custom" role="navigation">
	<div class="col-sm-9 col-md-4">
		<c:if test="${ authUser.no!=null}">
		<h3 id="goWriteH3" style="cursor: pointer" class="text-center">write</h3>
		</c:if>
		<c:if test="${ authUser.no==null}">
		<h3 id="goSignIn" style="cursor: pointer" class="text-center">write</h3>
		</c:if>
	</div>
	<div class="col-sm-9 col-md-4">
		<h3 id="goNotesH3" style="cursor: pointer" class="text-center">notes</h3>
	</div>
	<div class="col-sm-9 col-md-4">
	<c:if test="${ authUser.no!=null}">
		<h3 id="goMyNotesH3" style="cursor: pointer" class="text-center">my notes</h3>
	</c:if>
	<c:if test="${ authUser.no==null}">
		<h3 id="goSignIn2" style="cursor: pointer" class="text-center">my notes</h3>
	</c:if>
	
	</div>
</div>
