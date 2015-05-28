<%@ page contentType="text/html;charset=UTF-8" %>
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

	<section id="wrapper">
		<div id="middleNav">
			<nav style="margin: 30px; min-height: 0px;"	class="navbar navbar-custom">
				<div id="goSearchDiv" class="col-sm-12">
					<form class="navbar-form" role="search"	action="board/search" method="post">
						<input type="text" class="class form-control input-lg" placeholder="주제" 
								name="subjectName" value="${requestScope.subject}">
						<input type="text" class="class form-control input-lg" placeholder="강사" 
								name="teacherName" value="${requestScope.teacher}">
						<input type="text" class="class form-control input-lg" placeholder="기관" 
								name="placeName" value="${requestScope.place}">
						<input type="text" class="class form-control input-lg" placeholder="강의명" 
							name="nameName" value="${requestScope.name}">
						<button type="submit" class="btn input-lg searchBtn">search</button>
					</form>
				</div>
			</nav>
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
