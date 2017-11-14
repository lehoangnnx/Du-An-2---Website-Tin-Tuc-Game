<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<style>
</style>
<div class="container-fluid">
	<h4>Material Form</h4>
	<ol class="breadcrumb no-bg mb-1">
		<li class="breadcrumb-item"><a href="forms-material.html#">Home</a></li>
		<li class="breadcrumb-item"><a href="forms-material.html#">Forms</a></li>
		<li class="breadcrumb-item active">Material Form</li>
	</ol>

	<div class="box box-block bg-white">
		<h5>Colors</h5>

		<form class="">
			<div class="form-group row">
				<label style="padding-top: 2rem; " id="mat-label" for="inputEmail3"
					class="col-sm-2 col-form-label">Primary</label>
				<div class="col-sm-10">
					<div class="form-group form-md-line-input form-md-floating-label">
						<input type="text" class="form-control" id="form_control_1">
						<label for="form_control_1">Input with help</label> <span
							class="help-block">Some help goes here...</span>
					</div>
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
					<div class="md-checkbox">
						<input type="checkbox" id="checkbox6" class="md-check"> <label
							for="checkbox6"> <span></span> <span class="check"></span>
							<span class="box"></span> Option 1
						</label>
					</div>
					<div class="md-checkbox">
						<input type="checkbox" id="checkbox7" class="md-check" checked>
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
			</div>
			<div class="form-group row  ">
				<label for="inputEmail3" class="col-sm-2 col-form-label">Nội Dung</label>
				<div class="col-sm-10">
					<div id="summernote">
						
					</div>
				</div>
			</div>

			

			

			<div class="form-group row"
				style="border-top: 1px solid #e7ecf1; padding: 20px;">
				<div class="offset-sm-2 col-sm-10">
					<button type="button" class="btn default">Làm Mới</button>
					<button type="button" class="btn blue">Xác Nhận</button>
					<button type="submit" class="btn btn-danger pull-right">Hủy
						Bỏ</button>
				</div>
			</div>

		</form>

	</div>
</div>
