<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta name="keywords"
	content="opensource rich wysiwyg text editor jquery bootstrap execCommand html5" />
<meta name="description"
	content="This tiny jQuery Bootstrap WYSIWYG plugin turns any DIV into a HTML5 rich text editor" />
<!--  editor CSS -->
<link
	href="${pageContext.request.contextPath}/assets/editor/external/google-code-prettify/prettify.css"
	rel="stylesheet">
<link
	href="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.1/css/bootstrap-combined.no-icons.min.css"
	rel="stylesheet">
<link
	href="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.1/css/bootstrap-responsive.min.css"
	rel="stylesheet">
<link
	href="http://netdna.bootstrapcdn.com/font-awesome/3.0.2/css/font-awesome.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/assets/editor/index.css"
	rel="stylesheet">
</head>
<body style="width: 100vw; height: 100vh; padding: 0;">
	<div id="alerts"></div>
	<div class="btn-toolbar" data-role="editor-toolbar"
		data-target="#editor">
		<div class="btn-group">
			<a class="btn" data-edit="bold" title="Bold (Ctrl/Cmd+B)"><i
				class="icon-bold"></i></a> <a class="btn" data-edit="italic"
				title="Italic (Ctrl/Cmd+I)"><i class="icon-italic"></i></a> <a
				class="btn" data-edit="strikethrough" title="Strikethrough"><i
				class="icon-strikethrough"></i></a> <a class="btn" data-edit="underline"
				title="Underline (Ctrl/Cmd+U)"><i class="icon-underline"></i></a>
		</div>
		<div class="btn-group">
			<a class="btn" data-edit="insertunorderedlist" title="Bullet list"><i
				class="icon-list-ul"></i></a> <a class="btn"
				data-edit="insertorderedlist" title="Number list"><i
				class="icon-list-ol"></i></a> <a class="btn" data-edit="outdent"
				title="Reduce indent (Shift+Tab)"><i class="icon-indent-left"></i></a>
			<a class="btn" data-edit="indent" title="Indent (Tab)"><i
				class="icon-indent-right"></i></a>
		</div>
		<div class="btn-group">
			<a class="btn" data-edit="justifyleft"
				title="Align Left (Ctrl/Cmd+L)"><i class="icon-align-left"></i></a>
			<a class="btn" data-edit="justifycenter" title="Center (Ctrl/Cmd+E)"><i
				class="icon-align-center"></i></a> <a class="btn"
				data-edit="justifyright" title="Align Right (Ctrl/Cmd+R)"><i
				class="icon-align-right"></i></a> <a class="btn" data-edit="justifyfull"
				title="Justify (Ctrl/Cmd+J)"><i class="icon-align-justify"></i></a>
		</div>
		<div class="btn-group">
			<a class="btn dropdown-toggle" data-toggle="dropdown"
				title="Hyperlink"><i class="icon-link"></i></a>
			<div class="dropdown-menu input-append">
				<input class="span2" placeholder="URL" type="text"
					data-edit="createLink" />
				<button class="btn" type="button">Add</button>
			</div>
			<a class="btn" data-edit="unlink" title="Remove Hyperlink"><i
				class="icon-cut"></i></a>

		</div>

		<div class="btn-group">
			<a class="btn" title="Insert picture (or just drag & drop)"
				id="pictureBtn"><i class="icon-picture"></i></a> <input type="file"
				data-role="magic-overlay" data-target="#pictureBtn"
				data-edit="insertImage" />
		</div>
		<div class="btn-group">
			<a class="btn" data-edit="undo" title="Undo (Ctrl/Cmd+Z)"><i
				class="icon-undo"></i></a> <a class="btn" data-edit="redo"
				title="Redo (Ctrl/Cmd+Y)"><i class="icon-repeat"></i></a>
		</div>
		<input type="text" data-edit="inserttext" id="voiceBtn"
			x-webkit-speech="">
	</div>
	<div style="max-height: 100vh; height: 100vh;" id="editor">Go ahead&hellip;</div>
	<script
		src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/editor/external/jquery.hotkeys.js"></script>
	<script
		src="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.1/js/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/editor/external/google-code-prettify/prettify.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/editor/bootstrap-wysiwyg.js"></script>
	<script>
		$(function() {
			function initToolbarBootstrapBindings() {
				var fonts = [ 'Serif', 'Sans', 'Arial', 'Arial Black',
						'Courier', 'Courier New', 'Comic Sans MS', 'Helvetica',
						'Impact', 'Lucida Grande', 'Lucida Sans', 'Tahoma',
						'Times', 'Times New Roman', 'Verdana' ], fontTarget = $(
						'[title=Font]').siblings('.dropdown-menu');
				$.each(
					fonts,
					function(idx, fontName) {
						fontTarget.append($('<li><a data-edit="fontName ' + fontName +'" style="font-family:\''+ fontName +'\'">'
							+ fontName + '</a></li>'));
				});
				$('a[title]').tooltip({
					container : 'body'
				});
				$('.dropdown-menu input').click(function() {
					return false;
				}).change(
						function() {
							$(this).parent('.dropdown-menu').siblings(
									'.dropdown-toggle').dropdown('toggle');
						}).keydown('esc', function() {
					this.value = '';
					$(this).change();
				});

				$('[data-role=magic-overlay]').each(
						function() {
							var overlay = $(this), target = $(overlay
									.data('target'));
							overlay.css('opacity', 0).css('position',
									'absolute').offset(target.offset()).width(
									target.outerWidth()).height(
									target.outerHeight());
						});
				if ("onwebkitspeechchange" in document.createElement("input")) {
					var editorOffset = $('#editor').offset();
					$('#voiceBtn').css('position', 'absolute').offset(
							{
								top : editorOffset.top,
								left : editorOffset.left
										+ $('#editor').innerWidth() - 35
							});
				} else {
					$('#voiceBtn').hide();
				}
			}
			;
			function showErrorAlert(reason, detail) {
				var msg = '';
				if (reason === 'unsupported-file-type') {
					msg = "Unsupported format " + detail;
				} else {
					console.log("error uploading file", reason, detail);
				}
				$(
						'<div class="alert"> <button type="button" class="close" data-dismiss="alert">&times;</button>'
								+ '<strong>File upload error</strong> '
								+ msg
								+ ' </div>').prependTo('#alerts');
			}
			;
			initToolbarBootstrapBindings();
			$('#editor').wysiwyg({
				fileUploadError : showErrorAlert
			});
			window.prettyPrint && prettyPrint();
		});
	</script>
</body>
</html>