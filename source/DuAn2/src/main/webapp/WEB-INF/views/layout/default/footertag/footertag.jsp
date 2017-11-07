<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<script type="text/javascript" src="${contextPath}/js/js/jquery-latest.min.js"></script>
	<script type="text/javascript" src="${contextPath}/js/js/jquery.js"></script>
	<script type="text/javascript" src="${contextPath}/js/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${contextPath}/js/js/smoothscroll.js"></script>

	<!-- <script type="text/javascript" src="${contextPath}/js/js/main.js"></script>-->

	<script src="${contextPath}/js/sliderengine/amazingslider.js"></script>
	<script src="${contextPath}/js/sliderengine/initslider-1.js"></script>

<script src='${contextPath}/js/js/jquery.leanModal.min_.js'></script>
	<script src="https://apis.google.com/js/platform.js" async defer></script>
	<script>
		jQuery(".widget-tabbed > h3 span", ".sidebar").on(
				"click",
				function() {
					var thisel = jQuery(this);
					thisel.addClass("active").siblings(".active").removeClass(
							"active").parent().siblings("div").eq(
							thisel.index()).addClass("active").siblings(
							".active").removeClass("active");
					return false;
				});
	</script>
	<script>
		if ($('#back-to-top').length) {
			var scrollTrigger = 100, // px
			backToTop = function() {
				var scrollTop = $(window).scrollTop();
				if (scrollTop > scrollTrigger) {
					$('#back-to-top').addClass('show');
				} else {
					$('#back-to-top').removeClass('show');
				}
			};
			backToTop();
			$(window).on('scroll', function() {
				backToTop();
			});
			$('#back-to-top').on('click', function(e) {
				e.preventDefault();
				$('html,body').animate({
					scrollTop : 0
				}, 700);
			});
		}
	</script>
	<script>
		(function($) {
			"use strict";

			Array.prototype.forEach2 = function(a) {
				var l = this.length;
				for (var i = 0; i < l; i++)
					a(this[i], i)
			};

			jQuery(document)
					.on(
							"ready",
							function() {

								// Breaking slider main function
								function otBreakingSlide(item, direction,
										thisisbutton) {
									if (item.data("breaking-hover") == true
											&& !thisisbutton) {
										return false;
									}
									if (thisisbutton) {
										clearInterval(item
												.data("breaking-function"));
									}
									if (direction == "right"
											&& parseInt(item
													.data("breaking-current"),
													10) + 1 < parseInt(item
													.data("breaking-size"), 10)) {
										item
												.find(
														".ot-breaking-news-content .item")
												.eq(0)
												.css(
														"margin-left",
														"-"
																+ (100 * (parseInt(
																		item
																				.data("breaking-current"),
																		10) + 1))
																+ "%");
										item.data("breaking-current", parseInt(
												item.data("breaking-current"),
												10) + 1);
									} else if (direction == "right") {
										item
												.find(
														".ot-breaking-news-content .item")
												.eq(0)
												.css("margin-left", "0px");
										item.data("breaking-current", "0");
									}
									if (direction == "left"
											&& parseInt(item
													.data("breaking-current"),
													10) - 1 >= 0) {
										item
												.find(
														".ot-breaking-news-content .item")
												.eq(0)
												.css(
														"margin-left",
														"-"
																+ (100 * (parseInt(
																		item
																				.data("breaking-current"),
																		10) - 1))
																+ "%");
										item.data("breaking-current", parseInt(
												item.data("breaking-current"),
												10) - 1);
									} else if (direction == "left") {
										item
												.find(
														".ot-breaking-news-content .item")
												.eq(0)
												.css(
														"margin-left",
														"-"
																+ (100 * (parseInt(
																		item
																				.data("breaking-size"),
																		10) - 1))
																+ "%");
										item.data("breaking-current",
												parseInt(item
														.data("breaking-size"),
														10) - 1);
									}
								}

								jQuery("a[href='#top']", "body").on("click",
										function() {
											jQuery("body,html").animate({
												scrollTop : 0
											}, 500);
											return false;
										});

								jQuery(".ot-breaking-news-body", ".content")
										.toArray()
										.forEach2(
												function(a) {
													var thisel = jQuery(a), thiscontrol = thisel
															.find(
																	".ot-breaking-news-content .item")
															.eq(0), slidetimeout = (thisel
															.data("breaking-timeout") && parseInt(thisel
															.data("breaking-timeout")) >= 1000) ? parseInt(thisel
															.data("breaking-timeout"))
															: 2000;
													thisel
															.data(
																	"breaking-size",
																	thisel
																			.find(
																					".ot-breaking-news-content .item")
																			.size())
															.data(
																	"breaking-current",
																	"0");

													if (thisel
															.data("breaking-autostart") == true) {
														thisel
																.data(
																		"breaking-function",
																		setInterval(
																				function() {
																					otBreakingSlide(
																							thisel,
																							"right");
																				},
																				slidetimeout));
													}
												});

								jQuery(".ot-breaking-news-body", ".content")
										.on(
												"mouseenter",
												function() {
													jQuery(this).addClass(
															"mouseenter").data(
															"breaking-hover",
															true);
												}).on(
												"mouseleave",
												function() {
													jQuery(this).removeClass(
															"mouseenter").data(
															"breaking-hover",
															false);
												});

								jQuery("button[data-break-dir='right']",
										".ot-breaking-news-controls").on(
										"click",
										function() {
											otBreakingSlide(jQuery(this)
													.parent().parent(),
													"right", true);
											return false;
										});

								jQuery("button[data-break-dir='left']",
										".ot-breaking-news-controls").on(
										"click",
										function() {
											otBreakingSlide(jQuery(this)
													.parent().parent(), "left",
													true);
											return false;
										});

							});

		})(jQuery);
	</script>
	
	
	<script>
	// Plugin options and our code
	
	$("#modal_trigger").leanModal({
			top: 100,
			overlay: 0.6,
			closeButton: ".modal_close"
	});

	$(function() {
			// Calling Login Form
			$("#login_form").click(function() {
					$(".social_login").hide();
					$(".user_login").show();
					return false;
			});

			// Calling Register Form
			$("#register_form").click(function() {
					$(".social_login").hide();
					$(".user_register").show();
					$(".header_title").text('Register');
					return false;
			});

			// Going back to Social Forms
			$(".back_btn").click(function() {
					$(".user_login").hide();
					$(".user_register").hide();
					$(".social_login").show();
					$(".header_title").text('Login');
					return false;
			});
	});
	</script>
	
	
	<!-- Controller Form Login Ajax -->
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
	
	<script type="text/javascript">
      function onSignIn(googleUser) {
      // window.location.href='success.jsp';
      var profile = googleUser.getBasicProfile();
      var imagurl=profile.getImageUrl();
      var name=profile.getName();
      var email=profile.getEmail();
		console.log("progilr :"+profile +"-"+"img :"+imagurl +"-"+"name :"+name+"-"+"email :"+email);
		console.log("ID: " + profile.getId()); // Don't send this directly to your server!
        console.log('Full Name: ' + profile.getName());
        console.log('Given Name: ' + profile.getGivenName());
        console.log('Family Name: ' + profile.getFamilyName());
        console.log("Image URL: " + profile.getImageUrl());
        console.log("Email: " + profile.getEmail());

        // The ID token you need to pass to your backend:
        var id_token = googleUser.getAuthResponse().id_token;
        console.log("id_token: " + id_token);
       
		var xhr = new XMLHttpRequest();
		xhr.open('GET', '${pageContext.request.contextPath}/signin-google?idtoken='+id_token,true);
		xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
		xhr.onload = function() {
		  console.log('Signed in as: ' + xhr.responseText);
		};
		xhr.send("idtoken="+ id_token);
           // document.location.href = '${pageContext.request.contextPath}/'; 
        
   }
      
   </script>
   
   <script>
      function myFunction() {
      gapi.auth2.getAuthInstance().disconnect();
      location.reload();
   }
   </script>
