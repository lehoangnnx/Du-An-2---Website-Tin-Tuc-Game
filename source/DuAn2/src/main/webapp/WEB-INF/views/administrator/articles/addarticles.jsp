<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<style>
.error{
	color: red;
}
</style>
<div class="container-fluid">
	<h4>Bài Viết</h4>
	<ol class="breadcrumb no-bg mb-1">
		<li class="breadcrumb-item"><a href="forms-material.html#">Home</a></li>
		<li class="breadcrumb-item"><a href="forms-material.html#">Forms</a></li>
		<li class="breadcrumb-item active">Thêm Người Dùng</li>
	</ol>

	<div class="box box-block bg-white">
		<h5>Thêm Bài Viết</h5>

		<form:form id="formArticle" action="${contextPath }/admin/articles" method="post"
         enctype="multipart/form-data" modelAttribute="article">

			<div id="divTitle" class="form-group row">
				<label class="col-md-2 col-form-label" for="inputSuccess1">Tiêu
					Đề</label>
				<div class="col-md-10">
					<input maxlength="100" type="text" class="maxlength form-control " value="${article.title }"
					id="title" name="title"  
					required="required"
					oninvalid="this.setCustomValidity('Vui Lòng Nhập Tiêu Đề')"
  					  oninput="setCustomValidity('')" 
					onkeyup="ChangeToSlug();">
			
					 <div id="spanTitle" class=" error form-control-feedback"></div> 
					<label id="title-error" class="error" for="title"></label>
				</div>
			</div>

			<div id="divSlug" class="form-group  row">
				<label class="col-md-2 col-form-label" for="inputSuccess1">Đường
					Dẫn</label>
				<div class="col-md-10">
					<input type="text"  value="${article.slug }"
					class="form-control " id="slug" name="slug"
					 required="required"
					oninvalid="this.setCustomValidity('Vui Lòng Nhập Đường Dẫn')"
  					  oninput="setCustomValidity('')" 
					 >
				 <div id="spanSlug" class=" error form-control-feedback"></div> 
<label id="slug-error" class="error" for="slug"></label>
				</div>
			</div>


 
			<div class="form-group row">
				<label class="col-md-2 col-form-label">Danh Mục</label>
				<div class="col-md-10">
					<div class="md-checkbox-inline">
					
					<c:forEach var="acl" items="${articleCategoryList}" varStatus="status">
						<div class="md-checkbox">
							
							<input name="articleCategories" type="checkbox"

							value="${acl.articleCategoryId }" id="${acl.articleCategoryId }" class="md-check"> <label
								for="${acl.articleCategoryId }"> <span></span> <span class="check"></span>
								<span class="box"></span> ${acl.name }
							</label>
						</div>
					</c:forEach>
					</div>
					<label id="articleCategories-error" class="error" for="articleCategories" style=""></label>
				</div>
				
			</div>


			<div class="form-group row">
				<label class="col-md-2 col-form-label">Trạng Thái</label>
				<div class="col-md-10">
					<div class="md-radio-inline">
						<div class="md-radio">
							<input type="radio" id="radio54" name="status" value="active"
							${article.status == 'active' ? 'checked' : '' }
								 class="md-radiobtn">
							<label for="radio54"> <span></span> <span class="check"></span>
								<span class="box"></span>Kích Hoạt
							</label>
						</div>
						<div class="md-radio has-info">
							<input type="radio" id="radio55" name="status" value="inactive"
							${article.status == 'inactive' ? 'checked' : '' }
								checked="checked"
								class="md-radiobtn"> <label for="radio55"> <span
								class="inc"></span> <span class="check"></span> <span
								class="box"></span> Chưa Kích Hoạt
							</label>
						</div>
						<div class="md-radio has-warning">
							<input type="radio" id="radio56" name="status" value="draft"
							${article.status == 'draft' ? 'checked' : '' }
								 class="md-radiobtn">
							<label for="radio56"> <span class="inc"></span> <span
								class="check"></span> <span class="box"></span> Chờ Kích Hoạt
							</label>
						</div>
						<div class="md-radio has-error">
							<input type="radio" id="radio57" name="status" value="deleted"
								${article.status == 'deleted' ? 'checked' : '' }
								class="md-radiobtn"> <label for="radio57"> <span></span>
								<span class="check"></span> <span class="box"></span> Xóa
							</label>
						</div>
					</div>
				</div>
			</div>

			<div class="form-group row">
				<label class="col-md-2 col-form-label">Tin Nổi Bật</label>
				<div class="col-md-10">
					<div class="md-radio-inline">
						<div class="md-radio">
							<input type="radio" id="radio53" name="isHot" value="1"
							${article.isHot == 1 ? 'checked' : '' }
								 class="md-radiobtn">
							<label for="radio53"> <span></span> <span class="check"></span>
								<span class="box"></span>Có
							</label>
						</div>


						<div class="md-radio has-error">
							<input type="radio" id="radio52" name="isHot" value="0"
							${article.isHot == 0 ? 'checked' : '' }
								checked="checked"
								class="md-radiobtn"> <label for="radio52"> <span></span>
								<span class="check"></span> <span class="box"></span> Không
							</label>
						</div>
					</div>
				</div>
			</div>

			
			<!--
			<div class="form-group has-danger row">
				<label class="col-md-2 col-form-label" for="inputSuccess1">Input
					with success</label>
				<div class="col-md-10">
					<input type="text" class="form-control form-control-danger"
						id="">
					<div class="form-control-feedback">Success! You've done it.</div>

				</div>
			</div>

			 <div class="form-group row">
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
				<label for="select2-demo-1" class="col-md-2 form-control-label">Game</label>
				<div class="col-md-10">
					<select id="select2-demo-1" class="form-control" name="gameId"
						data-plugin="select2">
						<c:forEach var="gl" items="${gameList }">
							<option ${article.gameId == gl.gameId ? 'checked' : '' } value="${gl.gameId }">${gl.name }</option>
						</c:forEach>
						
						
					</select>
				</div>
			</div>

<div class="form-group row">
				<label for="select2-demo-4" class="col-md-2 form-control-label">Thẻ</label>
				<div class="col-md-10">
					<select id="select2-demo-4" class="form-control" name="tags"
						data-plugin="select2" multiple="multiple"
						data-options="{ tags: true }"
						>
						<c:forEach var="tl" items="${tagsList }">
							<option value="${tl.tagsId }">${tl.name }</option>
						</c:forEach>
					</select>
					<label id="select2-demo-4-error" class="error" for="select2-demo-4"></label>
				</div>
			</div>
			 <div class="form-group row">
            <label for="example-datetime-local-input"
               class="col-md-2 col-form-label">Ngày Hiển Thị</label>
            <div class="col-md-10">
               <input class="form-control" type="datetime-local" 
                name="showDate"
               value=""
               id="showDate">
            </div>
         </div>



			<div class=" form-group row">


				<label for="select2-demo-1" class="col-md-2 form-control-label">Tóm
					Tắt</label>
				<div class="col-md-10">
					<textarea id="textarea" class="form-control" maxlength="225" name="subContent"
					rows="5" placeholder="This textarea has a limit of 225 chars."></textarea>
				</div>


			</div>


			<div class="form-group row">
				<label class="col-md-2 col-form-label">Nội Dung</label>
				<div class="col-md-10">
					<textarea name="mainContent" required="required"  id="summernote"></textarea>
					
				</div>
			</div>

<div class="form-group  row">
				<label class="col-md-2 col-form-label" for="inputSuccess1">Tác Giả/Nguồn</label>
				<div class="col-md-10">
					<input type="text" class="form-control" id="author" name="author">
					<label id="author-error" class="error" for="author"></label>
				</div>
			</div>


			<div class="form-group row">
				<label class="col-md-2 control-label" for="form_control_1">Ảnh
					Thumbnail</label>
				<div class="col-md-10">
					<input name="imagesThumbnail" type="file" id="input-file-max-fs" required="required"
						value="${user.avatar}" class="dropify" data-max-file-size="15M"
						data-default-file="${contextPath}/images/avatar/${user.avatar}">

					<label id="input-file-max-fs-error" class="error" for="input-file-max-fs"></label>
				</div>
			</div>

			<div class="form-group has-success row">
				<label class="col-md-2 col-form-label" for="inputSuccess1">Video
					Thumbnail</label>
				<div class="col-md-10">
					<input type="text" class="form-control form-control-success" name="video"
						id="inputframeVideo">

					<div id="iframeVideo" class=""></div>
				</div>
			</div>



			<div class="form-group row"
				style="border-top: 1px solid #e7ecf1; padding: 20px;">
				<input hidden="" id="msg" value="${msg }"></input>
				<div class="offset-sm-2 col-md-10">
					<button type="button" class="btn default">Làm Mới</button>
					<button id="btnAddArticle" type="submit" class=" btn btn-primary">Xác Nhận</button>
					<button type="button" class="btn btn-danger pull-right">Hủy
						Bỏ</button>
				</div>
			</div>

		</form:form>

	</div>
</div>
