<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
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
		<li class="breadcrumb-item active">Thêm Danh Mục Bài Viêt</li>
	</ol>

	<div class="box box-block bg-white">
		<h5>Thêm Quyền</h5>

		<form:form id="formRoles" action="${contextPath }/admin/roles"
			method="post" >

			<div id="divTitle" class="form-group row">
				<label class="col-md-2 col-form-label" for="inputSuccess1">Tên Quyền</label>
				<div class="col-md-10">
					<input style="text-transform: uppercase;" maxlength="100" type="text" class="maxlength form-control "
						value="${roles.name }" id="name" name="name">
					<div id="spanName" class=" error form-control-feedback"></div>
					<label id="name-error" class="error" for="name"></label>
				</div>
			</div>
			<div class=" form-group row">


				<label for="select2-demo-1" class="col-md-2 form-control-label">Mô Tả</label>
				<div class="col-md-10">
					<textarea id="description" class="form-control maxlength" maxlength="225"
							  name="description" rows="5"
							  placeholder="This textarea has a limit of 225 chars.">${roles.description }</textarea>
					<label id="description-error" class="error" for="description"></label>
				</div>


			</div>

			<div class="form-group row">
				<label class="col-md-2 col-form-label">Trạng Thái</label>
				<div class="col-md-10">
					<div class="md-radio-inline">
						<div class="md-radio">
							<input type="radio" id="radio54" name="status" value="active"
								${roles.status == 'active' ? 'checked' : '' }
								class="md-radiobtn"> <label for="radio54"> <span></span>
								<span class="check"></span> <span class="box"></span>Kích Hoạt
							</label>
						</div>
						<div class="md-radio has-info">
							<input type="radio" id="radio55" name="status" value="inactive"
								${roles.status == 'inactive' ? 'checked' : '' }
								checked="checked" class="md-radiobtn"> <label
								for="radio55"> <span class="inc"></span> <span
								class="check"></span> <span class="box"></span> Chưa Kích Hoạt
							</label>
						</div>
						<div class="md-radio has-warning">
							<input type="radio" id="radio56" name="status" value="draft"
								${roles.status == 'draft' ? 'checked' : '' }
								class="md-radiobtn"> <label for="radio56"> <span
								class="inc"></span> <span class="check"></span> <span
								class="box"></span> Chờ Kích Hoạt
							</label>
						</div>
						<div class="md-radio has-error">
							<input type="radio" id="radio57" name="status" value="deleted"
								${roles.status == 'deleted' ? 'checked' : '' }
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

					<button id="btn-submit" type="submit" class=" btn btn-primary">Xác
						Nhận</button>
					<a href="${contextPath}/admin/articles/categorys?status=active" class="btn btn-danger pull-right" >Quay Lại</a>
				</div>
			</div>

		</form:form>

	</div>
</div>
