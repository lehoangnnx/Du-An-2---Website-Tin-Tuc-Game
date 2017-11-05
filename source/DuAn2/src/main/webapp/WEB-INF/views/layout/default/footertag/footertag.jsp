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
<script src="${contextPath}/js/js/modernizr-login.js"></script> <!-- Modernizr -->
<script src="${contextPath}/js/js/main-login.js"></script> <!-- Gem jQuery -->

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