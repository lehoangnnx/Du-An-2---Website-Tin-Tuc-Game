<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security"
           uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<style>
    .chinh{
        font-size: 10px;
    }
</style>
<header id="navigation">

    <div class="navbar navbar-inverse navbar-fixed-top" role="banner">
        <div class="container" style="margin-top: -10px;">
            <div class="navbar-header  col-md-2 ">
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

            <div class="collapse navbar-collapse   col-md-6">
                <ul style="margin-right: 0px; margin-bottom: 15px;" class="nav navbar-nav navbar-right">
                    <li class="scroll active"><a class="chinh" href="${contextPath}/">Trang
                        chủ</a></li>
                    <c:forEach var="atl" items="${articleCategoryList}">
                        <c:if test="${atl.sortOrder == 1 && atl.subArticleCategoryId == 0}">
                            <li class="scroll"><a class="chinh"
                                    href="${contextPath}/${atl.slug}.html?sorted=news">${atl.name}</a></li>
                        </c:if>
                    </c:forEach>
                    <li class="scroll"><a class="chinh" href="${contextPath}/games/hoso.html">Game</a></li>
                    <li class="dropdown"><a  class="dropdown-toggle chinh"
                                            data-toggle="dropdown" href="#">Tin Game<span class=" fa fa-angle-down"></span></a>
                        <ul class="dropdown-menu ">
                            <c:forEach var="atl" items="${articleCategoryList}">
                                <c:if test="${atl.sortOrder == 2 && atl.subArticleCategoryId == 0}">
                                    <li><a class="chinh" href="${contextPath}/${atl.slug}.html?sorted=news">${atl.name}</a></li>
                                </c:if>

                            </c:forEach>

                        </ul>
                    </li>
                    <li class="dropdown"><a class="dropdown-toggle chinh"
                                            data-toggle="dropdown" href="#">Khác <span class="fa fa-angle-down"></span></a>
                        <ul class="dropdown-menu ">
                            <c:forEach var="atl" items="${articleCategoryList}">
                                <c:if test="${atl.sortOrder > 2 && atl.subArticleCategoryId == 0}">
                                    <li><a class="chinh" href="${contextPath}/${atl.slug}.html?sorted=news">${atl.name}</a></li>
                                </c:if>

                            </c:forEach>

                        </ul>
                    </li>
                    <!-- ${pageContext.request.userPrincipal.name}
					//${pageContext.request.userPrincipal.authorities}   -->

                    <security:authorize access="isAuthenticated()">
                        <security:authentication var="principal" property="principal"/>
                        <li class="dropdown"><a class="dropdown-toggle chinh"
                                                data-toggle="dropdown" title="${user.firstName} ${user.lastName}" href="#"> <security:authorize
                                access="hasAnyRole('FACEBOOK', 'GOOGLE')">
                            ${fn:substring(user.firstName, 0, 6)}
                        </security:authorize> <security:authorize
                                access="hasAnyRole('MEMBER', 'ADMIN')">
                            ${fn:substring(user.userName, 0, 6)}
                        </security:authorize> <span class="fa fa-level-down"></span>
                        </a>
                            <ul class="dropdown-menu ">
                                <security:authorize access="hasRole('MEMBER')">
                                    <li class="text-center"><a class="chinh" href="${contextPath}/profile.html">Thông Tin</a></li>

                                </security:authorize>


                                <security:authorize access="hasRole('WRITING')">
                                    <li class="text-center"><a class="chinh" href="${contextPath }/admin/index">Quản Trị</a></li>
                                </security:authorize>
                                    <li class="text-center">
                                        <%--<button type="submit"><i style="margin-right: 7px;" class="fa fa-sign-out"></i>Đăng Xuất</button>--%>
                                            <a class="chinh" href="javascript:void(0);" id="btn-logout">Đăng Xuất</a>
                                    </li>



                            </ul>
                        </li>
                    </security:authorize>
                    <security:authorize access="!isAuthenticated()">
                        <li class="scroll"><a class="modal_trigger chinh" href="#modal">Đăng
                            Nhập</a></li>

                    </security:authorize>
                </ul>
            </div>

            <div style="margin: 0px;" id="morphsearch" class="morphsearch col-md-4 pull-right collapse navbar-collapse ">
                <form:form id="formsearch"  class="morphsearch-form" action="${contextPath}/search.html" method="get" >
                    <input class="morphsearch-input" id="inputsearch" name="q"  type="search" placeholder="Tìm Kiếm ..."/>
                    <button id="btnsearch" style="background-image: url('images/magnifier.svg')" class="morphsearch-submit" type="submit"></button>
                </form:form>
                <div class="morphsearch-content">
                    <div class="dummy-column">
                        <h2>Gaming Gear</h2>
                        <c:forEach var="gahvl"  items="${getTop10ArticleHotAndNewGamingGearList}">

                            <a class="dummy-media-object" href="${contextPath}/${gahvl.slug}.html">
                                <img style="height: 35px;" src="${contextPath}/images/articles/${gahvl.imagesThumbnail}"
                                     alt="${gahvl.title}"/>
                                <h3>${fn:substring(gahvl.title, 0, 60)} ...</h3>
                            </a>

                        </c:forEach>
                    </div>
                    <div class="dummy-column">
                        <h2>Manga/Film</h2>
                        <c:forEach var="gahvl"  items="${getTop10ArticleHotAndNewMangaFilmList}">

                            <a class="dummy-media-object" href="${contextPath}/${gahvl.slug}.html">
                                <img style="height: 35px;" src="${contextPath}/images/articles/${gahvl.imagesThumbnail}"
                                     alt="${gahvl.title}"/>
                                <h3>${fn:substring(gahvl.title, 0, 60)} ...</h3>
                            </a>

                        </c:forEach>
                    </div>
                    <div class="dummy-column">
                        <h2>Reviews</h2>
                        <c:forEach var="gahvl"  items="${getTop10ArticleHotAndNewReviewsList}">

                            <a class="dummy-media-object" href="${contextPath}/${gahvl.slug}.html">
                                <img style="height: 35px;" src="${contextPath}/images/articles/${gahvl.imagesThumbnail}"
                                     alt="${gahvl.title}"/>
                                <h3>${fn:substring(gahvl.title, 0, 60)} ...</h3>
                            </a>

                        </c:forEach>
                    </div>
                </div><!-- /morphsearch-content -->
                <span class="morphsearch-close"></span>
            </div>


        </div>
    </div>
    <!--/navbar-->
</header>

<!--/Đóng header-->
<!--/Tìm kiếm-->

<!--/Đóng tìm kiếm-->
<div class="content" style="padding-top: 100px;">
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
                                <a href="${contextPath}/${gahav.slug}.html "
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


