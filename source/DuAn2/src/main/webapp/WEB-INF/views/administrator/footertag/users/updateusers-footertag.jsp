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
	$(document)
			.ready(
					function($) {
						var timeout = null;
						$("#email").on('keyup keypress keydown',function(event) {
							var email = $('#email').val();

							var email_regex = /^[\w\-\.\+]+\@[a-zA-Z0-9\.\-]+\.[a-zA-z0-9]{2,4}$/;
							if (email.match(email_regex) && email.length != 0) {
							clearTimeout(timeout);
							timeout = setTimeout(function() {
								var users = {};
								users["userId"] = $("#userId").val();
								users["email"] = $("#email").val();
								//alert(users.userId + users.email);
								// $("#btn-update").prop("disabled", true);
								var token = $("meta[name='_csrf']").attr("content");
								var header = $("meta[name='_csrf_header']").attr("content");
								$(document).ajaxSend(function(e,xhr,options) {
										xhr.setRequestHeader(header,token);
										});

									$.ajax({
											type : "POST",
											contentType : "application/json",
											url : "${pageContext.request.contextPath}/admin/validator-user",
											data : JSON.stringify(users),
												//dataType: 'json',
												// timeout: 600000,
											success : function(result) {
											//  alert(result);
											if (result == 'erroremail') {
											$('#email-error').text("Email Đã Tồn Tại"); // This Segment Displays The Validation Rule For Email
												$("#email").focus();
											$("#btn-submit").prop("disabled",true);
											return false;
											}
											if (result == 'successemail') {
											$('#email-error').text(""); // This Segment Displays The Validation Rule For Email
											$("#btn-submit").prop("disabled",false);
												return true;
												}

											},
											error : function(e) {
												alert("Lỗi ! Vui Lòng Kiểm Tra Lại");
												}
											});

								}, 1000);
						}
			});

					});
</script>

<script>
	$(document).ready(function() {
		$("#btn-submit").prop("disabled",true);
		$("#formUser").change(function(){
			$("#btn-submit").prop("disabled",false);
			});
		var msg = $("#msg").val();
		if (msg != "") {
			alert(msg);
		}

	});
</script>

<script>
	$(document).ready(function() {

		$("#btn-submit").click(function(e) {
			var firstName = $("#firstName").val();
			var lastName = $("#lastName").val();
			var email = $('#email').val();
			var phoneNumber = $("#phoneNumber").val();
			
			var phone_regex = /^(01[2689]|09)[0-9]{8}$/;
			var name_regex = /^[a-zA-Z_ÀÁÂÃÈÉÊÌÍÒÓÔÕÙÚĂĐĨŨƠàáâãèéêìíòóôõùúăđĩũơƯĂẠẢẤẦẨẪẬẮẰẲẴẶẸẺẼỀỀỂưăạảấầẩẫậắằẳẵặẹẻẽềềểỄỆỈỊỌỎỐỒỔỖỘỚỜỞỠỢỤỦỨỪễệỉịọỏốồổỗộớờởỡợụủứừỬỮỰỲỴÝỶỸửữựỳỵỷỹ]+$/;
			var email_regex = /[A-Z0-9._%+-]+@[A-Z0-9-]+.+.[A-Z]{2,4}/igm;
			if (!email.match(email_regex) || email.length == 0) {
				console.log("sdssd");
				$('#email-error').text("Vui Lòng Nhập Email"); // This Segment Displays The Validation Rule For Email
				$("#email").focus();
				e.preventDefault();
				return false;
			} 
			else if (!firstName.match(name_regex) && firstName.length != 0 ) {
				console.log(firstName+ lastName+email+ "sssssssssss" );
				$('#firstName-error').text("Vui Lòng Nhập Đúng Họ");
				$("#firstName").focus();
				e.preventDefault();
				return false;
			}
			else if (!lastName.match(name_regex) && lastName.length != 0) {
				$('#lastName-error').text("Vui Lòng Nhập Đúng Tên");
				$("#lastName").focus();
				e.preventDefault();
				return false;
			}
			else if(!phoneNumber.match(phone_regex) && phoneNumber.length != 0){
				$('#phoneNumber-error').text("Vui Lòng Nhập Đúng Số Điện Thoại");
				$("#lastName").focus();
				e.preventDefault();
				return false;
			}
			 else {
				$('#lastName-error').text("");
				$('#firstName-error').text("");
				$('#email-error').text("");
				$('#phoneNumber-error').text("");
				return true;
			}

		});

	});
</script>