<%@ page contentType="text/html;charset=UTF-8" %>
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
			<div class="row">
				<div class="col-sm-6 col-sm-offset-3">
					<div class="pfblock-header">
						<h2 class="pfblock-title">Write new subject</h2>
						<div class="pfblock-line"></div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-6 col-sm-offset-3">
					<form id="optionForm" method="post"
						action="write.vote?command=writeVote" enctype="multipart/form-data">
	
						<div class="form-group">
							<span style="color: #E7746F">Title</span> <input type="text"
								name="title" class="form-control" placeholder="Name">
						</div>
						<div class="form-group">
							<span style="color: #E7746F">Content</span>
							<textarea name="contents" class="form-control" rows="3"
								placeholder="Content"></textarea>
						</div>
						<div class="form-group" style="margin-bottom: 30px;">
							<span style="color: #E7746F">Options</span>
							<div id="optionAddingDiv">
								<div id="optionDiv" style="margin-bottom: 5px;"
									class="input-group form-control">
									<input type="hidden" name="isImageExist" value="false">
									<!-- 사진 -->
									<input name="optionImageFile" type="file"
										style="visibility: hidden; display: inline-block; width: 0px;">
									<!-- 옵션이름 -->
									<input name="optionTitle" style="border: none; padding: 0;"
										type="text" class="form-control" placeholder="Options">
									<div class="input-group-btn">
										<button name="optionImage" type="button"
											class="btn btn-default">append image</button>
										<button name="optionDelete"
											style="padding: 10px; background: none; visibility: hidden;"
											type="button" class="btn btn-default">x</button>
									</div>
								</div>
							</div>
							<a style="cursor: pointer;" id="addOptionA" class="pull-right">add
								new option</a>
						</div>
						<button onclick="submitWrite();" type="button" class="btn btn-lg btn-block wow fadeInUp"
							data-wow-delay=".3s">start</button>
					</form>
				</div>
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