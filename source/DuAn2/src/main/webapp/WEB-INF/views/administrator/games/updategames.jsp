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
	<h4>Game</h4>
	<ol class="breadcrumb no-bg mb-1">
		<li class="breadcrumb-item"><a href="${contextPath}/admin/index">Trang Chủ</a></li>

		<li class="breadcrumb-item active">Sửa Game</li>
	</ol>

	<div class="box box-block bg-white">
		<h5>Sửa  Game</h5>

		<form:form id="formGames" action="${contextPath }/admin/games"
			method="patch" enctype="multipart/form-data" >

			<input hidden value="${games.gameId}" id="gameId" name="gameId" />
			<div class="form-group row">
				<label class="col-md-2 control-label" >Ảnh Game<span class="error"> *</span></label>
				<div class="col-md-10">
					<input name="images" type="file" id="input-file-max-fs" accept="image/*"
						    value="${games.images}" class="dropify"
						   data-max-file-size="15M"
						   data-default-file="${contextPath}/images/games/${games.images}">

					<label id="input-file-max-fs-error" class="error" for="input-file-max-fs"></label>
				</div>
			</div>

			<div id="divTitle" class="form-group row">
				<label class="col-md-2 col-form-label" >Tên
					Game<span class="error"> *</span></label>
				<div class="col-md-10">
					<input maxlength="100" type="text" class="maxlength form-control "
						value="${games.name }" id="name" name="name"
						onkeyup="ChangeToSlug();">
					<div id="spanName" class=" error form-control-feedback"></div>

				</div>
			</div>

			<div id="divSlug" class="form-group  row">
				<label class="col-md-2 col-form-label" >Đường
					Dẫn<span class="error"> *</span></label>
				<div class="col-md-10">
					<input type="text" value="${games.slug }" class="form-control maxlength" maxlength="100"
						id="slug" name="slug">
					<div id="spanSlug" class=" error form-control-feedback"></div>

				</div>
			</div>
			<div class="form-group row">
				<label class="col-md-2 col-form-label">Game Nổi Bật<span class="error"> *</span></label>
				<div class="col-md-10">
					<div class="md-radio-inline">
						<div class="md-radio">
							<input type="radio" id="isHotY" name="isHot" value="1"
								${games.isHot == 1 ? 'checked' : '' } class="md-radiobtn">
							<label for="isHotY"> <span></span> <span class="check"></span>
								<span class="box"></span>Có
							</label>
						</div>


						<div class="md-radio has-error">
							<input type="radio" id="isHotN" name="isHot" value="0"
								${games.isHot == 0 ? 'checked' : '' }
								   class="md-radiobtn"> <label for="isHotN"> <span></span>
							<span class="check"></span> <span class="box"></span> Không
						</label>
						</div>
					</div>
				</div>
			</div>


			<div class=" form-group row">


				<label class="col-md-2 form-control-label">Mô Tả Game<span class="error"> *</span></label>
				<div class="col-md-10">
					<textarea id="info" class="form-control maxlength" maxlength="4000"
							  name="info" rows="5"
							  placeholder="Mô Tả Game Tối Đa 4000 Ký Tự.">${games.info }</textarea>
					<label id="info-error" class="error" ></label>
				</div>


			</div>

			<div class="form-group  row">
				<label class="col-md-2 col-form-label">Trang Chủ<span class="error"> *</span></label>
				<div class="col-md-10">
					<input type="text" value="${games.homeUrl }"
						   class="form-control " id="homeUrl" name="homeUrl">
					<label id="homeUrl-error" class="error" for="homeUrl"></label>
				</div>
			</div>

			<div class="form-group  row">
				<label class="col-md-2 col-form-label" >Trang Tải Game<span class="error"> *</span></label>
				<div class="col-md-10">
					<input type="text" value="${games.downloadUrl }"
						   class="form-control " id="downloadUrl" name="downloadUrl">
					<label id="downloadUrl-error" class="error" for="homeUrl"></label>
				</div>
			</div>
			<div class="form-group  row">
				<label class="col-md-2 col-form-label">Nhà
					Phát Hành<span class="error"> *</span></label>
				<div class="col-md-10">
					<input type="text" maxlength="500" value="${games.publishers }"
						class="form-control " id="publishers" name="publishers">

				</div>
			</div>
			<div class="form-group row">
				<label
					class="col-md-2 col-form-label">Ngày Phát Hành<span class="error"> *</span></label>
				<div class="col-md-10">
					<input class="form-control" type="datetime-local" name="releases"
						value="<fmt:formatDate pattern="yyyy-MM-dd'T'HH:mm" value="${games.releases}"/>"
						id="releases">
				</div>
			</div>

			<div class="form-group row">
				<label class="col-md-2 col-form-label">Cấu Hình<span class="error"> *</span></label>
				<div class="col-md-10">
					<textarea name="systemRequirements" id="summernote">${games.systemRequirements }</textarea>

					<span id="systemRequirements-error"  class="error"></span>
				</div>
			</div>

			<div class="form-group  row">
				<label class="col-md-2 col-form-label" for="developers">Nhà
					Phát Triển</label>
				<div class="col-md-10">
					<input type="text" maxlength="500" value="${games.developers }"
						class="form-control " id="developers" name="developers">

				</div>
			</div>
			
			<div class="form-group  row">
				<label class="col-md-2 col-form-label" for="writers">Kịch Bản</label>
				<div class="col-md-10">
					<input type="text" maxlength="500" value="${games.writers }"
						class="form-control " id="writers" name="writers">

				</div>
			</div>
			<div class="form-group  row">
				<label class="col-md-2 col-form-label" for="composers">Âm Nhạc</label>
				<div class="col-md-10">
					<input type="text" maxlength="500" value="${games.composers }"
						class="form-control " id="composers" name="composers">

				</div>
			</div>
			<div class="form-group  row">
				<label class="col-md-2 col-form-label" for="engine">Công Nghệ</label>
				<div class="col-md-10">
					<input type="text" maxlength="500" value="${games.engine }"
						class="form-control " id="engine" name="engine">

				</div>
			</div>
			<div class="form-group  row">
				<label class="col-md-2 col-form-label" for="platforms">Nền Tảng</label>
				<div class="col-md-10">
					<input type="text" maxlength="500" value="${games.platforms }"
						class="form-control " id="platforms" name="platforms">

				</div>
			</div>

			<div class="form-group row">
				<label class="col-md-2 col-form-label">Danh Mục Games</label>
				<div class="col-md-10">
					<div class="md-checkbox-inline">

						<c:forEach var="gcl" items="${gameCategoryList}">
							<c:set var="found" value="fasle" />
							<c:forEach var="gc" items="${games.gameCategories}">
								<c:choose>
									<c:when test="${gcl == gc}">
										<c:set var="found" value="true" />
										<div class="md-checkbox">
											<input name="gameCategories" type="checkbox"
												checked="checked" value="${gcl.gameCategoryId}"
												id="${gcl.gameCategoryId }" class="md-check"> <label
												for="${gcl.gameCategoryId }"> <span></span> <span
												class="check"></span> <span class="box"></span> ${gcl.name }
											</label>
										</div>
									</c:when>
								</c:choose>
							</c:forEach>
							<c:choose>
								<c:when test="${!found}">
									<div class="md-checkbox">
										<input name="gameCategories" type="checkbox"
											value="${gcl.gameCategoryId }" id="${gcl.gameCategoryId }"
											class="md-check"> <label for="${gcl.gameCategoryId }">
											<span></span> <span class="check"></span> <span class="box"></span>
											${gcl.name }
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
								${games.status == 'active' ? 'checked' : '' }
								class="md-radiobtn"> <label for="statusactive"> <span></span>
								<span class="check"></span> <span class="box"></span>Kích Hoạt
							</label>
						</div>
						<div class="md-radio has-info">
							<input type="radio" id="statusinactive" name="status" value="inactive"
								${games.status == 'inactive' ? 'checked' : '' }
								 class="md-radiobtn"> <label
								for="statusinactive"> <span class="inc"></span> <span
								class="check"></span> <span class="box"></span> Chưa Kích Hoạt
							</label>
						</div>
						<div class="md-radio has-warning">
							<input type="radio" id="statusdraft" name="status" value="draft"
								${games.status == 'draft' ? 'checked' : '' } class="md-radiobtn">
							<label for="statusdraft"> <span class="inc"></span> <span
								class="check"></span> <span class="box"></span> Bản Nháp
							</label>
						</div>
						<div class="md-radio has-error">
							<input type="radio" id="statusdeleted" name="status" value="deleted"
								${games.status == 'deleted' ? 'checked' : '' }
								class="md-radiobtn"> <label for="statusdeleted"> <span></span>
								<span class="check"></span> <span class="box"></span> Xóa
							</label>
						</div>
					</div>
				</div>
			</div>
			</security:authorize>


			<div class="form-group row"
				style="border-top: 1px solid #e7ecf1; padding: 20px;">
				<input hidden="" id="msg" value="${msg }"></input>
				<div class="offset-sm-2 col-md-10">

					<button id="btn-submit" type="submit" class=" btn btn-primary">Xác
						Nhận</button>
					<a href="${contextPath}/admin/games?status=active" class="btn btn-danger pull-right" >Quay Lại</a>
				</div>
			</div>

		</form:form>

	</div>
</div>
