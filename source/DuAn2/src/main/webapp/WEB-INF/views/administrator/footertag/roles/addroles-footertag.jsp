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
	src="${contextPath}/js/switchery/dists/switchery.min.js"></script>


<script type="text/javascript"
	src="${contextPath}/js/js/forms-editors.js"></script>
<script type="text/javascript"
	src="${contextPath}/js/summernote/summernote.min.js"></script>
<script type="text/javascript"
	src="${contextPath}/js/dropify/dists/js/dropify.min.js"></script>

<script type="text/javascript"
	src="${contextPath}/js/js/forms-upload.js"></script>


<script type="text/javascript"
	src="${contextPath}/js/select2/dists/js/select2.min.js"></script>
<script type="text/javascript"
	src="${contextPath}/js/bootstrap-tagsinput/dists/bootstrap-tagsinput.min.js"></script>
<script type="text/javascript"
	src="${contextPath}/js/multi-select/js/jquery.multi-select.js"></script>
<script type="text/javascript"
	src="${contextPath}/js/bootstrap-touchspin/dists/jquery.bootstrap-touchspin.min.js"></script>
<script type="text/javascript"
	src="${contextPath}/js/bootstrap-maxlength/src/bootstrap-maxlength.js"></script>
<!-- Neptune JS -->




<script type="text/javascript" src="${contextPath}/js/js/app.js"></script>
<script type="text/javascript" src="${contextPath}/js/js/demo.js"></script>


<script type="text/javascript"
	src="${contextPath}/js/js/forms-plugins.js"></script>



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
	function validatorRoles() {

		clearTimeout(timeout);
		timeout = setTimeout(
				function() {
					var roles = {};
					roles["name"] = $("#name").val();


					var token = $("meta[name='_csrf']").attr("content");
					var header = $("meta[name='_csrf_header']").attr("content");
					$(document).ajaxSend(function(e, xhr, options) {
						xhr.setRequestHeader(header, token);
					});
					$
							.ajax({

								type : "POST",
								contentType : "application/json",
								url : "${pageContext.request.contextPath}/admin/validator-roles",
								data : JSON.stringify(roles),
								//dataType: 'json',
								// timeout: 600000,
								success : function(result) {
									//alert(result);

									if (result == 'errorname') {
										errorBtn();
										errortitle();

									}
									if (result == 'msgsuccess') {
										successBtn();
										successtitle();


									}

								},
								error : function(e) {

								}
							});
				}, 200);
	}
	function errorBtn() {
		
		$("#btn-submit").prop("disabled", true);
	}
	function successBtn() {
		
		$("#btn-submit").prop("disabled", false);
	}
	function errortitle() {
		
		$("#spanName").text("Tên Quyền Đã Tồn Tại - Vui Lòng Nhập Tên Khác");
	}
	
	function successtitle() {
		
		$("#spanName").text("");
	}


	$(document).ready(function($) {
		
		$("#btn-submit").prop("disabled", true);
		/* $("#formArticleCategory").change(function(){
			$("#btnAddArticleCategory").prop("disabled", false);
		}); */


		$("#name").on('keyup keypress keydown', function(event) {
			if ($("#name").val() != '' ) {
				var a = $("#name").val().toUpperCase();
                $("#name").val(a);
				if(a.substr(0, 5) === "ROLE_"){
				    console.log(a.substr(0, 4));
                    $("#spanName").text("");
                    validatorRoles();
				}else{
                    console.log(a.substr(0, 4));
                    $("#spanName").text("Tên Quyền Phải Bắt Đầu Bằng ROLE_");
				}

			} else {
				$("#spanName").text("");

			}

		});

	});
</script>
<script>
	$(document).ready(function() {
		
		//Khi bàn phím được nhấn và thả ra thì sẽ chạy phương thức này
		$("#formRoles").validate({

			rules : {
				name : {
					required : true,
					maxlength : 100
				},
                description: {
                    maxlength : 255
				}

				
			},
			messages : {
				name : {
					required : "Vui Lòng Nhập Tên ",
					maxlength : "Tên Không Dài Hơn 100 Ký Tự"
				},
                description: {
                    maxlength : "Mô Tả Không Dài Hơn 100 Ký Tự"
                }

				
				

			}
		});
	});
</script>