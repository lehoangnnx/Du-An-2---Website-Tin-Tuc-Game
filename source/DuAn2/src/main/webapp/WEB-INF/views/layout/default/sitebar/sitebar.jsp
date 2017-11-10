<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<aside class="sidebar">


    <div class="widget">
        <h3>Video Nỏi Bật</h3>
        <div class="widget-article-list">
            <c:forEach var="gactvl" items="${getArticleCategoryTopVideoList}">
                <div class="item">
                    <div class="item-header">
                        <a href="${contextPath}/${gactvl.slug}"><img src="${contextPath}/images/articles/${gactvl.imagesThumbnail}"
                              class="img-responsive"    title="${gactvl.title}"  alt="${gactvl.title}"/>

                        </a>
                    </div>
                    <div class="item-content">
                        <h4>
                            <a title="${gactvl.title}" href="${contextPath}/${gactvl.slug}">${fn:substring(gactvl.title, 0, 80)} ...</a>
                        </h4>
                        <span class="item-meta"> <a href="#"><i
                                class="fa fa-comment-o"></i>82 Bình luận</a> <a href="#"><i
                                class="fa fa-clock-o"></i><fmt:formatDate pattern="dd-MM-yyyy" value="${gactvl.createdDate}"/></a>
										</span>
                    </div>
                </div>
            </c:forEach>

            <a href="${contextPath}/${getArticleCategoryVideo.slug}?sorted=top" class="button-read-more">Hiện thị nhiều hơn</a>
        </div>
    </div>


    <div class="widget">
        <h3>Tin mới liên quan</h3>
        <div class="widget-article-list">
            <div class="item">
                <div class="item-header">
                    <a href="#"><img src="images/photos/image-7.jpg" alt=""/></a>
                </div>
                <div class="item-content">
                    <h4>
                        <a href="#">Gran Turismo Sport - Vũ điệu tốc độ của người
                            Nhật Bản</a>
                    </h4>
                    <span class="item-meta"> <a href="#"><i
                            class="fa fa-comment-o"></i>82 Bình luận</a> <a href="#"><i
                            class="fa fa-clock-o"></i>Tháng 10, 2017</a>
										</span>
                </div>
            </div>

            <div class="item">
                <div class="item-header">
                    <a href="#"><img src="images/photos/image-8.jpg" alt=""/></a>
                </div>
                <div class="item-content">
                    <h4>
                        <a href="#">Cùng soi Hàng Long Phục Hổ sau ngày mở cửa
                            rộng rãi tại Việt Nam</a>
                    </h4>
                    <span class="item-meta"> <a href="#"><i
                            class="fa fa-comment-o"></i>82 Bình luận</a> <a href="#"><i
                            class="fa fa-clock-o"></i>Tháng 10, 2017</a>
										</span>
                </div>
            </div>

            <div class="item">
                <div class="item-header">
                    <a href="#"><img src="images/photos/image-9.jpg" alt=""/></a>
                </div>
                <div class="item-content">
                    <h4>
                        <a href="#">Ngạo Kiếm Vô Song 2 mở cửa không reset tại
                            Việt Nam vào ngày 27/10</a>
                    </h4>
                    <span class="item-meta"> <a href="#"><i
                            class="fa fa-comment-o"></i>82 Bình luận</a> <a href="#"><i
                            class="fa fa-clock-o"></i>Tháng 10, 2017</a>
										</span>
                </div>
            </div>
            <a href="#" class="button-read-more">Hiện thị nhiều hơn</a>
        </div>
    </div>
    <div class="widget widget-tabbed">
        <h3>
            <span class="active">Top game</span><span class="">Game
									Online</span><span class="">Game Offline</span>
        </h3>
        <div class="widget-comments-list active">

            <div class="item">
                <div class="item-header">
                    <img src="images/game/11.cache" alt="">
                </div>
                <div class="item-content">
                    <h4>
                        <a href="#">Blade &amp; Soul</a>
                    </h4>
                    <p>Blade &amp; Soul - Garena hay còn được gọi B&amp;S Garena là
                        tựa game nhập vai...</p>
                    <span class="item-meta"> <a href="#"><i class="fa fa-reply"></i>Xem chi tiết</a>
										</span>
                </div>
            </div>

            <div class="item">
                <div class="item-header">
                    <img src="images/game/10.cache" alt="">
                </div>
                <div class="item-content">
                    <h4>
                        <a href="#">Audition - VTC Game</a>
                    </h4>
                    <p>Audition là tựa game nhảy PC “huyền thoại” đã trải qua
                        hơn 10 năm thăng trầm...</p>
                    <span class="item-meta"> <a href="#"><i class="fa fa-reply"></i>Xem chi tiết</a>
										</span>
                </div>
            </div>

            <div class="item">
                <div class="item-header">
                    <img src="images/game/12.cache" alt="">
                </div>
                <div class="item-content">
                    <h4>
                        <a href="#">Võ Lâm Truyền Kỳ Web</a>
                    </h4>
                    <p>Webgame Võ Lâm Truyền Kỳ là game online kiếm hiệp được
                        phát triển bởi chính KingSoft...</p>
                    <span class="item-meta"> <a href="#"><i class="fa fa-reply"></i>Xem chi tiết</a>
										</span>
                </div>
            </div>
            <div class="item">
                <div class="item-header">
                    <img src="images/game/13.cache" alt="">
                </div>
                <div class="item-content">
                    <h4>
                        <a href="#">Cửu Âm Chân Kinh 2</a>
                    </h4>
                    <p>Cửu Âm Chân Kinh 1 có lối chơi do thám bằng cách đưa ra
                        cho bạn 1 mục tiêu...</p>
                    <span class="item-meta"> <a href="#"><i class="fa fa-reply"></i>Xem chi tiết</a>
										</span>
                </div>
            </div>
            <div class="item">
                <div class="item-header">
                    <img src="images/game/14.cache" alt="">
                </div>
                <div class="item-content">
                    <h4>
                        <a href="#">PlayerUnknown’s Battlegrounds</a>
                    </h4>
                    <p>Nếu nhắc đến các tựa game hay của năm 2017, sẽ thật sai
                        lầm nếu không nhắc đến PlayerUnknown’s Battlegrounds
                        (PUBG)...</p>
                    <span class="item-meta"> <a href="#"><i class="fa fa-reply"></i>Xem chi tiết</a>
										</span>
                </div>
            </div>

        </div>
        <div class="widget-article-list">

            <div class="item">
                <div class="item-header">
                    <img src="images/game/15.cache" alt="">
                </div>
                <div class="item-content">
                    <h4>
                        <a href="#">Transformers Online</a>
                    </h4>
                    <p>Blade &amp; Soul - Garena hay còn được gọi B&amp;S Garena là
                        tựa game nhập vai...</p>
                    <span class="item-meta"> <a href="#"><i class="fa fa-reply"></i>Xem chi tiết</a>
										</span>
                </div>
            </div>
            <div class="item">
                <div class="item-header">
                    <img src="images/game/16.cache" alt="">
                </div>
                <div class="item-content">
                    <h4>
                        <a href="#">Xuất Kích</a>
                    </h4>
                    <p>Xuất Kích trở lại "mạnh mẽ" với bản BIG UPDATE ...</p>
                    <span class="item-meta"> <a href="#"><i class="fa fa-reply"></i>Xem chi tiết</a>
										</span>
                </div>
            </div>
            <div class="item">
                <div class="item-header">
                    <img src="images/game/17.cache" alt="">
                </div>
                <div class="item-content">
                    <h4>
                        <a href="#">Biệt Kích Mobile</a>
                    </h4>
                    <p>Biệt Kích Mobile - Garena hay còn được gọi B&amp;S Garena là
                        tựa game nhập vai...</p>
                    <span class="item-meta"> <a href="#"><i class="fa fa-reply"></i>Xem chi tiết</a>
										</span>
                </div>
            </div>

            <a href="#" class="button-read-more">Hiện thị thêm</a>

        </div>
        <div class="widget-article-list">

            <div class="item">
                <div class="item-header">
                    <img src="images/game/18.cache" alt="">
                </div>
                <div class="item-content">
                    <h4>
                        <a href="#">Dragon Blaze</a>
                    </h4>
                    <p>Biệt Kích Mobile - Garena hay còn được gọi B&amp;S Garena là
                        tựa game nhập vai...</p>
                    <span class="item-meta"> <a href="#"><i class="fa fa-reply"></i>Xem chi tiết</a>
										</span>
                </div>
            </div>

            <div class="item">
                <div class="item-header">
                    <img src="images/game/19.cache" alt="">
                </div>
                <div class="item-content">
                    <h4>
                        <a href="#">Minions Paradise</a>
                    </h4>
                    <p>Biệt Kích Mobile - Garena hay còn được gọi B&amp;S Garena là
                        tựa game nhập vai...</p>
                    <span class="item-meta"> <a href="#"><i class="fa fa-reply"></i>Xem chi tiết</a>
										</span>
                </div>
            </div>

            <div class="item">
                <div class="item-header">
                    <img src="images/game/20.cache" alt="">
                </div>
                <div class="item-content">
                    <h4>
                        <a href="#">Cửu Âm VNG</a>
                    </h4>
                    <p>Biệt Kích Mobile - Garena hay còn được gọi B&amp;S Garena là
                        tựa game nhập vai...</p>
                    <span class="item-meta"> <a href="#"><i class="fa fa-reply"></i>Xem chi tiết</a>
										</span>
                </div>
            </div>

            <a href="#" class="button-read-more">Hiện thị thêm</a>

        </div>
    </div>
    <div class="widget">
        <h3>Kết nối với chúng tôi</h3>
        <div class="social-widget">
            <div class="social-squares">
                <a href="#" target="_blank" class="hover-color-facebook"><i
                        class="fa fa-facebook"></i></a> <a href="#" target="_blank"
                                                           class="hover-color-twitter"><i class="fa fa-twitter"></i></a>
                <a href="#" target="_blank" class="hover-color-google-plus"><i
                        class="fa fa-google-plus"></i></a> <a href="#" target="_blank"
                                                              class="hover-color-youtube"><i
                    class="fa fa-youtube-play"></i></a>
            </div>
        </div>
    </div>

    <div class="widget widget-tabbed">
        <h3>
            <span class="active">Game mới</span><span class="">Review</span><span
                class="">Tiện ích</span>
        </h3>
        <div class="widget-comments-list active">

            <div class="item">
                <div class="item-header">
                    <img src="images/no-avatar.jpg" alt=""/>
                </div>
                <div class="item-content">
                    <h4>
                        <a href="#">Uncharted Waters Online</a>
                    </h4>
                    <p>Uncharted Waters Online dựa trên dòng game offline nổi
                        tiếng Uncharted Waters...</p>
                    <span class="item-meta"> <a href="#"><i
                            class="fa fa-reply"></i>Xem chi tiết</a>
										</span>
                </div>
            </div>

            <div class="item">
                <div class="item-header">
                    <img src="images/no-avatar.jpg" alt=""/>
                </div>
                <div class="item-content">
                    <h4>
                        <a href="#">Hyper Universe</a>
                    </h4>
                    <p>Gameplay của Hyper Universe có sự kết hợp rất tốt giữa
                        cuộn cảnh màn ngang và MOBA...</p>
                    <span class="item-meta"> <a href="#"><i
                            class="fa fa-reply"></i>Xem chi tiết</a>
										</span>
                </div>
            </div>

            <div class="item">
                <div class="item-header">
                    <img src="images/no-avatar.jpg" alt=""/>
                </div>
                <div class="item-content">
                    <h4>
                        <a href="#">Laser League</a>
                    </h4>
                    <p>Khi tham gia vào thế giới ảo của Laser League, gần như
                        game thủ chỉ cần nháy mắt sai thời điểm một...</p>
                    <span class="item-meta"> <a href="#"><i
                            class="fa fa-reply"></i>Xem chi tiết</a>
										</span>
                </div>
            </div>

        </div>
        <div class="widget-article-list">

            <div class="item">
                <div class="item-header">
                    <a href="#"><img src="images/photos/image-7.jpg" alt=""></a>
                </div>
                <div class="item-content">
                    <h4>
                        <a href="#">Gameplay của Hyper Universe có sự kết hợp rất
                            tốt giữa cuộn cảnh màn ngang và MOBA..</a>
                    </h4>
                    <span class="item-meta"> <a href="#"><i
                            class="fa fa-comment-o"></i>82 Bình luận</a> <a href="#"><i
                            class="fa fa-clock-o"></i>Tháng 10, 2017</a>
										</span>
                </div>
            </div>

            <div class="item">
                <div class="item-header">
                    <a href="#"><img src="images/photos/image-8.jpg" alt=""></a>
                </div>
                <div class="item-content">
                    <h4>
                        <a href="#">Gameplay của Hyper Universe có sự kết hợp rất
                            tốt giữa cuộn cảnh màn ngang và MOBA..</a>
                    </h4>
                    <span class="item-meta"> <a href="#"><i
                            class="fa fa-comment-o"></i>82 Bình luận</a> <a href="#"><i
                            class="fa fa-clock-o"></i>Tháng 10, 2017</a>
										</span>
                </div>
            </div>

            <div class="item">
                <div class="item-header">
                    <a href="#"><img src="images/photos/image-9.jpg" alt=""></a>
                </div>
                <div class="item-content">
                    <h4>
                        <a href="#">Gameplay của Hyper Universe có sự kết hợp rất
                            tốt giữa cuộn cảnh màn ngang và MOBA..</a>
                    </h4>
                    <span class="item-meta"> <a href="#"><i
                            class="fa fa-comment-o"></i>82 Bình luận</a> <a href="#"><i
                            class="fa fa-clock-o"></i>Tháng 10, 2017</a>
										</span>
                </div>
            </div>

            <a href="#" class="button-read-more">Hiện thị thêm</a>

        </div>
        <div class="widget-article-list">

            <div class="item">
                <div class="item-header">
                    <a href="#"><img src="images/photos/image-9.jpg" alt=""></a>
                </div>
                <div class="item-content">
                    <h4>
                        <a href="#">Gameplay của Hyper Universe có sự kết hợp rất
                            tốt giữa cuộn cảnh màn ngang và MOBA..</a>
                    </h4>
                    <span class="item-meta"> <a href="#"><i
                            class="fa fa-comment-o"></i>82 Bình luận</a> <a href="#"><i
                            class="fa fa-clock-o"></i>Tháng 10, 2017</a>
										</span>
                </div>
            </div>

            <div class="item">
                <div class="item-header">
                    <a href="#"><img src="images/photos/image-7.jpg" alt=""></a>
                </div>
                <div class="item-content">
                    <h4>
                        <a href="#">Gameplay của Hyper Universe có sự kết hợp rất
                            tốt giữa cuộn cảnh màn ngang và MOBA..</a>
                    </h4>
                    <span class="item-meta"> <a href="#"><i
                            class="fa fa-comment-o"></i>82 Bình luận</a> <a href="#"><i
                            class="fa fa-clock-o"></i>Tháng 10, 2017</a>
										</span>
                </div>
            </div>

            <div class="item">
                <div class="item-header">
                    <a href="#"><img src="images/photos/image-8.jpg" alt=""></a>
                </div>
                <div class="item-content">
                    <h4>
                        <a href="#">Gameplay của Hyper Universe có sự kết hợp rất
                            tốt giữa cuộn cảnh màn ngang và MOBA..</a>
                    </h4>
                    <span class="item-meta"> <a href="#"><i
                            class="fa fa-comment-o"></i>82 Bình luận</a> <a href="#"><i
                            class="fa fa-clock-o"></i>Tháng 10, 2017</a>
										</span>
                </div>
            </div>

            <a href="#" class="button-read-more">Hiện thị thêm</a>

        </div>
    </div>

    <div class="widget">
        <h3>Thủ thuật game cập nhật</h3>
        <div class="widget-photo-gallery">

            <div class="item">
                <div class="item-content">
                    <h4>
                        <a href="#">Liên Quân Mobile: Điểm qua 4 vị tướng mà
                            người chơi chưa thể và cũng khó có thể biết mặt</a>
                    </h4>
                    <span class="item-meta"> <a href="#"><i
                            class="fa fa-camera"></i>16 lượt xem</a> <a href="#"><i
                            class="fa fa-reply"></i>Xem chi tiết</a>
										</span>
                </div>
            </div>

            <div class="item">
                <div class="item-content">
                    <h4>
                        <a href="#">Đập hộp chiếc VGA GTX 1070 Ti đầu tiên xuất
                            hiện tại Việt Nam</a>
                    </h4>
                    <span class="item-meta"> <a href="#"><i
                            class="fa fa-camera"></i>16 lượt xem</a> <a href="#"><i
                            class="fa fa-reply"></i>Xem chi tiết</a>
										</span>
                </div>
            </div>
            <div class="item">
                <div class="item-content">
                    <h4>
                        <a href="#">Liên Quân Mobile: Điểm qua 4 vị tướng mà
                            người chơi chưa thể và cũng khó có thể biết mặt</a>
                    </h4>
                    <span class="item-meta"> <a href="#"><i
                            class="fa fa-camera"></i>16 lượt xem</a> <a href="#"><i
                            class="fa fa-reply"></i>Xem chi tiết</a>
										</span>
                </div>
            </div>

            <div class="item">
                <div class="item-content">
                    <h4>
                        <a href="#">Đập hộp chiếc VGA GTX 1070 Ti đầu tiên xuất
                            hiện tại Việt Nam</a>
                    </h4>
                    <span class="item-meta"> <a href="#"><i
                            class="fa fa-camera"></i>16 lượt xem</a> <a href="#"><i
                            class="fa fa-reply"></i>Xem chi tiết</a>
										</span>
                </div>
            </div>
            <a href="#" class="button-read-more">Hiện thị nhiều hơn</a>

        </div>
    </div>
    <div class="widget">
        <h3>Xem thêm</h3>
        <div class="tagcloud">
            <a href="#">#GameOnline</a> <a href="#">#Game</a> <a href="#">#Game</a>
            <a href="#">#Game thể thao</a> <a href="#">Game sinh tồn</a> <a
                href="#">#Tin tức mới</a> <a href="#">Video nổi bật</a> <a
                href="#">#Game chuyển động</a> <a href="#">Thể loại game</a> <a
                href="#">#Download game</a> <a href="#">#Danh sách game</a> <a
                href="#"> #Game bắn súng</a>
        </div>
    </div>

    <div class="widget">
        <h3>Game nổi bật</h3>
        <div class="widget-article-list">

            <div class="item">
                <div class="item-header">
                    <a href="#"><img src="images/photos/image-9.jpg" alt=""/></a>
                </div>
                <div class="item-content">
                    <h4>
                        <a href="#">Liên Minh Huyền Thoại</a>
                    </h4>
                    <div>
                        <strong class="item-stars"><span class="stars-inner"
                                                         style="width: 100%;"></span></strong>
                    </div>
                    <span class="item-meta"> <a href="#"><i
                            class="fa fa-comment-o"></i>82 Bình luận</a> <a href="#"><i
                            class="fa fa-clock-o"></i>Tháng 10, 2017</a>
										</span>
                </div>
            </div>

            <div class="item">
                <div class="item-header">
                    <a href="#"><img src="images/photos/image-7.jpg" alt=""/></a>
                </div>
                <div class="item-content">
                    <h4>
                        <a href="#">Đột Kích</a>
                    </h4>
                    <div>
                        <strong class="item-stars"><span class="stars-inner"
                                                         style="width: 60%;"></span></strong>
                    </div>
                    <span class="item-meta"> <a href="#"><i
                            class="fa fa-comment-o"></i>82 Bình luận</a> <a href="#"><i
                            class="fa fa-clock-o"></i>Tháng 10, 2017</a>
										</span>
                </div>
            </div>

            <div class="item">
                <div class="item-header">
                    <a href="#"><img src="images/photos/image-8.jpg" alt=""/></a>
                </div>
                <div class="item-content">
                    <h4>
                        <a href="#">Thế Giới Hoàn Mỹ VTC</a>
                    </h4>
                    <div>
                        <strong class="item-stars"><span class="stars-inner"
                                                         style="width: 80%;"></span></strong>
                    </div>
                    <span class="item-meta"> <a href="#"><i
                            class="fa fa-comment-o"></i>82 Bình luận</a> <a href="#"><i
                            class="fa fa-clock-o"></i>Tháng 10, 2017</a>
										</span>
                </div>
            </div>

            <a href="#" class="button-read-more">Hiện thị thêm</a>

        </div>
    </div>

    <div class="widget">
        <h3>Cộng đồng</h3>
        <div class="widget-instagram-photos">

            <div class="item">

                <div class="item-content">
										<span class="insta-like-count"><i class="fa fa-heart"></i>160
											likes</span>
                    <h4>
                        <a href="#">Trải nghiệm MU Online Web - Công nghệ đồ họa
                            hiện đại</a>
                    </h4>
                    <span class="item-meta"> <a href="#"><i
                            class="fa fa-clock-o"></i>3 days ago</a>
										</span>
                </div>
            </div>

            <div class="item">

                <div class="item-content">
										<span class="insta-like-count"><i class="fa fa-heart"></i>1550
											likes</span>
                    <h4>
                        <a href="#">CFSI 2017: EvaTeams – Mỗi trận đấu đều là một
                            trận chung kết sớm</a>
                    </h4>
                    <span class="item-meta"> <a href="#"><i
                            class="fa fa-clock-o"></i>6 days ago</a>
										</span>
                </div>
            </div>
            <div class="item">

                <div class="item-content">
										<span class="insta-like-count"><i class="fa fa-heart"></i>1600
											likes</span>
                    <h4>
                        <a href="#">Trải nghiệm Vô Địch Tam Quốc - Game chiến
                            thuật phong cách người lớn hoàn toàn khác lạ.</a>
                    </h4>
                    <span class="item-meta"> <a href="#"><i
                            class="fa fa-clock-o"></i>6 days ago</a>
										</span>
                </div>
            </div>
            <div class="item">

                <div class="item-content">
										<span class="insta-like-count"><i class="fa fa-heart"></i>160
											likes</span>
                    <h4>
                        <a href="#">Liên Quân Mobile: Top 3 vị tướng sở hữu nhiều
                            loại vũ khí chiến đấu nhất thời điểm hiện tại</a>
                    </h4>
                    <span class="item-meta"> <a href="#"><i
                            class="fa fa-clock-o"></i>6 days ago</a>
										</span>
                </div>
            </div>

            <a href="#" target="_blank" class="button-read-more">Hiện
                thị nhiều hơn</a>

        </div>
    </div>

    <!-- END .sidebar -->
</aside>
