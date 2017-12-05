<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="security"
		   uri="http://www.springframework.org/security/tags" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<style>
.error {
	color: red;
}
</style>
<div class="container-fluid">
	<h4>Bài Viết</h4>
	<ol class="breadcrumb no-bg mb-1">
		<li class="breadcrumb-item"><a href="${contextPath}/admin/index">Trang
				Chủ</a></li>
		<li class="breadcrumb-item active">Sửa Bài Viết</li>
	</ol>

	<div class="box box-block bg-white">
		<h5>Sửa Bài Viết</h5>

		<form:form id="formArticle" action="${contextPath }/admin/articles"
			method="patch" enctype="multipart/form-data" >
			<input hidden name="articleId" id="articleId" value="${article.articleId}" />
			<div id="divTitle" class="form-group row">
				<label class="col-md-2 col-form-label" >Tiêu
					Đề<span class="error"> *</span></label>
				<div class="col-md-10">
					<input maxlength="255" type="text" class="maxlength form-control "
						value="${article.title }" id="title" name="title"
						required="required"
						oninvalid="this.setCustomValidity('Vui Lòng Nhập Tiêu Đề')"
						oninput="setCustomValidity('')" onkeyup="ChangeToSlug();">

					<div id="spanTitle" class=" error form-control-feedback"></div>
					<label id="title-error" class="error" for="title"></label>
				</div>
			</div>

			<div id="divSlug" class="form-group  row">
				<label class="col-md-2 col-form-label" >Đường
					Dẫn<span class="error"> *</span></label>
				<div class="col-md-10">
					<input type="text" value="${article.slug }" class="form-control maxlength" maxlength="255"
						id="slug" name="slug" required="required"
						oninvalid="this.setCustomValidity('Vui Lòng Nhập Đường Dẫn')"
						oninput="setCustomValidity('')">
					<div id="spanSlug" class=" error form-control-feedback"></div>
					<label id="slug-error" class="error" for="slug"></label>
				</div>
			</div>



			<div class="form-group row">
				<label class="col-md-2 col-form-label">Danh Mục<span class="error"> *</span></label>
				<div class="col-md-10">
					<div class="md-checkbox-inline">

						<c:forEach var="acl" items="${articleCategoryList}">
							<c:set var="found" value="fasle" />
							<c:forEach var="aacl" items="${article.articleCategories}">
								<c:choose>
									<c:when test="${acl == aacl}">
										<c:set var="found" value="true" />
										<div class="md-checkbox">
											<input name="articleCategories" type="checkbox"
												checked="checked" value="${aacl.articleCategoryId }"
												id="${aacl.articleCategoryId }" class="md-check"> <label
												for="${aacl.articleCategoryId }"> <span></span> <span
												class="check"></span> <span class="box"></span> ${aacl.name }
											</label>
										</div>
									</c:when>
								</c:choose>
							</c:forEach>
							<c:choose>
								<c:when test="${!found}">
									<div class="md-checkbox">
										<input name="articleCategories" type="checkbox"
											value="${acl.articleCategoryId }"
											id="${acl.articleCategoryId }" class="md-check"> <label
											for="${acl.articleCategoryId }"> <span></span> <span
											class="check"></span> <span class="box"></span> ${acl.name }
										</label>
									</div>
								</c:when>
							</c:choose>
						</c:forEach>


					</div>
					<label id="articleCategories-error" class="error" for="articleCategories"></label>
				</div>

			</div>

			<security:authorize access="hasRole('ADMIN')">
			<div class="form-group row">
				<label class="col-md-2 col-form-label">Trạng Thái<span class="error"> *</span></label>
				<div class="col-md-10">
					<div class="md-radio-inline">
						<div class="md-radio">
							<input type="radio" id="statusactive" name="status" value="active"
								${article.status == 'active' ? 'checked' : '' }
								class="md-radiobtn"> <label for="statusactive"> <span></span>
								<span class="check"></span> <span class="box"></span>Kích Hoạt
							</label>
						</div>
						<div class="md-radio has-info">
							<input type="radio" id="statusinactive" name="status" value="inactive"
								${article.status == 'inactive' ? 'checked' : '' }
								 class="md-radiobtn"> <label
								for="statusinactive"> <span class="inc"></span> <span
								class="check"></span> <span class="box"></span> Chưa Kích Hoạt
							</label>
						</div>
						<div class="md-radio has-warning">
							<input type="radio" id="statusdraft" name="status" value="draft"
								${article.status == 'draft' ? 'checked' : '' }
								class="md-radiobtn"> <label for="statusdraft"> <span
								class="inc"></span> <span class="check"></span> <span
								class="box"></span> Chờ Kích Hoạt
							</label>
						</div>
						<div class="md-radio has-error">
							<input type="radio" id="statusdeleted" name="status" value="deleted"
								${article.status == 'deleted' ? 'checked' : '' }
								class="md-radiobtn"> <label for="statusdeleted"> <span></span>
								<span class="check"></span> <span class="box"></span> Xóa
							</label>
						</div>
					</div>
				</div>
			</div>
			</security:authorize>
			<div class="form-group row">
				<label class="col-md-2 col-form-label">Tin Nổi Bật<span class="error"> *</span></label>
				<div class="col-md-10">
					<div class="md-radio-inline">
						<div class="md-radio">
							<input type="radio" id="isHotY" name="isHot" value="1"
								${article.isHot == 1 ? 'checked' : '' } class="md-radiobtn">
							<label for="isHotY"> <span></span> <span class="check"></span>
								<span class="box"></span>Có
							</label>
						</div>


						<div class="md-radio has-error">
							<input type="radio" id="isHotN" name="isHot" value="0"
								${article.isHot == 0 ? 'checked' : '' }
								class="md-radiobtn"> <label for="isHotN"> <span></span>
								<span class="check"></span> <span class="box"></span> Không
							</label>
						</div>
					</div>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-md-2 col-form-label">Cho Phép Bình Luận<span class="error"> *</span></label>
				<div class="col-md-10">
					<div class="md-radio-inline">
						<div class="md-radio">
							<input type="radio" id="allowCommentY" name="allowComment"
								value="allow"
								${article.allowComment == 'allow'? 'checked' : '' }
								class="md-radiobtn"> <label for="allowCommentY"> <span></span>
								<span class="check"></span> <span class="box"></span>Có
							</label>
						</div>


						<div class="md-radio has-error">
							<input type="radio" id="allowCommentN" name="allowComment"
								value="block"
								${article.allowComment == 'block'? 'checked' : '' }
								class="md-radiobtn"> <label for="allowCommentN"> <span></span>
								<span class="check"></span> <span class="box"></span> Không
							</label>
						</div>
					</div>
				</div>
			</div>

			<div class="form-group row">
				<label for="select2-demo-1" class="col-md-2 form-control-label">Game</label>
				<div class="col-md-10">
					<select id="select2-demo-1" class="form-control" name="gameId"
						data-plugin="select2">
						<c:choose>
							<c:when test="${article.gameId == 0}">
								<option value="0">Chưa Chọn</option>
								<c:forEach var="gl" items="${gameList }">
									<c:if test="${game.gameId != gl.gameId }">
										<option value="${gl.gameId }">${gl.name }</option>
									</c:if>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<option value="${article.gameId }">${game.name }</option>
								<c:forEach var="gl" items="${gameList }">
									<c:if test="${game.gameId != gl.gameId }">
										<option value="${gl.gameId }">${gl.name }</option>
									</c:if>
								</c:forEach>
								<option value="0">Chưa Chọn</option>
							</c:otherwise>
						</c:choose>



					</select>
				</div>
			</div>

			<div class="form-group row">
				<label class="col-md-2 form-control-label">Thẻ</label>
				<div class="col-md-10">
					<select multiple data-role="tagsinput" name="tags" id="tags">
						<c:forEach var="at" items="${article.tagses }">

							<option value="${at.name }">${at.name }</option>

						</c:forEach>
					</select>
					<label id="_tags-error" style="color: red;" ></label>
				</div>
			</div>
			<div class="form-group row">
				<label
					class="col-md-2 col-form-label">Ngày Hiển Thị</label>
				<div class="col-md-10">
					<input class="form-control" type="datetime-local" name="showDate"
						value="<fmt:formatDate pattern="yyyy-MM-dd'T'HH:mm" value="${article.showDate}"/>"
						id="showDate">
				</div>
			</div>



			<div class=" form-group row">


				<label for="select2-demo-1" class="col-md-2 form-control-label">Tóm
					Tắt<span class="error"> *</span></label>
				<div class="col-md-10">
					<textarea id="subContent" class="form-control" maxlength="4000"
						name="subContent" rows="5"
						placeholder="Tóm Tắt Tối Đa 4000 Ký Tự">${article.subContent }</textarea>
					<label id="subContent-error" class="error" for="subContent"></label>
				</div>


			</div>


			<div class="form-group row">
				<label class="col-md-2 col-form-label">Nội Dung<span class="error"> *</span></label>
				<div class="col-md-10">
					<textarea name="mainContent" id="summernote">${article.mainContent }</textarea>

					<span id="mainContent-error"></span>
				</div>
			</div>

			<div class="form-group  row">
				<label class="col-md-2 col-form-label" >Tác
					Giả/Nguồn<span class="error"> *</span></label>
				<div class="col-md-10">
					<input type="text" maxlength="255" class="form-control" id="author" name="author"
						value="${article.author }"> <label id="author-error"
						class="error" for="author"></label>
				</div>
			</div>


			<div class="form-group row">
				<label class="col-md-2 control-label">Ảnh
					Thumbnail<span class="error"> *</span></label>
				<div class="col-md-10">
					<input name="imagesThumbnail" type="file" id="input-file-max-fs" accept="image/*"
						value="${contextPath}/images/articles/${article.imagesThumbnail}"
						class="dropify" data-max-file-size="15M"
						data-default-file="${contextPath}/images/articles/${article.imagesThumbnail}">

					<label id="input-file-max-fs-error" class="error"
						for="input-file-max-fs"></label>
				</div>
			</div>

			<div class="form-group row">
				<label class="col-md-2 col-form-label" >Video
					Thumbnail</label>
				<div class="col-md-10">
					<input type="text" class="form-control" name="video"
						value="${article.video}" id="inputframeVideo">


					<iframe  style="margin-top: 15px; margin-bottom: 15px;"
						class="col-md-12" id="ifVideo" width="560" height="315"
						src="${article.video}" frameborder="0" allowfullscreen></iframe>

				</div>
			</div>


			<div class="form-group row"
				style="border-top: 1px solid #e7ecf1; padding: 20px;">
				<input hidden="" id="msg" value="${msg }"></input>
				<div class="offset-sm-2 col-md-10">

					<button id="btn-submit" type="submit" class=" btn btn-primary">Xác
						Nhận</button>
					<a href="${contextPath}/admin/articles?status=active" class="btn btn-danger pull-right" >Quay Lại</a>
				</div>
			</div>

		</form:form>

	</div>
</div>
