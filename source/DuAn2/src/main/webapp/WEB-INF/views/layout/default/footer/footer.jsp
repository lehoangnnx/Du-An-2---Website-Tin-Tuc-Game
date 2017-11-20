<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- Login Form -->
<div id="modal" class="popupContainer" style="display: none;">
	<header class="popupHeader">
		<span class="header_title">Login</span> <span class="modal_close"><i
			class="fa fa-times"></i></span>
	</header>

	<section class="popupBody">
		<!-- Social Login -->
		<div class="social_login">
			<div class="">
				<form:form action="${contextPath }/signin/facebook" method="POST">
					<input type="hidden" name="scope" value="public_profile"/>
					<input type="hidden" name="${_csrf.parameterName}"
						   value="${_csrf.token}"/>

					<button type="submit" class="loginBtn loginBtn--facebook">Login
						with Facebook
					</button>
				</form:form>


			</div>
			<div id="btn-google" class="g-signin2 " data-width="290"
				 data-height="32" data-longtitle="true" data-onsuccess="onSignIn" data-theme="dark"></div>


			<div class="centeredText">
				<span>Or use your Email address</span>
			</div>

			<div class="action_btns">
				<div class="one_half">
					<a href="#" id="login_form" class="btn">Login</a>
				</div>
				<div class="one_half last">
					<a href="#" id="register_form" class="btn">Sign up</a>
				</div>
			</div>
		</div>

		<!-- Username & Password Login form -->
		<div class="user_login">
			<form id="login-form">
				<label>Email / Username</label> <input id="userName" name="userName"
													   type="text"/> <br/> <label>Password</label> <input
					id="password" name="password" type="password"/> <br/> <label
					id="msgerror" class="msgerror"></label> <br/>
				<div class="checkbox">
					<input id="remember" type="checkbox" name="remember-me"/> <label
						for="remember">Remember me on this computer</label>
				</div>

				<div class="action_btns">
					<div class="one_half">
						<a href="#" class="btn back_btn"><i
								class="fa fa-angle-double-left"></i> Back</a>
					</div>

					<button type="button" id="btn-login"
							class="one_half last btn btn_red">Login
					</button>
				</div>
			</form>

			<a href="#" id="forgot_password" class="forgot_password">Forgot password?</a>
		</div>

		<!-- Register Form -->
		<div class="user_register">
			<form id="register-form">
				<label>Tên Đăng Nhập</label> <input id="userNamer" type="text"/> <br/>

				<label>Email</label> <input id="emailr" type="email"/> <br/>

				<label>Mật Khẩu</label> <input id="passwordr"
											   type="password"/> <br/>
				<label>Nhập Lại Mật Khẩu</label> <input id="rppasswordr"
														type="password"/> <br/>
				<label id="msgerror-r" class="msgerror"></label> <br/>
				<div class="action_btns">
					<div class="one_half">
						<a href="#" class="btn back_btn"><i
								class="fa fa-angle-double-left"></i> Back</a>
					</div>
					<button type="button" id="btn-register"
							class="one_half last btn btn_red">Đăng Ký
					</button>

				</div>
			</form>
		</div>

		<!-- Fogit Password Form -->
		<div class="user_forgot">
			<form id="forgot-form">
				<label>Tên Đăng Nhập</label> <input id="userNamef" type="text"/> <br/>

				<label id="msgerror-f" class="msgerror"></label> <br/>
				<div class="action_btns">
					<div style="padding: 10px;" data-callback="recaptchaCallback" class="g-recaptcha" data-sitekey="6LfS7DgUAAAAAGOzeNHJyHgF0VxVzsfqbF7C09yb"></div>

					<div class="one_half">
						<a href="#" class="btn back_btn"><i
								class="fa fa-angle-double-left"></i> Back</a>
					</div>
					<button disabled type="button" id="btn-forgot"
							class="one_half last btn btn_red">Gửi
					</button>

				</div>
			</form>
		</div>
	</section>
</div>
<footer class="footer">
		<div class="container">
			<div class="text-center">
				<div class="row">
					<div class="col-md-4 col-sm-8" style="margin-top: 17px;">
						<img alt="#" src="images/logo2.png"><br>
						<p>
							© Copyright 2007 - 2017 – By FourHansTeam<br>Tầng 3 Toà nhà
							VIB - 27 Nguyễn Tất Thành, Buôn Ma Thuột<br>Giấy phép thiết
							lập trang thông tin điện tử tổng hợp trên internet số 1395
						</p>
					</div>
					<div class="col-md-4 col-sm-8">
						<h3>Ban biên tập Game24h</h3>
						<p>
							Điện thoại: 0941.41.4307<br>Email: info@game24h.vn<br>Chịu
							trách nhiệm quản lý nội dung: Ông Phạm Văn Hùng<br>27 Nguyễn
							Tất Thành, Tp. Buôn Ma Thuột
						</p>
					</div>
					<div class="col-md-4 col-sm-8">
						<h3>Liên hệ quảng cáo</h3>
						<p>
							Admicro Hotline hỗ trợ quảng cáo: 0942 86 1<br>Email:
							giaitrixahoi@admicro.vn<br>Hỗ trợ & CSKH: Admicro Address:
							Tầng 20, Tòa nhà Center Building
						</p>
					</div>

				</div>
				<p style="font-weight: bold;">
					Copyright &copy; 2017 - <a href="#">Game24h</a> | Four Hand Team
				</p>
			</div>
		</div>
		<a class="scroll-up shad" href="#" id="back-to-top"><i
			class="fa fa-angle-up"></i></a>

	</footer>
	<div id="LoadingImage" style="display: none">
  <img src="${contextPath }/images/load2.gif" />
</div>