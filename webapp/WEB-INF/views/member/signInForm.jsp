<div id="loginModal" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
  <div style="margin: 100px auto;" class="modal-dialog">
  <div class="modal-content">
      <div class="modal-header">
          <button id="closeLoginModal" type="button" class="close" data-dismiss="modal" aria-hidden="true">x</button>
          <h1 class="text-center">Login</h1>
      </div>
      <form id="login-form" name="loginform" method="post" action="${pageContext.request.contextPath}/member/signIn">
      <div class="modal-body">
          <div class="form col-md-12 center-block"> 
          <input type="hidden" name="command" value="signIn" />
         
            <div style="text-align: center;" class="form-group">
              <p id="signInMsgP" style="color: #E7746F">Enter email and password</p>
            </div>
            <div class="form-group">
              <input type="text" id="signInUserEmail" name="email" class="form-control input-lg" placeholder="Email">
            </div>
            <div class="form-group">
              <input type="password" id="signInUserPwd" name="password" class="form-control input-lg" placeholder="Password">
            </div>
            <div class="form-group">
              <button onclick="signIn()" style="background: rgba(17, 17, 17, 0.8)" class="btn btn-primary btn-lg btn-block">Sign In</button>
            </div>
          </div>
      </div>
      </form>
      <div style="border: none;" class="modal-footer">
          <div class="col-md-12">
          <button onclick="cancelSignInModal()" class="btn" data-dismiss="modal" aria-hidden="true">Cancel</button>
		  </div>	
      </div>
  </div>
  </div>
</div>

