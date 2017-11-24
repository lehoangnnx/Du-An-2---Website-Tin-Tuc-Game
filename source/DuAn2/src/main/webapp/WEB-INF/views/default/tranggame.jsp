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
<!-- Mở đầu cho chi tiết game -->

<!-- Đóng chi tiết bài viết -->
<!-- Banner chi tiết bài viết -->
<div class="container-fluid">
    <div id="custom_carousel" class="carousel slide" data-ride="carousel" data-interval="2500">
        <div class="carousel-inner">
            <c:forEach var="gl" items="${Top5gamesList}" varStatus="status">
                <div class="item ${status.index == 0 ? 'active' : ''}">
                    <div class="container-fluid">
                        <div class="row" style="margin-top: 10px;">
                            <div class="col-md-3"><a href="${contextPath}/games/${gl.slug}.html"><img style="width: 100%;height: 150px;"
                                    src="${contextPath}/images/games/${gl.images}" class="img-responsive"></a></div>
                            <div class="col-md-9">
                                <a href="${contextPath}/games/${gl.slug}.html"><h2>${gl.name}</h2></a>
                                <p>${gl.info}</p>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>

            <!-- Kết thúc một mối tình -->
        </div>
        <!-- Banner nhỏ-->
        <div class="controls">
            <ul class="nav">
                <c:forEach var="gl" items="${Top5gamesList}" varStatus="status">
                    <li data-target="#custom_carousel" data-slide-to="${status.index}"
                        class="${status.index == 0 ? 'active' : ''}"><a href="${contextPath}/games/${gl.slug}.html">
                        <img style="width: 30%; height: 50px;" src="${contextPath}/images/games/${gl.images}">
                        <small>${gl.name}</small>
                    </a></li>
                </c:forEach>
            </ul>
        </div>
    </div>
</div>
<br>
<!-- Danh sach game -->
<!-- Danh sach game -->
<div class="container" style="margin: 50px 0px;">
    <h2 class="widget-title feed-widget-title col-md-4">
        <a href="/video?sorted=hots">DANH SÁCH GAME</a>
    </h2>

    <div class="col-md-8">
        <div class="row">
            <div class="col-md-3" style="margin-right: 15px;">
                <h5>Thể loại</h5>
                <form class="form-horizontal" role="form">
                    <div class="form-group">
                        <select class="form-control" id="gameCategoryId">
                            <option value="0" selected>Tất Cả</option>
                            <c:forEach var="gcl" items="${gameCategoryList}">
                                <option value="${gcl.gameCategoryId}">${gcl.name}</option>
                            </c:forEach>
                        </select>
                    </div>
                </form>
            </div>
            <div class="col-md-3" style="margin-right: 15px;">
                <h5>Nhà Phát Hành</h5>
                <form class="form-horizontal" role="form">
                    <div class="form-group">
                        <select class="form-control" id="publishers">
                            <option value="all" selected>Tất Cả</option>
                            <c:forEach var="gl" items="${gamesList}">
                                <option value="${gl.publishers}">${gl.publishers}</option>
                            </c:forEach>

                        </select>
                    </div>
                </form>
            </div>

            <div class="col-md-3" style="margin-right: 15px;">
                <h5>Tên Game</h5>

                    <div class="form-group">
                        <input id="keysearch" style="height: 34px;" type="text" class="form-control"/>
                    </div>

            </div>

            <div class="col-md-2">
                <button id="btn-searchgame" type="button" class="btn btn-warning" style="margin-top: 23px;">Tìm kiếm
                </button>
            </div>
        </div>
    </div>
    <br><br>
    <div class="row" style="margin-top: 50px;padding-top: 50px; border-top: 1px solid #f0f0f0">
        <div id="danhsachgame">

        </div>
        <ul class="pager col-md-12"
            style="border-bottom: 1px solid #f0f0f0; margin-bottom: 15px; padding-bottom: 50px;">
            <li><a id="preview" style="width: 80px;" href="javascript:void(0);">Sau</a></li>
            <li><a id="next" style="width: 80px;" href="javascript:void(0);">Trước</a></li>
        </ul>
    </div>
</div>


<!--Mở đầu tin tức nè-->
<div class="container-fluid">
    <div class="container container-pad" id="property-listings">

        <div class="row">
            <div class="col-md-12" style="border-bottom: 1px solid #f0f0f0; margin-bottom: 30px; padding-bottom: 15px;">
                <h1>Tin game mới nổi bật</h1><br>
            </div>
        </div>

        <div class="row">
            <div class="col-sm-6">
                <c:forEach var="al" items="${articleList}" begin="0" end="4">
                    <div class="brdr bgc-fff pad-10 box-shad btm-mrg-20 property-listing">
                        <div class="media hover14 column">
                            <a class="pull-left" href="${contextPath}/${al.slug}.html" target="_parent">
                                <figure><img alt="image" class="img-responsive" style="width: 100%; height: 130px;"
                                             src="${contextPath}/images/articles/${al.imagesThumbnail}"></figure></a>

                            <div class="clearfix visible-sm"></div>

                            <div class="media-body fnt-smaller">

                                <h4 class="media-heading">
                                    <a href="${contextPath}/${al.slug}.html" target="_parent">
                                            ${fn:substring(al.title, 0, 100)} ... </a></h4>
                                <ul class="list-inline mrg-0 btm-mrg-10 clr-535353">
                                    <li>${al.views} Lượt xem</li>

                                    <li style="list-style: none">|</li>

                                    <li>${fn:length(al.comments)} Bình luận</li>

                                    <li style="list-style: none">|</li>

                                    <li>${al.users.userName}</li>
                                </ul>

                                <p class="hidden-xs ">${fn:substring(al.subContent, 0, 100)} ...</p>
                                <span class="fnt-smaller fnt-lighter fnt-arial">Nguồn: ${al.author}</span>
                            </div>
                        </div>
                    </div>
                </c:forEach>

            </div>


            <div class="col-sm-6">
                <c:forEach var="al" items="${articleList}" begin="5" end="9">
                    <div class="brdr bgc-fff pad-10 box-shad btm-mrg-20 property-listing">
                        <div class="media hover14 column">
                            <a class="pull-left" href="${contextPath}/${al.slug}.html" target="_parent">
                                <figure> <img alt="image" class="img-responsive" style="width: 100%; height: 130px;"
                                              src="${contextPath}/images/articles/${al.imagesThumbnail}"></figure></a>

                            <div class="clearfix visible-sm"></div>

                            <div class="media-body fnt-smaller">

                                <h4 class="media-heading">
                                    <a href="${contextPath}/${al.slug}.html" target="_parent">
                                            ${fn:substring(al.title, 0, 100)} ...</a></h4>
                                <ul class="list-inline mrg-0 btm-mrg-10 clr-535353">
                                    <li>${al.views} Lượt xem</li>

                                    <li style="list-style: none">|</li>

                                    <li>${fn:length(al.comments)} Bình luận</li>

                                    <li style="list-style: none">|</li>

                                    <li>${al.users.userName}</li>
                                </ul>

                                <p class="hidden-xs ">${fn:substring(al.subContent, 0, 100)} ...</p>
                                <span class="fnt-smaller fnt-lighter fnt-arial">Nguồn: ${al.author}</span>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>

        </div>
    </div>
</div>
</div>



