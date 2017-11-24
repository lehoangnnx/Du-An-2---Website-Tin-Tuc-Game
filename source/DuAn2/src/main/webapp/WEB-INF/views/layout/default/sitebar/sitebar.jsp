<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<aside class="sidebar " id="sidebar">


    <div class="widget">
        <h3>Video Nổi Bật</h3>
        <div class="widget-article-list">
            <c:forEach var="gactvl" items="${getTop5ArticleCategoryHotVideoList}">
                <div class="item">
                    <div class="item-header">
                        <a href="${contextPath}/${gactvl.slug}.html"><img
                                src="${contextPath}/images/articles/${gactvl.imagesThumbnail}"
                                class="img-responsive " title="${gactvl.title}" alt="${gactvl.title}"/>

                        </a>
                    </div>
                    <div class="item-content">
                        <h4>
                            <a title="${gactvl.title}" href="${contextPath}/${gactvl.slug}.html">${gactvl.title}</a>
                        </h4>
                        <span class="item-meta"> <a href="${contextPath}/${gactvl.slug}.html"><i
                                class="fa fa-eye"></i>${gactvl.views} Lượt Xem</a> <a
                                href="${contextPath}/${gactvl.slug}.html"><i
                                class="fa fa-clock-o"></i><fmt:formatDate pattern="dd-MM-yyyy"
                                                                          value="${gactvl.createdDate}"/></a>
										</span>
                    </div>
                </div>
            </c:forEach>

            <a href="${contextPath}/video.html?sorted=hots" class="button-read-more">Hiện thị nhiều hơn</a>
        </div>
    </div>


    <div class="widget">
        <h3>Tin Nổi Bật</h3>
        <div class="widget-article-list">
            <c:forEach var="gha" items="${getTop10HotArticle}">
                <div class="item">
                    <div class="item-header">
                        <a href="${contextPath}/${gha.slug}.html"><img class="img-responsive "
                                                                  src="${contextPath}/images/articles/${gha.imagesThumbnail}"
                                                                  alt="${gha.title}"/></a>
                    </div>
                    <div class="item-content">
                        <h4>
                            <a href="${contextPath}/${gha.slug}.html">${gha.title}</a>
                        </h4>
                        <span class="item-meta"> <a href="${contextPath}/${gha.slug}.html"><i
                                class="fa fa-eye"></i>${gha.views} Lượt Xem</a> <a
                                href="${contextPath}/${gha.slug}.html"><i
                                class="fa fa-clock-o"></i><fmt:formatDate pattern="dd-MM-yyyy"
                                                                          value="${gha.createdDate}"/></a>
										</span>
                    </div>
                </div>
            </c:forEach>

            <a href="${contextPath}/articles.html?sorted=hots" class="button-read-more">Hiện thị nhiều hơn</a>
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
                        <img class="img-responsive " src="${contextPath}/images/games/${ghg.images}" alt="">
                    </div>
                    <div class="item-content">
                        <h4>
                            <a href="${contextPath}/${ghg.slug}.html">${ghg.name}</a>
                        </h4>
                        <p>${ghg.description}</p>
                        <span class="item-meta"> <a href="${contextPath}/${ghg.slug}.html">
                            <i class="fa fa-reply"></i>Xem chi tiết</a>
										</span>
                    </div>
                </div>
            </c:forEach>
            <a href="${contextPath}/game.html?sorted=hots" class="button-read-more">Hiện thị thêm</a>
        </div>
        <div class="widget-article-list">
            <c:forEach var="ggo" items="${getTop10GameOnline}">
                <div class="item">
                    <div class="item-header">
                        <img class="img-responsive " src="${contextPath}/images/games/${ggo.images}" alt="">
                    </div>
                    <div class="item-content">
                        <h4>
                            <a href="${contextPath}/${ggo.slug}.html">${ggo.name}</a>
                        </h4>
                        <p>${ggo.description}</p>
                        <span class="item-meta"> <a href="${contextPath}/${ggo.slug}.html"><i class="fa fa-reply"></i>Xem chi tiết</a>
										</span>
                    </div>
                </div>
            </c:forEach>
            <a href="${contextPath}/game-online.html?sorted=hots" class="button-read-more">Hiện thị thêm</a>
        </div>


        <div class="widget-article-list">
            <c:forEach var="ggof" items="${getTop10GameOffline}">
                <div class="item">
                    <div class="item-header">
                        <img class="img-responsive " src="${contextPath}/images/games/${ggof.images}" alt="">
                    </div>
                    <div class="item-content">
                        <h4>
                            <a href="${contextPath}/${ggof.slug}.html">${ggof.name}</a>
                        </h4>
                        <p>${ggof.description}</p>
                        <span class="item-meta"> <a href="${contextPath}/${ggof.slug}.html"><i class="fa fa-reply"></i>Xem chi tiết</a>
										</span>
                    </div>
                </div>
            </c:forEach>
            <a href="${contextPath}/game-offline.html?sorted=hots" class="button-read-more">Hiện thị thêm</a>

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
                        <img class="img-responsive " src="${contextPath}/images/games/${gng.images}" alt="">
                    </div>
                    <div class="item-content">
                        <h4>
                            <a href="${contextPath}/${gng.slug}.html">${gng.name}</a>
                        </h4>
                        <p>${gng.description}</p>
                        <span class="item-meta"> <a href="${contextPath}/${gng.slug}.html"><i class="fa fa-reply"></i>Xem chi tiết</a>
										</span>
                    </div>
                </div>
            </c:forEach>
            <a href="${contextPath}/game.html?sorted=news" class="button-read-more">Hiện thị thêm</a>

        </div>
        <div class="widget-article-list">
            <c:forEach var="gacnrl" items="${getTop10ArticleCategoryNewReviewsList}">
                <div class="item">
                    <div class="item-header">
                        <a href="${contextPath}/${gacnrl.slug}.html"><img class="img-responsive "
                                                                     src="${contextPath}/images/articles/${gacnrl.imagesThumbnail}"
                                                                     alt=""/></a>
                    </div>
                    <div class="item-content">
                        <h4>
                            <a href="${contextPath}/${gacnrl.slug}.html">${gacnrl.title}</a>
                        </h4>
                        <span class="item-meta"> <a href="${contextPath}/${gacnrl.slug}.html"><i
                                class="fa fa-eye"></i>${gacnrl.views}</a> <a href="${contextPath}/${gacnrl.slug}.html"><i
                                class="fa fa-clock-o"></i><fmt:formatDate pattern="dd-MM-yyyy"
                                                                          value="${gacnrl.createdDate}"/></a>
										</span>
                    </div>
                </div>
            </c:forEach>
            <a href="${contextPath}/reviews.html?sorted=news" class="button-read-more">Hiện thị thêm</a>

        </div>
        <div class="widget-article-list">
            <c:forEach var="gacntcl" items="${getTop10ArticleCategoryNewTienIchList}">
                <div class="item">
                    <div class="item-header">
                        <a href="${contextPath}/${gacntcl.slug}.html"><img class="img-responsive "
                                                                      src="${contextPath}/images/articles/${gacntcl.imagesThumbnail}"
                                                                      alt=""/></a>
                    </div>
                    <div class="item-content">
                        <h4>
                            <a href="${contextPath}/${gacntcl.slug}.html">${gacntcl.title}</a>
                        </h4>
                        <span class="item-meta"> <a href="${contextPath}/${gacntcl.slug}.html"><i
                                class="fa fa-eye"></i>${gacntcl.views}</a> <a href="${contextPath}/${gacntcl.slug}.html"><i
                                class="fa fa-clock-o"></i><fmt:formatDate pattern="dd-MM-yyyy"
                                                                          value="${gacntcl.createdDate}"/></a>
										</span>
                    </div>
                </div>
            </c:forEach>
            <a href="${contextPath}/tien-ich.html?sorted=news" class="button-read-more">Hiện thị thêm</a>


        </div>
    </div>

    <div class="widget">
        <h3>Thủ Thuật Game</h3>
        <div class="widget-photo-gallery">
            <c:forEach var="gacnttl" items="${getTop10ArticleCategoryNewThuThuatList}">
                <div class="item">
                    <div class="item-content">
                        <h4>
                            <a href="${contextPath}/${gacnttl.slug}.html">${gacnttl.title}</a>
                        </h4>
                        <span class="item-meta"> <a href="${contextPath}/${gacnttl.slug}.html"><i
                                class="fa fa-eye"></i>${gacnttl.views} Lượt xem</a> <a
                                href="${contextPath}/${gacnttl.slug}.html"><i
                                class="fa fa-reply"></i>Xem chi tiết</a>
										</span>
                    </div>
                </div>
            </c:forEach>
            <a href="${contextPath}/tien-ich.html?sorted=news" class="button-read-more">Hiện thị thêm</a>


        </div>
    </div>
    <div class="widget">
        <h3>Xem thêm</h3>
        <div class="tagcloud">
            <c:forEach var="gtl" items="${getTop20TagsList}">
                <a href="${contextPath}/${gtl.slug}.html">#${gtl.name}</a>
            </c:forEach>
        </div>
    </div>


</aside>
