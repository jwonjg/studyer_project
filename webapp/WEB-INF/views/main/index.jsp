<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html>
<head>
<title>STUDYER</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<!-- CSS -->
<link href="assets/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
<!-- Custom styles CSS -->
<link href="${pageContext.request.contextPath}/assets/css/style.css" rel="stylesheet" media="screen">
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
				<div class="col-sm-6 col-md-6">
					<h3 id="goWriteH3" style="cursor: pointer" class="text-center">write</h3>
				</div>
				<div class="col-sm-6 col-md-6">
					<h3 id="goMyVote" style="cursor: pointer" class="text-center">my vote</h3>
				</div>
			</nav>
		</div>
		<div class="container">
			<div class="col-xs-12 col-sm-12 col-md-12">
				<form class="navbar-form navbar-right" role="search"
					action="search.vote" method="post">
					<input type="hidden" name="command" value="searchVote" />
					<div class="input-group">
						<input type="text" class="form-control input-sm" placeholder="Search" 
							name="searchString" value="${requestScope.searchString}">
						<div class="input-group-btn">
							<c:choose>
								<c:when test="${ empty authUser }">
									<button type="submit" class="btn input-sm" disabled="disabled">search</button>
								</c:when>
								<c:otherwise>
									<button type="submit" class="btn input-sm">search</button>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
				</form>
				<table class="table">
					<thead>
						<tr>
							<td>Title</td>
							<td>Done/Ongoing</td>
							<td>Participants</td>
							<td>Proposer</td>
						</tr>
					</thead>
					<tbody>
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
	<script src="assets/bootstrap/js/bootstrap.min.js"></script>
	<script src="assets/js/jquery.parallax-1.1.3.js"></script>
	<script src="assets/js/jquery.sticky.js"></script>
	<script src="assets/js/wow.min.js"></script>
	<script src="assets/js/jquery.easypiechart.js"></script>
	<script src="assets/js/waypoints.min.js"></script>
	<script src="assets/js/jquery.cbpQTRotator.js"></script>
	<script src="assets/js/custom.js"></script>
</body>
</html>