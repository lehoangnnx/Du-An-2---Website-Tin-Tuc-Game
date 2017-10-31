<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<script type="text/javascript"
	src="${contextPath}/js/jquery/jquery-1.12.3.min.js"></script>

<script type="text/javascript"
	src="${contextPath}/js/js/jquery-3.2.1.min.js"></script>

<script type="text/javascript"
	src="${contextPath}/js/js/jquery.validate.js"></script>
<script type="text/javascript"
	src="${contextPath}/js/tether/js/tether.min.js"></script>
<script type="text/javascript"
	src="${contextPath}/js/bootstrap4/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="${contextPath}/js/detectmobilebrowser/detectmobilebrowser.js"></script>
<script type="text/javascript"
	src="${contextPath}/js/jscrollpane/jquery.mousewheel.js"></script>
<script type="text/javascript"
	src="${contextPath}/js/jscrollpane/mwheelIntent.js"></script>
<script type="text/javascript"
	src="${contextPath}/js/jscrollpane/jquery.jscrollpane.min.js"></script>
<script type="text/javascript"
	src="${contextPath}/js/jquery-fullscreen-plugin/jquery.fullscreen-min.js"></script>
<script type="text/javascript"
	src="${contextPath}/js/waves/waves.min.js"></script>
<script type="text/javascript"
	src="${contextPath}/js/switchery/dist/switchery.min.js"></script>


<script type="text/javascript"
	src="${contextPath}/js/js/forms-editors.js"></script>
<script type="text/javascript"
	src="${contextPath}/js/summernote/summernote.min.js"></script>
<script type="text/javascript"
	src="${contextPath}/js/dropify/dist/js/dropify.min.js"></script>

<script type="text/javascript"
	src="${contextPath}/js/js/forms-upload.js"></script>


<script type="text/javascript"
	src="${contextPath}/js/select2/dist/js/select2.min.js"></script>
<script type="text/javascript"
	src="${contextPath}/js/bootstrap-tagsinput/dist/bootstrap-tagsinput.min.js"></script>
<script type="text/javascript"
	src="${contextPath}/js/multi-select/js/jquery.multi-select.js"></script>
<script type="text/javascript"
	src="${contextPath}/js/bootstrap-touchspin/dist/jquery.bootstrap-touchspin.min.js"></script>
<script type="text/javascript"
	src="${contextPath}/js/bootstrap-maxlength/src/bootstrap-maxlength.js"></script>
<!-- Neptune JS -->




<script type="text/javascript" src="${contextPath}/js/js/app.js"></script>
<script type="text/javascript" src="${contextPath}/js/js/demo.js"></script>


<script type="text/javascript"
	src="${contextPath}/js/js/forms-plugins.js"></script>



<script>
	$(document)
			.ready(
					function() {

						$('#inputframeVideo')
								.change(
										function() {
											$("#iframeVideo")
													.addClass(
															'embed-responsive embed-responsive-16by9');
											$("#iframeVideo")
													.html(
															'<iframe width="560" height="315" src="https://www.youtube.com/embed/5hcqd_w3k8s" frameborder="0" allowfullscreen></iframe>');

										});
					});

	function ChangeToSlug() {
		var title, slug;

		//Lấy text từ thẻ input title 
		title = document.getElementById("title").value;

		//Đổi chữ hoa thành chữ thường
		slug = title.toLowerCase();

		//Đổi ký tự có dấu thành không dấu
		slug = slug.replace(/á|à|ả|ạ|ã|ă|ắ|ằ|ẳ|ẵ|ặ|â|ấ|ầ|ẩ|ẫ|ậ/gi, 'a');
		slug = slug.replace(/é|è|ẻ|ẽ|ẹ|ê|ế|ề|ể|ễ|ệ/gi, 'e');
		slug = slug.replace(/i|í|ì|ỉ|ĩ|ị/gi, 'i');
		slug = slug.replace(/ó|ò|ỏ|õ|ọ|ô|ố|ồ|ổ|ỗ|ộ|ơ|ớ|ờ|ở|ỡ|ợ/gi, 'o');
		slug = slug.replace(/ú|ù|ủ|ũ|ụ|ư|ứ|ừ|ử|ữ|ự/gi, 'u');
		slug = slug.replace(/ý|ỳ|ỷ|ỹ|ỵ/gi, 'y');
		slug = slug.replace(/đ/gi, 'd');
		//Xóa các ký tự đặt biệt
		slug = slug
				.replace(
						/\`|\~|\!|\@|\#|\||\$|\%|\^|\&|\*|\(|\)|\+|\=|\,|\.|\/|\?|\>|\<|\'|\"|\:|\;|_/gi,
						'');
		//Đổi khoảng trắng thành ký tự gạch ngang
		slug = slug.replace(/ /gi, "-");
		//Đổi nhiều ký tự gạch ngang liên tiếp thành 1 ký tự gạch ngang
		//Phòng trường hợp người nhập vào quá nhiều ký tự trắng
		slug = slug.replace(/\-\-\-\-\-/gi, '-');
		slug = slug.replace(/\-\-\-\-/gi, '-');
		slug = slug.replace(/\-\-\-/gi, '-');
		slug = slug.replace(/\-\-/gi, '-');
		//Xóa các ký tự gạch ngang ở đầu và cuối
		slug = '@' + slug + '@';
		slug = slug.replace(/\@\-|\-\@|\@/gi, '');
		//In slug ra textbox có id “slug”
		document.getElementById('slug').value = slug;
	}
</script>
<script>
	$(document).ready(function() {
		var msg = $("#msg").val();
		if (msg != "") {
			alert(msg);
		}

	});
</script>
<script>
	var timeout = null;
	function validatorArticle() {

		clearTimeout(timeout);
		timeout = setTimeout(
				function() {
					var article = {};
					article["title"] = $("#title").val();
					article["slug"] = $("#slug").val();

					var token = $("meta[name='_csrf']").attr("content");
					var header = $("meta[name='_csrf_header']").attr("content");
					$(document).ajaxSend(function(e, xhr, options) {
						xhr.setRequestHeader(header, token);
					});
					$
							.ajax({

								type : "POST",
								contentType : "application/json",
								url : "${pageContext.request.contextPath}/admin/validator-article",
								data : JSON.stringify(article),
								//dataType: 'json',
								// timeout: 600000,
								success : function(result) {
									//alert(result);
									if (result == 'error') {
										errorBtn();
										errortitle();
										errorslug();
									}

									if (result == 'errortitle') {
										errorBtn();
										errortitle();
										successslug();
									}
									if (result == 'errorslug') {
										errorBtn();
										errorslug();
										successtitle();
									}
									if (result == 'msgsuccess') {
										successBtn();
										successtitle();

										successslug();
									}

								},
								error : function(e) {

								}
							});
				}, 1000);
	}
	function errorBtn() {
		$("#command").removeAttr("action");
		$("#btnAddArticle").prop("disabled", true);
	}
	function successBtn() {
		$("#user").attr("action",
				"${pageContext.request.contextPath}/admin/articles");
		$("#btnAddArticle").prop("disabled", false);
	}
	function errortitle() {
		$("#divTitle").removeClass("has-success");
		//$("#divTitle").addClass("has-danger");
		$("#title").removeClass("form-control-success");
		//$("#title").addClass("form-control-danger");
		$("#spanTitle").text("Tiêu Đề Đã Tồn Tại - Vui Lòng Nhập Tiêu Đề Khác");
	}
	function warningtitle() {
		$("#divTitle").removeClass("has-success");
		$("#divTitle").addClass("has-warning");
		$("#title").removeClass("form-control-success");
		$("#title").addClass("form-control-warning");
		$("#spanTitle").text("Nhập Tiêu Đề");
	}
	function successtitle() {
		$("#divTitle").removeClass("has-danger has-warning");
		//$("#divTitle").addClass("has-success ");

		$("#title").removeClass("form-control-danger form-control-warning ");
		//$("#title").addClass("form-control-success");
		$("#spanTitle").text("");
	}
	function errorslug() {
		$("#divSlug").removeClass("has-success");
		//$("#divSlug").addClass("has-danger");
		$("#slug").removeClass("form-control-success");
		//$("#slug").addClass("form-control-danger");
		$("#spanSlug").text(
				"Đường Dẫn Đã Tồn Tại - Vui Lòng Nhập Đường Dẫn Khác");
	}
	function successslug() {
		$("#divSlug").removeClass("has-danger");
		//$("#divSlug").addClass("has-success");

		$("#slug").removeClass("form-control-danger");
		//$("#slug").addClass("form-control-success");
		$("#spanSlug").text("");
	}

	$(document).ready(function($) {
		$("#command").removeAttr("action");
		$("#btnAddArticle").prop("disabled", true);

		$("#slug").on('keyup keypress keydown', function(event) {
			if($("#title").val() != '' && $("#slug").val() != ''){validatorArticle();}
			else{$("#spanTitle").text("");$("#spanSlug").text("");}
			
		});

		$("#title").on('keyup keypress keydown', function(event) {
			if($("#title").val() != '' && $("#slug").val() != ''){validatorArticle();}
			else{$("#spanTitle").text("");$("#spanSlug").text("");}

		});

	});
</script>
<script>
	$(document).ready(function() {

		//Khi bàn phím được nhấn và thả ra thì sẽ chạy phương thức này
		$("#formArticle").validate({
			rules : {
				title : {
					required : true,
					maxlength : 100
				},
				slug : {
					required : true,
					maxlength : 100
				},
				articleCategories : {
					required : true
				},
				tags : {
					required : true
				},
				subContent : {
					required : true
				},
				mainContent : {
					required : true
				},
				author: {
					required : true
				},
				imagesThumbnail: {
					required : true
				}
			},
			messages : {
				title : {
					required : "Vui Lòng Nhập Tiêu Đề",
					maxlength : "Tiêu Đề Không Dài Hơn 100 Ký Tự"
				},
				slug : {
					required : "Vui Lòng Nhập Đường Dẫn",
					maxlength : "Đường Dẫn Không Dài Hơn 100 Ký Tự"
				},
				articleCategories : {
					required : "Vui Lòng Chọn Danh Mục"
				},
				tags : {
					required : "Vui Lòng Chọn Thẻ"
				},
				subContent : {
					required : "Vui Lòng Nhập Tóm Tắt"
				},
				mainContent : {
					required : "Vui Lòng Nhập Nội Dung"
				},
				author: {
					required : "Vui Lòng Nhập Tác Giả/Nguồn"
				},
				imagesThumbnail: {
					required : "Vui Lòng Chọn Ảnh"
				}

			}
		});
	});
</script>