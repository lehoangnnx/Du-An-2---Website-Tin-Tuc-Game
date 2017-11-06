<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<div class="content-block-single">

	<div class="content-panel">
		<div class="content-panel-title">
			<div class="feed-widget-header">
				<h2 class="widget-title feed-widget-title">
					<a href="#">VIDEO</a>
				</h2>
				<div class="feed-widget-viewall">
					<a href="#"><span>XEM THÊM</span> <i
						class="fa fa-chevron-right"></i></a>
				</div>
				<div class="clear"></div>
			</div>
		</div>

		<div class="content-panel-body article-list">
			<div class="item">
				<div class="col-xs-12 col-sm-12 col-md-12">
					<article class="content">
						<div id="amazingslider-wrapper-1"
							style="display: block; position: relative; max-width: 900px; padding-left: 0px; padding-right: 244px; margin: 0px auto 0px;">
							<div id="amazingslider-1"
								style="display: block; position: relative; margin: 0 auto;">
								<ul class="amazingslider-slides" style="display: none;">
									<li><img src="images/slider/1.jpg"
										alt="Optimus Stream | Giáo Sư Cường 10 Tỉ"
										title="Optimus Stream | Giáo Sư Cường 10 Tỉ"
										data-description="1.658.932 lượt xem" /> <video
											preload="none"
											src="<iframe width=" 560" height="315"
																src="https://www.youtube.com/embed/VLD4czIWqC0"
																frameborder="0" allowfullscreen>
																</iframe>
																">
										</video></li>

									<li><img src="images/slider/2.jpg"
										alt="BLV Hoàng Luân - Optimus về đội Minas - Lý do QTV"
										title="BLV Hoàng Luân - Optimus về đội Minas - Lý do QTV"
										data-description="12.638.000 lượt xem" /> <video
											preload="none"
											src="https://www.youtube.com/embed/NdwayoAXmfI"></video></li>
									<li><img src="images/slider/3.jpg"
										alt="EVOS Trở Thành “Super Team” KT Rolster Của Việt Nam"
										title="EVOS Trở Thành “Super Team” KT Rolster Của Việt Nam"
										data-description="1.638.550 lượt xem" /> <video
											preload="none"
											src="https://www.youtube.com/embed/y8chU0BB40w"></video></li>
									<li><img src="images/slider/3.jpg"
										alt="ASSASSIN&apos;S CREED ORIGINS #1: SÁT THỦ TRỞ VỀ AI CẬP CỔ ĐẠI"
										title="ASSASSIN&apos;S CREED ORIGINS #1: SÁT THỦ TRỞ VỀ AI CẬP CỔ ĐẠI"
										data-description="1.338.550 lượt xem" /> <video
											preload="none"
											src="https://www.youtube.com/embed/xXW3DHAKOpc"></video></li>
									<li><img src="images/slider/5.jpg"
										alt="[ Bình Luận CF ] Snake DBR - Tiền Zombie v4"
										title="[ Bình Luận CF ] Snake DBR - Tiền Zombie v4"
										data-description="1.338.550 lượt xem" /> <video
											preload="none"
											src="https://www.youtube.com/embed/j45B481Uahs"></video></li>
									<li><img src="images/slider/6.jpg"
										alt="Những lựa chọn &quot;Độc Nhất Vô Nhị&quot; trong sự nghiệp thi đấu của FAKER"
										title="Những lựa chọn &quot;Độc Nhất Vô Nhị&quot; trong sự nghiệp thi đấu của FAKER"
										data-description="66.338.550 lượt xem" /> <video
											preload="none"
											src="https://www.youtube.com/embed/4kGcWI-agqU"></video></li>
								</ul>
								<ul class="amazingslider-thumbnails" style="display: none;">
									<li><img src="images/slider/1-tn.jpg"
										alt="Optimus Stream | Giáo Sư Cường 10 Tỉ"
										title="Optimus Stream | Giáo Sư Cường 10 Tỉ" /></li>
									<li><img src="images/slider/2-tn.jpg"
										alt="BLV Hoàng Luân - Optimus về đội Minas - Lý do QTV"
										title="BLV Hoàng Luân - Optimus về đội Minas - Lý do QTV" /></li>
									<li><img src="images/slider/3-tn.jpg"
										alt="EVOS Trở Thành “Super Team” KT Rolster Của Việt Nam"
										title="EVOS Trở Thành “Super Team” KT Rolster Của Việt Nam" /></li>
									<li><img src="images/slider/4-tn.jpg"
										alt="ASSASSIN&apos;S CREED ORIGINS #1: SÁT THỦ TRỞ VỀ AI CẬP CỔ ĐẠI"
										title="ASSASSIN&apos;S CREED ORIGINS #1: SÁT THỦ TRỞ VỀ AI CẬP CỔ ĐẠI" /></li>
									<li><img src="images/slider/5-tn.jpg"
										alt="[ Bình Luận CF ] Snake DBR - Tiền Zombie v4"
										title="[ Bình Luận CF ] Snake DBR - Tiền Zombie v4" /></li>
									<li><img src="images/slider/6-tn.jpg"
										alt="Những lựa chọn &quot;Độc Nhất Vô Nhị&quot; trong sự nghiệp thi đấu của FAKER"
										title="Những lựa chọn &quot;Độc Nhất Vô Nhị&quot; trong sự nghiệp thi đấu của FAKER" /></li>
								</ul>
							</div>
						</div>
						<!-- END REVOLUTION SLIDER -->

					</article>
					<!-- home slider -->
				</div>
			</div>
		</div>
	</div>
	<!-- BEGIN .content-panel -->
	<div class="content-panel">
		<div class="content-panel-title">

			<div class="feed-widget-header">
				<h2 class="widget-title feed-widget-title">
					<a href="#">TIN MỚI</a>
				</h2>
				<div class="feed-widget-viewall">
					<a href="#"><span>XEM THÊM</span> <i
						class="fa fa-chevron-right"></i></a>
				</div>
				<div class="clear"></div>
			</div>

		</div>
		<div class="content-panel-body article-list">
			<div class="item">
				<div class="item-header">
					<a href="#"> <span class="comment-tag"><i
							class="fa fa-comment-o"></i>290<i></i></span> <span
						class="read-more-wrapper"><span class="read-more">Xem
								chi tiết<i></i>
						</span></span> <img src="images/anh/1.jpg" alt="" />
					</a>
				</div>
				<div class="item-content">
					<strong class="category-link"><a href="#">Tin mới</a></strong>
					<h3>
						<a href="ctbaiviet.html">Không thèm dùng Denuvo, hậu quả
							Wolfenstein II:</a>
					</h3>
					<span class="item-meta"> <a href="#"><i
							class="fa fa-comment-o"></i>82 Bình luận</a> <a href="#"><i
							class="fa fa-clock-o"></i>Tháng 11, 2017</a>
					</span>
					<p>Wolfenstein II: The New Colossus là phần tiếp theo của
						series game nổi tiếng được phát hành lần đầu vào năm 1981...</p>
				</div>
			</div>

			<div class="item">
				<div class="item-header">
					<a href="#"> <span class="comment-tag"><i
							class="fa fa-comment-o"></i>139<i></i></span> <span
						class="read-more-wrapper"><span class="read-more">Xem
								chi tiết<i></i>
						</span></span> <img src="images/anh/2.jpg" alt="" />
					</a>
				</div>
				<div class="item-content">
					<strong class="category-link"><a href="#">Tin mới</a></strong>
					<h3>
						<a href="#">Final Fantasy XV công bố cấu hình cho bản PC</a>
					</h3>
					<span class="item-meta"> <a href="#"><i
							class="fa fa-comment-o"></i>82 Bình luận</a> <a href="#"><i
							class="fa fa-clock-o"></i>Tháng 11, 2017</a>
					</span>
					<p>Theo thông tin vừa được công bố trên Microsoft Store, nhà
						phát hành Square Enix đã hé lộ cấu hình tiêu chuẩn cho bản PC của
						Final Fantasy XV. ...</p>
				</div>
			</div>

			<div class="item" data-color-top-slider="#867eef">
				<div class="item-header">
					<a href="#"> <span class="comment-tag"><i
							class="fa fa-comment-o"></i>65<i></i></span> <span
						class="read-more-wrapper"><span class="read-more">Xem
								chi tiết<i></i>
						</span></span> <img src="images/anh/3.jpg" alt="" />
					</a>
				</div>
				<div class="item-content">
					<strong class="category-link"><a href="#">Tin mới</a></strong>
					<h3>
						<a href="#">Halloween Sale chính thức mở cửa</a>
					</h3>
					<span class="item-meta"> <a href="#"><i
							class="fa fa-comment-o"></i>82 Bình luận</a> <a href="#"><i
							class="fa fa-clock-o"></i>Tháng 10, 2017</a>
					</span>
					<p>Đúng như dự kiến từ trước, vào đêm qua theo giờ Việt Nam,
						Steam đã cho ra mắt sự kiện khuyến mại lớn có tên “Halloween
						Sale”. ...</p>
				</div>
			</div>
			<div class="item">
				<div class="item-header">
					<a href="#"> <span class="comment-tag"><i
							class="fa fa-comment-o"></i>290<i></i></span> <span
						class="read-more-wrapper"><span class="read-more">Xem
								chi tiết<i></i>
						</span></span> <img src="images/anh/1.jpg" alt="" />
					</a>
				</div>
				<div class="item-content">
					<strong class="category-link"><a href="#">Tin mới</a></strong>
					<h3>
						<a href="#">Không thèm dùng Denuvo, hậu quả Wolfenstein II:</a>
					</h3>
					<span class="item-meta"> <a href="#"><i
							class="fa fa-comment-o"></i>82 Bình luận</a> <a href="#"><i
							class="fa fa-clock-o"></i>Tháng 11, 2017</a>
					</span>
					<p>Wolfenstein II: The New Colossus là phần tiếp theo của
						series game nổi tiếng được phát hành lần đầu vào năm 1981...</p>
				</div>
			</div>

			<div class="item">
				<div class="item-header">
					<a href="#"> <span class="comment-tag"><i
							class="fa fa-comment-o"></i>139<i></i></span> <span
						class="read-more-wrapper"><span class="read-more">Xem
								chi tiết<i></i>
						</span></span> <img src="images/anh/2.jpg" alt="" />
					</a>
				</div>
				<div class="item-content">
					<strong class="category-link"><a href="#">Tin mới</a></strong>
					<h3>
						<a href="#">Final Fantasy XV công bố cấu hình cho bản PC</a>
					</h3>
					<span class="item-meta"> <a href="#"><i
							class="fa fa-comment-o"></i>82 Bình luận</a> <a href="#"><i
							class="fa fa-clock-o"></i>Tháng 11, 2017</a>
					</span>
					<p>Theo thông tin vừa được công bố trên Microsoft Store, nhà
						phát hành Square Enix đã hé lộ cấu hình tiêu chuẩn cho bản PC của
						Final Fantasy XV. ...</p>
				</div>
			</div>

			<div class="item" data-color-top-slider="#867eef">
				<div class="item-header">
					<a href="#"> <span class="comment-tag"><i
							class="fa fa-comment-o"></i>65<i></i></span> <span
						class="read-more-wrapper"><span class="read-more">Xem
								chi tiết<i></i>
						</span></span> <img src="images/anh/3.jpg" alt="" />
					</a>
				</div>
				<div class="item-content">
					<strong class="category-link"><a href="#">Tin mới</a></strong>
					<h3>
						<a href="#">Halloween Sale chính thức mở cửa</a>
					</h3>
					<span class="item-meta"> <a href="#"><i
							class="fa fa-comment-o"></i>82 Bình luận</a> <a href="#"><i
							class="fa fa-clock-o"></i>Tháng 10, 2017</a>
					</span>
					<p>Đúng như dự kiến từ trước, vào đêm qua theo giờ Việt Nam,
						Steam đã cho ra mắt sự kiện khuyến mại lớn có tên “Halloween
						Sale”. ...</p>
				</div>
			</div>
		</div>
		<div class="content-panel-body pagination">
			<a class="prev page-numbers" href="#"><i class="fa fa-angle-left"></i>Trước</a>
			<a class="page-numbers" href="#">1</a> <span
				class="page-numbers current">2</span> <a class="page-numbers"
				href="#">3</a> <a class="page-numbers" href="#">4</a> <a
				class="page-numbers" href="#">5</a> <a class="next page-numbers"
				href="#">Tiếp theo<i class="fa fa-angle-right"></i></a>
		</div>
		<!-- END .content-panel -->
	</div>

	<!-- BEGIN .content-panel -->
	<div class="container hidden-xs hidden-sm"></div>
	<!-- BEGIN .content-panel -->

	<div class="content-panel">
		<div class="content-panel-title">
			<div class="feed-widget-header">
				<h2 class="widget-title feed-widget-title">
					<a href="#">SỰ KIỆN</a>
				</h2>
				<div class="feed-widget-viewall">
					<a href="#"><span>XEM THÊM</span> <i
						class="fa fa-chevron-right"></i></a>
				</div>
				<div class="clear"></div>
			</div>
		</div>
		<div class="content-panel-body split-article-slide">
			<div class="split-article-slide-left">
				<!-- BEGIN .top-slider-body -->
				<div class="widget">

					<br>
					<div class="widget-article-list">
						<div class="item">
							<div class="item-header">
								<a href="#"><img src="images/photos/image-7.jpg" alt="" /></a>
							</div>
							<div class="item-content">
								<h4>
									<a href="#">Đột Kích: Tiến Xinh Trai cũng sờ tận tay nút
										vàng của bản thân ngay sau Tiền Zombie v4.</a>
								</h4>
								<span class="item-meta"> <a href="#"><i
										class="fa fa-comment-o"></i>82 Bình luận</a> <a href="#"><i
										class="fa fa-clock-o"></i>Tháng 10, 2017</a>
								</span>
							</div>
						</div>

						<div class="item">
							<div class="item-header">
								<a href="#"><img src="images/photos/image-8.jpg" alt="" /></a>
							</div>
							<div class="item-content">
								<h4>
									<a href="#">PUBG ra mắt chính thức game thủ sau hơn
										nửa năm phát hành BTT 20:10</a>
								</h4>
								<span class="item-meta"> <a href="#"><i
										class="fa fa-comment-o"></i>82 Bình luận</a> <a href="#"><i
										class="fa fa-clock-o"></i>Tháng 10, 2017</a>
								</span>
							</div>
						</div>

						<div class="item">
							<div class="item-header">
								<a href="#"><img src="images/photos/image-9.jpg" alt="" /></a>
							</div>
							<div class="item-content">
								<h4>
									<a href="#">Đột Kích: Chàng trai mua x7 M66-Legend để...
										chắc chắn nhận được Thiết Phiến. </a>
								</h4>
								<span class="item-meta"> <a href="#"><i
										class="fa fa-comment-o"></i>82 Bình luận</a> <a href="#"><i
										class="fa fa-clock-o"></i>Tháng 10, 2017</a>
								</span>
							</div>
						</div>
						<div class="item">
							<div class="item-header">
								<a href="#"><img src="images/photos/image-9.jpg" alt="" /></a>
							</div>
							<div class="item-content">
								<h4>
									<a href="#">Đột Kích: Chàng trai mua x7 M66-Legend để...
										chắc chắn nhận được Thiết Phiến. </a>
								</h4>
								<span class="item-meta" style="width: 100%;"> <a href="#"><i
										class="fa fa-comment-o"></i>82 Bình luận</a> <a href="#"><i
										class="fa fa-clock-o"></i>Tháng 10, 2017</a>
								</span>
							</div>
						</div>


					</div>
				</div>
				<br>

			</div>

			<div class="split-article-slide-right">
				<div class="item">
					<div class="item-header">
						<a href="#"> <span class="comment-tag"><i
								class="fa fa-comment-o"></i>65<i></i></span> <span
							class="read-more-wrapper"><span class="read-more">Xem
									chi tiết<i></i>
							</span></span> <img src="images/image-19.jpg" alt="" />
						</a>
					</div>
					<div class="item-content">
						<h3>
							<a href="#">Đập hộp Fuhlen G90S RGB - Chuột chơi game vừa đẹp
								vừa rẻ lại cực ngon mới về Việt Nam</a>
						</h3>
						<span class="item-meta"> <a href="#"><i
								class="fa fa-comment-o"></i>82 Bình luận</a> <a href="#"><i
								class="fa fa-clock-o"></i>Tháng 11, 2017</a>
						</span>
						<p>Fuhlen G90S RGB là chú chuột có hình thức rất bắt mắt với
							đèn LED RGB cùng chất lượng cực tốt trong phân......</p>
						<a href="#" class="read-more-button">Xem chi tiết<i
							class="fa fa-mail-forward"></i>
						</a>
					</div>
				</div>
			</div>

		</div>
		<!-- END .content-panel -->
	</div>
	<div class="content-panel">
		<div class="content-panel-title">


			<div class="feed-widget-header">
				<h2 class="widget-title feed-widget-title">
					<a href="#">GAME</a>
				</h2>
				<div class="feed-widget-viewall">
					<a href="#"><span>XEM THÊM</span> <i
						class="fa fa-chevron-right"></i></a>
				</div>
				<div class="clear"></div>
			</div>

		</div>
		<div class="content-panel-body split-article-slide">
			<div class="thuvien m-b-40" id="div_Home_GameLibraryPartial"
				style="margin-top: -25px;">
				<div class="content-panel">
					<div class="content-panel-title"></div>
					<div class="row">
						<div class="col-xs-4">
							<div class="box">
								<div class="title">
									<h2>
										<a style="color: white;" href="#">Game online</a>
									</h2>
								</div>
								<ul>
									<li><a href="#" class="pull-left p-r-15"> <img
											src="images/game/1.cache" alt="MU Online Web"
											style="border-radius: 13px;"></a>
										<h2>
											<a href="#">MU Online Web</a>
										</h2>
										<p>VNG</p> <span class="view"><a href="#"><i
												class="fa fa-eye"></i> Xem</a></span> <span class="download"><a
											href="#" rel="nofollow" target="_blank"><i
												class="fa fa-download"></i> Download</a></span>
										<div class="clearfix"></div></li>
									<li><a href="" class="pull-left p-r-15"> <img
											src="images/game/2.cache" alt="Hàng Long Phục Hổ "
											style="border-radius: 13px;"></a>
										<h2>
											<a href="#">Hàng Long Phục Hổ </a>
										</h2>
										<p>AIVO</p> <span class="view"><a href="#"><i
												class="fa fa-eye"></i> Xem</a></span> <span class="download"><a
											href="#" rel="nofollow" target="_blank"><i
												class="fa fa-download"></i> Download</a></span>
										<div class="clearfix"></div></li>
									<li><a href="#" class="pull-left p-r-15"> <img
											src="images/game/3.cache" alt="Ngạo Kiếm Vô Song 2"
											style="border-radius: 13px;"></a>
										<h2>
											<a href="#">Ngạo Kiếm Vô Song 2</a>
										</h2>
										<p>GOSU</p> <span class="view"><a href="#"><i
												class="fa fa-eye"></i> Xem</a></span> <span class="download"><a
											href="#" rel="nofollow" target="_blank"><i
												class="fa fa-download"></i> Download</a></span>
										<div class="clearfix"></div></li>
								</ul>
								<div class="more">
									<a href="#">Xem thêm</a>
								</div>
							</div>
						</div>
						<div class="col-xs-4">
							<div class="box">
								<div class="title">
									<h2>
										<a style="color: white;" href="#">Game mobile</a>
									</h2>
								</div>
								<ul>
									<li><a href="#" class="pull-left p-r-15"> <img
											src="images/game/4.cache" alt="Đông Tà Tây Độc mobile"
											style="border-radius: 13px;"></a>
										<h2>
											<a href="#">Đông Tà Tây Độc</a>
										</h2>
										<p>SohaGame</p> <span class="view"><a href="#"><i
												class="fa fa-eye"></i> Xem</a></span> <span class="download"><a
											href="#" rel="nofollow" target="_blank"><i
												class="fa fa-download"></i> Download</a></span>
										<div class="clearfix"></div></li>
									<li><a href="#" class="pull-left p-r-15"> <img
											src="images/game/5.cache" alt="Nhật Ký Tình Yêu Gamota"
											style="border-radius: 13px;"></a>
										<h2>
											<a href="#"> Nhật Ký Tình Yêu Gamota</a>
										</h2>
										<p>N/A</p> <span class="view"><a href="#"><i
												class="fa fa-eye"></i> Xem</a></span> <span class="download"><a
											href="#" rel="nofollow" target="_blank"><i
												class="fa fa-download"></i> Download</a></span>
										<div class="clearfix"></div></li>
									<li><a href="#" class="pull-left p-r-15"> <img
											src="images/game/6.cache" alt="Thế Giới Hoàn Mỹ VTC"
											style="border-radius: 13px;"></a>
										<h2>
											<a href="#">Thế Giới Hoàn Mỹ VTC</a>
										</h2>
										<p>VTC Game</p> <span class="view"><a href="#"><i
												class="fa fa-eye"></i> Xem</a></span> <span class="download"><a
											href="#" rel="nofollow" target="_blank"><i
												class="fa fa-download"></i> Download</a></span>
										<div class="clearfix"></div></li>
								</ul>
								<div class="more">
									<a href="#">Xem thêm</a>
								</div>
							</div>
						</div>
						<div class="col-xs-4">
							<div class="box">
								<div class="title">
									<h2>
										<a style="color: white;" href="#">eSport</a>
									</h2>
								</div>
								<ul>
									<li><a href="#" class="pull-left p-r-15"> <img
											src="images/game/7.cache" alt="Liên Minh Huyền Thoại"
											style="border-radius: 13px;"></a>
										<h2>
											<a href="#">Liên Minh Huyền Thoại</a>
										</h2>
										<p>Garena</p> <span class="view"><a href="#"><i
												class="fa fa-eye"></i> Xem</a></span> <span class="download"><a
											href="#" rel="nofollow" target="_blank"><i
												class="fa fa-download"></i> Download</a></span>
										<div class="clearfix"></div></li>
									<li><a href="#" class="pull-left p-r-15"> <img
											src="images/game/8.cache" alt="Warface"
											style="border-radius: 13px;"></a>
										<h2>
											<a href="#">Warface</a>
										</h2>
										<p>VTC Online</p> <span class="view"><a href="#"><i
												class="fa fa-eye"></i> Xem</a></span> <span class="download"><a
											href="#" rel="nofollow" target="_blank"><i
												class="fa fa-download"></i> Download</a></span>
										<div class="clearfix"></div></li>
									<li><a href="#" class="pull-left p-r-15"> <img
											src="images/game/9.cache" alt="Đột Kích"
											style="border-radius: 13px;"></a>
										<h2>
											<a href="#">Đột Kích trong Tầm Ngắm</a>
										</h2>
										<p>VTC Game</p> <span class="view"><a href="#"><i
												class="fa fa-eye"></i> Xem</a></span> <span class="download"><a
											href="#" rel="nofollow" target="_blank"><i
												class="fa fa-download"></i> Download</a></span>
										<div class="clearfix"></div></li>
								</ul>
								<div class="more">
									<a href="#">Xem thêm</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- END .content-panel -->
	</div>

	<div class="content-panel">
		<div class="content-panel-title">
			<div class="feed-widget-header">
				<h2 class="widget-title feed-widget-title">
					<a href="#">KHÁM PHÁ</a>
				</h2>
				<div class="feed-widget-viewall">
					<a href="#"><span>XEM THÊM</span> <i
						class="fa fa-chevron-right"></i></a>
				</div>
				<div class="clear"></div>
			</div>
		</div>
		<div class="content-panel-body full-width-articles">

			<div class="item">
				<div class="item-header">
					<a href="#"> <span class="comment-tag"><i
							class="fa fa-comment-o"></i>139<i></i></span> <span
						class="read-more-wrapper"><span class="read-more">Xem
								chi tiết<i></i>
						</span></span> <img src="images/photos/image-20.jpg" alt="">
					</a>
				</div>
				<div class="item-content">
					<h3>
						<a href="#">Game thủ Pokemon Go Việt đã có cơ hội sở hữu
							Pokemon huyền thoại Entei ngay từ thời điểm này</a>
					</h3>
					<span class="item-meta"> <a href="##comments"><i
							class="fa fa-comment-o"></i>82 Bình luận</a> <a href="#"><i
							class="fa fa-clock-o"></i>Tháng 11, 2017</a>
					</span>
					<p>Đúng như kế hoạch mà Niantic đã công bố trong thời gian
						trước đây, bộ 3 Pokemon huyền thoại: Entei, Raikou và Suicune đã
						tiếp tục di cư sang khu vực khác...</p>
					<a href="#" class="read-more-button">Xem chi tiết<i
						class="fa fa-mail-forward"></i>
					</a>
				</div>
			</div>
			<div class="item">
				<div class="item-header">
					<a href="#"> <span class="comment-tag"><i
							class="fa fa-comment-o"></i>139<i></i></span> <span
						class="read-more-wrapper"><span class="read-more">Xem
								chi tiết<i></i>
						</span></span> <img src="images/photos/image-20.jpg" alt="">
					</a>
				</div>
				<div class="item-content">
					<h3>
						<a href="#">Game thủ Pokemon Go Việt đã có cơ hội sở hữu
							Pokemon huyền thoại Entei ngay từ thời điểm này</a>
					</h3>
					<span class="item-meta"> <a href="##comments"><i
							class="fa fa-comment-o"></i>82 Bình luận</a> <a href="#"><i
							class="fa fa-clock-o"></i>Tháng 11, 2017</a>
					</span>
					<p>Đúng như kế hoạch mà Niantic đã công bố trong thời gian
						trước đây, bộ 3 Pokemon huyền thoại: Entei, Raikou và Suicune đã
						tiếp tục di cư sang khu vực khác...</p>
					<a href="#" class="read-more-button">Xem chi tiết<i
						class="fa fa-mail-forward"></i>
					</a>
				</div>
			</div>

		</div>
		<!-- END .content-panel -->
	</div>




</div>