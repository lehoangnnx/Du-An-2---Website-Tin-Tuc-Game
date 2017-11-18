<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security"
           uri="http://www.springframework.org/security/tags" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<header id="navigation">
    <div class="navbar navbar-inverse navbar-fixed-top" role="banner">
        <div class="container" style="margin-top: -10px;">
            <div class="navbar-header ">
                <button type="button" class="navbar-toggle" data-toggle="collapse"
                        data-target=".navbar-collapse">
                    <span class="sr-only">Navigation</span> <span class="icon-bar"></span>
                    <span class="icon-bar"></span> <span class="icon-bar"></span>
                </button>
                <div class="text-center">
                    <a class="navbar-brand " href="${contextPath}/"
                       style="margin-top: 11px;"><h1>
                        <img class=" " src="${contextPath}/images/logo2.png" alt="logo">
                    </h1></a>
                </div>
            </div>
            <div class="collapse navbar-collapse ">
                <ul class="nav navbar-nav navbar-right">
                    <li class="scroll active"><a href="${contextPath}/">Trang
                        chủ</a></li>
                    <c:forEach var="atl" items="${articleCategoryList}">
                        <c:if test="${atl.sortOrder == 1}">
                            <li class="scroll"><a
                                    href="${contextPath}${atl.slug}?sorted=news">${atl.name}</a></li>
                        </c:if>
                    </c:forEach>


                    <li class="dropdown mega-dropdown" ><a href="#"
                                                          class="dropdown-toggle" data-toggle="dropdown">Khác<span
                            class="caret"></span></a>
                        <ul class="dropdown-menu mega-dropdown-menu" >
                            <li class="col-sm-3">
                                <ul>
                                    <li class="dropdown-header">Tin Nổi Bật</li>
                                    <div id="menCollection" class="carousel slide"
                                         data-ride="carousel">
                                        <div class="carousel-inner">
                                            <c:forEach var="gha" items="${getTop10HotArticle}" varStatus="status">
                                                <div class="item ${status.index == 1 ? 'active' : ''}">
                                                    <a style="background-color: #F0F0F0;" href="${contextPath}/${gha.slug}"><img
                                                            src="${contextPath}/images/articles/${gha.imagesThumbnail}"
                                                            class="img-responsive" alt="product 1"></a>

                                                </div>
                                            </c:forEach>
                                            <!-- End Item -->
                                        </div>
                                        <!-- End Carousel Inner -->
                                        <!-- Controls -->
                                        <a class="left carousel-control" href="#menCollection"
                                           role="button" data-slide="prev"> <span
                                                class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                                            <span class="sr-only">Previous</span>
                                        </a> <a class="right carousel-control" href="#menCollection"
                                                role="button" data-slide="next"> <span
                                            class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                                        <span class="sr-only">Next</span>
                                    </a>
                                    </div>
                                    <!-- /.carousel -->
                                    <%--<li class="divider"></li>
                                    <li><a href="#">Hiển thị nhiều hơn <span
                                            class="glyphicon glyphicon-chevron-right pull-right"></span></a></li>--%>
                                </ul>
                            </li>
                            <li class="col-sm-3" style="padding-left: 40px;">
                                <ul>
                                    <li class="dropdown-header">Game</li>
                                    <c:forEach var="atl" items="${articleCategoryList}">
                                        <c:if test="${atl.sortOrder == 2}">
                                            <li><a href="${contextPath}${atl.slug}?sorted=news">${atl.name}</a></li>
                                        </c:if>

                                    </c:forEach>

                                </ul>
                            </li>
                            <li class="col-sm-3" style="padding-left: 40px;">
                                <ul>
                                    <li class="dropdown-header">Gì</li>
                                    <c:forEach var="atl" items="${articleCategoryList}">
                                        <c:if test="${atl.sortOrder == 3}">
                                            <li><a href="${contextPath}${atl.slug}?sorted=news">${atl.name}</a></li>
                                        </c:if>

                                    </c:forEach>
                                </ul>
                            </li>
                            <li class="col-sm-3" style="padding-left: 40px;">
                                <ul>
                                    <li class="dropdown-header">Sau</li>
                                    <c:forEach var="atl" items="${articleCategoryList}">
                                        <c:if test="${atl.sortOrder == 4}">
                                            <li><a href="${contextPath}${atl.slug}?sorted=news">${atl.name}</a></li>
                                        </c:if>

                                    </c:forEach>
                                </ul>
                            </li>
                        </ul>
                    </li>

                    <!-- ${pageContext.request.userPrincipal.name}
					//${pageContext.request.userPrincipal.authorities}   -->

                    <security:authorize access="isAuthenticated()">
                        <security:authentication var="principal" property="principal"/>
                        <li class="dropdown"><a class="dropdown-toggle"
                                                data-toggle="dropdown" href="#"> <security:authorize
                                access="hasAnyRole('FACEBOOK', 'GOOGLE')">
                            ${user.firstName} ${ user.lastName   }
                        </security:authorize> <security:authorize
                                access="hasAnyRole('MEMBER', 'ADMIN')">
                            ${user.userName}
                        </security:authorize> <span class="caret"></span>
                        </a>
                            <ul class="dropdown-menu ">
                                <security:authorize access="hasRole('MEMBER')">
                                    <li><a href="#">Thông Tin</a></li>

                                </security:authorize>
                                <security:authorize access="hasAnyRole('FACEBOOK', 'GOOGLE')">
                                    <li><a href="#">Trang Cá Nhân</a></li>
                                </security:authorize>

                                <security:authorize access="hasRole('ADMIN')">
                                    <li><a href="${contextPath }/admin/index">Quản Trị</a></li>
                                </security:authorize>
                                <security:authorize access="hasRole('GOOGLE')">
                                    <form:form id="logoutForm" method="POST"
                                               action="${contextPath}/logout">
                                        <input type="hidden" name="${_csrf.parameterName}"
                                               value="${_csrf.token}"/>
                                        <button type="submit" onclick="signOut();"
                                                class="dropdown-item">Đăng Xuất
                                        </button>
                                    </form:form>

                                </security:authorize>

                                <security:authorize access="!hasRole('GOOGLE')">
                                    <form:form id="logoutForm" method="POST"
                                               action="${contextPath}/logout">
                                        <input type="hidden" name="${_csrf.parameterName}"
                                               value="${_csrf.token}"/>
                                        <button type="submit" class="dropdown-item">Đăng Xuất</button>
                                    </form:form>
                                </security:authorize>


                            </ul>
                        </li>
                    </security:authorize>
                    <security:authorize access="!isAuthenticated()">
                        <li class="scroll"><a class="modal_trigger" href="#modal">Đăng
                            Nhập</a></li>

                    </security:authorize>

                    <!-- <li class="fa fa-caret-down" style="font-size: 26px">
                        </li> -->
                    <li>
                        
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <!--/navbar-->
</header>
<!--/Đóng header-->
<!--/Tìm kiếm-->
<div id="morphsearch" class="morphsearch">
    <form class="morphsearch-form">
        <input  class="morphsearch-input" type="search" placeholder="Search..."/>
        <button class="morphsearch-submit" type="submit"></button>
    </form>
    <div class="morphsearch-content">
        <div class="dummy-column">
            <h2>People</h2>
            <a class="dummy-media-object" href="http://twitter.com/SaraSoueidan">
                <img class="round" src="http://0.gravatar.com/avatar/81b58502541f9445253f30497e53c280?s=50&d=identicon&r=G" alt="Sara Soueidan"/>
                <h3>Sara Soueidan</h3>
            </a>
            <a class="dummy-media-object" href="http://twitter.com/rachsmithtweets">
                <img class="round" src="http://0.gravatar.com/avatar/48959f453dffdb6236f4b33eb8e9f4b7?s=50&d=identicon&r=G" alt="Rachel Smith"/>
                <h3>Rachel Smith</h3>
            </a>
            <a class="dummy-media-object" href="http://www.twitter.com/peterfinlan">
                <img class="round" src="http://0.gravatar.com/avatar/06458359cb9e370d7c15bf6329e5facb?s=50&d=identicon&r=G" alt="Peter Finlan"/>
                <h3>Peter Finlan</h3>
            </a>
            <a class="dummy-media-object" href="http://www.twitter.com/pcridesagain">
                <img class="round" src="http://1.gravatar.com/avatar/db7700c89ae12f7d98827642b30c879f?s=50&d=identicon&r=G" alt="Patrick Cox"/>
                <h3>Patrick Cox</h3>
            </a>
            <a class="dummy-media-object" href="https://twitter.com/twholman">
                <img class="round" src="http://0.gravatar.com/avatar/cb947f0ebdde8d0f973741b366a51ed6?s=50&d=identicon&r=G" alt="Tim Holman"/>
                <h3>Tim Holman</h3>
            </a>
            <a class="dummy-media-object" href="https://twitter.com/shaund0na">
                <img class="round" src="http://1.gravatar.com/avatar/9bc7250110c667cd35c0826059b81b75?s=50&d=identicon&r=G" alt="Shaun Dona"/>
                <h3>Shaun Dona</h3>
            </a>
        </div>
        <div class="dummy-column">
            <h2>Popular</h2>
            <a class="dummy-media-object" href="http://tympanus.net/codrops/2014/08/05/page-preloading-effect/">
                <img src="img/thumbs/PagePreloadingEffect.png" alt="PagePreloadingEffect"/>
                <h3>Page Preloading Effect</h3>
            </a>
            <a class="dummy-media-object" href="http://tympanus.net/codrops/2014/05/28/arrow-navigation-styles/">
                <img src="img/thumbs/ArrowNavigationStyles.png" alt="ArrowNavigationStyles"/>
                <h3>Arrow Navigation Styles</h3>
            </a>
            <a class="dummy-media-object" href="http://tympanus.net/codrops/2014/06/19/ideas-for-subtle-hover-effects/">
                <img src="img/thumbs/HoverEffectsIdeasNew.png" alt="HoverEffectsIdeasNew"/>
                <h3>Ideas for Subtle Hover Effects</h3>
            </a>
            <a class="dummy-media-object" href="http://tympanus.net/codrops/2014/07/14/freebie-halcyon-days-one-page-website-template/">
                <img src="img/thumbs/FreebieHalcyonDays.png" alt="FreebieHalcyonDays"/>
                <h3>Halcyon Days Template</h3>
            </a>
            <a class="dummy-media-object" href="http://tympanus.net/codrops/2014/05/22/inspiration-for-article-intro-effects/">
                <img src="img/thumbs/ArticleIntroEffects.png" alt="ArticleIntroEffects"/>
                <h3>Inspiration for Article Intro Effects</h3>
            </a>
            <a class="dummy-media-object" href="http://tympanus.net/codrops/2014/06/26/draggable-dual-view-slideshow/">
                <img src="img/thumbs/DraggableDualViewSlideshow.png" alt="DraggableDualViewSlideshow"/>
                <h3>Draggable Dual-View Slideshow</h3>
            </a>
        </div>
        <div class="dummy-column">
            <h2>Recent</h2>
            <a class="dummy-media-object" href="http://tympanus.net/codrops/2014/10/07/tooltip-styles-inspiration/">
                <img src="img/thumbs/TooltipStylesInspiration.png" alt="TooltipStylesInspiration"/>
                <h3>Tooltip Styles Inspiration</h3>
            </a>
            <a class="dummy-media-object" href="http://tympanus.net/codrops/2014/09/23/animated-background-headers/">
                <img src="img/thumbs/AnimatedHeaderBackgrounds.png" alt="AnimatedHeaderBackgrounds"/>
                <h3>Animated Background Headers</h3>
            </a>
            <a class="dummy-media-object" href="http://tympanus.net/codrops/2014/09/16/off-canvas-menu-effects/">
                <img src="img/thumbs/OffCanvas.png" alt="OffCanvas"/>
                <h3>Off-Canvas Menu Effects</h3>
            </a>
            <a class="dummy-media-object" href="http://tympanus.net/codrops/2014/09/02/tab-styles-inspiration/">
                <img src="img/thumbs/TabStyles.png" alt="TabStyles"/>
                <h3>Tab Styles Inspiration</h3>
            </a>
            <a class="dummy-media-object" href="http://tympanus.net/codrops/2014/08/19/making-svgs-responsive-with-css/">
                <img src="img/thumbs/ResponsiveSVGs.png" alt="ResponsiveSVGs"/>
                <h3>Make SVGs Responsive with CSS</h3>
            </a>
            <a class="dummy-media-object" href="http://tympanus.net/codrops/2014/07/23/notification-styles-inspiration/">
                <img src="img/thumbs/NotificationStyles.png" alt="NotificationStyles"/>
                <h3>Notification Styles Inspiration</h3>
            </a>
        </div>
    </div><!-- /morphsearch-content -->
    <span class="morphsearch-close"></span>
</div>
<div class="content">
    <div class="container">
        <div class="row">
            <div class="col-md-12 push-right">







                <div class="search">
                    <form class="navbar-form navbar-right" action="${contextPath}/search" method="get">

                        <div class="form-group">

                            <input type="text" name="q" class="form-control" placeholder="Tìm Kiếm">
                            <button type="submit" class="btn btn-default"
                                    aria-label="Left Align">
                                <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                            </button>
                        </div>
                    </form>
                </div>
            </div>

        </div>
    </div>
</div>

<!--/Đóng tìm kiếm-->
<div class="content">
    <div class="container">
        <div class="row">

            <div class="col-md-12 push-right">
                <div class="ot-breaking-news-body mouseenter"
                     data-breaking-timeout="4000" data-breaking-autostart="true">
                    <div class="ot-breaking-news-controls">
                        <strong><i class="fa fa-bar-chart"></i>Thông tin game 24h
                            : </strong>
                    </div>
                    <div class="ot-breaking-news-content">
                        <marquee behavior="scroll" direction="left" scrollamount="8"
                                 scrolldelay="20" width="90%">
                            <c:forEach var="gahav" items="${getTop5ArticleHotAndViews}">
                                <a href="${contextPath}/${gahav.slug} "
                                   style="color: #fc7700; padding-right: 150px;">${gahav.title}</a>
                            </c:forEach>


                        </marquee>


                    </div>
                    <!-- END .ot-breaking-news-body -->
                </div>

            </div>
        </div>
    </div>
</div>


