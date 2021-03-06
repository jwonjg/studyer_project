<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<div id="signUpModal" class="modal fade" tabindex="-1" role="dialog"
	aria-hidden="true">
	<div style="margin: 100px auto;" class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button id="closeLoginModal" type="button" class="close"
					data-dismiss="modal" aria-hidden="true">x</button>
				<c:choose>
					<c:when test="${ empty authUser }">
						<h1 class="text-center">Register</h1>
					</c:when>
					<c:otherwise>
						<h1 class="text-center">My Page</h1>
					</c:otherwise>
				</c:choose>
			</div>
			<div class="modal-body">
				<div style="text-align: center;" class="form-group">
					<p id="signUpMsgP" style="color: #E7746F">Please fill blanks</p>
				</div>
				<c:choose>
					<c:when test="${ empty authUser }">
						<form onsubmit="return signUpFormCheck();"
							class="form col-md-12 center-block" method="post"
							action="${pageContext.request.contextPath}/member/signUp"
							enctype="multipart/form-data">
					</c:when>
					<c:otherwise>
						<form onsubmit="return signUpFormCheck();"
							class="form col-md-12 center-block" method="post"
							action="${pageContext.request.contextPath}/member/userinfo"
							enctype="multipart/form-data">
					</c:otherwise>
				</c:choose>
				<span style="color: #E7746F">Email</span>
				<div class="form-group">
					<input type="text" id="signUpUserEmail"
						class="form-control input-lg" placeholder="Email" name="email"
						value="${sessionScope.authUser.email}">
				</div>
				<span style="color: #E7746F">Password</span>
				<div class="form-group">
					<input type="password" id="signUpUserPwd" name="password"
						value="${sessionScope.authUser.password}"
						class="form-control input-lg" placeholder="Password">
				</div>
				<span style="color: #E7746F">Name</span>
				<div class="form-group">
					<input type="text" name="name"
						value="${sessionScope.authUser.name}"
						class="form-control input-lg" placeholder="Name">
				</div>
								
					<div class="form-group" style="margin-bottom: 30px;">
							<span style="color: #E7746F">Photo</span>
							<div id="optionAddingDiv">
								<div id="optionDiv" style="margin-bottom: 5px;"
									class="input-group form-control">
									<input type="hidden" name="isImageExist" value="false">
									<!-- 사진 -->
									<input id="uploadImageFile" name="file" type="file"
										style="visibility: hidden; display: inline-block; width: 0px;">
									<!-- 옵션이름 -->
									<input id="uploadImageName" name="uploadImageName" style="border: none; padding: 0;"
										type="text" class="form-control input-lg" placeholder="Photo">
									<div class="input-group-btn">
										<button id="uploadImageButton" type="button"
											class="btn btn-default">append image</button>
										<button name="optionDelete"
											style="padding: 10px; background: none; visibility: hidden;"
											type="button" class="btn btn-default">x</button>
									</div>
								</div>
							</div>
				</div>

				<div class="form-group">
					<c:choose>
						<c:when test="${ empty authUser }">
							<button style="background: rgba(17, 17, 17, 0.8)"
								class="btn btn-primary btn-lg btn-block">Welcome</button>
						</c:when>
						<c:otherwise>
							<button style="background: rgba(17, 17, 17, 0.8)"
								class="btn btn-primary btn-lg btn-block">Update</button>
						</c:otherwise>
					</c:choose>
				</div>
				</form>
			</div>
			<div style="border: none;" class="modal-footer">
				<div class="col-md-12">
					<button onclick="cancelSignUpModal()" class="btn"
						data-dismiss="modal" aria-hidden="true">Cancel</button>
				</div>
			</div>
		</div>
	</div>
</div>

