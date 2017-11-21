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
                        <h4>OS: Windows 7 64-Bit / Windows 8 64-Bit / Windows 8.1 64-Bit OS: Windows 7 64-Bit / Windows 8 64-Bit / Windows 8.1 64-Bit OS: Windows 7 64-Bit / Windows 8 64-Bit / Windows 8.1 64-Bit
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
<!-- Đóng -->
<!-- Banner chi tiết bài viết -->
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