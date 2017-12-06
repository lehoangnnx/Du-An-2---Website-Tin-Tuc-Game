
	$(document).ready(function() {
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
						url : contextPath+"/admin/validator-user",
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

				}, 200);
			}
		});

	});

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

	$(document).ready(function() {

		$("#btn-submit").click(function(e) {
			var firstName = $("#firstName").val().trim();
			var lastName = $("#lastName").val().trim();
			var email = $('#email').val().trim();
			var phoneNumber = $("#phoneNumber").val().trim();
			
			var phone_regex = /^(01[2689]|09)[0-9]{8}$/;
			var name_regex = /^[A-Za-zÀÁÂÃÈÉÊÌÍÒÓÔÕÙÚÝàáâãèéêìíòóôõùúýĂăĐđĨĩŨũƠơƯưẠ-ỹ]+$/;
			var email_regex = /[A-Z0-9._%+-]+@[A-Z0-9-]+.+.[A-Z]{2,4}/igm;
			if(email == ''){
                $('#email').val("");
			}
			if (!email.match(email_regex) || email.length == 0) {

				$('#email-error').text("Vui Lòng Nhập Email"); // This Segment Displays The Validation Rule For Email
				$("#email").focus();
				e.preventDefault();
				return false;
			} 
			else if (!firstName.match(name_regex) && firstName.length != 0 ) {

				$('#firstName-error').text("Vui Lòng Nhập Đúng Họ");
                $('#email-error').text("");
				$("#firstName").focus();
				e.preventDefault();
				return false;
			}
			else if (!lastName.match(name_regex) && lastName.length != 0) {
				$('#lastName-error').text("Vui Lòng Nhập Đúng Tên");
                $('#firstName-error').text("");
				$("#lastName").focus();
				e.preventDefault();
				return false;
			}
			else if(!phoneNumber.match(phone_regex) && phoneNumber.length != 0){
				$('#phoneNumber-error').text("Vui Lòng Nhập Đúng Số Điện Thoại");
                $('#lastName-error').text("");
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

    $("#formUser").validate({
        rules : {
            email: {
              required : true,
				email : true,
				maxlength:255
			},
            firstName:{
                maxlength:255
			},
            lastName:{
                maxlength:255
			},
            phoneNumber:{
                maxlength:15
			},
            roleses: {
                required : true
			},
            avatar : {
               
                accept: "image/*"
            }
        },
		messages : {
            email: {
              required : "Vui Lòng Nhập Email",
				email : "Vui Lòng Nhập Đúng Email",
                maxlength : "Email Tối Đa 255 Ký Tự."
			},
            firstName:{
                maxlength : "Họ Tối Đa 255 Ký Tự."
            },
            lastName:{
                maxlength : "Tên Tối Đa 255 Ký Tự."
            },
            phoneNumber:{
                maxlength : "Số Điện Thoại Tối Đa 15 Ký Tự."
            },
            roleses: {
                required : "Vui Lòng Chọn Quyền"
            },
            avatar : {
               
                accept : "Vui Lòng Chọn File Ảnh"
            }
        }

	});
