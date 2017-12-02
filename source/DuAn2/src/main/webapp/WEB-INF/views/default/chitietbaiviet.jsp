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
            <img style="width: 782px; height:440px; " class="img-responsive"
                 src="${contextPath}/images/articles/${article.imagesThumbnail}" alt="${article.title}">
            <div class="wrapper" style="margin-top: 31px;">
                <div class="content-panel-body article-header">
                    <input hidden id="articleId" value="${article.articleId}"/>
                    <strong class="category-link">
                        <c:forEach var="ac" items="${article.articleCategories}">
                            <a href="${contextPath}/${ac.slug}.html">${ac.name} &emsp;</a>
                            <span>  </span>
                        </c:forEach>

                    </strong>

                    <h2>${article.title}</h2>
                    <div class="article-meta">
                        <a href="#" class="meta-item">${article.users.userName}</a> <a href="#"
                                                                                       class="meta-item"><fmt:formatDate
                            pattern="dd-MM-yyyy" value="${article.showDate}"/></a> <a href="#"
                                                                                      class="meta-item">${article.views}
                        lượt xem 
                        </a>
                    </div>
                </div>

            </div>

            <c:if test="${article.video != null}">
                <iframe src="${article.video}" frameborder="0" width="560" height="315"
                        allowfullscreen>

                </iframe>
            </c:if>
        </div>
        <!-- Bài viết chí tiết -->
        <div class="content-panel-body shortcode-content">

            <h2 class="subcontentandauthor">${article.subContent}</h2>

            <c:out value="${article.mainContent}" escapeXml="false"/>

            <h2 style="padding: 10px;  " class="pull-right subcontentandauthor">${article.author}</h2>
        </div>

        <div class="content-panel">
            <div class="content-panel-body article-main-tags">
                <span id="msglikearticle">
                    <c:choose>
                        <c:when test="${userOfArticleLike == true}">
                            <b>Bạn</b> Và <span
                                id="numberUserArticleLike"> ${fn:length(articleLikeList) -1} </span> người khác thích bài viết này
                        </c:when>
                        <c:otherwise>
                            <b id="numberUserArticleLike"> ${fn:length(articleLikeList)} </b> người thích bài viết này
                        </c:otherwise>
                    </c:choose>

                </span>
                <security:authorize access="isAuthenticated()">

                    <a id="likearticle" href="javascript:void(0)" style=" float: right;"><i style="padding-right: 5px;"
                                                                           class="fa fa-thumbs-up"></i>
                        <span id="textlike" >${userOfArticleLike == true ? 'Bỏ Thích' : 'Thích'}</span> </a>
                </security:authorize>
                <security:authorize access="!isAuthenticated()">
                    <a class="modal_trigger" href="#modal" style=" float: right;"><i style="padding-right: 5px;"
                                                                                     class="fa fa-thumbs-up"></i>Thích</a>
                </security:authorize>

            </div>
        </div>

        <!-- Đóng bài viết chí tiết -->
        <br>
        <!-- Thẻ hagtag, chia sẻ -->
        <div class="content-panel">
            <div class="content-panel-body article-main-share">
				<span class="share-front"><i class="fa fa-share-alt"></i>Chia
					sẻ</span> <a id="sharefacebook"
                                 onclick="return !window.open(this.href, 'Facebook', 'width=640,height=580')"
                                 class="article-main-share-button"><strong
                    class="hover-color-facebook">Facebook</strong><i id="countsharefacebook"></i></a> <a
                    id="sharetwitter" onclick="return !window.open(this.href, 'Twitter', 'width=640,height=580')"
                     class="article-main-share-button"><strong
                    class="hover-color-twitter">Twitter</strong><i id="countsharetwitter"></i></a>
                <a id="sharegoogle" class="article-main-share-button" onclick="return !window.open(this.href, 'Google', 'width=640,height=580')">
                    <strong class="hover-color-google-plus">Google+</strong><i id="countsharegoogle"></i></a> <br>


            </div>
            <div class="content-panel">
                <div class="content-panel-body article-main-tags">
                    <span class="tags-front"><i class="fa fa-tags"></i>Xem thêm</span>
                    <c:forEach var="at" items="${article.tagses}">
                        <a href="${contextPath}/${at.slug}.html">${at.name}</a>
                    </c:forEach>
                </div>
            </div>
            <!-- END Thẻ hagtag, chi sẻ -->

            <!-- Game vote -->
            <c:if test="${article.gameId != 0 && !empty games }">
                <div class="game-vote">
                    <div class="row">
                        <div style="padding-top: 10px;" class="col-md-7">
                            <div class="col-md-4">
                                <img style="width: 100%; height: 120px;"
                                     src="${contextPath}/images/games/${games.images}" alt="${games.name}"
                                     class="pull-left m-r-10 hidden-xs"></div>
                            <div class="col-md-8 ">
                                <h3 style="color: #e54c10;" class="title-game-vote">${games.name}</h3></div>
                            <div class="pull-left">

                                <p>
                                    Danh mục:
                                    <c:forEach items="${games.gameCategories}" var="gc">
                                        <a href="">${gc.name}</a><br/>
                                    </c:forEach>
                                    <br>
                                    Nhà phát hành: <span>
                                        ${fn:substring(games.publishers, 0, 20)} ...</span><br/>
                                </p>
                                <a class="btn btn-default btn-sm" href="${contextPath}/games/${games.slug}.html">Thông tin game</a>
                                <a target="_blank" class="btn btn-success btn-sm" href="${games.homeUrl }">Trang Chủ</a>
                            </div>
                        </div>
                        <div class="col-md-5" style="padding-top: 10px;">
                            <div class="rank-vote pull-right">${pointGameReviews * 2}</div>
                            <div class="pull-right text-right">
                                Điểm đánh giá<br>
                                <c:forEach begin="1" end="${pointGameReviews}">
                                    <i style="padding-top: 10px;" class="fa fa-star"></i>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                    <div class="stars">
                        <security:authorize access="isAuthenticated()">
                            <form action="">
                                <h4></h4>
                                <input hidden id="gameId" value="${article.gameId}"/>
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
            </c:if>
            <!-- End Game vote -->
            <br>

            <div class="content-panel">

                <div class="content-panel-body article-main-next-prev">
                    <div class="paragraph-row">
                        <div class="column6">
                            <a href="${contextPath}/${articleLienQuanList[0].slug}.html" class="article-nav-previous">
                                <i class="fa fa-chevron-left"></i>
                                <span>Bài Viết Trước</span>
                                <strong>${articleLienQuanList[0].title}</strong>
                            </a>
                        </div>
                        <div class="column6">
                            <a href="${contextPath}/${articleLienQuanList[1].slug}.html" class="article-nav-next">
                                <i class="fa fa-chevron-right"></i>
                                <span>Bài Viết Sau</span>
                                <strong>${articleLienQuanList[1].title}</strong>
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
                    </ol>
                </div>
                
                <div class="xemthemcomment"
                     style="padding: 10px 1px; text-align: center; background: #f7f7f7; margin-bottom: 20px;">
                    <div id="LoadingGifSmall">
                        <img src="${contextPath }/images/36.gif"/>
                    </div>
                    <button id="morecomment" class="">Xem thêm bình luận</button>
                </div>
            </div>
            <!-- End Bình luận -->

            <!-- Trả lời bình luận -->
            <security:authorize access="isAuthenticated()">
            <c:choose>
            	<c:when test="${article.allowComment == 'allow' }">
            	<input hidden id="CommentId" value="0"/>
                <input hidden id="subCommentId" value="0"/>
                <input hidden id="usersBySubUserId" value="0"/>
                <li class="comment">
                    <div class="comment-block">
                        <security:authorize access="hasAnyRole('FACEBOOK', 'GOOGLE')">
                            <a href="#" class="image-avatar"> <img
                                    src="${user.avatar}"
                                    data-ot-retina="${user.avatar}" alt="" title="">
                            </a>
                        </security:authorize>
                        <security:authorize access="!hasAnyRole('FACEBOOK', 'GOOGLE')">
                            <a href="#" class="image-avatar"> <img
                                    src="${contextPath}/images/avatar/${user.avatar}"
                                    data-ot-retina="${contextPath}/images/avatar/${user.avatar}" alt="" title="">
                            </a>
                        </security:authorize>

                        <div class="comment-text">
                            <security:authorize access="hasAnyRole('FACEBOOK', 'GOOGLE')">
                                <strong class="user-nick"><a href="#">${user.firstName} ${user.lastName}</a> <span
                                        id="msgsubcomment"></span></strong>
                            </security:authorize>
                            <security:authorize access="!hasAnyRole('FACEBOOK', 'GOOGLE')">
                                <strong class="user-nick"><a href="#">${user.userName}</a> <span
                                        id="msgsubcomment"></span></strong>
                            </security:authorize>

                            <textarea id="content" name="content"
                                      placeholder="Viết bình luận của bạn.."
                                      style="width: 100%; height: 100px"></textarea>
                            <p class="form-submit">
                                <input name="submit" type="submit" id="btn-newcomment" disabled="disabled"
                                       class="submit button btn-postcomment" value="Gửi bình luận">

                            </p>
                        </div>
                    </div>
                </li>
            	</c:when>
            	<c:otherwise>
            	 <div style="text-align: center;">
                <span>Quản Trị Viên Đã Tắt Bình Luận Bài Viết Này
                </span>
                </div>
            	</c:otherwise>
            </c:choose>
                
            </security:authorize>

            <security:authorize access="!isAuthenticated()">
                <div style="text-align: center;">
                <span>Vui Lòng Đăng Nhập Để Bình Luận
                <li class="scroll"><a style="color: #e54c10;" class="modal_trigger" href="#modal">Đăng
                    Nhập</a></li></span>
                </div>
            </security:authorize>
            <!-- End trả lời bình luận -->
        </div>
    </div>
    <!-- Tin mới -->
    <br> <br>
    <div class="content-panel">
        <div class="content-panel-title">
            <div class="feed-widget-header">
                <h2 class="widget-title feed-widget-title">
                    <a href="${contextPath}/${articleCategory.slug}.html?sorted=news">CÙNG CHUYÊN MỤC</a>
                </h2>
                <div class="feed-widget-viewall">
                    <a href="${contextPath}/${articleCategory.slug}.html?sorted=news"><span>XEM THÊM</span> <i
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
                        <c:forEach var="alql" items="${articleLienQuanList}" begin="1" end="7">
                            <div class="item">
                                <div class="item-header">
                                    <a href="${contextPath}/${alql.slug}.html"><img
                                            src="${contextPath}/images/articles/${alql.imagesThumbnail}"
                                            alt=""/></a>
                                </div>
                                <div class="item-content">
                                    <h4>
                                        <a href="${contextPath}/${alql.slug}.html"> ${fn:substring(alql.title, 0, 50)}
                                            ...</a>
                                    </h4>
                                    <span class="item-meta"> <%--<a
                                            href="${contextPath}/images/articles/${alql.imagesThumbnail}"><i
                                            class="fa fa-comment-o"></i>82 Bình luận</a>--%> <a
                                            href="${contextPath}/images/articles/${alql.imagesThumbnail}"><i
                                            class="fa fa-clock-o"></i><fmt:formatDate
                                            pattern="dd-MM-yyyy" value="${alql.showDate}"/></a>
								</span>
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
                        <a href="${contextPath}/${articleLienQuanList[0].slug}.html"> <span class="comment-tag"><i
                                class="fa fa-comment-o"></i>${articleLienQuanList[0].views}<i></i></span> <span
                                class="read-more-wrapper"><span class="read-more">Xem
									chi tiết<i></i>
							</span></span>
                            <figure><img src="${contextPath}/images/articles/${articleLienQuanList[0].imagesThumbnail}"
                                         alt=""/></figure>
                        </a>
                    </div>
                    <div class="item-content">
                        <h3>
                            <a href="${contextPath}/${articleLienQuanList[0].slug}.html">${articleLienQuanList[0].title}</a>
                        </h3>
                        <span class="item-meta"> <a href="${contextPath}/${articleLienQuanList[0].slug}.html"><i
                                class="fa fa-comment-o"></i>82 Bình luận</a> <a href="${contextPath}/${articleLienQuanList[0].slug}.html"><i
                                class="fa fa-clock-o"></i><fmt:formatDate
                                pattern="dd-MM-yyyy" value="${articleLienQuanList[0].showDate}"/></a>
						</span>
                        <p>${articleLienQuanList[0].subContent}</p>
                        <a href="${contextPath}/${articleLienQuanList[0].slug}.html" class="read-more-button">Xem chi tiết<i
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
                    <a href="${contextPath}/articles.html?sorted=news">TIN MỚI</a>
                </h2>
                <div class="feed-widget-viewall">
                    <a href="${contextPath}/articles.html?sorted=news"><span>XEM THÊM</span> <i
                            class="fa fa-chevron-right"></i></a>
                </div>
                <div class="clear"></div>
            </div>

        </div>
        <div class="content-panel-body article-list">
            <c:forEach var="gal" items="${getTop10ArticleList}">
                <div class="item">
                    <div class="item-header hover14 column">
                        <a href="${contextPath}/${gal.slug}.html"> <span class="comment-tag"><i
                                class="fa fa-comment-o"></i>${gal.views}<i></i></span> <span
                                class="read-more-wrapper"><span class="read-more">Xem
								chi tiết<i></i>
						</span></span>
                            <figure><img src="${contextPath}/images/articles/${gal.imagesThumbnail}"
                                         alt="${gal.title}"></figure>
                        </a>
                    </div>
                    <div class="item-content">
                        <strong class="category-link">
                            <c:forEach var="ac" items="${gal.articleCategories}">
                                <a style="padding-right: 7px;" href="${contextPath}/${ac.slug}.html">${ac.name}</a>
                            </c:forEach>
                        </strong>

                        <h3>
                            <a alt="${gal.title}" href="${contextPath}/${gal.slug}.html">${gal.title}</a>
                        </h3>
                        <span class="item-meta">
                            <a style="font-weight: bold;" href="${contextPath}/${gal.slug}.html"><i
                                    class="fa fa-user"></i>${gal.users.userName}</a>
                            <a href="${contextPath}/${gal.slug}.html"><i
                                    class="fa fa-comment-o"></i>${fn:length(gal.comments)}</a> <a
                                href="${contextPath}/${gal.slug}.html"><i
                                class="fa fa-clock-o"></i><fmt:formatDate pattern="dd-MM-yyyy" value="${gal.showDate}"/></a>
					</span>
                        <p>${gal.subContent}</p>
                    </div>
                </div>
            </c:forEach>

        </div>
    </div>
    <!-- End tin mới -->

    <div class="container hidden-xs hidden-sm"></div>

</div>

<div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Xóa Bình Luận</h4>
            </div>
            <div class="modal-body">
                <p>Bạn Muốn Xóa Bình Luận ?</p>
            </div>
            <div class="modal-footer">

                <input id="btn-deleteComment" name="submit" type="submit" data-dismiss="modal"
                       class="submit button" value="Xóa">
            </div>
        </div>
    </div>
</div>