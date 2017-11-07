<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">
<head>
<!-- Meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<meta name="description" content="">
<meta name="author" content="">
<meta name="_csrf" content="${_csrf.token}" />
<!-- default header name is X-CSRF-TOKEN -->
<meta name="_csrf_header" content="${_csrf.headerName}" />
<!-- Title -->
<title>Đăng Nhập Trang Quản Trị</title>

<!-- Vendor CSS -->
<link rel="stylesheet"
	href="${contextPath }/css/bootstrap4/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${contextPath }/css/themify-icons/themify-icons.css">
<link rel="stylesheet"
	href="${contextPath }/css/font-awesome/css/font-awesome.min.css">

<!-- Neptune CSS -->
<link rel="stylesheet" href="${contextPath }/css/css/core.css">

<!-- HTML5 Shiv and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
		<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
		<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
		<![endif]-->
		<style>
/* Paste this css to your style sheet file or under head tag */
/* This only works with JavaScript, 
if it's not present, don't show loader */
.no-js #loader { display: none;  }
.js #loader { display: block; position: absolute; left: 100px; top: 0; }
.se-pre-con {
	position: fixed;
	left: 0px;
	top: 0px;
	width: 100%;
	height: 100%;
	z-index: 9999;
	background: url(../files/images/Preloader_3.gif) center no-repeat #fff;
}
</style>
</head>
<body class="auth-bg">
<div class="se-pre-con"></div>
	<div class="auth">
		<div class="auth-header">
			<div class="mb-2">
				<img src="${contextPath }/img/img/logo.png" title="">
			</div>
			<h6>Chào Mừng ! Đến Với Trang Quản Trị.</h6>
		</div>
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-4 offset-md-4">
					<form id="login-form">
						
						<%-- <span>	${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}</span> --%>
						<div class="form-group">
							<div class="input-group">
								<input name="userName" type="text" class="form-control"
									id="userName" placeholder="Email">
								<div class="input-group-addon">
									<i class="ti-email"></i>
								</div>
							</div>
						</div>
						<div class="form-group">
							<div class="input-group">
								<input name="password" type="password" class="form-control"
									id="password" placeholder="Password">
								<div class="input-group-addon">
									<i class="ti-key"></i>
								</div>
							</div>
						</div>
						<div class="form-group clearfix">
							<span style=" color: white;" id="msgerror"></span>
						</div>
						<input type="hidden" name="${_csrf.parameterName}"
							value="${_csrf.token}" />
						<div class="form-group">
							<button type="button" id="btn-login" class="btn btn-danger btn-block">Sign
								in</button>
						</div>
					</form>
					
				</div>
			</div>
		</div>
	</div>
	
	<!-- Vendor JS -->
	<script type="text/javascript"
		src="${contextPath }/js/jquery/jquery-1.12.3.min.js"></script>
	<script type="text/javascript"
		src="${contextPath }/js/tether/js/tether.min.js"></script>
	<script type="text/javascript"
		src="${contextPath }/js/bootstrap4/js/bootstrap.min.js"></script>
		<script src="http://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.2/modernizr.js"></script>
		<script>
	
	var timeout = null;
	function login() { 
			
			console.log(($('#login-form').serialize()));
		clearTimeout(timeout);
		timeout = setTimeout(
				function() {

					var token = $("meta[name='_csrf']").attr("content");
					var header = $("meta[name='_csrf_header']").attr("content");
					$(document).ajaxSend(function(e, xhr, options) {
						xhr.setRequestHeader(header, token);
					});
					$.ajax({

								type : "POST",
								//contentType : "application/json",
								url : "${pageContext.request.contextPath}/login",
								data : $('#login-form').serialize(),
								//dataType: 'json',
								// timeout: 600000,
								success : function(result) {
									console.log(result);
									if(result == 'Bad credentials'){
										$('#msgerror').text('* Sai Tên Đăng Nhập Hoặc Mật Khẩu');
									}else if(result == 'User account is locked'){
										$('#msgerror').text('* Tài Khoản Đã Bị Khóa');
									}else if(result == 'success'){
										$('#msgerror').text('');
										window.location.href = "${pageContext.request.contextPath}/";
										
									}
									
								},
								error : function(e) {
									alert("Lỗi ! Vui Lòng Kiểm Tra Lại");
								}
							});
				}, 1000); 
	 };
	
	</script>
	<script>
			var timeoutbtnlogin = null;
			$('#btn-login').click(function (){
				$(".se-pre-con").fadeOut("slow");
				clearTimeout(timeoutbtnlogin);
				timeoutbtnlogin = setTimeout(function() {
					console.log('btn login');
					var userName = $('#userName').val();
					var password = $('#password').val();
					if(userName == '' && password == ''  ){
							$('#msgerror').text('* Vui Lòng Nhập Đủ Thông Tin');
					}else if(userName ==''){ 
						$('#msgerror').text('* Vui Lòng Nhập UserName');
					}else if(password ==''){
						$('#msgerror').text('* Vui Lòng Nhập Mật Khẩu');
					}else {
						$('#msgerror').text('');
						login();
					}
			}, 1000);
		}); 
	</script>
	<script>
	//paste this code under head tag or in a seperate js file.
	// Wait for window load
	$(window).load(function() {
		// Animate loader off screen
		$(".se-pre-con").fadeOut("slow");
	});
	
</script>
</body>
</html>