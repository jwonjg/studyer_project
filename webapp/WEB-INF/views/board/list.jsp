<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html>
<head>
<title>STUDYER</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
<link href="${pageContext.request.contextPath}/assets/css/style.css" rel="stylesheet" media="screen">
<link href="${pageContext.request.contextPath}/assets/css/custom.css" rel="stylesheet" media="screen">
</head>
<body>
	<c:import url="/WEB-INF/views/member/signInForm.jsp"/>
	<c:import url="/WEB-INF/views/member/signUpForm.jsp"/>
	
	<header class="header"> 
		<c:import url="/WEB-INF/views/include/header.jsp"/>
	</header>

	<nav>
		<c:import url="/WEB-INF/views/include/navigation.jsp"/>
	</nav>

	<section id="contact" class="pfblock">
		<div class="container">
			<div class="col-sm-8 col-sm-offset-2">
				<table id="inputTable" class="table">
					<thead>
					<tr>
						<td>
						<input type="text" class="form-control input-lg" placeholder="주제" 
								name="subject" value="${requestScope.subject}">
						</td>
						<td>
						<input type="text" class="form-control input-lg" placeholder="강사" 
								name="teacher" value="${requestScope.teacher}">
						</td>
						<td>
						<input type="text" class="form-control input-lg" placeholder="기관" 
								name="place" value="${requestScope.place}">
						</td>
						<td>
						<input type="text" class="form-control input-lg col-2" placeholder="강의명" 
							name="name" value="${requestScope.name}">
						</td>
					</tr>
					</thead>
					<tbody>
						<c:forEach var="board" items="${ requestScope.list }">
							<tr>
								<td><h6>${ pageScope.board.subject_name }</h6></td>
								<td><h6>${ pageScope.board.teacher_name }</h6></td>
								<td><h6>${ pageScope.board.place_name }</h6></td>
								<td><h6>${ pageScope.board.name_name }</h6></td>
							</tr>
							<tr>
								<td style="border-top: none;" colspan="3">
									<h3><a href="${pageContext.request.contextPath}/board/detail/${ pageScope.board.no }">${ pageScope.board.title }</a></h3>
								</td>
								<td style="border-top: none;">
									<h3>${ pageScope.board.reg_date }</h3>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</section>
	
	<footer id="footer">
		<c:import url="/WEB-INF/views/include/footer.jsp"></c:import>
	</footer>

	<!-- Javascript files -->
	<script src="//code.jquery.com/jquery-1.11.2.min.js"></script>
	<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
	<script src="${pageContext.request.contextPath}/assets/bootstrap/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/custom.js"></script>
</body>
</html>