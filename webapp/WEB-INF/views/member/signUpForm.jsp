<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div id="signUpModal" class="modal fade" tabindex="-1" role="dialog"
	aria-hidden="true">
	<div style="margin: 100px auto;" class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button id="closeLoginModal" type="button" class="close" data-dismiss="modal" aria-hidden="true">x</button>
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
	            <form onsubmit="return signUpFormCheck();" class="form col-md-12 center-block" method="post" action="signUp.user">
	  				<c:choose>
						<c:when test="${ empty authUser }">
							<input type="hidden" name="command" value="signUp">
						</c:when>
						<c:otherwise>
							<input type="hidden" name="command" value="userInfo">
						</c:otherwise>
					</c:choose>
					<span style="color: #E7746F">ID</span>
					<div class="form-group">
						<input type="text" id="signUpUserEmail" class="form-control input-lg"
							placeholder="Email" name="userEmail"
							value="${sessionScope.authUser.userEmail}">
					</div>
					<span style="color: #E7746F">Password</span>
					<div class="form-group">
						<input type="password" name="userPwd"
							value="${sessionScope.authUser.userPwd}"
							class="form-control input-lg" placeholder="Password">
					</div>
					<span style="color: #E7746F">Nickname</span>
					<div class="form-group">
						<input type="text" name="userName"
							value="${sessionScope.authUser.userName}"
							class="form-control input-lg" placeholder="Nickname">
					</div>
					<span style="color: #E7746F">Gender</span>
					<div class="form-group input-lg">
						<div>
							<input id="male" name="userGender" type="radio" value="male"
								${sessionScope.authUser.userGender == 'male'? 'checked':''}><label
								style="margin: auto 10px;" for="male">male</label> 
							<input id="female" name="userGender" type="radio" value="female"
								${sessionScope.authUser.userGender == 'female'? 'checked':''}><label
								style="margin: auto 10px;" for="female">female</label>
						</div>
					</div>
					<span style="color: #E7746F">Age</span>
					<div class="form-group">
						<input name="userAge" min="0" max="100" type="number"
							value="${sessionScope.authUser.userAge}"
							class="form-control input-lg" placeholder="Age">
					</div>
					<div class="form-group">
						<span style="color: #E7746F">Job</span> <select
							class="form-control input-lg" name="userJob">
							<option value="student"
								${sessionScope.authUser.userJob == 'student'? 'selected':''}>student</option>
							<option value="employee"
								${sessionScope.authUser.userJob == 'employee'? 'selected':''}>employee</option>
						</select>
					</div>
					<div class="form-group">
						<c:choose>
							<c:when test="${ empty authUser }">
								<button style="background: rgba(17, 17, 17, 0.8)"  class="btn btn-primary btn-lg btn-block">Welcome</button>
							</c:when>
							<c:otherwise>
								<button style="background: rgba(17, 17, 17, 0.8)" class="btn btn-primary btn-lg btn-block">Update</button>
							</c:otherwise>
						</c:choose>
					</div>
				</form>
			</div>
			<div style="border: none;" class="modal-footer">
				<div class="col-md-12">
					<button onclick="cancelSignUpModal()" class="btn" data-dismiss="modal" aria-hidden="true">Cancel</button>
				</div>
			</div>
		</div>
	</div>
</div>

