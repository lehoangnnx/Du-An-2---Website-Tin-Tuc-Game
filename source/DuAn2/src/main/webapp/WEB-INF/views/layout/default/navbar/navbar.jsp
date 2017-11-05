<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<header id="navigation">
		<div class="navbar navbar-inverse navbar-fixed-top" role="banner">
			<div class="container" style="margin-top: -10px;">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target=".navbar-collapse">
						<span class="sr-only">Navigation</span> <span class="icon-bar"></span>
						<span class="icon-bar"></span> <span class="icon-bar"></span>
					</button>
					<div class="text-center">
						<a class="navbar-brand " href="index.html"><h1>
								<img class=" " src="images/logo2.png" alt="logo">
							</h1></a>
					</div>
				</div>
				<div class="collapse navbar-collapse  main-nav1">
					<ul class="nav navbar-nav navbar-right">
						<li class="scroll active"><a href="#navigation">Trang chủ</a></li>
						<li class="scroll"><a href="#">Review</a></li>
						<li class="scroll"><a href="#">Video</a></li>
						<li class="scroll"><a href="#">Khám phá</a></li>
						<li class="scroll"><a href="#">Trải nghiệm</a></li>
						<li class="scroll"><a href="#">Forum</a></li>
						<li class="scroll"><a href="#">Tải game</a></li>
						<li class="scroll"><a href="#">Liên hệ</a></li>
						<li class="scroll"><a class="cd-signup" href="#0">Đăng nhập</a></li>
						<!-- <li class="dropdown"><a class="dropdown-toggle"
							data-toggle="dropdown" href="#">Đăng nhập<span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="#">Facebook</a></li>
								<li><a href="#">Google</a></li>
								<li><a id="openFormLogin" class="cd-signin" href="#0">Tài Khoản</a></li>
							</ul></li> -->
						<!-- <li class="fa fa-caret-down" style="font-size: 26px">
						</li> -->
					</ul>
				</div>
			</div>
		</div>
		<!--/navbar-->
	</header>
	<!--/Đóng header-->
	<!--/Tìm kiếm-->
	<div class="content">
		<div class="container">
			<div class="row">
				<div class="col-md-12 push-right">
					<div class="search">
						<form class="navbar-form navbar-right" action="#" method="post">
							<div class="form-group">
								<input type="text" class="form-control" placeholder="Search">
								<button type="submit" class="btn btn-default"
									aria-label="Left Align">
									<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
								</button>
							</div>
						</form>
					</div>
				</div>

			</div>
		</div>
	</div>

	<!--/Đóng tìm kiếm-->
	<div class="content">
		<div class="container">
			<div class="row">

				<div class="col-md-12 push-right">
					<div class="ot-breaking-news-body mouseenter"
						data-breaking-timeout="4000" data-breaking-autostart="true">
						<div class="ot-breaking-news-controls">
							<strong><i class="fa fa-bar-chart"></i>Thông tin game
								24h : </strong>
						</div>
						<div class="ot-breaking-news-content">
							<marquee behavior="scroll" direction="left" scrollamount="8"
								scrolldelay="20" width="90%">
								<FONT face="Tahoma" size="2" color="#fc7700"> Game
									mobile: Overhit – Game Mobile bom tấn với đồ họa cực khủng ấn
									định ra mắt cuối năm nay (02-11-2017 19:33)</FONT>
							</marquee>

						</div>
						<!-- END .ot-breaking-news-body -->
					</div>

				</div>
			</div>
		</div>
	</div>
	
	
	<!-- Login Form -->
	<div class="cd-user-modal"> <!-- this is the entire modal form, including the background -->
		<div class="cd-user-modal-container"> <!-- this is the container wrapper -->
			<ul class="cd-switcher">
				<li><a href="#0">Sign in</a></li>
				<li><a href="#0">New account</a></li>
			</ul>

			<div id="cd-login"> <!-- log in form -->
				<form class="cd-form">
					<p class="fieldset">
						<label class="image-replace cd-email" for="signin-email">E-mail</label>
						<input class="full-width has-padding has-border" id="signin-email" type="email" placeholder="E-mail">
						<span class="cd-error-message">Error message here!</span>
					</p>

					<p class="fieldset">
						<label class="image-replace cd-password" for="signin-password">Password</label>
						<input class="full-width has-padding has-border" id="signin-password" type="text"  placeholder="Password">
						<a href="#0" class="hide-password">Hide</a>
						<span class="cd-error-message">Error message here!</span>
					</p>

					<p class="fieldset">
						<input type="checkbox" id="remember-me" checked>
						<label for="remember-me">Remember me</label>
					</p>

					<p class="fieldset">
						<input class="full-width" type="submit" value="Login">
					</p>
				</form>
				
				<p class="cd-form-bottom-message"><a href="#0">Forgot your password?</a></p>
				<!-- <a href="#0" class="cd-close-form">Close</a> -->
			</div> <!-- cd-login -->

			<div id="cd-signup"> <!-- sign up form -->
				<form class="cd-form">
					<p class="fieldset">
						<label class="image-replace cd-username" for="signup-username">Username</label>
						<input class="full-width has-padding has-border" id="signup-username" type="text" placeholder="Username">
						<span class="cd-error-message">Error message here!</span>
					</p>

					<p class="fieldset">
						<label class="image-replace cd-email" for="signup-email">E-mail</label>
						<input class="full-width has-padding has-border" id="signup-email" type="email" placeholder="E-mail">
						<span class="cd-error-message">Error message here!</span>
					</p>

					<p class="fieldset">
						<label class="image-replace cd-password" for="signup-password">Password</label>
						<input class="full-width has-padding has-border" id="signup-password" type="text"  placeholder="Password">
						<a href="#0" class="hide-password">Hide</a>
						<span class="cd-error-message">Error message here!</span>
					</p>

					<p class="fieldset">
						<input type="checkbox" id="accept-terms">
						<label for="accept-terms">I agree to the <a href="#0">Terms</a></label>
					</p>

					<p class="fieldset">
						<input class="full-width has-padding" type="submit" value="Create account">
					</p>
				</form>

				<!-- <a href="#0" class="cd-close-form">Close</a> -->
			</div> <!-- cd-signup -->

			<div id="cd-reset-password"> <!-- reset password form -->
				<p class="cd-form-message">Lost your password? Please enter your email address. You will receive a link to create a new password.</p>

				<form class="cd-form">
					<p class="fieldset">
						<label class="image-replace cd-email" for="reset-email">E-mail</label>
						<input class="full-width has-padding has-border" id="reset-email" type="email" placeholder="E-mail">
						<span class="cd-error-message">Error message here!</span>
					</p>

					<p class="fieldset">
						<input class="full-width has-padding" type="submit" value="Reset password">
					</p>
				</form>

				<p class="cd-form-bottom-message"><a href="#0">Back to log-in</a></p>
			</div> <!-- cd-reset-password -->
			<a href="#0" class="cd-close-form">Close</a>
		</div> <!-- cd-user-modal-container -->
	</div>