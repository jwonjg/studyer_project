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
</head>
<body>
	<header class="header"> 
		<c:import url="/WEB-INF/views/include/header.jsp"/>
	</header>

	<section id="contact" class="pfblock">
		<div class="container">
			<div class="col-sm-8 col-sm-offset-2">
				<table class="table">
					<thead>
						<tr>
							<td colspan="4">
							<form style="margin: 0;" class="navbar-form navbar-right" role="search" action="search.vote" method="post">
								<input type="hidden" name="command" value="searchVote" />
								<div class="input-group">
									<input type="text" class="form-control input-sm"
										placeholder="Search" name="searchStr"
										value="${requestScope.searchStr}">
									<div class="input-group-btn">
										<button type="submit" class="btn input-sm">search</button>
									</div>
								</div>
							</form>
							</td>
						</tr>
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