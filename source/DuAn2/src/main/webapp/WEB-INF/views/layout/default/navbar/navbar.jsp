<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security"
           uri="http://www.springframework.org/security/tags" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
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

            <div class="collapse navbar-collapse  col-md-6">
                <ul class="nav navbar-nav navbar-right">
                    <li class="scroll active"><a href="${contextPath}/">Trang
                        chủ</a></li>
                    <c:forEach var="atl" items="${articleCategoryList}">
                        <c:if test="${atl.sortOrder == 1}">
                            <li class="scroll"><a
                                    href="${contextPath}${atl.slug}?sorted=news">${atl.name}</a></li>
                        </c:if>
                    </c:forEach>


                   <%-- <li class="dropdown mega-dropdown" ><a href="#"
                                                          class="dropdown-toggle" data-toggle="dropdown">Khác<span
                            class="caret"></span></a>
                        <ul class="dropdown-menu mega-dropdown-menu " >
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
                                    &lt;%&ndash;<li class="divider"></li>
                                    <li><a href="#">Hiển thị nhiều hơn <span
                                            class="glyphicon glyphicon-chevron-right pull-right"></span></a></li>&ndash;%&gt;
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
                    </li>--%>
                    <li class="dropdown"><a class="dropdown-toggle"
                                            data-toggle="dropdown" href="#">Game<span class="caret"></span></a>
                        <ul class="dropdown-menu ">
                            <c:forEach var="atl" items="${articleCategoryList}">
                                <c:if test="${atl.sortOrder == 2}">
                                    <li><a href="${contextPath}${atl.slug}?sorted=news">${atl.name}</a></li>
                                </c:if>

                            </c:forEach>

                        </ul>
                    </li>
                    <li class="dropdown"><a class="dropdown-toggle"
                                            data-toggle="dropdown" href="#">Khác<span class="caret"></span></a>
                        <ul class="dropdown-menu ">
                            <c:forEach var="atl" items="${articleCategoryList}">
                                <c:if test="${atl.sortOrder > 2}">
                                    <li><a href="${contextPath}${atl.slug}?sorted=news">${atl.name}</a></li>
                                </c:if>

                            </c:forEach>

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
                                    <form:form id="logoutForm" method="POST" style="margin-left: 7px;"
                                               action="${contextPath}/logout">
                                        <input type="hidden" name="${_csrf.parameterName}"
                                               value="${_csrf.token}"/>
                                        <button type="submit" onclick="signOut();"><span class="glyphicon glyphicon-log-out"></span> Logout tài khoản
                                        </button>
                                    </form:form>

                                </security:authorize>

                                <security:authorize access="!hasRole('GOOGLE')">
                                    <form:form id="logoutForm" method="POST" style="margin-left: 7px;"
                                               action="${contextPath}/logout">
                                        <input type="hidden" name="${_csrf.parameterName}"
                                               value="${_csrf.token}"/>

                                        <button  type="submit"><span class="glyphicon glyphicon-log-out"></span> Logout tài khoản</button>
                                    </form:form>
                                </security:authorize>


                            </ul>
                        </li>
                    </security:authorize>
                    <security:authorize access="!isAuthenticated()">
                        <li class="scroll"><a class="modal_trigger" href="#modal">Đăng
                            Nhập</a></li>

                    </security:authorize>
                </ul>
            </div>

            <div id="morphsearch" class="morphsearch col-md-4 pull-right collapse navbar-collapse ">
                <form  class="morphsearch-form" action="" method="get" >
                    <input class="morphsearch-input " type="search" placeholder="Tìm Kiếm ..."/>
                    <button style="background-image: url('images/magnifier.svg')" class="morphsearch-submit" type="submit"></button>
                </form>
                <div class="morphsearch-content">
                    <div class="dummy-column">
                        <h2>Game</h2>
                        <c:forEach var="gc"  items="${gamesCategoryList}">
                        <c:if test="${gc.sortOrder ==1 }">
                        <a class="dummy-media-object" href="${contextPath}${gc.slug}">
                            
                            <h3>${gc.name}</h3>
                        </a>
                        </c:if>
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


