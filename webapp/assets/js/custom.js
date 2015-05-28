	$("#goWriteH3").click(function() {
		location.href = "/studyer_project/board/write";
	});
	$("#goNotesH3").click(function() {
		location.href = "/studyer_project/board/list";
	});
	$("#goMyNotesH3").click(function() {
		location.href = "/studyer_project/board/list";
	});
	$("#goSignIn").click(function() {
		$("#signIn").click();
	});
	$("#goSignIn2").click(function() {
		$("#signIn").click();
	});
	
	
	$("#signUpUserEmail").on(
			"blur",
			function() {
				var email = $("#signUpUserEmail").val();
				if(email==null||email==""){
					$("#signUpMsgP").text("Email을 입력하세요.");
					return
				}
				$.ajax({
					url : "/studyer_project/member/checkEmail",
					type : "post",
					data : {
						"email" : email
					},
					success : function( response ){
				    	if( response.result == false  ) {
				    		// 사용가능
				    		$("#signUpMsgP").text(response.data);
				    		
				    	} else {
				    		$("#signUpMsgP").text(response.data);
							$("#signUpUserEmail").focus();
							$("#signUpUserEmail").val("");
				       	}
					},
					error : function(request, status, error) {
						alert("code:" + request.status + "\n" + "message:"
								+ request.responseText + "\n" + "error:"
								+ error);
					},
					dataType : "json"
				});
			});
	
	
	function signUpFormCheck() {
		var FormInputs = $("#signUpMsgP").parent().next().find("input");
		for ( var i = 0; i < FormInputs.length; i++) {
			if ($(FormInputs[i]).val() == null
					|| $(FormInputs[i]).val().trim() == "") {
				$("#signUpMsgP").text(
						$(FormInputs[i]).attr("placeholder")+" 입력하세요.");
				return false;
			}
		}
		return true;
	}
	
	function signIn() {
		var email = $("#signInUserEmail").val();
		var password = $("#signInUserPwd").val();
		
		$.ajax({
			url : "/studyer_project/member/signIn",
			type : "post",
			data : {
				"email" : email,
				"password" : password
			},
			success : function( response ){
		    	if( response.result == 'fail'  ) {
		    		// 사용가능
		    		$("#signInMsgP").text("Email 혹은 Password를 확인해주세요.");
		    		
		    	} else {
		    		location.href = "index";
		       	}
			},
			error : function(request, status, error) {
				alert("code:" + request.status + "\n" + "message:"
						+ request.responseText + "\n" + "error:" + error);
			},
			dataType : "json"
		});
	}
	
	$("#uploadImageButton").on("click", function() {
		$("#uploadImageFile").click();
	});
	$("#uploadImageFile").on(
			"change",
			function() {
				
				$("#uploadImageName").attr("value",
						$(this).val().split('/').pop().split('\\').pop());
		});

	$(".class").focus(function(){
		var categoryName = $(this).attr("name");
		$.ajax({
			url : "/studyer_project/class/"+categoryName,
			type : "post",
			success : function( response ){
				$("input[name='"+categoryName+"']").autocomplete("option", "source", response);
			},
			error : function(request, status, error) {
				alert("code:" + request.status + "\n" + "message:"
						+ request.responseText + "\n" + "error:" + error);
			},
			dataType : "json"
		});
	});
	
	$(function() {
	    $( "input[name='subjectName']" ).autocomplete();
	    $( "input[name='teacherName']" ).autocomplete();
	    $( "input[name='placeName']" ).autocomplete();
	    $( "input[name='nameName']" ).autocomplete();
	  });
	
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

	function viewContent() {
		var $content = $("#invisibleContent");
		$("#editor").contents().find("#editor").html($content.html());
	};
	
	function submitUpdate() {
		var content = $("#editor").contents().find("#editor").html();
		$("<input>").attr({name:"content", value:content, type:"hidden"}).appendTo("#writeForm");
		$("<input>").attr({name:"before_content", value:$("#invisibleContent").html(), type:"hidden"}).appendTo("#writeForm");
		$("#writeForm").submit();
	}	