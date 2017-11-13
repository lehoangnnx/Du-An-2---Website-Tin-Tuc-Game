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
<!-- Banner chi tiết bài viết -->
<div class="content-block-single" style="padding-top: 10px;">
    <div class="content-panel">
        <div class="article-full-image">
            <img src="${contextPath}/images/articles/${article.imagesThumbnail}" alt="">
            <div class="wrapper" style="margin-top: 31px;">
                <div class="content-panel-body article-header">

                    <strong class="category-link">
                        <c:forEach var="ac" items="${article.articleCategories}">
                            <a href="${contextPath}/${ac.slug}">${ac.name} &emsp;</a>
                            <span>  </span>
                        </c:forEach>

                    </strong>

                    <h2>${article.title}</h2>
                    <div class="article-meta">
                        <a href="#" class="meta-item">${article.users.userName}</a> <a href="#"
                                                                                       class="meta-item"><fmt:formatDate
                            pattern="dd-MM-yyyy" value="${article.showDate}"/></a> <a href="#"
                                                                                      class="meta-item">${article.views}
                        lượt xem</a>
                    </div>
                </div>
            </div>
        </div>
        <!-- Bài viết chí tiết -->
        <div class="content-panel-body shortcode-content">


            <c:out value="${article.mainContent}" escapeXml="false"/>


        </div>


        <!-- Đóng bài viết chí tiết -->
        <br>
        <!-- Thẻ hagtag, chia sẻ -->
        <div class="content-panel">
            <div class="content-panel-body article-main-share">
				<span class="share-front"><i class="fa fa-share-alt"></i>Chia
					sẻ</span> <a href="#" class="article-main-share-button"><strong
                    class="hover-color-facebook">Facebook</strong><i>2.1k</i></a> <a
                    href="#" class="article-main-share-button"><strong
                    class="hover-color-twitter">Twitter</strong><i>1.4k</i></a> <a href="#"
                                                                                   class="article-main-share-button"><strong
                    class="hover-color-google-plus">Google+</strong><i>603</i></a> <br>
            </div>
            <div class="content-panel">
                <div class="content-panel-body article-main-tags">
                    <span class="tags-front"><i class="fa fa-tags"></i>Xem thêm</span>
                    <c:forEach var="at" items="${article.tagses}">
                        <a href="${contextPath}/${at.slug}">${at.name}</a>
                    </c:forEach>
                </div>
            </div>
            <!-- END Thẻ hagtag, chi sẻ -->

            <!-- Game vote -->
            <div class="game-vote">
                <div class="row">
                    <div class="col-md-7">
                        <img src="images/g1.cache" alt="PlayerUnknown’s Battlegrounds"
                             class="pull-left m-r-10 hidden-xs">
                        <div class="pull-left">
                            <h3 class="title-game-vote">PlayerUnknown’s Battlegrounds</h3>
                            <p>
                                Danh mục: <span>Game Online</span><br> Nhà phát hành: <span>N/A</span>
                            </p>
                            <a class="btn btn-default btn-sm">Thông tin game</a> <a
                                class="btn btn-success btn-sm" href="#">Bạn bình chọn</a>
                        </div>
                    </div>
                    <div class="col-md-5">
                        <div class="rank-vote pull-right">9</div>
                        <div class="pull-right text-right">
                            Điểm đánh giá<br> <i class="fa fa-star"></i> <i
                                class="fa fa-star"></i> <i class="fa fa-star"></i> <i
                                class="fa fa-star"></i> <i class="fa fa-star"></i>
                        </div>
                    </div>
                </div>
                <div class="stars">
                    <form action="">
                        <h4></h4>
                        <input class="star star-5" id="star-5" type="radio" name="star">
                        <label class="star star-5" for="star-5"></label> <input
                            class="star star-4" id="star-4" type="radio" name="star">
                        <label class="star star-4" for="star-4"></label> <input
                            class="star star-3" id="star-3" type="radio" name="star">
                        <label class="star star-3" for="star-3"></label> <input
                            class="star star-2" id="star-2" type="radio" name="star">
                        <label class="star star-2" for="star-2"></label> <input
                            class="star star-1" id="star-1" type="radio" name="star"><label
                            class="star star-1" for="star-1"></label>
                    </form>
                </div>
            </div>
            <!-- End Game vote -->
            <br>

            <div class="content-panel">
                <div class="content-panel-body article-main-next-prev">
                    <div class="paragraph-row">
                        <div class="column6">
                            <a href="#" class="article-nav-previous">
                                <i class="fa fa-chevron-left"></i>
                                <span>Previous article</span>
                                <strong>Has ut quando laoreet et lucilius menandri usu duo ea errem urbanitas</strong>
                            </a>
                        </div>
                        <div class="column6">
                            <a href="#" class="article-nav-next">
                                <i class="fa fa-chevron-right"></i>
                                <span>Next article</span>
                                <strong>Amet iudico tincidunt at sea ut euismod antiopam interesset eos</strong>
                            </a>
                        </div>
                    </div>
                </div>
                <!-- END .content-panel -->
            </div>

            <!-- Bình luận -->
            <div class="content-panel">
                <div class="content-panel-title">
                    <h2>Bình luận</h2>
                </div>
                <div class="content-panel-body comment-list">
                    <ol id="comments">
                        <li class="comment">
                            <div class="comment-block">
                                <a href="#" class="image-avatar"> <img
                                        src="images/no-avatar-100x100.jpg"
                                        data-ot-retina="images/no-avatar-200x200.jpg" alt="" title="">
                                </a>
                                <div class="comment-text">
                                    <span class="time-stamp right">Tháng 11, 2017</span> <strong
                                        class="user-nick"><a href="#">Nguyễn Chiến</a></strong>
                                    <div class="shortcode-content">
                                        <p>Theo tôi thì Uzi là xạ thủ tốt nhất, sau đó tới PraY,
                                            và vị trí thứ cuối cùng trong Top 3 là tôi!.</p>
                                    </div>
                                    <span class="item-meta"> <a href="#"><i
                                            class="fa fa-thumbs-o-up"></i> Thích</a> <a href="#"><i
                                            class="fa fa-comment-o" style="margin-left: 25px;"></i> Bình
											luận</a>
									</span>
                                </div>

                            </div>
                            <ul class="children">
                                <li class="comment">
                                    <div class="comment-block">
                                        <a href="#" class="image-avatar"> <img
                                                src="images/photos/avatar-1.jpg"
                                                data-ot-retina="images/photos/avatar-1@2x.jpg" alt=""
                                                title="">
                                        </a>
                                        <div class="comment-text">
                                            <span class="time-stamp right">Tháng 11, 2017</span> <strong
                                                class="user-nick"><a href="#">Đạt Nguyễn</a><span
                                                class="user-label">Admin</span></strong>
                                            <div class="shortcode-content">
                                                <p>Bình luận một số từ</p>
                                            </div>
                                            <span class="item-meta"> <a href="#"><i
                                                    class="fa fa-thumbs-o-up"></i> Thích</a> <a href="#"><i
                                                    class="fa fa-comment-o" style="margin-left: 25px;"></i>
													Bình luận</a>
											</span>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </li>
                        <li class="comment">
                            <div class="comment-block">
                                <a href="#" class="image-avatar"> <img
                                        src="images/photos/avatar-1.jpg"
                                        data-ot-retina="images/photos/avatar-1@2x.jpg" alt="" title="">
                                </a>
                                <div class="comment-text">
                                    <span class="time-stamp right">Tháng 11, 2017</span> <strong
                                        class="user-nick"><a href="#">Nguyễn Hữu Hùng</a><span
                                        class="user-label">Admin</span></strong>
                                    <div class="shortcode-content">
                                        <p>Các bạn đọc cảm nhận ra sao về sự kiện này? Để lại bình
                                            luận cho chúng tôi trên Fanpage hoặc Group Cộng đồng Game24h
                                            nhé. Game 24h sẽ luôn cập nhật những thông tin Đột Kích nóng
                                            nhất từ trong nước đến quốc tế, mời các bạn đón đọc tại trang
                                            chủ.</p>
                                    </div>
                                    <span class="item-meta"> <a href="#"><i
                                            class="fa fa-thumbs-o-up"></i> Thích</a> <a href="#"><i
                                            class="fa fa-comment-o" style="margin-left: 25px;"></i> Bình
											luận</a>
									</span>
                                </div>
                            </div>
                        </li>
                        <li class="comment">
                            <div class="comment-block">
                                <a href="#" class="image-avatar"> <img
                                        src="images/photos/avatar-1.jpg"
                                        data-ot-retina="images/photos/avatar-1@2x.jpg" alt="" title="">
                                </a>
                                <div class="comment-text">
                                    <span class="time-stamp right">Tháng 11, 2017</span> <strong
                                        class="user-nick"><a href="#">Nguyễn Hữu Hùng</a><span
                                        class="user-label">Admin</span></strong>
                                    <div class="shortcode-content">
                                        <p>Các bạn đọc cảm nhận ra sao về sự kiện này? Để lại bình
                                            luận cho chúng tôi trên Fanpage hoặc Group Cộng đồng Game24h
                                            nhé.</p>
                                    </div>
                                    <span class="item-meta"> <a href="#"><i
                                            class="fa fa-thumbs-o-up"></i> Thích</a> <a href="#"><i
                                            class="fa fa-comment-o" style="margin-left: 25px;"></i> Bình
											luận</a>
									</span>
                                </div>
                            </div>
                        </li>
                    </ol>
                </div>
                <div class="xemthem"
                     style="padding: 10px 1px; text-align: center; background: #f7f7f7; margin-bottom: 20px;">
                    <a href="#">Xem thêm bình luận</a>
                </div>
            </div>
            <!-- End Bình luận -->

            <!-- Trả lời bình luận -->
            <li class="comment">
                <div class="comment-block">
                    <a href="#" class="image-avatar"> <img
                            src="images/no-avatar-100x100.jpg"
                            data-ot-retina="images/no-avatar-200x200.jpg" alt="" title="">
                    </a>
                    <div class="comment-text">
                        <strong class="user-nick"><a href="#">Chuối hột</a></strong>
                        <textarea id="subject" name="subject"
                                  placeholder="Viết bình luận của bạn.."
                                  style="width: 100%; height: 100px"></textarea>
                        <p class="form-submit">
                            <input name="submit" type="submit" id="submit"
                                   class="submit button" value="Gửi bình luận">
                        </p>
                    </div>
                </div>
            </li>
            <!-- End trả lời bình luận -->
        </div>
    </div>
    <!-- Tin mới -->
    <br> <br>
    <div class="content-panel">
        <div class="content-panel-title">
            <div class="feed-widget-header">
                <h2 class="widget-title feed-widget-title">
                    <a href="#">CÙNG CHUYÊN MỤC</a>
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
                                <a href="#"><img src="images/photos/image-7.jpg" alt=""/></a>
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
                                <a href="#"><img src="images/photos/image-8.jpg" alt=""/></a>
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
                                <a href="#"><img src="images/photos/image-9.jpg" alt=""/></a>
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
                                <a href="#"><img src="images/photos/image-9.jpg" alt=""/></a>
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
							</span></span> <img src="images/image-19.jpg" alt=""/>
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
        <!-- Danh sách game -->
    </div>

    <br>
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
						</span></span> <img src="images/anh/1.jpg" alt="">
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
						</span></span> <img src="images/anh/2.jpg" alt="">
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
						</span></span> <img src="images/anh/3.jpg" alt="">
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
    </div>
    <!-- End tin mới -->

    <div class="container hidden-xs hidden-sm"></div>

</div>