<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!-- Banner chi tiết bài viết -->
<style>
	input.hidden {
		position: absolute;
		left: -9999px;
	}

	#profile-image1 {
		cursor: pointer;

		width: 100px;
		height: 100px;
		border:2px solid #03b1ce ;}
	.tital{ font-size:16px; font-weight:500;}
	.bot-border{ border-bottom:1px #f8f8f8 solid;  margin:5px 0  5px 0}
</style>
<div class="content-block-single">
	<div class="content-panel">


		<div class="content-panel-body article-list" >
			<div class="container">
				<div class="row">
					<div class="col-md-8">
						<div class="panel panel-default">
							<div class="panel-heading">  <h4 >Thông Tin Cá Nhân</h4></div>
							<div class="panel-body">
								<div class="box box-info">
									<div class="box-body">
										<form:form id="formAvatar" action="${contextPath}/users" method="patch"
										enctype="multipart/form-data">
										<div class="col-sm-6">

											<div class="col-md-offset-3"  align="center"> <img alt="Hình Đại Diện" src="${contextPath}/images/avatar/${user.avatar}"
												   id="profile-image1" class="img-circle img-responsive">
												<input onchange="ValidateSingleInput(this);" name="avatar" id="profile-image-upload" class="hidden" type="file" accept="image/*">
												<!--Upload Image Js And Css-->
											</div>

											<br>
											<!-- /input-group -->
										</div>
										<div class="col-sm-6">
											<h4 style="color:#00b1b1;">${user.userName}</h4></span>

										</div>
										<div class="clearfix"></div>
										<hr style="margin:5px 0 5px 0;">
										<ul class="nav nav-tabs" style="margin-bottom: 20px;">
											<li class="active"><a href="#home" data-toggle="tab">Thông Tin</a></li>
											<li><a href="#profile" data-toggle="tab">Thay Đổi Mật Khẩu</a></li>
										</ul>
										<div id="myTabContent" class="tab-content">
											<input hidden id="userId" value="${user.userId}" />
											<div class="tab-pane active in" id="home">


													<label>Họ</label>
													<input name="firstName" id="firstName" type="text" value="${user.firstName}" class="input-xlarge">
													<label>Tên</label>
													<input name="lastName" id="lastName" type="text" value="${user.lastName}" class="input-xlarge">
													<label>Email</label>
													<input name="email" id="email" type="text" value="${user.email}" class="input-xlarge">
													<label>Số Điện Thoại</label>
													<input name="phoneNumber" id="phoneNumber" type="text" value="${user.phoneNumber}" class="input-xlarge">
													<span style="color: red; " id="msgerror"></span>
													<div style="margin-top: 20px;">
														<input id="btn-updateprofile"  name="submit" type="submit" id="btn-newcomment"
																class="submit button " value="Cập Nhập">
													</div>

											</div>
											<div class="tab-pane fade" id="profile">


													<label style="margin-bottom: 20px;">Mật Khẩu Cũ</label>
													<div class="input-group" style="margin-bottom: 20px;">

														<span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
														<input id="oldpassword" type="password" class="form-control"
															   name="password" placeholder="Nhập Mật Khẩu Cũ">
													</div>
													<label style="margin-bottom: 20px;">Mật Khẩu Mới</label>
													<div class="input-group" style="margin-bottom: 20px;">

														<span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
														<input id="newpassword"  type="password" class="form-control"
																name="password" placeholder="Nhập Mật Khẩu Mới">
													</div>
													<label style="margin-bottom: 20px;">Nhập Lại Mật Khẩu Mới</label>
													<div class="input-group" style="margin-bottom: 20px;">

														<span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
														<input  type="password" class="form-control"
																name="password" placeholder="Nhập Lại Mật Khẩu Mới">
													</div>
													<span style="color: red; " id="msgerrorp"></span>
													<div style="margin-top: 20px;">
														<input id="btn-changepassword"  name="submit" type="submit"
																class="submit button " value="Thay Đổi">
													</div>

											</div>
										</div>
										</form:form>
										<!-- /.box-body -->
									</div>
									<!-- /.box -->

								</div>


							</div>
						</div>
					</div>


				</div>
			</div>

		</div>

		<!-- End tin mới -->
	</div>

</div>