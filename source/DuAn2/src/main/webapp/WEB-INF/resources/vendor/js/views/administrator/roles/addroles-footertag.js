
	$(document).ready(function() {
		var msg = $("#msg").val();
		if (msg != "") {
			alert(msg);
		}

	});

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
								url : contextPath+"/admin/validator-roles",
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
