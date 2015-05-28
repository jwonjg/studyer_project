<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html>
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

<body onload="viewContent()">
	<header class="header"> 
		<c:import url="/WEB-INF/views/include/header.jsp"/>
	</header>

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
					<input type="hidden" name="no" value="${ requestScope.board.no }">
					<div style="padding: 0;" class="navbar-form">
						<span style="color: #E7746F">Category</span> 
						<div>
						<input type="text" class="form-control input-lg" placeholder="주제" 
								name="subject" value="${c_vo.subjectName}">
						<input type="text" class="form-control input-lg" placeholder="강사" 
								name="teacher" value="${c_vo.teacherName}">
						<input type="text" class="form-control input-lg" placeholder="기관" 
								name="place" value="${c_vo.placeName}">
						<input type="text" class="form-control input-lg" placeholder="강의명" 
							name="name" value="${c_vo.nameName}">
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
					
					<button onclick="submitWrite();" type="button" class="btn btn-lg btn-block wow fadeInUp">update</button>
				</form>
			</div>
		</div>
	</section>
	
	<footer id="footer">
		<c:import url="/WEB-INF/views/include/footer.jsp"></c:import>
	</footer>
	
	<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/bootstrap/js/bootstrap.min.js"></script>
	
	<script type="text/javascript">
	function viewContent() {
		var $content = $("#invisibleContent");
		$("#editor").contents().find("#editor").html($content.html());
	};
	
/* 	function updateContent(){		
		var content = $("#editor").contents().find("#editor").html();
		$("<input>").attr({name:"content", value:content, type:"hidden"}).appendTo("#writeForm");
		$("#writeForm").submit();
	}; */
	
	</script>

</body>
</html>
