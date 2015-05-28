<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
					<h2 class="pfblock-title">${vo2.title }</h2>
					<div class="pfblock-line"></div>
				</div>
			</div>
			<div class="col-sm-8 col-sm-offset-2">
					<div class="form-group">
						<span style="color: #E7746F">Category</span> 
						<div>
						<h4>
							${c_vo.subjectName }>${c_vo.teacherName }>${c_vo.placeName }>${c_vo.nameName }
						</h4>	
						</div>
					</div>
					<div class="form-group" >
						<span style="color: #E7746F">Attachment</span>
						<div>
							<c:set var="originName" value="${vo2.file_url }"/>
							<a href="/studyer_project/file/${vo2.no}.${fn:substringAfter(originName, '.')}" download>${vo2.file_url }</a>
						</div>
					</div>
					<div class="form-group">
						<span style="color: #E7746F">Content</span>
						<div>
							${vo2.content}
						</div>
					</div>
			</div>
			<div class="row">
				<div class="col-md-12 col-lg-12 calltoaction-btn" style="margin: 20px 0;">
					<button
						onclick="location.href='resultForm.vote?command=resultForm'"
						style="background: rgba(17, 17, 17, 0.8); color: white; border: 1px solid rgba(17, 17, 17, 0.8);"
						class="btn btn-lg btn-default" >like</button>
					<c:if test="${ sessionScope.currentUserId eq requestScope.voteForm.vote.userId }">
						<a style="background: #E7746F; color: white;" class="btn btn-lg btn-default">delete</a>
					</c:if>
					<a title="vote" id="resultToggleA"
						style="border-color: #E7746F; border-width: 1px; border-style: solid; color: #E7746F;"
						class="btn btn-lg">edit this note</a>
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