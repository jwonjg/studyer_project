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
<style type="text/css">
	#editor {
		width: 100%;
		height: 350px;
		border: none;
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
				<div class="pfblock-header">
					<h2 class="pfblock-title">Write new subject</h2>
					<div class="pfblock-line"></div>
				</div>
			</div>
			<div class="col-sm-8 col-sm-offset-2">
				<form id="writeForm" method="post" action="${pageContext.request.contextPath}/board/write" enctype="multipart/form-data">
					<div style="padding: 0;" class="navbar-form">
						<span style="color: #E7746F">Category</span> 
						<div>
						<input type="text" class="form-control input-lg" placeholder="주제" 
								name="subject" value="${requestScope.subject}">
						<input type="text" class="form-control input-lg" placeholder="강사" 
								name="teacher" value="${requestScope.teacher}">
						<input type="text" class="form-control input-lg" placeholder="기관" 
								name="place" value="${requestScope.place}">
						<input type="text" class="form-control input-lg" placeholder="강의명" 
							name="name" value="${requestScope.name}">
						</div>
					</div>
					<div class="form-group">
						<span style="color: #E7746F">Title</span> 
						<input style="height: 40px;" type="text" name="title" class="form-control input-lg" placeholder="Title">
					</div>
					<div class="form-group" >
						<span style="color: #E7746F">Attachment</span>
						<div id="optionAddingDiv">
							<div id="optionDiv"	class="input-group form-control">
								<input type="hidden" name="isImageExist" value="false">
								<!-- 사진 -->
								<input id="uploadFile" name="file" type="file"
									style="visibility: hidden; display: inline-block; width: 0px;">
								<!-- 사진이름 -->
								<input id="uploadFileName" readonly="readonly" name="optionTitle" style="border: none; padding: 0;"
									type="text" class="form-control input-lg" placeholder="Attached File">
								<div class="input-group-btn">
									<button id="uploadFileButton" name="optionImage" type="button"
										class="btn btn-default">file upload</button>
									<button name="optionDelete"
										style="padding: 10px; background: none; visibility: hidden;"
										type="button" class="btn btn-default">x</button>
								</div>
							</div>
						</div>
					</div>
					<div class="form-group">
						<span style="color: #E7746F">Content</span>
						<div>
						<iframe id="editor" scrolling="no" src="${pageContext.request.contextPath}/assets/editor/editor.jsp"></iframe>
						</div>
					</div>	
					
					<button onclick="submitWrite();" type="button" class="btn btn-lg btn-block wow fadeInUp">write</button>
				</form>
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
			var content = $("#editor").contents().find("#editor").html();
			$("<input>").attr({name:"content", value:content, type:"hidden"}).appendTo("#writeForm");
			$("#writeForm").submit();
		}	
		
		$("#uploadFileButton").on("click", function() {
			$("#uploadFile").click();
		});
		$("#uploadFile").on(
				"change",
				function() {
					
					$("#uploadFileName").attr("value",
							$(this).val().split('/').pop().split('\\').pop());
			});
		
		$(".pfblock-title").click(function(){
		});
	</script>
</body>
</html>