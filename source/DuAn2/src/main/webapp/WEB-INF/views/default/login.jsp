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
</head>
<body class="auth-bg">

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
					<form:form action="${contextPath }/login" method="post">
						<span>${error}</span>
						<%-- <span>	${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}</span> --%>
						<div class="form-group">
							<div class="input-group">
								<input name="userName" type="text" class="form-control"
									id="exampleInputEmail" placeholder="Email">
								<div class="input-group-addon">
									<i class="ti-email"></i>
								</div>
							</div>
						</div>
						<div class="form-group">
							<div class="input-group">
								<input name="password" type="password" class="form-control"
									id="exampleInputPassword" placeholder="Password">
								<div class="input-group-addon">
									<i class="ti-key"></i>
								</div>
							</div>
						</div>
						<div class="form-group clearfix">
							<div class="float-xs-left">
								<label class="custom-control custom-checkbox"> <input
									type="checkbox" class="custom-control-input"> <span
									class="custom-control-indicator"></span> <span
									class="custom-control-description font-90">Remember me</span>
								</label>
							</div>
							<div class="float-xs-right">
								<a class="text-white font-90" href="pages-sign-in2.html#">Forgot
									password?</a>
							</div>
						</div>
						<input type="hidden" name="${_csrf.parameterName}"
							value="${_csrf.token}" />
						<div class="form-group">
							<button type="submit" class="btn btn-danger btn-block">Sign
								in</button>
						</div>
					</form:form>
					<div class="row">
						<div class="col-xs-6">

							<form:form action="${contextPath }/signin/facebook" method="POST">
								<input type="hidden" name="scope" value="public_profile" />
								<button type="submit"
									class="btn bg-facebook btn-block label-left mb-0-25">
									<span class="btn-label"><i class="ti-facebook"></i></span>
									Facebook
								</button>

							</form:form>
						</div>
						<div class="col-xs-6">
							<button type="button"
								class="btn bg-twitter btn-block label-left mb-0-25">
								<span class="btn-label"><i class="ti-twitter"></i></span>
								Twitter
							</button>
						</div>
					</div>
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
</body>
</html>