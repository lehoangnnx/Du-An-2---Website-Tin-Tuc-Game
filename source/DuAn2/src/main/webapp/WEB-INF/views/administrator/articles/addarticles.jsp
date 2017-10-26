<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<style>
</style>
<div class="container-fluid">
	<h4>Bài Viết</h4>
	<ol class="breadcrumb no-bg mb-1">
		<li class="breadcrumb-item"><a href="forms-material.html#">Home</a></li>
		<li class="breadcrumb-item"><a href="forms-material.html#">Forms</a></li>
		<li class="breadcrumb-item active">Thêm Người Dùng</li>
	</ol>

	<div class="box box-block bg-white">
		<h5>Thêm Người Dùng</h5>

		<form>


			<div class="form-group has-success row">
				<label class="col-md-2 col-form-label" for="inputSuccess1">Input
					with success</label>
				<div class="col-md-10">
					<input type="text" class="form-control form-control-success"
						id="inputSuccess1">
					<div class="form-control-feedback">Success! You've done it.</div>

				</div>
			</div>

			<div class="form-group has-danger row">
				<label class="col-md-2 col-form-label" for="inputSuccess1">Input
					with success</label>
				<div class="col-md-10">
					<input type="text" class="form-control form-control-success"
						id="inputSuccess1">
					<div class="form-control-feedback">Success! You've done it.</div>

				</div>
			</div>

			<!-- <div class="form-group row">
				<label style="padding-top: 2rem; " id="mat-label" for="inputEmail3"
					class="col-md-2 col-form-label">Primary</label>
				<div class="col-md-10">
					<div class="form-group form-md-line-input form-md-floating-label has-error">
						<input type="text" class="form-control" id="form_control_1">
						<label for="form_control_1">Input with help</label> <span
							class="help-block">Some help goes here...</span>
					</div>
				</div>
			</div> -->

			<div class="form-group row">
				<label for="select2-demo-1" class="col-md-2 form-control-label">Single
					select box</label>
				<div class="col-md-10">
					<select id="select2-demo-1" class="form-control"
						data-plugin="select2">
						<option value="option1">HTML</option>
						<option value="option2">CSS</option>
						<option value="option3">Javascript</option>
						<option value="option4">PHP</option>
						<option value="option5">Bootstrap</option>
					</select>
				</div>
			</div>

			<div class=" form-group row">


				<label for="select2-demo-1" class="col-md-2 form-control-label">Sub
					Contetn</label>
				<div class="col-md-10">
					<textarea id="textarea" class="form-control" maxlength="225"
						rows="5" placeholder="This textarea has a limit of 225 chars."></textarea>
				</div>


			</div>






			<div class="form-group row">
				<label class="col-md-2 col-form-label">Nội Dung</label>
				<div class="col-md-10">
					<div id="summernote"></div>
				</div>
			</div>


			<div class="form-group form-md-checkboxes">
				<label>Inline Checkboxes</label>
				<div class="md-checkbox-inline">
					<div class="md-checkbox">
						<input type="checkbox" id="checkbox6" class="md-check"> <label
							for="checkbox6"> <span></span> <span class="check"></span>
							<span class="box"></span> Option 1
						</label>
					</div>
					<div class="md-checkbox">
						<input type="checkbox" id="checkbox7" class="md-check" checked="">
						<label for="checkbox7"> <span></span> <span class="check"></span>
							<span class="box"></span> Option 2
						</label>
					</div>
					<div class="md-checkbox">
						<input type="checkbox" id="checkbox8" class="md-check"> <label
							for="checkbox8"> <span></span> <span class="check"></span>
							<span class="box"></span> Option 3
						</label>
					</div>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-md-2 control-label" for="form_control_1">Ảnh
					Đại Diện</label>
				<div class="col-md-10">
					<input name="avatar" type="file" id="input-file-max-fs"
						value="${user.avatar}" class="dropify" data-max-file-size="15M"
						data-default-file="${contextPath}/images/avatar/${user.avatar}">


				</div>
			</div>
			
			<div class="form-group has-success row">
				<label class="col-md-2 col-form-label" for="inputSuccess1">Input
					with success</label>
				<div class="col-md-10">
					<input type="text" class="form-control form-control-success"
						id="inputframeVideo">
					<div class="form-control-feedback">Success! You've done it.</div>
						<div id="iframeVideo" class="">
						
					</div>
				</div>
			</div>



			<div class="form-group row"
				style="border-top: 1px solid #e7ecf1; padding: 20px;">
				<div class="offset-sm-2 col-md-10">
					<button type="button" class="btn default">Làm Mới</button>
					<button type="button" class="btn blue">Xác Nhận</button>
					<button type="submit" class="btn btn-danger pull-right">Hủy
						Bỏ</button>
				</div>
			</div>

		</form>

	</div>
</div>
