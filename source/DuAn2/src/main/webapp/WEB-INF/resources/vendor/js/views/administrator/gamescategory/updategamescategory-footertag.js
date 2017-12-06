
	function ChangeToSlug() {
		var title, slug;

		//Lấy text từ thẻ input title 
		title = document.getElementById("name").value;

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

	$(document).ready(function() {
		var msg = $("#msg").val();
		if (msg != "") {
			alert(msg);
		}

	});

	var timeout = null;
	function validatorGameCategory() {

		clearTimeout(timeout);
		timeout = setTimeout(
				function() {
					var gameCategory = {};
					gameCategory["name"] = $("#name").val();
					gameCategory["slug"] = $("#slug").val();
					gameCategory["gameCategoryId"] = $("#gameCategoryId").val();
					var token = $("meta[name='_csrf']").attr("content");
					var header = $("meta[name='_csrf_header']").attr("content");
					$(document).ajaxSend(function(e, xhr, options) {
						xhr.setRequestHeader(header, token);
					});
					$
							.ajax({

								type : "POST",
								contentType : "application/json",
								url : contextPath+"/admin/validator-gamescategory",
								data : JSON.stringify(gameCategory),
								//dataType: 'json',
								// timeout: 600000,
								success : function(result) {
									//alert(result);
									if (result == 'error') {
										errorBtn();
										errortitle();
										errorslug();
									}

									if (result == 'errorname') {
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
				}, 200);
	}
	function errorBtn() {
		
		$("#btn-submit").prop("disabled", true);
	}
	function successBtn() {
		
		$("#btn-submit").prop("disabled", false);
	}
	function errortitle() {
		
		$("#spanName").text("Tên Đã Tồn Tại - Vui Lòng Nhập Tên Khác");
	}
	
	function successtitle() {
		
		$("#spanName").text("");
	}
	function errorslug() {
		
		$("#spanSlug").text(
				"Đường Dẫn Đã Tồn Tại - Vui Lòng Nhập Đường Dẫn Khác");
	}
	function successslug() {
		
		$("#spanSlug").text("");
	}

	$(document).ready(function($) {
		
		$("#btn-submit").prop("disabled", true);
		 $("#formGameCategory").change(function(){
			 validatorGameCategory();
		}); 
		$("#slug").on('keyup keypress keydown', function(event) {
			if ($("#name").val().trim() != '' && $("#slug").val().trim() != '') {
				validatorGameCategory();
			}  else if($("#name").val().trim() == '' && $("#slug").val().trim() == ''){
                $("#name").val("");
                $("#slug").val("");
            }else if($("#slug").val().trim() == ''){
                $("#slug").val("");
            }

		});

		$("#name").on('keyup keypress keydown', function(event) {
			if ($("#name").val().trim() != '' && $("#slug").val().trim() != '') {
				validatorGameCategory();
			} else if($("#name").val().trim() == '' && $("#slug").val().trim() == ''){
                $("#name").val("");
                $("#slug").val("");
            }else if($("#name").val().trim() == ''){
                $("#name").val("");
            }

		});

	});

	$(document).ready(function() {
		
		//Khi bàn phím được nhấn và thả ra thì sẽ chạy phương thức này
		$("#formGameCategory").validate({

			rules : {
				name : {
					required : true,
					maxlength : 100
				},
				slug : {
					required : true,
					maxlength : 100
				}
				
			},
			messages : {
				name : {
					required : "Vui Lòng Nhập Tên ",
					maxlength : "Tiêu Đề Không Dài Hơn 100 Ký Tự"
				},
				slug : {
					required : "Vui Lòng Nhập Đường Dẫn",
					maxlength : "Đường Dẫn Không Dài Hơn 100 Ký Tự"
				}
				
				

			}
		});
	});
