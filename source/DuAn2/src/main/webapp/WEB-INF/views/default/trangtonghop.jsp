<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!-- Banner chi tiết bài viết -->
<div class="container-fluid">
	<div id="custom_carousel" class="carousel slide" data-ride="carousel" data-interval="2500">
		<div class="carousel-inner">
			<div class="item active">
				<div class="container-fluid">
					<div class="row">
						<div class="col-md-3"><img src="images/anhgame/1.jpg" class="img-responsive"></div>
						<div class="col-md-9">
							<h2>Doto Mobile</h2>
							<p>Doto Mobile là game di động chiến thuật được xây dựng dựa trên bối cảnh của tựa game huyền thoại Warcraft 3, từ cốt truyện, hệ thống nhân vật cho đến những chi tiết hấp dẫn khác, người chơi có thể dễ dàng nhận ra các nhân vật "gốc" từ Warcraft 3 được đưa vào trong game di động này. Bước vào thế giới Doto Mobile, người chơi sẽ tự đưa mình vào cuộc đại chiến tranh giành lãnh thổ. Mỗi người chơi sẽ xây dựng lãnh thổ và đội hình tướng cho riêng mình để cạnh tranh với người chơi khác. </p>
						</div>
					</div>
				</div>
			</div>
			<div class="item">
				<div class="container-fluid">
					<div class="row">
						<div class="col-md-3"><img src="images/anhgame/2.png" class="img-responsive"></div>
						<div class="col-md-9">
							<h2>Vô Địch Tam Quốc</h2>
							<p>Đúng vào lúc 15h00 hôm nay 4/9, Doto Mobile - Tựa game tái hiện huyền thoại Warcraft trên di động sẽ chính thức mở cửa tại thị trường Việt Nam. Nhân dịp này, Nhà phát hành Doto Mobile cũng gửi tặng đọc giả 200 vipcode chứa nhiều vật phẩm giá trị.</p>
						</div>
					</div>
				</div>
			</div>
			<div class="item">
				<div class="container-fluid">
					<div class="row">
						<div class="col-md-3"><img src="images/anhgame/3.jpg" class="img-responsive"></div>
						<div class="col-md-9">
							<h2>Warcraft được game thủ yêu thích nhất</h2>
							<p>Bối cảnh rộng lớn được khắc họa một cách chi tiết chính là một trong những ưu điểm góp phần làm lên thành công của thương hiệu Warcraft của Blizzard. Trong bối cảnh rộng lớn ấy, có những nhân vật nổi danh đã xuất hiện và để lại dấu ấn không thể xóa nhòa trong tâm trí của người hâm mộ. Hãy cùng tìm hiểu những Hero được xem như huyền thoại và mang tính biểu tượng trong Warcraft xem họ có gì đặc biệt.</p>
						</div>
					</div>
				</div>
			</div>
			<div class="item">
				<div class="container-fluid">
					<div class="row">
						<div class="col-md-3"><img src="images/anhgame/4.jpg" class="img-responsive"></div>
						<div class="col-md-9">
							<h2>Chơi thử Doto Mobile trước ngày game ra mắt tại Việt Nam 30/08</h2>
							<p>Về tổng thể, Doto Mobile là một tựa game nhập vai, kết hợp thẻ tướng được xây dựng với cốt truyện dựa trên tựa game offline nổi tiếng WarCraft 3. Ngay khi tham gia vào game, người chơi đã có thể dễ dàng bắt gặp các nhân vật quen thuộc trong game WarCraft 3 ngày nào.Theo đó trong Doto Mobile nhiệm vụ của người chơi ....</p>
						</div>
					</div>
				</div>
			</div>
			<!-- Kết thúc một mối tình -->
		</div>
		<!-- Banner nhỏ-->
		<div class="controls">
			<ul class="nav">
				<li data-target="#custom_carousel" data-slide-to="0" class="active"><a href="#"><img src="images/anhgame/g1.jpg"><small>Slide One</small></a></li>
				<li data-target="#custom_carousel" data-slide-to="1"><a href="#"><img src="images/anhgame/g2.jpg"><small>Slide Two</small></a></li>
				<li data-target="#custom_carousel" data-slide-to="2"><a href="#"><img src="images/anhgame/g3.jpg"><small>Slide Three</small></a></li>
				<li data-target="#custom_carousel" data-slide-to="3"><a href="#"><img src="images/anhgame/g4.jpg"><small>Slide Four</small></a></li>
			</ul>
		</div>
	</div>
</div>
<br>
<!-- Danh sach game -->
<div class="container">
	<h2 class="widget-title feed-widget-title">
		<a href="/video?sorted=hots">DANH SÁCH GAME</a>
	</h2>
	<br><br><br>
	<div class="row">
		<div class="col-md-4">
			<div class="artist-data pull-left">
				<div class="artst-pic pull-left">
					<span class="artst-like"><a href="#"><i class="glyphicon glyphicon-heart-empty"></i></a></span>
					<span class="artst-share"><a href="#"><i class="glyphicon glyphicon-share"></i></a></span>
					<span class="artst-plus"><a href="#"><i class="glyphicon glyphicon-plus-sign"></i></a></span>
					<a href="#">
						<img src="images/anhgame/q1.jpg" alt="" class="img-responsive" />
					</a>
				</div>
				<div class="artst-prfle pull-right">
					<div class="art-title">
						Đại Đường Võ Lâm
						<span class="artst-sub">Thể loại <span class="byname">Game hành động</span> <span class="daysago"></span></span>
					</div>
					<div class="counter-tab">
						<div class="counter_comnt"><i class="glyphicon glyphicon-comment"></i> 359</div>
						<div class="counter_ply"><i class="glyphicon glyphicon-play"></i> 1312</div>
						<div class="counter_like"><i class="glyphicon glyphicon-heart"></i> 2256</div>
					</div>
				</div>
				<div class="bot-links">
					<a href="#">Xem chi tiết</a>
					<a href="#">Bình chọn</a>
					<a href="#">Tải game</a>
					<a href="#">Chơi thử game</a>
					<a href="#">Xem video</a>
				</div>
			</div>
		</div>
		<div class="col-md-4">
			<div class="artist-data pull-left">
				<div class="artst-pic pull-left">
					<span class="artst-like"><a href="#"><i class="glyphicon glyphicon-heart-empty"></i></a></span>
					<span class="artst-share"><a href="#"><i class="glyphicon glyphicon-share"></i></a></span>
					<span class="artst-plus"><a href="#"><i class="glyphicon glyphicon-plus-sign"></i></a></span>
					<a href="#">
						<img src="images/anhgame/q2.jpg" alt="" class="img-responsive" />
					</a>
				</div>
				<div class="artst-prfle pull-right">
					<div class="art-title">
						Idol Thời Trang
						<span class="artst-sub">Thể loại <span class="byname">Game thời trang</span> <span class="daysago"></span></span>
					</div>
					<div class="counter-tab">
						<div class="counter_comnt"><i class="glyphicon glyphicon-comment"></i> 359</div>
						<div class="counter_ply"><i class="glyphicon glyphicon-play"></i> 1312</div>
						<div class="counter_like"><i class="glyphicon glyphicon-heart"></i> 2256</div>
					</div>
				</div>
				<div class="bot-links">
					<a href="#">Xem chi tiết</a>
					<a href="#">Bình chọn</a>
					<a href="#">Tải game</a>
					<a href="#">Chơi thử game</a>
					<a href="#">Xem video</a>
				</div>
			</div>
		</div>
		<div class="col-md-4">
			<div class="artist-data pull-left">
				<div class="artst-pic pull-left">
					<span class="artst-like"><a href="#"><i class="glyphicon glyphicon-heart-empty"></i></a></span>
					<span class="artst-share"><a href="#"><i class="glyphicon glyphicon-share"></i></a></span>
					<span class="artst-plus"><a href="#"><i class="glyphicon glyphicon-plus-sign"></i></a></span>
					<a href="#">
						<img src="images/anhgame/q3.png" alt="" class="img-responsive" />
					</a>
				</div>
				<div class="artst-prfle pull-right">
					<div class="art-title">
						Tây Du Chi Lộ
						<span class="artst-sub">Thể loại <span class="byname">Game hành động</span> <span class="daysago"></span></span>
					</div>
					<div class="counter-tab">
						<div class="counter_comnt"><i class="glyphicon glyphicon-comment"></i> 359</div>
						<div class="counter_ply"><i class="glyphicon glyphicon-play"></i> 1312</div>
						<div class="counter_like"><i class="glyphicon glyphicon-heart"></i> 2256</div>
					</div>
				</div>
				<div class="bot-links">
					<a href="#">Xem chi tiết</a>
					<a href="#">Bình chọn</a>
					<a href="#">Tải game</a>
					<a href="#">Chơi thử game</a>
					<a href="#">Xem video</a>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="container">
	<div class="row">
		<div class="col-md-4">
			<div class="artist-data pull-left">
				<div class="artst-pic pull-left">
					<span class="artst-like"><a href="#"><i class="glyphicon glyphicon-heart-empty"></i></a></span>
					<span class="artst-share"><a href="#"><i class="glyphicon glyphicon-share"></i></a></span>
					<span class="artst-plus"><a href="#"><i class="glyphicon glyphicon-plus-sign"></i></a></span>
					<a href="#">
						<img src="images/anhgame/q4.jpg" alt="" class="img-responsive" />
					</a>
				</div>
				<div class="artst-prfle pull-right">
					<div class="art-title">
						Sứ Mệnh Rồng
						<span class="artst-sub">Thể loại <span class="byname">Game di động</span> <span class="daysago"</span></span>
					</div>
					<div class="counter-tab">
						<div class="counter_comnt"><i class="glyphicon glyphicon-comment"></i> 359</div>
						<div class="counter_ply"><i class="glyphicon glyphicon-play"></i> 1312</div>
						<div class="counter_like"><i class="glyphicon glyphicon-heart"></i> 2256</div>
					</div>
				</div>
				<div class="bot-links">
					<a href="#">Xem chi tiết</a>
					<a href="#">Bình chọn</a>
					<a href="#">Tải game</a>
					<a href="#">Chơi thử game</a>
					<a href="#">Xem video</a>
				</div>
			</div>
		</div>
		<div class="col-md-4">
			<div class="artist-data pull-left">
				<div class="artst-pic pull-left">
					<span class="artst-like"><a href="#"><i class="glyphicon glyphicon-heart-empty"></i></a></span>
					<span class="artst-share"><a href="#"><i class="glyphicon glyphicon-share"></i></a></span>
					<span class="artst-plus"><a href="#"><i class="glyphicon glyphicon-plus-sign"></i></a></span>
					<a href="#">
						<img src="images/anhgame/q5.png" alt="" class="img-responsive" />
					</a>
				</div>
				<div class="artst-prfle pull-right">
					<div class="art-title">
						Cửu Thiên Phong Thần
						<span class="artst-sub">Thể loại <span class="byname">Game việt</span> <span class="daysago"></span></span>
					</div>
					<div class="counter-tab">
						<div class="counter_comnt"><i class="glyphicon glyphicon-comment"></i> 359</div>
						<div class="counter_ply"><i class="glyphicon glyphicon-play"></i> 1312</div>
						<div class="counter_like"><i class="glyphicon glyphicon-heart"></i> 2256</div>
					</div>
				</div>
				<div class="bot-links">
					<a href="#">Xem chi tiết</a>
					<a href="#">Bình chọn</a>
					<a href="#">Tải game</a>
					<a href="#">Chơi thử game</a>
					<a href="#">Xem video</a>
				</div>
			</div>
		</div>
		<div class="col-md-4">
			<div class="artist-data pull-left">
				<div class="artst-pic pull-left">
					<span class="artst-like"><a href="#"><i class="glyphicon glyphicon-heart-empty"></i></a></span>
					<span class="artst-share"><a href="#"><i class="glyphicon glyphicon-share"></i></a></span>
					<span class="artst-plus"><a href="#"><i class="glyphicon glyphicon-plus-sign"></i></a></span>
					<a href="#">
						<img src="images/anhgame/q6.jpg" alt="" class="img-responsive" />
					</a>
				</div>
				<div class="artst-prfle pull-right">
					<div class="art-title">
						Doto Mobile
						<span class="artst-sub">Thể loại <span class="byname">Game di động</span> <span class="daysago"></span></span>
					</div>
					<div class="counter-tab">
						<div class="counter_comnt"><i class="glyphicon glyphicon-comment"></i> 359</div>
						<div class="counter_ply"><i class="glyphicon glyphicon-play"></i> 1312</div>
						<div class="counter_like"><i class="glyphicon glyphicon-heart"></i> 2256</div>
					</div>
				</div>
				<div class="bot-links">
					<a href="#">Xem chi tiết</a>
					<a href="#">Bình chọn</a>
					<a href="#">Tải game</a>
					<a href="#">Chơi thử game</a>
					<a href="#">Xem video</a>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="container">
	<div class="row">
		<div class="col-md-4">
			<div class="artist-data pull-left">
				<div class="artst-pic pull-left">
					<span class="artst-like"><a href="#"><i class="glyphicon glyphicon-heart-empty"></i></a></span>
					<span class="artst-share"><a href="#"><i class="glyphicon glyphicon-share"></i></a></span>
					<span class="artst-plus"><a href="#"><i class="glyphicon glyphicon-plus-sign"></i></a></span>
					<a href="#">
						<img src="images/anhgame/q1.jpg" alt="" class="img-responsive" />
					</a>
				</div>
				<div class="artst-prfle pull-right">
					<div class="art-title">
						Đại Đường Võ Lâm
						<span class="artst-sub">Thể loại <span class="byname">Game hành động</span> <span class="daysago"></span></span>
					</div>
					<div class="counter-tab">
						<div class="counter_comnt"><i class="glyphicon glyphicon-comment"></i> 359</div>
						<div class="counter_ply"><i class="glyphicon glyphicon-play"></i> 1312</div>
						<div class="counter_like"><i class="glyphicon glyphicon-heart"></i> 2256</div>
					</div>
				</div>
				<div class="bot-links">
					<a href="#">Xem chi tiết</a>
					<a href="#">Bình chọn</a>
					<a href="#">Tải game</a>
					<a href="#">Chơi thử game</a>
					<a href="#">Xem video</a>
				</div>
			</div>
		</div>
		<div class="col-md-4">
			<div class="artist-data pull-left">
				<div class="artst-pic pull-left">
					<span class="artst-like"><a href="#"><i class="glyphicon glyphicon-heart-empty"></i></a></span>
					<span class="artst-share"><a href="#"><i class="glyphicon glyphicon-share"></i></a></span>
					<span class="artst-plus"><a href="#"><i class="glyphicon glyphicon-plus-sign"></i></a></span>
					<a href="#">
						<img src="images/anhgame/q2.jpg" alt="" class="img-responsive" />
					</a>
				</div>
				<div class="artst-prfle pull-right">
					<div class="art-title">
						Idol Thời Trang
						<span class="artst-sub">Thể loại <span class="byname">Game thời trang</span> <span class="daysago"></span></span>
					</div>
					<div class="counter-tab">
						<div class="counter_comnt"><i class="glyphicon glyphicon-comment"></i> 359</div>
						<div class="counter_ply"><i class="glyphicon glyphicon-play"></i> 1312</div>
						<div class="counter_like"><i class="glyphicon glyphicon-heart"></i> 2256</div>
					</div>
				</div>
				<div class="bot-links">
					<a href="#">Xem chi tiết</a>
					<a href="#">Bình chọn</a>
					<a href="#">Tải game</a>
					<a href="#">Chơi thử game</a>
					<a href="#">Xem video</a>
				</div>
			</div>
		</div>
		<div class="col-md-4">
			<div class="artist-data pull-left">
				<div class="artst-pic pull-left">
					<span class="artst-like"><a href="#"><i class="glyphicon glyphicon-heart-empty"></i></a></span>
					<span class="artst-share"><a href="#"><i class="glyphicon glyphicon-share"></i></a></span>
					<span class="artst-plus"><a href="#"><i class="glyphicon glyphicon-plus-sign"></i></a></span>
					<a href="#">
						<img src="images/anhgame/q3.png" alt="" class="img-responsive" />
					</a>
				</div>
				<div class="artst-prfle pull-right">
					<div class="art-title">
						Tây Du Chi Lộ
						<span class="artst-sub">Thể loại <span class="byname">Game hành động</span> <span class="daysago"></span></span>
					</div>
					<div class="counter-tab">
						<div class="counter_comnt"><i class="glyphicon glyphicon-comment"></i> 359</div>
						<div class="counter_ply"><i class="glyphicon glyphicon-play"></i> 1312</div>
						<div class="counter_like"><i class="glyphicon glyphicon-heart"></i> 2256</div>
					</div>
				</div>
				<div class="bot-links">
					<a href="#">Xem chi tiết</a>
					<a href="#">Bình chọn</a>
					<a href="#">Tải game</a>
					<a href="#">Chơi thử game</a>
					<a href="#">Xem video</a>
				</div>
			</div>
		</div>
	</div>
</div>
<!--Mở đầu tin tức nè-->
<div class="container-fluid">
	<div class="container container-pad" id="property-listings">

		<div class="row">
			<div class="col-md-12">
				<h1>Tin game mới nổi bật</h1><br>
			</div>
		</div>

		<div class="row">
			<div class="col-sm-6">
				<div class="brdr bgc-fff pad-10 box-shad btm-mrg-20 property-listing">
					<div class="media">
						<a class="pull-left" href="#" target="_parent">
							<img alt="image" class="img-responsive" src="images/anhgame/z1.png"></a>

						<div class="clearfix visible-sm"></div>

						<div class="media-body fnt-smaller">
							<a href="#" target="_parent"></a>

							<h4 class="media-heading">
								<a href="#" target="_parent">SGame tung Teaser ra mắt Tân Tiên Kiếm “cuộn chuột” độc đáo</a></h4>
							<ul class="list-inline mrg-0 btm-mrg-10 clr-535353">
								<li>4444 Lượt xem</li>

								<li style="list-style: none">|</li>

								<li>5 Bình luận</li>

								<li style="list-style: none">|</li>

								<li>5 Vote</li>
							</ul>

							<p class="hidden-xs">Vào đúng sáng ngày Nhà Giáo Việt Nam 20/11, NPH SGame đã công bố trang teaser chính thức giới thiệu về webgame 3D Tân Tiên Kiếm.
								...</p><span class="fnt-smaller fnt-lighter fnt-arial">Nguồn: GameK</span>
						</div>
					</div>
				</div>


				<div class="brdr bgc-fff pad-10 box-shad btm-mrg-20 property-listing">
					<div class="media">
						<a class="pull-left" href="#" target="_parent">
							<img alt="image" class="img-responsive" src="images/anhgame/z2.jpg"></a>

						<div class="clearfix visible-sm"></div>

						<div class="media-body fnt-smaller">
							<a href="#" target="_parent"></a>

							<h4 class="media-heading">
								<a href="#" target="_parent">SGame tung Teaser ra mắt Tân Tiên Kiếm “cuộn chuột” độc đáo</a></h4>
							<ul class="list-inline mrg-0 btm-mrg-10 clr-535353">
								<li>4444 Lượt xem</li>

								<li style="list-style: none">|</li>

								<li>5 Bình luận</li>

								<li style="list-style: none">|</li>

								<li>5 Vote</li>
							</ul>

							<p class="hidden-xs">Vào đúng sáng ngày Nhà Giáo Việt Nam 20/11, NPH SGame đã công bố trang teaser chính thức giới thiệu về webgame 3D Tân Tiên Kiếm.
								...</p><span class="fnt-smaller fnt-lighter fnt-arial">Nguồn: GameK</span>
						</div>
					</div>
				</div>


				<div class="brdr bgc-fff pad-10 box-shad btm-mrg-20 property-listing">
					<div class="media">
						<a class="pull-left" href="#" target="_parent">
							<img alt="image" class="img-responsive" src="images/anhgame/z3.jpg"></a>

						<div class="clearfix visible-sm"></div>

						<div class="media-body fnt-smaller">
							<a href="#" target="_parent"></a>

							<h4 class="media-heading">
								<a href="#" target="_parent">SGame tung Teaser ra mắt Tân Tiên Kiếm “cuộn chuột” độc đáo</a></h4>
							<ul class="list-inline mrg-0 btm-mrg-10 clr-535353">
								<li>4444 Lượt xem</li>

								<li style="list-style: none">|</li>

								<li>5 Bình luận</li>

								<li style="list-style: none">|</li>

								<li>5 Vote</li>
							</ul>

							<p class="hidden-xs">Vào đúng sáng ngày Nhà Giáo Việt Nam 20/11, NPH SGame đã công bố trang teaser chính thức giới thiệu về webgame 3D Tân Tiên Kiếm.
								...</p><span class="fnt-smaller fnt-lighter fnt-arial">Nguồn: GameK</span>
						</div>
					</div>
				</div>

				<div class="brdr bgc-fff pad-10 box-shad btm-mrg-20 property-listing">
					<div class="media">
						<a class="pull-left" href="#" target="_parent">
							<img alt="image" class="img-responsive" src="images/anhgame/2.png"></a>

						<div class="clearfix visible-sm"></div>

						<div class="media-body fnt-smaller">
							<a href="#" target="_parent"></a>

							<h4 class="media-heading">
								<a href="#" target="_parent">SGame tung Teaser ra mắt Tân Tiên Kiếm “cuộn chuột” độc đáo</a></h4>
							<ul class="list-inline mrg-0 btm-mrg-10 clr-535353">
								<li>4444 Lượt xem</li>

								<li style="list-style: none">|</li>

								<li>5 Bình luận</li>

								<li style="list-style: none">|</li>

								<li>5 Vote</li>
							</ul>

							<p class="hidden-xs">Vào đúng sáng ngày Nhà Giáo Việt Nam 20/11, NPH SGame đã công bố trang teaser chính thức giới thiệu về webgame 3D Tân Tiên Kiếm.
								...</p><span class="fnt-smaller fnt-lighter fnt-arial">Nguồn: GameK</span>
						</div>
					</div>
				</div>


			</div>

			<div class="col-sm-6">

				<div class="brdr bgc-fff pad-10 box-shad btm-mrg-20 property-listing">
					<div class="media">
						<a class="pull-left" href="#" target="_parent">
							<img alt="image" class="img-responsive" src="images/anhgame/3.jpg"></a>

						<div class="clearfix visible-sm"></div>

						<div class="media-body fnt-smaller">
							<a href="#" target="_parent"></a>

							<h4 class="media-heading">
								<a href="#" target="_parent">SGame tung Teaser ra mắt Tân Tiên Kiếm “cuộn chuột” độc đáo</a></h4>
							<ul class="list-inline mrg-0 btm-mrg-10 clr-535353">
								<li>4444 Lượt xem</li>

								<li style="list-style: none">|</li>

								<li>5 Bình luận</li>

								<li style="list-style: none">|</li>

								<li>5 Vote</li>
							</ul>

							<p class="hidden-xs">Vào đúng sáng ngày Nhà Giáo Việt Nam 20/11, NPH SGame đã công bố trang teaser chính thức giới thiệu về webgame 3D Tân Tiên Kiếm.
								...</p><span class="fnt-smaller fnt-lighter fnt-arial">Nguồn: GameK</span>
						</div>
					</div>
				</div>

				<div class="brdr bgc-fff pad-10 box-shad btm-mrg-20 property-listing">
					<div class="media">
						<a class="pull-left" href="#" target="_parent">
							<img alt="image" class="img-responsive" src="images/anhgame/2.png"></a>

						<div class="clearfix visible-sm"></div>

						<div class="media-body fnt-smaller">
							<a href="#" target="_parent"></a>

							<h4 class="media-heading">
								<a href="#" target="_parent">SGame tung Teaser ra mắt Tân Tiên Kiếm “cuộn chuột” độc đáo</a></h4>
							<ul class="list-inline mrg-0 btm-mrg-10 clr-535353">
								<li>4444 Lượt xem</li>

								<li style="list-style: none">|</li>

								<li>5 Bình luận</li>

								<li style="list-style: none">|</li>

								<li>5 Vote</li>
							</ul>

							<p class="hidden-xs">Vào đúng sáng ngày Nhà Giáo Việt Nam 20/11, NPH SGame đã công bố trang teaser chính thức giới thiệu về webgame 3D Tân Tiên Kiếm.
								...</p><span class="fnt-smaller fnt-lighter fnt-arial">Nguồn: GameK</span>
						</div>
					</div>
				</div>
				<div class="brdr bgc-fff pad-10 box-shad btm-mrg-20 property-listing">
					<div class="media">
						<a class="pull-left" href="#" target="_parent">
							<img alt="image" class="img-responsive" src="images/anhgame/4.jpg"></a>

						<div class="clearfix visible-sm"></div>

						<div class="media-body fnt-smaller">
							<a href="#" target="_parent"></a>

							<h4 class="media-heading">
								<a href="#" target="_parent">SGame tung Teaser ra mắt Tân Tiên Kiếm “cuộn chuột” độc đáo</a></h4>
							<ul class="list-inline mrg-0 btm-mrg-10 clr-535353">
								<li>4444 Lượt xem</li>

								<li style="list-style: none">|</li>

								<li>5 Bình luận</li>

								<li style="list-style: none">|</li>

								<li>5 Vote</li>
							</ul>

							<p class="hidden-xs">Vào đúng sáng ngày Nhà Giáo Việt Nam 20/11, NPH SGame đã công bố trang teaser chính thức giới thiệu về webgame 3D Tân Tiên Kiếm.
								...</p><span class="fnt-smaller fnt-lighter fnt-arial">Nguồn: GameK</span>
						</div>
					</div>
				</div>
				<div class="brdr bgc-fff pad-10 box-shad btm-mrg-20 property-listing">
					<div class="media">
						<a class="pull-left" href="#" target="_parent">
							<img alt="image" class="img-responsive" src="images/anhgame/1.jpg"></a>

						<div class="clearfix visible-sm"></div>

						<div class="media-body fnt-smaller">
							<a href="#" target="_parent"></a>

							<h4 class="media-heading">
								<a href="#" target="_parent">SGame tung Teaser ra mắt Tân Tiên Kiếm “cuộn chuột” độc đáo</a></h4>
							<ul class="list-inline mrg-0 btm-mrg-10 clr-535353">
								<li>4444 Lượt xem</li>

								<li style="list-style: none">|</li>

								<li>5 Bình luận</li>

								<li style="list-style: none">|</li>

								<li>5 Vote</li>
							</ul>

							<p class="hidden-xs">Vào đúng sáng ngày Nhà Giáo Việt Nam 20/11, NPH SGame đã công bố trang teaser chính thức giới thiệu về webgame 3D Tân Tiên Kiếm.
								...</p><span class="fnt-smaller fnt-lighter fnt-arial">Nguồn: GameK</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- Kết thúc mối tình tin tức-->

<div class="content-block-single">
	<div class="content-panel">
		<c:if test="${objectCategoryAndTag.name == 'Video'}">
		<div class="content-panel-body article-list " style="padding-top: 10px;">
			<div class="item">
				<div class="col-xs-12 col-sm-12 col-md-12">

					<div class="rvs-container">

						<div class="rvs-item-container">
							<div class="rvs-item-stage">
								<c:forEach var="gacnvl" items="${getTop10ArticleCategoryNewVideoList}">
									<!-- The below is a single item, simply duplicate this layout for each item -->
									<div class="rvs-item" style="background-image: url('images/articles/${gacnvl.imagesThumbnail}')">
										<p class="rvs-item-text">${gacnvl.title}
											<small>${gacnvl.views} Lượt Xem</small>
										</p>
										<a href="${gacnvl.video}" class="rvs-play-video"></a>
									</div>
								</c:forEach>
							</div>
						</div>

						<div class="rvs-nav-container">
							<a class="rvs-nav-prev"></a>

							<div class="rvs-nav-stage">
								<c:forEach var="gacnvl" items="${getTop10ArticleCategoryNewVideoList}">
									<!-- The below is the corresponding nav item for the single item, simply duplicate this layout for each item -->
									<a class="rvs-nav-item">
                                            <span class="rvs-nav-item-thumb"
												  style="background-image: url('images/articles/${gacnvl.imagesThumbnail}')"></span>
										<h4 class="rvs-nav-item-title">${gacnvl.title}</h4>
										<small class="rvs-nav-item-credits">${gacnvl.views} Lượt Xem</small>
									</a>
								</c:forEach>
							</div>

							<a class="rvs-nav-next"></a>
						</div>

					</div>
					<!-- END REVOLUTION SLIDER -->


					<!-- home slider -->
				</div>
			</div>
		</div>
		</c:if>
		<div class="content-panel-title">

			<div class="feed-widget-header">
				<h2 class="widget-title feed-widget-title">
					<a href="${contextPath}/${objectCategoryAndTag.slug}?sorted=news">${objectCategoryAndTag.name}</a>
				</h2>

				<div class="clear"></div>
			</div>

		</div>
		<div class="content-panel-body article-list" id="posts">
			<c:forEach var="al" items="${articleList}">
				<div class="item">

					<div class="item-header hover14 column">
						<a href="${contextPath}/${al.slug}"> <span class="comment-tag"><i
								class="fa fa-eye"></i>${al.views}<i></i></span> <span
								class="read-more-wrapper"><span class="read-more">Xem chi tiết<i></i>
					</span></span>
							<figure><img class="img-responsive" title="${al.title}"
										 src="${contextPath}/images/articles/${al.imagesThumbnail}" alt="${al.title}"/></figure>
						</a>
					</div>

					<div class="item-content">

						<strong class="category-link">
							<c:forEach var="ac" items="${al.articleCategories}">
								<a style="padding-right: 7px;" href="${contextPath}/${ac.slug}">${ac.name}</a>
							</c:forEach>
						</strong>

						<h3>
							<a title="${al.title}" href="${contextPath}/${al.slug}">${al.title}</a>
						</h3>
						<span class="item-meta">
						<a style="font-weight: bold;" href="${contextPath}/${al.slug}"><i
								class="fa fa-user"></i>${al.users.userName}</a>
						<a href="${contextPath}/${al.slug}"><i
								class="fa fa-comment-o"></i>${fn:length(al.comments)} Bình luận</a> <a href="${contextPath}/${al.slug}"><i
								class="fa fa-clock-o"></i><fmt:formatDate pattern="dd-MM-yyyy" value="${al.showDate}"/></a>

					</span>
						<p>${al.subContent}</p>
					</div>
				</div>
			</c:forEach>

		</div>
		<div style="padding-bottom: 60px; border-bottom: 1px solid #F0F0F0" class="content-panel-body pagination ">
			<%--<a class="prev page-numbers" href="#"><i class="fa fa-angle-left"></i>Trước</a>
            <a class="page-numbers" href="#">1</a> <span
                class="page-numbers current">2</span> <a class="page-numbers"
                                                         href="#">3</a> <a class="page-numbers" href="#">4</a> <a
                class="page-numbers" href="#">5</a> <a class="next page-numbers"
                                                       href="#">Tiếp theo<i class="fa fa-angle-right"></i></a>--%>
			<c:if test="${currentpage > 1  }">

				<a class="prev page-numbers"
				   href="${contextPath}/${objectCategoryAndTag.slug}/?${sorted}&page=${currentpage -1 }"><i
						class="fa fa-angle-left"></i>Trước</a>
			</c:if>
			<c:forEach begin="${(currentpage - 3) > 0 ? currentpage - 3 : 1 }"
					   end="${currentpage + 3 < pagecount ? currentpage + 3 : pagecount }"
					   varStatus="status">
				<c:choose>
					<c:when test="${status.index == currentpage }">

						<span class="page-numbers current">${status.index }</span>
					</c:when>
					<c:otherwise>

						<a class="page-numbers" href="${contextPath}/${objectCategoryAndTag.slug}?${sorted}&page=${status.index }">${status.index }</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${currentpage < pagecount }">

				<a class="next page-numbers"
				   href="${contextPath}/${objectCategoryAndTag.slug}?${sorted}&page=${currentpage +1 }">Sau<i
						class="fa fa-angle-right"></i></a>
			</c:if>

		</div>



		<!-- End tin mới -->
	</div>

</div>