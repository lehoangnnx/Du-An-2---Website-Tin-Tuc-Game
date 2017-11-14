<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<div class="content-block-single">
	
    <div class="content-panel">
        <div class="content-panel-title">
            <div class="feed-widget-header">
                <h2 class="widget-title feed-widget-title">
                    <a href="${contextPath}/${getArticleCategoryVideo.slug}">VIDEO MỚI</a>
                </h2>

                <div class="feed-widget-viewall">
                    <a href="${contextPath}/${getArticleCategoryVideo.slug}?sorted=news"><span>XEM THÊM</span> <i
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
                                    <c:forEach var="gacnvl" items="${getTop10ArticleCategoryNewVideoList}">
                                        <li><img src="${contextPath}/images/articles/${gacnvl.imagesThumbnail}"
                                                 alt="${fn:substring(gacnvl.title, 0, 50)} ..."
                                                 title="${fn:substring(gacnvl.title, 0, 50)} ..."
                                                 data-description="${gacnvl.views} lượt xem"/>
                                            <video
                                                    preload="none"
                                                    src="${gacnvl.video}">
                                            </video>
                                        </li>
                                    </c:forEach>

                                </ul>
                                <ul class="amazingslider-thumbnails" style="display: none;">
                                    <c:forEach var="gacnvl" items="${getTop10ArticleCategoryNewVideoList}">
                                        <li><img src="${contextPath}/images/articles/${gacnvl.imagesThumbnail}"
                                                 alt="${gacnvl.title}"
                                                 title="${gacnvl.title}"/></li>
                                    </c:forEach>
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

    <!-- Tin mới -->


    <div class="container hidden-xs hidden-sm"></div>


    <div class="content-panel">
        <div class="content-panel-title">
            <div class="feed-widget-header">
                <h2 class="widget-title feed-widget-title">
                    <a href="${contextPath}/su-kien">SỰ KIỆN</a>
                </h2>
                <div class="feed-widget-viewall">
                    <a href="${contextPath}/su-kien"><span>XEM THÊM</span> <i
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
                        <c:forEach var="gacnskl" items="${getTop5ArticleCategoryNewSuKienList}" begin="1" end="4">
                            <div class="item">

                                <div class="item-header">
                                    <a href="${contextPath}/${gacnskl.slug}">
                                        <img src="${contextPath}/images/articles/${gacnskl.imagesThumbnail}"
                                             alt="${gacnskl.title}"/></a>
                                </div>
                                <div class="item-content">
                                    <h4>
                                        <a href="${contextPath}/${gacnskl.slug}">${gacnskl.title}.</a>
                                    </h4>

                                </div>
                            </div>
                        </c:forEach>


                    </div>
                </div>
                <br>

            </div>

            <div class="split-article-slide-right">
                <c:forEach var="gacnskl" items="${getTop5ArticleCategoryNewSuKienList}" begin="0" end="1" step="2">
                    <div class="item">
                        <div class="item-header hover14 column">
                            <a href="${contextPath}/${gacnskl.slug}"> <span class="comment-tag"><i
                                    class="fa fa-comment-o"></i>${gacnskl.views}<i></i></span> <span
                                    class="read-more-wrapper"><span class="read-more">Xem
									chi tiết<i></i>
							</span></span>
                                <figure><img src="${contextPath}/images/articles/${gacnskl.imagesThumbnail}" alt="${gacnskl.title}"/></figure>
                            </a>
                        </div>
                        <div class="item-content">
                            <h3>
                                <a href="${gacnskl.slug}">${gacnskl.title}</a>
                            </h3>
                            <span class="item-meta"> <a href="${contextPath}/${gacnskl.slug}"><i
                                    class="fa fa-comment-o"></i>82 Bình luận</a> <a href="${contextPath}/${gacnskl.slug}"><i
                                    class="fa fa-clock-o"></i><fmt:formatDate pattern="dd-MM-yyyy" value="${gacnskl.showDate}"/></a>
						</span>
                            <p>${gacnskl.subContent}</p>
                            <a href="${contextPath}/${gacnskl.slug}" class="read-more-button">Xem chi tiết<i
                                    class="fa fa-mail-forward"></i>
                            </a>
                        </div>
                    </div>
                </c:forEach>
            </div>

        </div>
        <!-- Danh sách game -->
    </div>
    <div class="content-panel">
        <div class="content-panel-title">


            <div class="feed-widget-header">
                <h2 class="widget-title feed-widget-title">
                    <a href="${contextPath}/game">GAME</a>
                </h2>
                <div class="feed-widget-viewall">
                    <a href="${contextPath}/game"><span>XEM THÊM</span> <i
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
                                        <a style="color: white;" href="${contextPath}/pc-console">Game Pc-Console</a>
                                    </h2>
                                </div>
                                <ul>
                                    <c:forEach var="ggpc" items="${getTop3GamePcConsole}">
                                        <li><a href="${ggpc.slug}" class="pull-left p-r-15"> <img
                                                src="${contextPath}/images/games/${ggpc.images}" alt="${ggpc.name}"
                                                style="border-radius: 13px;"></a>
                                            <h2>
                                                <a href="${contextPath}/${ggpc.slug}">${ggpc.name}</a>
                                            </h2>
                                            <p>${ggpc.publishers}</p> <span class="view"><a
                                                    href="${contextPath}/${ggpc.slug}"><i
                                                    class="fa fa-eye"></i> Xem</a></span> <span class="download"><a
                                                    href="${ggpc.downloadUrl}" rel="nofollow" target="_blank"><i
                                                    class="fa fa-download"></i> Download</a></span>
                                            <div class="clearfix"></div>
                                        </li>

                                    </c:forEach>
                                </ul>
                                <div class="more">
                                    <a href="${contextPath}/pc-console">Xem thêm</a>
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
                                    <c:forEach var="ggm" items="${getTop3GameMobile}">
                                        <li><a href="${ggm.slug}" class="pull-left p-r-15"> <img
                                                src="${contextPath}/images/games/${ggm.images}" alt="${ggm.name}"
                                                style="border-radius: 13px;"></a>
                                            <h2>
                                                <a href="${contextPath}/${ggm.slug}">${ggm.name}</a>
                                            </h2>
                                            <p>${ggm.publishers}</p> <span class="view"><a
                                                    href="${contextPath}/${ggm.slug}"><i
                                                    class="fa fa-eye"></i> Xem</a></span> <span class="download"><a
                                                    href="${ggm.downloadUrl}" rel="nofollow" target="_blank"><i
                                                    class="fa fa-download"></i> Download</a></span>
                                            <div class="clearfix"></div>
                                        </li>

                                    </c:forEach>

                                </ul>
                                <div class="more">
                                    <a href="${contextPath}/mobile">Xem thêm</a>
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
                                    <c:forEach var="gge" items="${getTop3GameEsport}">
                                        <li><a href="${gge.slug}" class="pull-left p-r-15"> <img
                                                src="${contextPath}/images/games/${gge.images}" alt="${gge.name}"
                                                style="border-radius: 13px;"></a>
                                            <h2>
                                                <a href="${contextPath}/${gge.slug}">${gge.name}</a>
                                            </h2>
                                            <p>${gge.publishers}</p> <span class="view"><a
                                                    href="${contextPath}/${gge.slug}"><i
                                                    class="fa fa-eye"></i> Xem</a></span> <span class="download"><a
                                                    href="${gge.downloadUrl}" rel="nofollow" target="_blank"><i
                                                    class="fa fa-download"></i> Download</a></span>
                                            <div class="clearfix"></div>
                                        </li>

                                    </c:forEach>
                                </ul>
                                <div class="more">
                                    <a href="${contextPath}/esport">Xem thêm</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- End danh sách game -->
    </div>

    <%--<div class="content-panel">
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
        <!-- END -->
    </div>--%>

    <div class="content-panel">
        <div class="content-panel-title">

            <div class="feed-widget-header">
                <h2 class="widget-title feed-widget-title">
                    <a href="#">TIN MỚI</a>
                </h2>
                <div class="feed-widget-viewall">
                    <a href="${contextPath}/articles?sorted=new"><span>XEM THÊM</span> <i
                            class="fa fa-chevron-right"></i></a>
                </div>
                <div class="clear"></div>
            </div>

        </div>
        <div class="content-panel-body article-list" id="posts">
            <c:forEach var="gal" items="${getTop10ArticleList}">
                <div class="item">

                    <div class="item-header hover14 column">
                        <a href="${contextPath}/${gal.slug}"> <span class="comment-tag"><i
                                class="fa fa-eye"></i>${gal.views}<i></i></span> <span
                                class="read-more-wrapper"><span class="read-more">Xem chi tiết<i></i>
					</span></span>
                            <figure><img title="${gal.title}"
                                         src="${contextPath}/images/articles/${gal.imagesThumbnail}" alt=""/></figure>
                        </a>
                    </div>

                    <div class="item-content">

                        <strong class="category-link">
                            <c:forEach var="ac" items="${gal.articleCategories}">
                                <a style="padding-right: 7px;" href="${contextPath}/${ac.slug}">${ac.name}</a>
                            </c:forEach>
                        </strong>

                        <h3>
                            <a title="${gal.title}" href="${contextPath}/${gal.slug}">${gal.title}</a>
                        </h3>
                        <span class="item-meta">
						<a style="font-weight: bold;" href="${contextPath}/${gal.slug}"><i
                                class="fa fa-user"></i>${gal.users.userName}</a>
						<a href="${contextPath}/${gal.slug}"><i
                                class="fa fa-comment-o"></i>82 Bình luận</a> <a href="${contextPath}/${gal.slug}"><i
                                class="fa fa-clock-o"></i><fmt:formatDate pattern="dd-MM-yyyy" value="${gal.showDate}"/></a>

					</span>
                        <p>${gal.subContent}</p>
                    </div>
                </div>
            </c:forEach>

        </div>
        <div style="padding-bottom: 60px; border-bottom: 1px solid #F0F0F0" class="content-panel-body pagination "
             id="xemthem">
            <%--<a class="prev page-numbers" href="#"><i class="fa fa-angle-left"></i>Trước</a>
            <a class="page-numbers" href="#">1</a> <span
                class="page-numbers current">2</span> <a class="page-numbers"
                                                         href="#">3</a> <a class="page-numbers" href="#">4</a> <a
                class="page-numbers" href="#">5</a> <a class="next page-numbers"
                                                       href="#">Tiếp theo<i class="fa fa-angle-right"></i></a>--%>

        </div>
        <!-- End tin mới -->
    </div>


</div>
