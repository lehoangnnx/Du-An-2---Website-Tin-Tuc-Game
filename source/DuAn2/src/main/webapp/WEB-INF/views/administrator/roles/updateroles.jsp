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
	<h4>Quyền</h4>
	<ol class="breadcrumb no-bg mb-1">
		<li class="breadcrumb-item"><a href="${contextPath}/admin/index">Trang Chủ</a></li>
		<li class="breadcrumb-item active">Sửa Quyền</li>
	</ol>

	<div class="box box-block bg-white">
		<h5>Sửa Quyền</h5>

		<form:form id="formRoles"
			action="${contextPath }/admin/roles" method="patch"
			enctype="multipart/form-data" >
			<input hidden value="${roles.roleId}" id="roleId" name="roleId" />
			<div id="divTitle" class="form-group row">
				<label class="col-md-2 col-form-label" >Tên Quyền<span class="error"> *</span></label>
				<div class="col-md-10">
					<input style="text-transform: uppercase;" maxlength="100" type="text" class="maxlength form-control "
						   value="${roles.name }" id="name" name="name">
					<div id="spanName" class=" error form-control-feedback"></div>
					<label id="name-error" class="error" for="name"></label>
				</div>
			</div>
			<div class=" form-group row">


				<label  class="col-md-2 form-control-label">Mô Tả</label>
				<div class="col-md-10">
					<textarea id="description" class="form-control maxlength" maxlength="225"
							  name="description" rows="5"
							  placeholder="Mô Tả Tối Đa 255 Ký Tự.">${roles.description }</textarea>
					<label id="description-error" class="error" for="description"></label>
				</div>


			</div>

			<div class="form-group row">
				<label class="col-md-2 col-form-label">Trạng Thái<span class="error"> *</span></label>
				<div class="col-md-10">
					<div class="md-radio-inline">
						<div class="md-radio">
							<input type="radio" id="statusactive" name="status" value="active"
								${roles.status == 'active' ? 'checked' : '' }
								   class="md-radiobtn"> <label for="statusactive"> <span></span>
							<span class="check"></span> <span class="box"></span>Kích Hoạt
						</label>
						</div>
						<div class="md-radio has-info">
							<input type="radio" id="statusinactive" name="status" value="inactive"
								${roles.status == 'inactive' ? 'checked' : '' }
								    class="md-radiobtn"> <label
								for="statusinactive"> <span class="inc"></span> <span
								class="check"></span> <span class="box"></span> Chưa Kích Hoạt
						</label>
						</div>
						<div class="md-radio has-warning">
							<input type="radio" id="statusdraft" name="status" value="draft"
								${roles.status == 'draft' ? 'checked' : '' }
								   class="md-radiobtn"> <label for="statusdraft"> <span
								class="inc"></span> <span class="check"></span> <span
								class="box"></span> Bản Nháp
						</label>
						</div>
						<div class="md-radio has-error">
							<input type="radio" id="statusdeleted" name="status" value="deleted"
								${roles.status == 'deleted' ? 'checked' : '' }
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

					<button id="btn-submit" type="submit"
						class=" btn btn-primary">Xác Nhận</button>
					<a href="${contextPath}/admin/articles/categorys?status=active" class="btn btn-danger pull-right" >Quay Lại</a>
				</div>
			</div>

		</form:form>

	</div>
</div>
