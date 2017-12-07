<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="security"
           uri="http://www.springframework.org/security/tags"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<div class="container">
    <div class="row user-menu-container square">
        <div class="col-md-7 user-details">
            <div class="row coralbg white">
                <div class="col-md-6 no-pad">
                    <div class="user-pad">
                        <h3 >${games.name}</h3><br>
                        <h4 class="white"><i class="fa fa-check-circle-o"></i>
                            <c:forEach items="${games.gameCategories}" var="gc">
                                ${gc.name} |
                            </c:forEach>
                        </h4>
                        <p>Nhà Phát Hành : ${games.publishers}</p><br/>
                        <p>Ngày Phát Hành : <fmt:formatDate pattern="dd-MM-yyyy" value="${games.releases}"/></p>
                         </div>
                </div>
                <div class="col-md-6 no-pad">
                    <div class="user-image">
                        <img src="${contextPath}/images/games/${games.images}" class="img-responsive thumbnail">
                    </div>
                </div>
            </div>
            <div class="row overview" style="float: left;margin-top: 10px;">
                <div class="col-md-4 user-pad text-center">
                    <h3 style="text-align: center;">LƯỢT XEM</h3>
                    <h4>${games.views}</h4>
                </div>
                <div class="col-md-4 user-pad text-center">
                    <h3 style="text-align: center;">ĐIỂM ĐÁNH GIÁ</h3>
                    <h4>${pointGameReviews}/10</h4>
                </div>
                <div class="col-md-4 user-pad text-center">
                    <h3 style="text-align: center;">LƯỢT ĐÁNH GIÁ </h3>
                    <h4>${gameReviews}</h4>
                </div>
            </div>
        </div>
        <div class="col-md-1 user-menu-btns">
            <div class="btn-group-vertical square" id="responsive">
                <a href="#" class="btn btn-block btn-default active">
                    <i class="fa fa-search fa-3x"></i>
                </a>
                <a href="#" class="btn btn-default">
                    <i class="fa fa-wrench fa-3x"></i>
                </a>
                <a href="#" class="btn btn-default">
                    <i class="fa fa-heart fa-3x"></i>
                </a>
                <a href="#" class="btn btn-default">
                    <i class="fa fa-download fa-3x"></i>
                </a>

            </div>
        </div>
        <div class="col-md-4 user-menu user-pad">
            <div class="user-menu-content active">
                <h3>
                    Thông tin game
                </h3>
                <ul class="user-menu-list">
                    <p>${games.info}</p>
                </ul>
            </div>
            <div class="user-menu-content">
                <h3>
                    Cấu hình chơi game
                </h3>
                <ul class="user-menu-list">
                    ${games.systemRequirements}

                </ul>
            </div>
            <div class="user-menu-content">
                <h3>
                    Bình chọn game
                </h3>
                <div class="stars1">
                    <security:authorize access="isAuthenticated()">
                        <form action="">
                            <h4></h4>
                            <input hidden id="gameId" value="${games.gameId}"/>
                            <input ${pointGameReviewsOfUser == 5 ? 'checked' : '' } class="star star-5" id="star-5"
                                                                                    type="radio" name="star">
                            <label onclick="gamereivews(5);" class="star star-5" for="star-5"></label>
                            <input ${pointGameReviewsOfUser == 4 ? 'checked' : '' }
                                    class="star star-4" id="star-4" type="radio" name="star">
                            <label onclick="gamereivews(4);" class="star star-4" for="star-4"></label>
                            <input ${pointGameReviewsOfUser == 3 ? 'checked' : '' }
                                    class="star star-3" id="star-3" type="radio" name="star">
                            <label onclick="gamereivews(3);" class="star star-3" for="star-3"></label>
                            <input ${pointGameReviewsOfUser == 2 ? 'checked' : '' }
                                    class="star star-2" id="star-2" type="radio" name="star">
                            <label onclick="gamereivews(2);" class="star star-2" for="star-2"></label>
                            <input ${pointGameReviewsOfUser == 1 ? 'checked' : '' }
                                    class="star star-1" id="star-1" type="radio" name="star"><label
                                onclick="gamereivews(1);"
                                class="star star-1" for="star-1"></label>
                        </form>
                    </security:authorize>
                    <security:authorize access="!isAuthenticated()">
                        <form action="">
                            <h4></h4>

                            <input class="star star-5" id="star-5" type="radio" name="star">
                            <a class="modal_trigger" href="#modal"> <label class="star star-5" for="star-5"></label></a>
                            <input
                                    class="star star-4" id="star-4" type="radio" name="star">
                            <a class="modal_trigger" href="#modal"><label class="star star-4" for="star-4"></label></a>
                            <input
                                    class="star star-3" id="star-3" type="radio" name="star">
                            <a class="modal_trigger" href="#modal"> <label class="star star-3" for="star-3"></label></a>
                            <input $
                                   class="star star-2" id="star-2" type="radio" name="star">
                            <a class="modal_trigger" href="#modal"> <label class="star star-2" for="star-2"></label></a>
                            <input
                                    class="star star-1" id="star-1" type="radio" name="star"><a
                                class="modal_trigger" href="#modal"><label
                                class="star star-1" for="star-1"></label></a>
                        </form>
                    </security:authorize>
                </div>

            </div>
            <div class="user-menu-content">
                <h2 class="text-center">
                    DOWNLOAD
                </h2>
                <center><i class="fa fa-cloud-upload fa-4x"></i></center>
                <div class="share-links">
                    <center><a type="button" target="_blank" class="btn btn-lg btn-labeled btn-success" href="${games.downloadUrl}" style="margin-bottom: 15px;">
                        <span class="btn-label"><i class="fa fa-arrow-circle-o-down"></i></span>TẢI TRỰC TIẾP TỪ WEBSITE
                    </a></center>
                    <%--<center><button type="button" class="btn btn-lg btn-labeled btn-warning" href="#">
                        <span class="btn-label"><i class="fa fa-arrow-circle-o-down"></i></span>LINK DRIVE
                    </button></center>--%>
                </div>
            </div>
        </div>
    </div>
</div>
<br><br>
<!-- Đóng -->
<!-- Banner chi tiết bài viết -->
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
                                <figure><img alt="${al.title}" class="img-responsive" style="width: 100%; height: 130px;"
                                             src="${contextPath}/images/articles/${al.imagesThumbnail}"></figure></a>

                            <div class="clearfix visible-sm"></div>

                            <div class="media-body fnt-smaller">

                                <h4 class="media-heading">
                                    <a alt="${al.title}" href="${contextPath}/${al.slug}.html" target="_parent">
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
                                <figure> <img alt="${al.title}" class="img-responsive" style="width: 100%; height: 130px;"
                                              src="${contextPath}/images/articles/${al.imagesThumbnail}"></figure></a>

                            <div class="clearfix visible-sm"></div>

                            <div class="media-body fnt-smaller">

                                <h4 class="media-heading">
                                    <a alt="${al.title}" href="${contextPath}/${al.slug}.html" target="_parent">
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