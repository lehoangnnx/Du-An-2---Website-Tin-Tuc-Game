<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
.error {
	color: red;
}
</style>
<div class="container-fluid">
	<h4>Bài Viết</h4>
	<ol class="breadcrumb no-bg mb-1">
		<li class="breadcrumb-item"><a href="forms-material.html#">Home</a></li>
		<li class="breadcrumb-item"><a href="forms-material.html#">Forms</a></li>
		<li class="breadcrumb-item active">Thêm Games</li>
	</ol>

	<div class="box box-block bg-white">
		<h5>Thêm Game</h5>

		<form:form id="formGames" action="${contextPath }/admin/games"
			method="post" enctype="multipart/form-data">

			<div class="form-group row">
				<label class="col-md-2 control-label" for="form_control_1">Ảnh Game</label>
				<div class="col-md-10">
					<input name="images" type="file" id="input-file-max-fs"
						   required="required" value="${games.images}" class="dropify"
						   data-max-file-size="15M"
						   data-default-file="${contextPath}/images/games/${games.images}">

					<label id="input-file-max-fs-error" class="error" for="input-file-max-fs"></label>
				</div>
			</div>

			<div id="divTitle" class="form-group row">
				<label class="col-md-2 col-form-label" for="inputSuccess1">Tên
					Game</label>
				<div class="col-md-10">
					<input maxlength="100" type="text" class="maxlength form-control "
						value="${games.name }" id="name" name="name"
						onkeyup="ChangeToSlug();">
					<div id="spanName" class=" error form-control-feedback"></div>

				</div>
			</div>

			<div id="divSlug" class="form-group  row">
				<label class="col-md-2 col-form-label" for="inputSuccess1">Đường
					Dẫn</label>
				<div class="col-md-10">
					<input type="text" value="${games.slug }" class="form-control "
						id="slug" name="slug">
					<div id="spanSlug" class=" error form-control-feedback"></div>

				</div>
			</div>
			<div class="form-group row">
				<label class="col-md-2 col-form-label">Game Nổi Bật</label>
				<div class="col-md-10">
					<div class="md-radio-inline">
						<div class="md-radio">
							<input type="radio" id="radio53" name="isHot" value="1"
								${games.isHot == 1 ? 'checked' : '' } class="md-radiobtn">
							<label for="radio53"> <span></span> <span class="check"></span>
								<span class="box"></span>Có
							</label>
						</div>


						<div class="md-radio has-error">
							<input type="radio" id="radio52" name="isHot" value="0"
								${games.isHot == 0 ? 'checked' : '' } checked="checked"
								   class="md-radiobtn"> <label for="radio52"> <span></span>
							<span class="check"></span> <span class="box"></span> Không
						</label>
						</div>
					</div>
				</div>
			</div>


			<div class=" form-group row">


				<label class="col-md-2 form-control-label">Mô Tả Game</label>
				<div class="col-md-10">
					<textarea id="description" class="form-control maxlength" maxlength="225"
							  name="description" rows="5"
							  placeholder="This textarea has a limit of 225 chars.">${games.description }</textarea>
					<label id="subContent-error" class="error" ></label>
				</div>


			</div>
			<div class="form-group  row">
				<label class="col-md-2 col-form-label" for="inputSuccess1">Nhà
					Phát Hành</label>
				<div class="col-md-10">
					<input type="text" value="${games.publishers }"
						class="form-control " id="publishers" name="publishers">

				</div>
			</div>
			<div class="form-group row">
				<label for="example-datetime-local-input"
					class="col-md-2 col-form-label">Ngày Phát Hành</label>
				<div class="col-md-10">
					<input class="form-control" type="datetime-local" name="releases"
						value="<fmt:formatDate pattern="yyyy-MM-dd'T'HH:mm" value="${games.releases}"/>"
						id="releases">
				</div>
			</div>



			<div class="form-group  row">
				<label class="col-md-2 col-form-label" for="developers">Nhà
					Phát Triển</label>
				<div class="col-md-10">
					<input type="text" value="${games.developers }"
						class="form-control " id="developers" name="developers">

				</div>
			</div>
			
			<div class="form-group  row">
				<label class="col-md-2 col-form-label" for="writers">Kịch Bản</label>
				<div class="col-md-10">
					<input type="text" value="${games.writers }"
						class="form-control " id="writers" name="writers">

				</div>
			</div>
			<div class="form-group  row">
				<label class="col-md-2 col-form-label" for="composers">Âm Nhạc</label>
				<div class="col-md-10">
					<input type="text" value="${games.composers }"
						class="form-control " id="composers" name="composers">

				</div>
			</div>
			<div class="form-group  row">
				<label class="col-md-2 col-form-label" for="engine">Công Nghệ</label>
				<div class="col-md-10">
					<input type="text" value="${games.engine }"
						class="form-control " id="engine" name="engine">

				</div>
			</div>
			<div class="form-group  row">
				<label class="col-md-2 col-form-label" for="platforms">Nền Tảng</label>
				<div class="col-md-10">
					<input type="text" value="${games.platforms }"
						class="form-control " id="platforms" name="platforms">

				</div>
			</div>
			<div class="form-group  row">
				<label class="col-md-2 col-form-label" for="info">Mô Tả Game</label>
				<div class="col-md-10">
					<input type="text" value="${games.info }"
						class="form-control " id="info" name="info">

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
					<label id="gameCategories-error" class="error" for="gameCategories"></label>
				</div>

			</div>


			<div class="form-group row">
				<label class="col-md-2 col-form-label">Trạng Thái</label>
				<div class="col-md-10">
					<div class="md-radio-inline">
						<div class="md-radio">
							<input type="radio" id="radio54" name="status" value="active"
								${games.status == 'active' ? 'checked' : '' }
								class="md-radiobtn"> <label for="radio54"> <span></span>
								<span class="check"></span> <span class="box"></span>Kích Hoạt
							</label>
						</div>
						<div class="md-radio has-info">
							<input type="radio" id="radio55" name="status" value="inactive"
								${games.status == 'inactive' ? 'checked' : '' }
								checked="checked" class="md-radiobtn"> <label
								for="radio55"> <span class="inc"></span> <span
								class="check"></span> <span class="box"></span> Chưa Kích Hoạt
							</label>
						</div>
						<div class="md-radio has-warning">
							<input type="radio" id="radio56" name="status" value="draft"
								${games.status == 'draft' ? 'checked' : '' } class="md-radiobtn">
							<label for="radio56"> <span class="inc"></span> <span
								class="check"></span> <span class="box"></span> Chờ Kích Hoạt
							</label>
						</div>
						<div class="md-radio has-error">
							<input type="radio" id="radio57" name="status" value="deleted"
								${games.status == 'deleted' ? 'checked' : '' }
								class="md-radiobtn"> <label for="radio57"> <span></span>
								<span class="check"></span> <span class="box"></span> Xóa
							</label>
						</div>
					</div>
				</div>
			</div>



			<div class="form-group row"
				style="border-top: 1px solid #e7ecf1; padding: 20px;">
				<input hidden="" id="msg" value="${msg }"></input>
				<div class="offset-sm-2 col-md-10">
					<button type="button" class="btn default">Làm Mới</button>
					<button id="btn-submit" type="submit" class=" btn btn-primary">Xác
						Nhận</button>
					<button type="button" class="btn btn-danger pull-right">Hủy
						Bỏ</button>
				</div>
			</div>

		</form:form>

	</div>
</div>
