<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />


<style>
</style>
<div class="container-fluid">
	<h4>Người Dùng</h4>
	<ol class="breadcrumb no-bg mb-1">
		<li class="breadcrumb-item"><a href="forms-material.html#">Home</a></li>
		<li class="breadcrumb-item"><a href="forms-material.html#">Forms</a></li>
		<li class="breadcrumb-item active">Material Form</li>
	</ol>

	<div class="box box-block bg-white">
		<h5>Sửa Người Dùng</h5>
		<span>trước ${user.lastName } sau</span>
		<form:form action="../admin/updateuser" method="post"
			enctype="multipart/form-data" modelAttribute="user">
			<form:hidden path="userId" />
			<div class="form-group row">
				<label style="padding-top: 2rem;" id="mat-label" for="inputEmail3"
					class="col-sm-2 col-form-label">User Name</label>
				<div class="col-sm-10">
					<div class="form-group form-md-line-input form-md-floating-label">
						<input readonly name="userName"  type="text" class="form-control" value="${user.userName }"
							id="form_control_1" />
						<label for="form_control_1">User Name</label> <span
							class="help-block">Nhập User Name</span>
					</div>
				</div>
			</div>
			<div class="form-group row">
				<label style="padding-top: 2rem;" id="mat-label" for="inputEmail3"
					class="col-sm-2 col-form-label">Email</label>
				<div class="col-sm-10">
					<div class="form-group form-md-line-input form-md-floating-label">
						<input type="text" class="form-control"value="${user.email }" name="email"
							id="form_control_1" />
						<label for="form_control_1">Email</label> <span class="help-block">Nhập
							Email</span>
					</div>
				</div>
			</div>
			<div class="form-group row">
				<label style="padding-top: 2rem;" id="mat-label" for="inputEmail3"
					class="col-sm-2 col-form-label">First Name</label>
				<div class="col-sm-10">
					<div class="form-group form-md-line-input form-md-floating-label">
						<input " type="text" class="form-control" value="${user.firstName }" name=firstName
							id="form_control_1" />
						<label for="form_control_1">First Name</label> <span
							class="help-block">Nhập First Name</span>
					</div>
				</div>
			</div>
			<div class="form-group row">
				<label style="padding-top: 2rem;" id="mat-label" for="inputEmail3"
					class="col-sm-2 col-form-label">Last Name</label>
				<div class="col-sm-10">
					<div class="form-group form-md-line-input form-md-floating-label">
						
						<input type="text" class="form-control" value="${user.lastName }" name="lastName"
							id="form_control_1" /> <label for="form_control_1">Last
							Name</label> <span class="help-block">Nhập Last Name</span>
					</div>
				</div>
			</div>
			<div class="form-group row">
				<label style="padding-top: 2rem;" id="mat-label" for="inputEmail3"
					class="col-sm-2 col-form-label">Số Điện Thoại</label>
				<div class="col-sm-10">
					<div class="form-group form-md-line-input form-md-floating-label">
						<input type="text" class="form-control" value="${user.phoneNumber }" name="phoneNumber"
							id="form_control_1" />
						<label for="form_control_1">Số Điện Thoại</label> <span
							class="help-block">Nhập Số Điện Thoại</span>
					</div>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-md-2 control-label" for="form_control_1">Ngày
					Tạo</label>
				<div class="col-md-10">
					<input type="text" class="form-control" readonly name="createdDate"
						value="${user.createdDate}" id="form_control_1"
						placeholder="Placeholder..." />
					<div class="form-control-focus"></div>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-md-2 control-label" for="form_control_1">Ngày
					Đăng Nhập Gần Nhất</label>
				<div class="col-md-10">
					<input type="text" class="form-control" readonly
						name="loggedInDate" value="${user.loggedInDate}"
						id="form_control_1" placeholder="Placeholder..." />
					<div class="form-control-focus"></div>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-md-2 control-label" for="form_control_1">Địa
					Chỉ Đăng Nhập</label>
				<div class="col-md-10">
					<input type="text" class="form-control" readonly name="ip"
						value="${user.ip}" id="form_control_1"
						placeholder="Placeholder..." />
					<div class="form-control-focus"></div>
				</div>
			</div>
			<div class="form-group now">
				<label class="col-md-2 control-label" for="form_control_1">Oline</label>
				<div class="col-md-10">
					<div class="md-radio-inline">
						<div class="md-radio">
							<input disabled type="radio" id="radio53" name="isOnline" value="1"
								${user.isOnline == 1 ? 'checked' : '' } class="md-radiobtn">
							<label  for="radio53"> <span></span> <span class="check"></span>
								<span class="box"></span>Đang Online
							</label>
						</div>
						<div class="md-radio has-error">
							<input disabled type="radio" id="radio54" name="isOnline" value="0"
								${user.isOnline == 0 ? 'checked' : '' } class="md-radiobtn">
							<label  for="radio54"> <span></span> <span class="check"></span>
								<span class="box"></span> Không Online
							</label>
						</div>

					</div>
				</div>
			</div>


			<div class="form-group now">
				<label class="col-md-2 control-label" for="form_control_1">Trạng
					Thái</label>
				<div class="col-md-10">
					<div class="md-radio-inline">
						<div class="md-radio">
							<input type="radio" id="radio58" name="status" value="active"
								${user.status == 'active' ? 'checked' : '' } class="md-radiobtn">
							<label for="radio58"> <span></span> <span class="check"></span>
								<span class="box"></span>Kích Hoạt
							</label>
						</div>
						<div class="md-radio has-info">
							<input type="radio" id="radio55" name="status" value="inactive"
								${user.status == 'inactive' ? 'checked' : '' }
								class="md-radiobtn"> <label for="radio55"> <span
								class="inc"></span> <span class="check"></span> <span
								class="box"></span> Chưa Kích Hoạt
							</label>
						</div>
						<div class="md-radio has-warning">
							<input type="radio" id="radio52" name="status" value="draft"
								${user.status == 'draft' ? 'checked' : '' } class="md-radiobtn">
							<label for="radio52"> <span class="inc"></span> <span
								class="check"></span> <span class="box"></span> Chờ Kích Hoạt
							</label>
						</div>
						<div class="md-radio has-error">
							<input type="radio" id="radio56" name="status" value="deleted"
								${user.status == 'deleted' ? 'checked' : '' }
								class="md-radiobtn"> <label for="radio56"> <span></span>
								<span class="check"></span> <span class="box"></span> Xóa
							</label>
						</div>

					</div>
				</div>
			</div>

			<div class="form-group row">
				<label class="col-md-2 control-label" for="form_control_1">Ảnh
					Đại Diện</label>
				<div class="col-md-10">
					<input  name="avatar" type="file" id="input-file-max-fs" value="${user.avatar}"
						class="dropify" data-max-file-size="15M"
						data-default-file="${contextPath}/images/avatar/${user.avatar}">


				</div>
			</div>

			<!-- <div class="form-group row">
				<label style="padding-top: 2rem; " id="mat-label" for="inputEmail3"
					class="col-sm-2 col-form-label">Primary</label>
				<div class="col-sm-10">
					<div class="form-group form-md-line-input form-md-floating-label has-error">
						<input type="text" class="form-control" id="form_control_1">
						<label for="form_control_1">Input with help</label> <span
							class="help-block">Some help goes here...</span>
					</div>
				</div>
			</div> -->

			<div class="form-group row">
				<label id="mat-label" for="inputEmail3"
					class="col-sm-2 col-form-label">Checkbox</label>
				<div class="col-sm-10">
					<div class="md-checkbox-inline">
						<c:forEach var="lr" items="${listRoles }">
							<c:set var="found" value="fasle" />
							<c:forEach var="lrou" items="${user.roleses}">
								<c:choose>
									<c:when test="${lrou == lr }">
										<c:set var="found" value="true" />
										<div class="md-checkbox">
											<input name="roleses" value="${lr.name }" type="checkbox"
												id="${lr.roleId }" class="md-check" checked> <label
												for="${lr.roleId }"> <span></span> <span
												class="check"></span> <span class="box"></span> ${lr.name }
											</label>
										</div>
									</c:when>

								</c:choose>

							</c:forEach>
							<c:choose>
								<c:when test="${!found}">
									<div class="md-checkbox">
										<input name="roleses" value="${lr.name }" type="checkbox"
											id="${lr.roleId }" class="md-check"> <label
											for="${lr.roleId }"> <span></span> <span
											class="check"></span> <span class="box"></span> ${lr.name }
										</label>
									</div>
								</c:when>

							</c:choose>


						</c:forEach>



					</div>
				</div>
			</div>
			<!-- <div class="form-group row  ">
				<label for="inputEmail3" class="col-sm-2 col-form-label">Nội
					Dung</label>
				<div class="col-sm-10">
					<div id="summernote"></div>
				</div>
			</div>
 -->



			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" />
			<div class="form-group row"
				style="border-top: 1px solid #e7ecf1; padding: 20px;">
				<div class="offset-sm-2 col-sm-10">
					<button type="button" class="btn default">Làm Mới</button>
					<form:button class="btn blue" id="btn-update">Xác Nhận</form:button>
					<button type="submit" class="btn btn-danger pull-right">Hủy
						Bỏ</button>
				</div>
			</div>

		</form:form>

	</div>
</div>
<script>
  jQuery(document).ready(
	function($) {

		$("#btn-update").click(function(event) {

			var data = {}
			data["userName"] = $(".userName").val();
			data["email"] = $(".email").val();
			alert(data);
			$("#btn-update").prop("disabled", true);

			$.ajax({
		             type: "POST",
		             contentType: "application/json",
		             url: "${pageContext.request.contextPath}/admin/validator-user",
		             data: JSON.stringify(data),
		             dataType: 'json',
		             timeout: 600000,
		             success: function (data) {
		                 $("#btn-update").prop("disabled", false);
		                 alert(data);
		             },
		             error: function (e) {
		                 $("#btn-update").prop("disabled", false);
		                 //...
		             }
			});


		});

	});
</script>