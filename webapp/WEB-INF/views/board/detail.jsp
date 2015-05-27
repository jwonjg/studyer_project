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
				<div class="pfblock-header">
					<h2 class="pfblock-title">Title</h2>
					<div class="pfblock-line"></div>
				</div>
			</div>
			<div class="col-sm-8 col-sm-offset-2">
					<div class="form-group">
						<span style="color: #E7746F">Category</span> 
						<div>
							<h4>주제 > 강사 > 기관 > 강의명</h4>
						</div>
					</div>
					<div class="form-group" >
						<span style="color: #E7746F">Attachment</span>
						<div>
							<h4>File name</h4>
						</div>
					</div>
					<div class="form-group">
						<span style="color: #E7746F">Content</span>
						<div>
							<h4>Content</h4>
						</div>
					</div>	
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
	<script type="text/javascript">
		function submitWrite() {
			$("#writeForm").submit();
		}	
	</script>
</body>
</html>