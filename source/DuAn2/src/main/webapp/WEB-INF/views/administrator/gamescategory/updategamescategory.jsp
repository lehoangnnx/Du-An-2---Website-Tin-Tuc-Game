<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<style>
.error {
	color: red;
}
</style>
<div class="container-fluid">
	<h4>Danh Mục Game</h4>
	<ol class="breadcrumb no-bg mb-1">
		<li class="breadcrumb-item"><a href="forms-material.html#">Trang
				Chủ</a></li>
		<li class="breadcrumb-item active">Sửa Danh Mục Game</li>
	</ol>

	<div class="box box-block bg-white">
		<h5>Sửa Danh Mục Game</h5>

		<form:form id="formGameCategory"
			action="${contextPath }/admin/games/categorys" method="patch"
			enctype="multipart/form-data">

			<input hidden value="${gameCategory.gameCategoryId}" id="gameCategoryId" name="gameCategoryId" />
			<div id="divTitle" class="form-group row">
				<label class="col-md-2 col-form-label">Tên
					Danh Mục<span class="error"> *</span></label>
				<div class="col-md-10">
					<input maxlength="100" type="text" class="maxlength form-control "
						value="${gameCategory.name }" id="name" name="name"
						onkeyup="ChangeToSlug();">
					<div id="spanName" class=" error form-control-feedback"></div>
					<label id="name-error" class="error" for="name"></label>
				</div>
			</div>

			<div id="divSlug" class="form-group  row">
				<label class="col-md-2 col-form-label">Đường
					Dẫn<span class="error"> *</span></label>
				<div class="col-md-10">
					<input type="text" value="${gameCategory.slug }"
						class="form-control maxlength" maxlength="100" id="slug" name="slug">
					<div id="spanSlug" class=" error form-control-feedback"></div>
					<label id="slug-error" class="error" for="slug"></label>
				</div>
			</div>
			<div class="form-group row">
				<label for="select2-demo-1" class="col-md-2 form-control-label">Thuộc
					Danh Mục</label>
				<div class="col-md-10">
					<select id="select2-demo-1" class="form-control"
						name="subGameCategoryId" data-plugin="select2">
						
						<c:choose>
							<c:when test="${gameCategory.subGameCategoryId == 0}">
								<option value="0">Chưa Chọn</option>
								<c:forEach var="gcl" items="${gameCategoryList }">
									
									<option value="${gcl.gameCategoryId }">${gcl.name }</option>
									
								</c:forEach>
							</c:when>
							<c:otherwise>
								
								<c:forEach var="gcla" items="${gameCategoryList }">
									<c:if test="${gcla.gameCategoryId == gameCategory.subGameCategoryId }">
										<option value="${gcla.gameCategoryId }">${gcla.name }</option>
									</c:if>
									
								
								</c:forEach>
								<c:forEach var="gcl" items="${gameCategoryList }">
									<c:if test="${gcl.gameCategoryId != gameCategory.gameCategoryId }">
									<option value="${gcl.gameCategoryId }">${gcl.name }</option>
								</c:if>
									
								</c:forEach>
								<option value="0">Chưa Chọn</option>
							</c:otherwise>
						</c:choose>

					</select>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-md-2 col-form-label">Trạng Thái<span class="error"> *</span></label>
				<div class="col-md-10">
					<div class="md-radio-inline">
						<div class="md-radio">
							<input type="radio" id="statusactive" name="status" value="active"
								${gameCategory.status == 'active' ? 'checked' : '' }
								class="md-radiobtn"> <label for="statusactive"> <span></span>
								<span class="check"></span> <span class="box"></span>Kích Hoạt
							</label>
						</div>
						<div class="md-radio has-info">
							<input type="radio" id="statusinactive" name="status" value="inactive"
								${gameCategory.status == 'inactive' ? 'checked' : '' }
								class="md-radiobtn"> <label for="statusinactive"> <span
								class="inc"></span> <span class="check"></span> <span
								class="box"></span> Chưa Kích Hoạt
							</label>
						</div>
						<div class="md-radio has-warning">
							<input type="radio" id="statusdraft" name="status" value="draft"
								${gameCategory.status == 'draft' ? 'checked' : '' }
								class="md-radiobtn"> <label for="statusdraft"> <span
								class="inc"></span> <span class="check"></span> <span
								class="box"></span> Chờ Kích Hoạt
							</label>
						</div>
						<div class="md-radio has-error">
							<input type="radio" id="statusdeleted" name="status" value="deleted"
								${gameCategory.status == 'deleted' ? 'checked' : '' }
								class="md-radiobtn"> <label for="statusdeleted"> <span></span>
								<span class="check"></span> <span class="box"></span> Xóa
							</label>
						</div>
					</div>
				</div>
			</div>



			<div class="form-group row"
				style="border-top: 1px solid #e7ecf1; padding: 20px;">
				<input hidden="" id="msg" value="${msg }" />
				<div class="offset-sm-2 col-md-10">

					<button id="btn-submit" type="submit" class=" btn btn-primary">Xác
						Nhận</button>
					<a href="${contextPath}/admin/games/categorys?status=active" class="btn btn-danger pull-right" >Quay Lại</a>
				</div>
			</div>

		</form:form>

	</div>
</div>
