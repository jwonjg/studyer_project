<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html>
<head>
<title>STUDYER</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<!-- CSS -->
<link href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
<!-- Custom styles CSS -->
<link href="${pageContext.request.contextPath}/assets/css/style.css" rel="stylesheet" media="screen">
<style type="text/css">
#inputTable thead tr:last-child td {
	border-top: none;
	border-bottom: 1px solid #666;
	padding-bottom: 20px;
}
#inputTable tbody tr:first-child td {
	padding-top: 20px;
	padding-bottom: 0px;
}
#inputTable tbody td {
	padding-top: 5px;
	padding-bottom: 5px;
}
h3, h5, h6 {
	text-transform: none;
}
#inputTable a {
	cursor: pointer;
}


</style>
</head>
<body>
	<header class="header"> 
		<c:import url="/WEB-INF/views/include/header.jsp"/>
	</header>

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
	<script src="${pageContext.request.contextPath}/assets/bootstrap/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/jquery.parallax-1.1.3.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/jquery.sticky.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/wow.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/jquery.easypiechart.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/waypoints.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/jquery.cbpQTRotator.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/custom.js"></script>
</body>
</html>