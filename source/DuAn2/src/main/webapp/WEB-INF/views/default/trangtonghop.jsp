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
<!-- Banner chi tiết bài viết -->
<div class="content-block-single">
	<div class="content-panel">
		<div class="content-panel-title">

			<div class="feed-widget-header">
				<h2 class="widget-title feed-widget-title">
					<a href="${objectCategoryAndTag.slug}">${objectCategoryAndTag.name}</a>
				</h2>

				<div class="clear"></div>
			</div>

		</div>
		<div class="content-panel-body article-list" id="posts">
			<c:forEach var="al" items="${articleList}">
				<div class="item">

					<div class="item-header hover14 column">
						<a href="${contextPath}/${al.slug}"> <span class="comment-tag"><i
								class="fa fa-eye"></i>${al.views}<i></i></span> <span
								class="read-more-wrapper"><span class="read-more">Xem chi tiết<i></i>
					</span></span>
							<figure><img class="img-responsive" title="${al.title}"
										 src="${contextPath}/images/articles/${al.imagesThumbnail}" alt="${al.title}"/></figure>
						</a>
					</div>

					<div class="item-content">

						<strong class="category-link">
							<c:forEach var="ac" items="${al.articleCategories}">
								<a style="padding-right: 7px;" href="${contextPath}/${ac.slug}">${ac.name}</a>
							</c:forEach>
						</strong>

						<h3>
							<a title="${al.title}" href="${contextPath}/${al.slug}">${al.title}</a>
						</h3>
						<span class="item-meta">
						<a style="font-weight: bold;" href="${contextPath}/${al.slug}"><i
								class="fa fa-user"></i>${al.users.userName}</a>
						<a href="${contextPath}/${al.slug}"><i
								class="fa fa-comment-o"></i>${fn:length(al.comments)} Bình luận</a> <a href="${contextPath}/${al.slug}"><i
								class="fa fa-clock-o"></i><fmt:formatDate pattern="dd-MM-yyyy" value="${al.showDate}"/></a>

					</span>
						<p>${al.subContent}</p>
					</div>
				</div>
			</c:forEach>

		</div>
		<div style="padding-bottom: 60px; border-bottom: 1px solid #F0F0F0" class="content-panel-body pagination ">
			<%--<a class="prev page-numbers" href="#"><i class="fa fa-angle-left"></i>Trước</a>
            <a class="page-numbers" href="#">1</a> <span
                class="page-numbers current">2</span> <a class="page-numbers"
                                                         href="#">3</a> <a class="page-numbers" href="#">4</a> <a
                class="page-numbers" href="#">5</a> <a class="next page-numbers"
                                                       href="#">Tiếp theo<i class="fa fa-angle-right"></i></a>--%>
			<c:if test="${currentpage > 1  }">

				<a class="prev page-numbers"
				   href="${contextPath}/${objectCategoryAndTag.slug}?page=${currentpage -1 }"><i
						class="fa fa-angle-left"></i>Trước</a>
			</c:if>
			<c:forEach begin="${(currentpage - 3) > 0 ? currentpage - 3 : 1 }"
					   end="${currentpage + 3 < pagecount ? currentpage + 3 : pagecount }"
					   varStatus="status">
				<c:choose>
					<c:when test="${status.index == currentpage }">

						<span class="page-numbers current">${status.index }</span>
					</c:when>
					<c:otherwise>

						<a class="page-numbers" href="${contextPath}/${objectCategoryAndTag.slug}?page=${status.index }">${status.index }</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${currentpage < pagecount }">

				<a class="next page-numbers"
				   href="${contextPath}/${objectCategoryAndTag.slug}?page=${currentpage +1 }">Sau<i
						class="fa fa-angle-right"></i></a>
			</c:if>

		</div>



		<!-- End tin mới -->
	</div>

</div>