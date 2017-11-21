<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="security"
           uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<div class="container">
    <div class="row user-menu-container square">
        <div class="col-md-7 user-details">
            <div class="row coralbg white">
                <div class="col-md-6 no-pad">
                    <div class="user-pad">
                        <h3 >Call of Duty</h3><br>
                        <h4 class="white"><i class="fa fa-check-circle-o"></i> Game nhập vai hành động</h4>
                        <p>Call of duty là game di động chiến thuật được xây dựng dựa trên bối cảnh của tựa game huyền thoại Warcraft 3. </p>
                    </div>
                </div>
                <div class="col-md-6 no-pad">
                    <div class="user-image">
                        <img src="images/anhgame/t1.jpg" class="img-responsive thumbnail">
                    </div>
                </div>
            </div>
            <div class="row overview">
                <div class="col-md-4 user-pad text-center">
                    <h3>LƯỢT XEM</h3>
                    <h4>2,784</h4>
                </div>
                <div class="col-md-4 user-pad text-center">
                    <h3>ĐÁNH GIÁ</h3>
                    <h4>456</h4>
                </div>
                <div class="col-md-4 user-pad text-center">
                    <h3>SỐ LƯỢT TẢI </h3>
                    <h4>4,901</h4>
                </div>
            </div>
        </div>
        <div class="col-md-1 user-menu-btns">
            <div class="btn-group-vertical square" id="responsive">
                <a href="#" class="btn btn-block btn-default active">
                    <i class="fa fa-search fa-3x"></i>
                </a>
                <a href="#" class="btn btn-default">
                    <i class="fa fa-wrench fa-3x"></i>
                </a>
                <a href="#" class="btn btn-default">
                    <i class="fa fa-heart fa-3x"></i>
                </a>
                <a href="#" class="btn btn-default">
                    <i class="fa fa-download fa-3x"></i>
                </a>

            </div>
        </div>
        <div class="col-md-4 user-menu user-pad">
            <div class="user-menu-content active">
                <h3>
                    Thông tin game
                </h3>
                <ul class="user-menu-list">
                    <p>Call of Duty Black Ops III (Call of Duty Black Ops 3, Call of Duty 2015, Call of Duty 12) là game bắn súng góc nhìn thứ nhất, là phiên bản thứ 12 trong seri Call of Duty. Game đưa người chơi vào chiến trường mạnh mẽ của tương lai, nơi mà công nghệ sinh học đã cho phép tạo ra những người lính công nghệ cao, những quân nhân nửa người nửa robot với những khả năng vượt trội.</p>
                </ul>
            </div>
            <div class="user-menu-content">
                <h3>
                    Cấu hình chơi game
                </h3>
                <ul class="user-menu-list">
                    <li>
                        <h4>OS: Windows 7 64-Bit / Windows 8 64-Bit / Windows 8.1 64-Bit
                        </h4>
                    </li>
                    <li>
                        <h4>Processor: Intel® Core™ i3-530 @ 2.93 GHz / AMD Phenom™ II X4 810 @ 2.60 GHz
                            Memory: 6 GB RAM</h4>
                    </li>
                    <li>
                        <h4>Graphics: NVIDIA® GeForce® GTX 470 @ 1GB / ATI® Radeon™ HD 6970 @ 1GB
                            DirectX: Version 11</h4>
                    </li>
                </ul>
            </div>
            <div class="user-menu-content">
                <h3>
                    Bình chọn game
                </h3>
                <ul class="user-menu-list">

                        <div class="row lead evaluation">
                            <div id="colorstar" class="starrr ratable" ></div>
                            <span id="count">0</span> star(s) - <span id="meaning"> </span>

                            <div class='indicators' style="display:none">
                                <div id='textwr'>What went wrong?</div>
                                <input id="rate[]" name="rate[]" type="text" placeholder="" class="form-control input-md" style="display:none;">
                                <input id="rating[]" name="rating[]" type="text" placeholder="" class="form-control input-md rateval" style="display:none;">
                            </div>

                        </div>
                </ul>
            </div>
            <div class="user-menu-content">
                <h2 class="text-center">
                    DOWNLOAD
                </h2>
                <center><i class="fa fa-cloud-upload fa-4x"></i></center>
                <div class="share-links">
                    <center><button type="button" class="btn btn-lg btn-labeled btn-success" href="#" style="margin-bottom: 15px;">
                        <span class="btn-label"><i class="fa fa-arrow-circle-o-down"></i></span>TẢI TRỰC TIẾP TỪ WEB
                    </button></center>
                    <center><button type="button" class="btn btn-lg btn-labeled btn-warning" href="#">
                        <span class="btn-label"><i class="fa fa-arrow-circle-o-down"></i></span>LINK DRIVE
                    </button></center>
                </div>
            </div>
        </div>
    </div>
</div>
<br><br>




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
<!-- Danh sach game -->
<div class="container">
    <h2 class="widget-title feed-widget-title">
        <a href="/video?sorted=hots">DANH SÁCH GAME</a>
    </h2>
    <br>
    <div class="container">
        <div class="row">
            <div class="col-md-2">
                <h5>Thể loại</h5>
                <form class="form-horizontal" role="form">
                    <div class="form-group">
                        <select class="form-control">
                            <option value="0" selected>Game hành động</option>
                            <option value="1">Game nhập vai</option>
                            <option value="2">Game chiến thuật</option>
                            <option value="3">Game đua xe</option>
                            <option value="4">Game thời trang</option>
                        </select>
                    </div>
                </form>
            </div>
            <div class="col-md-2">
                <h5>Tên game</h5>
                <form class="form-horizontal" role="form">
                    <div class="form-group">
                        <select class="form-control">
                            <option value="0" selected>Liên minh huyền thoại</option>
                            <option value="1">Fifa 2017</option>
                            <option value="2">Ngọa long</option>
                            <option value="3">Đột kích</option>
                            <option value="4">Liên quan moblie</option>
                        </select>
                    </div>
                </form>
            </div>

            <div class="col-md-2">
                <h5>Loại game</h5>
                <form class="form-horizontal" role="form">
                    <div class="form-group">
                        <select class="form-control">
                            <option value="0" selected>Game online</option>
                            <option value="1">Game offline</option>
                            <option value="2">Game di động</option>
                            <option value="3">Game PC</option>
                        </select>
                    </div>
                </form>
            </div>
            <div class="col-md-2">
                <h5>Tìm nâng cao</h5>
                <form class="form-horizontal" role="form">
                    <div class="form-group">
                        <select class="form-control">
                            <option value="0" selected>Game online</option>
                            <option value="1">Game offline</option>
                            <option value="2">Game di động</option>
                            <option value="3">Game PC</option>
                        </select>
                    </div>
                </form>
            </div>

            <div class="col-md-1">
                <button type="button" class="btn btn-warning" style="margin-top: 23px;">Tìm kiếm</button>
            </div>
        </div>
    </div>
    <br><br>
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

                        <a class="page-numbers"
                           href="${contextPath}/${objectCategoryAndTag.slug}?${sorted}&page=${status.index }">${status.index }</a>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
            <c:if test="${currentpage < pagecount }">

                <a class="next page-numbers"
                   href="${contextPath}/${objectCategoryAndTag.slug}?${sorted}&page=${currentpage +1 }">Sau<i
                        class="fa fa-angle-right"></i></a>
            </c:if>

        </div>


