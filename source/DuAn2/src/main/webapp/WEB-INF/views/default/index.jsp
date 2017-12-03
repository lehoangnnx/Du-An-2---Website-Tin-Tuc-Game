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

            <div class="feed-widget-header" >

                <h2 class="widget-title feed-widget-title" >
                    <a href="${contextPath}/${getArticleCategoryVideo.slug}.html?sorted=hots">VIDEO ĐÁNG CHÚ Ý</a>
                </h2>

                <div class="feed-widget-viewall">
                    <a href="${contextPath}/${getArticleCategoryVideo.slug}.html?sorted=host"><span>XEM THÊM</span>
                        <i
                                class="fa fa-chevron-right"></i></a>
                </div>
                <div class="clear"></div>
            </div>
        </div>

        <div class="content-panel-body article-list " style="padding-top: 10px;">
            <div class="item">
                <div class="col-xs-12 col-sm-12 col-md-12">

                    <div class="rvs-container">

                        <div class="rvs-item-container">
                            <div class="rvs-item-stage">
                                <c:forEach var="gacnhvl"
                                           items="${getTop10ArticleCategoryNewAndHotVideoList}">
                                    <!-- The below is a single item, simply duplicate this layout for each item -->
                                    <div class="rvs-item" style="background-image: url('images/articles/${gacnhvl.imagesThumbnail}')">
                                        <p class="rvs-item-text">${gacnhvl.title}
                                            <small>${gacnhvl.views} Lượt Xem</small>
                                        </p>
                                        <a href="${gacnhvl.video}" class="rvs-play-video"></a>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>

                        <div class="rvs-nav-container">
                            <a class="rvs-nav-prev"></a>

                            <div class="rvs-nav-stage">
                                <c:forEach var="gacnhvl"
                                           items="${getTop10ArticleCategoryNewAndHotVideoList}">
                                    <!-- The below is the corresponding nav item for the single item, simply duplicate this layout for each item -->
                                    <a class="rvs-nav-item">
                                            <span class="rvs-nav-item-thumb"
                                                  style="background-image: url('images/articles/${gacnhvl.imagesThumbnail}')"></span>
                                        <h4 class="rvs-nav-item-title">${gacnhvl.title}</h4>
                                        <small class="rvs-nav-item-credits">${gacnhvl.views} Lượt Xem</small>
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
    </div>

    <!-- Tin mới -->


    <div class="container hidden-xs hidden-sm"></div>


    <div class="content-panel">
        <div class="content-panel-title">
            <div class="feed-widget-header">
                <h2 class="widget-title feed-widget-title">
                    <a href="${contextPath}/su-kien.html?sorted=news">SỰ KIỆN</a>
                </h2>
                <div class="feed-widget-viewall">
                    <a href="${contextPath}/su-kien.html?sorted=news"><span>XEM THÊM</span> <i
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
                        <c:forEach var="gacnskl" items="${getTop5ArticleCategoryNewSuKienList}"
                                   begin="1" end="4">
                            <div class="item">

                                <div class="item-header">
                                    <a href="${contextPath}/${gacnskl.slug}.html">
                                        <img src="${contextPath}/images/articles/${gacnskl.imagesThumbnail}"
                                             alt="${gacnskl.title}"/></a>
                                </div>
                                <div class="item-content">
                                    <h4>
                                        <a href="${contextPath}/${gacnskl.slug}.html">${gacnskl.title}.</a>
                                    </h4>

                                </div>
                            </div>
                        </c:forEach>


                    </div>
                </div>
                <br>

            </div>

            <div class="split-article-slide-right">

                    <div class="item">
                        <div class="item-header hover14 column">
                            <a href="${contextPath}/${getTop5ArticleCategoryNewSuKienList[0].slug}.html">
                                <span class="comment-tag"><i
                                    class="fa fa-comment-o"></i>${getTop5ArticleCategoryNewSuKienList[0].views}<i></i></span> <span
                                    class="read-more-wrapper"><span class="read-more">Xem
									chi tiết<i></i>
							</span></span>
                                <figure><img
                                        src="${contextPath}/images/articles/${getTop5ArticleCategoryNewSuKienList[0].imagesThumbnail}"
                                        alt="${getTop5ArticleCategoryNewSuKienList[0].title}"/></figure>
                            </a>
                        </div>
                        <div class="item-content">
                            <h3>
                                <a href="${contextPath}/${getTop5ArticleCategoryNewSuKienList[0].slug}.html">${getTop5ArticleCategoryNewSuKienList[0].title}</a>
                            </h3>
                            <span class="item-meta">
                                <a style="font-weight: bold;" href="${contextPath}/${getTop5ArticleCategoryNewSuKienList[0].slug}.html"><i
                                        class="fa fa-user"></i>${getTop5ArticleCategoryNewSuKienList[0].users.userName}</a>
                                <a href="${contextPath}/${getTop5ArticleCategoryNewSuKienList[0].slug}.html"><i
                                    class="fa fa-comment-o"></i>${fn:length(getTop5ArticleCategoryNewSuKienList[0].comments)} Bình luận</a> <a
                                    href="${contextPath}/${getTop5ArticleCategoryNewSuKienList[0].slug}.html"><i
                                    class="fa fa-clock-o"></i><fmt:formatDate pattern="dd-MM-yyyy"
                                                                              value="${getTop5ArticleCategoryNewSuKienList[0].showDate}"/></a>
						</span>
                            <p>${getTop5ArticleCategoryNewSuKienList[0].subContent}</p>
                            <a href="${contextPath}/${getTop5ArticleCategoryNewSuKienList[0].slug}.html" class="read-more-button">Xem
                                chi tiết<i
                                        class="fa fa-mail-forward"></i>
                            </a>
                        </div>
                    </div>

            </div>

        </div>
        <!-- Danh sách game -->
    </div>
    <div class="content-panel">

        <div class="content-panel-title">


            <div class="feed-widget-header">
                <h2 class="widget-title feed-widget-title">
                    <a href="${contextPath}/game.html?sorted=news">GAME</a>
                </h2>
                <div class="feed-widget-viewall">
                    <a href="${contextPath}/game.html?sorted=news"><span>XEM THÊM</span> <i
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
                                        <a style="color: white;" href="${contextPath}/games/hoso.html?gamecategory=pc-console">Game
                                            Pc-Console</a>
                                    </h2>
                                </div>
                                <ul>
                                    <c:forEach var="ggpc" items="${getTop3GamePcConsole}">
                                        <li><a href="${contextPath}/games/${ggpc.slug}.html" class="pull-left p-r-15"> <img
                                                src="${contextPath}/images/games/${ggpc.images} "
                                                alt="${ggpc.name}"
                                                style="border-radius: 13px;"></a>
                                            <h2>
                                                <a href="${contextPath}/games/${ggpc.slug}.html">${ggpc.name}</a>
                                            </h2>
                                            <p>${ggpc.publishers}</p> <span class="view"><a
                                                    href="${contextPath}/${ggpc.slug}.html"><i
                                                    class="fa fa-eye"></i> Xem</a></span> <span
                                                    class="download"><a
                                                    href="${ggpc.downloadUrl}" rel="nofollow"
                                                    target="_blank"><i
                                                    class="fa fa-download"></i> Tải</a></span>
                                            <div class="clearfix"></div>
                                        </li>

                                    </c:forEach>
                                </ul>
                                <div class="more">
                                    <a href="${contextPath}/games/hoso.html?gamecategory=pc-console">Xem thêm</a>
                                </div>
                            </div>
                        </div>
                        <div class="col-xs-4">
                            <div class="box">
                                <div class="title">
                                    <h2>
                                        <a style="color: white;" href="${contextPath}/games/hoso.html?gamecategory=mobile">Game mobile</a>
                                    </h2>
                                </div>
                                <ul>
                                    <c:forEach var="ggm" items="${getTop3GameMobile}">
                                        <li><a href="${contextPath}/games/${ggm.slug}.html" class="pull-left p-r-15"> <img
                                                src="${contextPath}/images/games/${ggm.images}"
                                                alt="${ggm.name}"
                                                style="border-radius: 13px;"></a>
                                            <h2>
                                                <a href="${contextPath}/games/${ggm.slug}.html">${ggm.name}</a>
                                            </h2>
                                            <p>${ggm.publishers}</p> <span class="view"><a
                                                    href="${contextPath}/${ggm.slug}.html"><i
                                                    class="fa fa-eye"></i> Xem</a></span> <span
                                                    class="download"><a
                                                    href="${ggm.downloadUrl}" rel="nofollow"
                                                    target="_blank"><i
                                                    class="fa fa-download"></i> Tải</a></span>
                                            <div class="clearfix"></div>
                                        </li>

                                    </c:forEach>

                                </ul>
                                <div class="more">
                                    <a href="${contextPath}/games/hoso.html?gamecategory=mobile">Xem thêm</a>
                                </div>
                            </div>
                        </div>
                        <div class="col-xs-4">
                            <div class="box">
                                <div class="title">
                                    <h2>
                                        <a style="color: white;" href="${contextPath}/games/hoso.html?gamecategory=esport">eSport</a>
                                    </h2>
                                </div>
                                <ul>
                                    <c:forEach var="gge" items="${getTop3GameEsport}">
                                        <li><a href="${contextPath}/games/${gge.slug}.html" class="pull-left p-r-15"> <img
                                                src="${contextPath}/images/games/${gge.images}"
                                                alt="${gge.name}"
                                                style="border-radius: 13px;"></a>
                                            <h2>
                                                <a href="${contextPath}/games/${gge.slug}.html">${gge.name}</a>
                                            </h2>
                                            <p>${gge.publishers}</p> <span class="view"><a
                                                    href="${contextPath}/${gge.slug}.html"><i
                                                    class="fa fa-eye"></i> Xem</a></span> <span
                                                    class="download"><a
                                                    href="${gge.downloadUrl}" rel="nofollow"
                                                    target="_blank"><i
                                                    class="fa fa-download"></i> Tải</a></span>
                                            <div class="clearfix"></div>
                                        </li>

                                    </c:forEach>
                                </ul>
                                <div class="more">
                                    <a href="${contextPath}/games/hoso.html?gamecategory=esport">Xem thêm</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- End danh sách game -->
    </div>

    <div class="content-panel">
        <div class="content-panel-title">

            <div class="feed-widget-header">
                <h2 class="widget-title feed-widget-title">
                    <a href="${contextPath}/articles.html?sorted=news">TIN MỚI</a>
                </h2>
                <div class="feed-widget-viewall">
                    <a href="${contextPath}/articles.html?sorted=news"><span>XEM THÊM</span> <i
                            class="fa fa-chevron-right"></i></a>
                </div>
                <div class="clear"></div>
            </div>

        </div>
        <div class="content-panel-body article-list" id="posts">
            <c:forEach var="gal" items="${getTop10ArticleList}">
                <div class="item">

                    <div class="item-header hover14 column">
                        <a href="${contextPath}/${gal.slug}.html"> <span class="comment-tag"><i
                                class="fa fa-eye"></i>${gal.views}<i></i></span> <span
                                class="read-more-wrapper"><span
                                class="read-more">Xem chi tiết<i></i>
					</span></span>
                            <figure><img title="${gal.title}" style="height: 200px;"
                                         src="${contextPath}/images/articles/${gal.imagesThumbnail}"
                                         alt=""/></figure>
                        </a>
                    </div>

                    <div class="item-content">

                        <strong class="category-link">
                            <c:forEach var="ac" items="${gal.articleCategories}">
                                <a style="padding-right: 7px;"
                                   href="${contextPath}/${ac.slug}.html">${ac.name}</a>
                            </c:forEach>
                        </strong>

                        <h3>
                            <a title="${gal.title}"
                               href="${contextPath}/${gal.slug}.html">${gal.title}</a>
                        </h3>
                        <span class="item-meta">
						<a style="font-weight: bold;" href="${contextPath}/${gal.slug}.html"><i
                                class="fa fa-user"></i>${gal.users.userName}</a>
						<a href="${contextPath}/${gal.slug}.html"><i
                                class="fa fa-comment-o"></i>${fn:length(gal.comments)} Bình luận</a> <a
                                href="${contextPath}/${gal.slug}.html"><i
                                class="fa fa-clock-o"></i><fmt:formatDate pattern="dd-MM-yyyy"
                                                                          value="${gal.showDate}"/></a>

					</span>
                        <p>${gal.subContent}</p>
                    </div>
                </div>
            </c:forEach>

        </div>
        <div style="padding-bottom: 60px; border-bottom: 1px solid #F0F0F0"
             class="content-panel-body pagination "
             id="xemthem">
            <a id="_xemthem" class="page-numbers col-md-12 " href="javascript:void(0);">Xem Thêm</a>
            <div id="LoadingGifSmall" style="display: none;">
                <img src="${contextPath }/images/36.gif"/>
            </div>
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
