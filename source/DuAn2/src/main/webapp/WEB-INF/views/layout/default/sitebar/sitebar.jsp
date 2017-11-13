<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<aside class="sidebar " id="sidebar">


    <div class="widget">
        <h3>Video Nổi Bật</h3>
        <div class="widget-article-list">
            <c:forEach var="gactvl" items="${getTop5ArticleCategoryHotVideoList}">
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
                                class="fa fa-eye"></i>82 Bình luận</a> <a href="#"><i
                                class="fa fa-clock-o"></i><fmt:formatDate pattern="dd-MM-yyyy" value="${gactvl.createdDate}"/></a>
										</span>
                    </div>
                </div>
            </c:forEach>

            <a href="${contextPath}/video?sorted=top" class="button-read-more">Hiện thị nhiều hơn</a>
        </div>
    </div>


    <div class="widget">
        <h3>Tin Nổi Bật</h3>
        <div class="widget-article-list">
            <c:forEach var="gha" items="${getTop10HotArticle}">
            <div class="item">
                <div class="item-header">
                    <a href="${contextPath}/${gha.slug}"><img src="${contextPath}/images/articles/${gha.imagesThumbnail}" alt=""/></a>
                </div>
                <div class="item-content">
                    <h4>
                        <a href="${gha.slug}">${gha.title}</a>
                    </h4>
                    <span class="item-meta"> <a href="${gha.slug}"><i
                            class="fa fa-eye"></i>${gha.views}</a> <a href="${gha.slug}"><i
                            class="fa fa-clock-o"></i><fmt:formatDate pattern="dd-MM-yyyy" value="${gha.createdDate}"/></a>
										</span>
                </div>
            </div>
            </c:forEach>

            <a href="${contextPath}/articles?sorted=hot" class="button-read-more">Hiện thị nhiều hơn</a>
        </div>
    </div>
    <div class="widget widget-tabbed">
        <h3>
            <span class="active">Game Nổi Bật</span><span class="">Game
									Online</span><span class="">Game Offline</span>
        </h3>
        <div class="widget-comments-list active">
            <c:forEach var="ghg" items="${getTop10HotGame}">
            <div class="item">
                <div class="item-header">
                    <img src="${contextPath}/images/games/${ghg.images}" alt="">
                </div>
                <div class="item-content">
                    <h4>
                        <a href="${contextPath}/${ghg.slug}">${ghg.name}</a>
                    </h4>
                    <p>${ghg.description}</p>
                    <span class="item-meta"> <a href="${contextPath}/${ghg.slug}"><i class="fa fa-reply"></i>Xem chi tiết</a>
										</span>
                </div>
            </div>
            </c:forEach>
            <a href="${contextPath}/game?sorted=hots" class="button-read-more">Hiện thị thêm</a>
        </div>
        <div class="widget-article-list">
            <c:forEach var="ggo" items="${getTop10GameOnline}">
            <div class="item">
                <div class="item-header">
                    <img src="${contextPath}/images/games/${ggo.images}" alt="">
                </div>
                <div class="item-content">
                    <h4>
                        <a href="${contextPath}/${ggo.slug}">${ggo.name}</a>
                    </h4>
                    <p>${ggo.description}</p>
                    <span class="item-meta"> <a href="${contextPath}/${ggo.slug}"><i class="fa fa-reply"></i>Xem chi tiết</a>
										</span>
                </div>
            </div>
            </c:forEach>
            <a href="${contextPath}/game-online?sorted=hots" class="button-read-more">Hiện thị thêm</a>
        </div>


        <div class="widget-article-list">
            <c:forEach var="ggof" items="${getTop10GameOffline}">
                <div class="item">
                    <div class="item-header">
                        <img src="${contextPath}/images/games/${ggof.images}" alt="">
                    </div>
                    <div class="item-content">
                        <h4>
                            <a href="${contextPath}/${ggof.slug}">${ggof.name}</a>
                        </h4>
                        <p>${ggof.description}</p>
                        <span class="item-meta"> <a href="${contextPath}/${ggof.slug}"><i class="fa fa-reply"></i>Xem chi tiết</a>
										</span>
                    </div>
                </div>
            </c:forEach>
            <a href="${contextPath}/game-offline?sorted=hots" class="button-read-more">Hiện thị thêm</a>

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
            <c:forEach var="gng" items="${getTop10NewGame}">
                <div class="item">
                    <div class="item-header">
                        <img src="${contextPath}/images/games/${gng.images}" alt="">
                    </div>
                    <div class="item-content">
                        <h4>
                            <a href="${contextPath}/${gng.slug}">${gng.name}</a>
                        </h4>
                        <p>${gng.description}</p>
                        <span class="item-meta"> <a href="${contextPath}/${gng.slug}"><i class="fa fa-reply"></i>Xem chi tiết</a>
										</span>
                    </div>
                </div>
            </c:forEach>
            <a href="${contextPath}/game?sorted=news" class="button-read-more">Hiện thị thêm</a>

        </div>
        <div class="widget-article-list">
            <c:forEach var="gacnrl" items="${getTop10ArticleCategoryNewReviewsList}">
                <div class="item">
                    <div class="item-header">
                        <a href="${contextPath}/${gacnrl.slug}"><img src="${contextPath}/images/articles/${gacnrl.imagesThumbnail}" alt=""/></a>
                    </div>
                    <div class="item-content">
                        <h4>
                            <a href="${contextPath}/${gacnrl.slug}">${gacnrl.title}</a>
                        </h4>
                        <span class="item-meta"> <a href="${contextPath}/${gacnrl.slug}"><i
                                class="fa fa-eye"></i>${gacnrl.views}</a> <a href="${contextPath}/${gacnrl.slug}"><i
                                class="fa fa-clock-o"></i><fmt:formatDate pattern="dd-MM-yyyy" value="${gacnrl.createdDate}"/></a>
										</span>
                    </div>
                </div>
            </c:forEach>
            <a href="${contextPath}/reviews?sorted=news" class="button-read-more">Hiện thị thêm</a>

        </div>
        <div class="widget-article-list">
            <c:forEach var="gacntcl" items="${getTop10ArticleCategoryNewTienIchList}">
                <div class="item">
                    <div class="item-header">
                        <a href="${contextPath}/${gacntcl.slug}"><img src="${contextPath}/images/articles/${gacntcl.imagesThumbnail}" alt=""/></a>
                    </div>
                    <div class="item-content">
                        <h4>
                            <a href="${contextPath}/${gacntcl.slug}">${gacntcl.title}</a>
                        </h4>
                        <span class="item-meta"> <a href="${contextPath}/${gacntcl.slug}"><i
                                class="fa fa-eye"></i>${gacntcl.views}</a> <a href="${contextPath}/${gacntcl.slug}"><i
                                class="fa fa-clock-o"></i><fmt:formatDate pattern="dd-MM-yyyy" value="${gacntcl.createdDate}"/></a>
										</span>
                    </div>
                </div>
            </c:forEach>
            <a href="${contextPath}/tien-ich?sorted=news" class="button-read-more">Hiện thị thêm</a>


        </div>
    </div>

    <div class="widget">
        <h3>Thủ Thuật Game</h3>
        <div class="widget-photo-gallery">
            <c:forEach var="gacnttl" items="${getTop10ArticleCategoryNewThuThuatList}">
                <div class="item">
                    <div class="item-content">
                        <h4>
                            <a href="${contextPath}/${gacnttl.slug}">${gacnttl.title}</a>
                        </h4>
                        <span class="item-meta"> <a href="${contextPath}/${gacnttl.slug}"><i
                                class="fa fa-camera"></i>${gacnttl.views} lượt xem</a> <a href="${contextPath}/${gacnttl.slug}"><i
                                class="fa fa-reply"></i>Xem chi tiết</a>
										</span>
                    </div>
                </div>
            </c:forEach>
            <a href="${contextPath}/tien-ich?sorted=news" class="button-read-more">Hiện thị thêm</a>







        </div>
    </div>
    <div class="widget">
        <h3>Xem thêm</h3>
        <div class="tagcloud">
            <c:forEach var="gtl" items="${getTop20TagsList}" >
            <a href="${contextPath}/${gtl.slug}">#${gtl.name}</a>
            </c:forEach>
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
