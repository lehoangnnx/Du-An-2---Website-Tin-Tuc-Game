<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!-- Login Form -->

<div id="modal" class="popupContainer" style="display: none;">
	<header class="popupHeader">
		<span class="header_title">Đăng nhập</span> <span class="modal_close"><i
			class="fa fa-times"></i></span>
	</header>

	<section class="popupBody">
		<!-- Social Login -->
		<div class="social_login">


				<a style="color: white;" id="btn-facebook" class="btn btn-block btn-social btn-facebook">
					<span class="fa fa-facebook"></span> Đăng nhập bằng Facebook
				</a>

			<a style="color: white;" id="btn-google" class="btn btn-block btn-social btn-google">
				<span class="fa fa-google-plus"></span> Đăng Nhập Bằng Google
			</a>




			<div class="centeredText">
				<span style="font-size: 15px;">Hoặc đăng nhập bằng Tài Khoản</span>
			</div>

			<div class="action_btns">
				<div class="one_half">
					<a href="#" id="login_form" class="btn">Đăng nhập</a>
				</div>
				<div class="one_half last">
					<a href="#" id="register_form" class="btn">Đăng ký</a>
				</div>
			</div>
		</div>

		<!-- Username & Password Login form -->
		<div class="user_login">
			<form id="login-form">
				<label>Tài khoản</label> <input id="userName" name="userName"
													   type="text"/> <br/> <label>Mật khẩu</label> <input
					id="password" name="password" type="password"/> <br/> <label
					id="msgerror" class="msgerror"></label> <br/>
				<div class="checkbox">
					<input id="remember" type="checkbox" name="remember-me"/> <label
						for="remember">Lưu tài khoản</label>
				</div>

				<div class="action_btns">
					<div class="one_half">
						<a href="#" class="btn back_btn"><i
								class="fa fa-angle-double-left"></i> Quay lại</a>
					</div>

					<button type="button" id="btn-login"
							class="one_half last btn btn_red">Đăng nhập
					</button>
				</div>
			</form>

			<a href="#" id="forgot_password" class="forgot_password">Quên mật khẩu?</a>
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
								class="fa fa-angle-double-left"></i> Quay lại</a>
					</div>
					<button type="button" id="btn-register" disabled
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
								class="fa fa-angle-double-left"></i> Quay lại</a>
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
						<img style=" width: 50%;height: auto;" alt="${contextPath}/" src="${contextPath}/images/logo2.png"><br>
						<p>
							© Copyright 2007 - 2017 – By FourHansTeam<br>Tầng 2 Toà nhà
							VIB - 27 Nguyễn Tất Thành, Buôn Ma Thuột<br>Giấy phép thiết
							lập trang thông tin điện tử tổng hợp trên internet số 1395
						</p>
					</div>
					<div class="col-md-4 col-sm-8" style="margin-top: 17px;">
						<h3>Ban biên tập Game24h</h3>
						<p>
							Điện thoại: 0941.41.4307<br>Email: websitegame24h@gmail.com<br>Chịu
							trách nhiệm quản lý nội dung: Ông Phạm Văn Hùng<br>27 Nguyễn
							Tất Thành, Tp. Buôn Ma Thuột
						</p>
					</div>
					<div class="col-md-4 col-sm-8" style="margin-top: 17px;">
						<h3>Liên hệ quảng cáo</h3>
						<p>
							Admicro Hotline hỗ trợ quảng cáo: 0989.007.595<br>Email:
							websitegame24h@gmail.com<br>Hỗ trợ & CSKH: Admicro Address:
							Tâng 2 - 27 Nguyễn Tất Thành, Tp. Buôn Ma Thuột
						</p>
					</div>

				</div>
				<p>Ngôn Ngữ</p>
				<div style="margin:15px;" id="google_translate_element"></div>
				<script type="text/javascript">
                    function googleTranslateElementInit() {
                        new google.translate.TranslateElement({pageLanguage: 'vi', includedLanguages: 'en,fr,fy,ru,vi,zh-CN', layout: google.translate.TranslateElement.InlineLayout.SIMPLE, gaTrack: true, gaId: 'UA-110169898-1'}, 'google_translate_element');
                    }
				</script><script type="text/javascript" src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>

				<p style="font-weight: bold;">
					Copyright &copy; 2017 - <a href="#">Game24h</a> | Four Hands Team
				</p>
			</div>
		</div>
		<a class="scroll-up shad" href="#" id="back-to-top"><i
			class="fa fa-angle-up"></i></a>

	</footer>
	<div id="LoadingImage" style="display: none">
  <img src="${contextPath }/images/load3.gif" />
</div>