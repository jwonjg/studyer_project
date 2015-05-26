<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html>
<head>
<title>STUDYER</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<!-- CSS -->
<link href="${pageContext.request.contextPath}assets/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
<!-- Custom styles CSS -->
<link href="${pageContext.request.contextPath}/assets/css/style.css" rel="stylesheet" media="screen">
<style type="text/css">
	#goSearchDiv {
		text-align: center;
		min-height: 70vh;
		padding-top: 30vh;
	}
</style>
</head>
<body>
	<c:import url="/WEB-INF/views/member/signInForm.jsp"/>
	<c:import url="/WEB-INF/views/member/signUpForm.jsp"/>

	<header class="header"> 
		<c:import url="/WEB-INF/views/include/header.jsp"/>
	</header>

	<section id="wrapper">
		<div id="middleNav">
			<nav style="margin: 30px; min-height: 0px;"
				class="navbar navbar-custom" role="navigation">
				<div id="goSearchDiv" class="col-sm-12">
					<form class="navbar-form" role="search"	action="search" method="post">
						<input type="text" class="form-control input-lg" placeholder="주제" 
								name="subject" value="${requestScope.subject}">
						<input type="text" class="form-control input-lg" placeholder="강사" 
								name="teacher" value="${requestScope.teacher}">
						<input type="text" class="form-control input-lg" placeholder="기관" 
								name="place" value="${requestScope.place}">
						<input type="text" class="form-control input-lg" placeholder="강의명" 
							name="name" value="${requestScope.name}">
						<c:choose>
							<c:when test="${ empty authUser }">
								<button type="submit" class="btn input-lg searchBtn" disabled="disabled">search</button>
							</c:when>
							<c:otherwise>
								<button type="submit" class="btn input-lg searchBtn">search</button>
							</c:otherwise>
						</c:choose>
					</form>
				</div>
				<div class="col-sm-6 col-md-6">
					<h3 id="goWriteH3" style="cursor: pointer" class="text-center">write</h3>
				</div>
				<div class="col-sm-6 col-md-6">
					<h3 id="goMyVote" style="cursor: pointer" class="text-center">my note</h3>
				</div>
			</nav>
		</div>
	</section>
	
	<footer id="footer">
		<c:import url="/WEB-INF/views/include/footer.jsp"></c:import>
	</footer>

	<!-- Javascript files -->
	<script src="//code.jquery.com/jquery-1.11.2.min.js"></script>
	<script src="assets/bootstrap/js/bootstrap.min.js"></script>
	<script src="assets/js/jquery.parallax-1.1.3.js"></script>
	<script src="assets/js/jquery.sticky.js"></script>
	<script src="assets/js/wow.min.js"></script>
	<script src="assets/js/jquery.easypiechart.js"></script>
	<script src="assets/js/waypoints.min.js"></script>
	<script src="assets/js/jquery.cbpQTRotator.js"></script>
	<script src="assets/js/custom.js"></script>
	<script type="text/javascript">
	$("#goWriteH3").click(function() {
		location.href = "${pageContext.request.contextPath}/board/write";
	});
	</script>
</body>
</html>