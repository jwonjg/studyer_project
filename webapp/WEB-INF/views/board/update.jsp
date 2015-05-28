<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!doctype html>
<html>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
<link href="${pageContext.request.contextPath}/assets/css/style.css" rel="stylesheet" media="screen">
<link href="${pageContext.request.contextPath}/assets/css/custom.css" rel="stylesheet" media="screen">
</head>
<body onload="viewContent()">
	<c:import url="/WEB-INF/views/member/signInForm.jsp"/>
	<c:import url="/WEB-INF/views/member/signUpForm.jsp"/>
	
	<header class="header"> 
		<c:import url="/WEB-INF/views/include/header.jsp"/>
	</header>

	<nav>
		<c:import url="/WEB-INF/views/include/navigation.jsp"/>
	</nav></head>

	<section id="contact" class="pfblock">
		<div class="container">
			<div class="col-sm-8 col-sm-offset-2">
				<div class="pfblock-header">
					<h2 class="pfblock-title">Update Class Note</h2>
					<div class="pfblock-line"></div>
				</div>
			</div>
			<div class="col-sm-8 col-sm-offset-2">
				<form id="writeForm" method="post" action="${pageContext.request.contextPath}/board/update" enctype="multipart/form-data">
					<input type="hidden" name="member_name" value="${ sessionScope.authUser.name }">
					<input type="hidden" name="no" value="${vo.no }">
					<div style="padding: 0;" class="navbar-form">
						<span style="color: #E7746F">Category</span> 
						<div>
						<h4>
							${c_vo.subjectName }>${c_vo.teacherName }>${c_vo.placeName }>${c_vo.nameName }
						</h4>
						<%-- <input type="text" class="form-control input-lg" placeholder="주제" 
								name="subject" value="${c_vo.subjectName}">
						<input type="text" class="form-control input-lg" placeholder="강사" 
								name="teacher" value="${c_vo.teacherName}">
						<input type="text" class="form-control input-lg" placeholder="기관" 
								name="place" value="${c_vo.placeName}">
						<input type="text" class="form-control input-lg" placeholder="강의명" 
							name="name" value="${c_vo.nameName}"> --%>
							
						</div>
					</div>
					<div class="form-group">
						<span style="color: #E7746F">Title</span> 
						<input style="height: 40px;" type="text" name="title" class="form-control input-lg" placeholder="Title"
						value = "${ vo.title }" >
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
								<c:set var="originName" value="${vo.file_url }"/>
								<input type="hidden" name="originExt" value="${fn:substringAfter(originName, '.')}"/>								
								<input id="uploadFileName" readonly="readonly" name="optionTitle" style="border: none; padding: 0;"
									type="text" class="form-control input-lg" placeholder="Attached File" value ="${ vo.file_url }" >
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
						<div id="invisibleContent" style="display:none">${vo.content}</div>
						<div>
						<iframe id="editor" scrolling="no" src="${pageContext.request.contextPath}/assets/editor/editor.jsp"></iframe>
						</div>
					</div>	
					
					<button onclick="submitUpdate();" type="button" class="btn btn-lg btn-block wow fadeInUp">update</button>
				</form>
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

