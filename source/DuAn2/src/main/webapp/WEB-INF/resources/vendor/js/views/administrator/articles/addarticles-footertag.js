
	$(document).ready(function() {
        var timeout = null;

        $('#inputframeVideo').on('keyup keypress keydown', function() {

            clearTimeout(timeout);
            timeout = setTimeout(function ()
            {
                var link =	$("#inputframeVideo").val();

                if(link.search("iframe") == 1){
					$('#ifVideo').css('display','block');
                    link = link.slice(link.indexOf("src")+5, link.indexOf("frameborder")-2);
                    $("#inputframeVideo").val(link);
                }else {
                    $('#ifVideo').css('display','none');
				}
                $("#ifVideo").attr("src", link);
            }, 500);
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

	$(document).ready(function() {
		var msg = $("#msg").val();
		if (msg != "") {
			alert(msg);
		}

	});

	var timeout = null;
	function validatorArticle() {

		clearTimeout(timeout);
		timeout = setTimeout(
				function() {
					var article = {};
					article["title"] = $("#title").val().trim();
					article["slug"] = $("#slug").val().trim();

					var token = $("meta[name='_csrf']").attr("content");
					var header = $("meta[name='_csrf_header']").attr("content");
					$(document).ajaxSend(function(e, xhr, options) {
						xhr.setRequestHeader(header, token);
					});
					$
							.ajax({

								type : "POST",
								contentType : "application/json",
								url : contextPath+"/admin/validator-article",
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
				}, 200);
	}
	function errorBtn() {
		
		$("#btn-submit").prop("disabled", true);
	}
	function successBtn() {
		
		$("#btn-submit").prop("disabled", false);
	}
	function errortitle() {
		
		$("#spanTitle").text("Tiêu Đề Đã Tồn Tại - Vui Lòng Nhập Tiêu Đề Khác");
	}
	
	function successtitle() {
		
		$("#spanTitle").text("");
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

        $("#slug").on('keyup keypress keydown', function(event) {
            if ($("#title").val().trim() != '' && $("#slug").val().trim() != '') {
                validatorArticle();
            } else {
                $("#spanTitle").text("");
                $("#spanSlug").text("");
            }

        });

        $("#title").on('keyup keypress keydown', function(event) {
            if ($("#title").val().trim() != '' && $("#slug").val().trim() != '') {
                validatorArticle();
            } else {
                $("#spanTitle").text("");
                $("#spanSlug").text("");
            }

        });

	});

	$(document).ready(function() {
		$('#formArticle').on('submit', function(e) {
			  
			  if($('#summernote').summernote('isEmpty')) {

			    $("#mainContent-error").text("Vui Lòng Nhập Nội Dung");
			    // cancel submit
			    e.preventDefault();
			  } else {
                  $("#mainContent-error").text("");
			  };

				if( $('#tags').has('option').length == 0 ){
                    $("#_tags-error").text("Vui Lòng Nhập Thẻ");
                    // cancel submit
                    e.preventDefault();
				}else{
                    $("#_tags-error").text("");
				};
			});
		//Khi bàn phím được nhấn và thả ra thì sẽ chạy phương thức này
		$("#formArticle").validate({

			rules : {
				title : {
					required : true,
                    maxlength : 255
				},
				slug : {
					required : true,
                    maxlength : 255
				},
				articleCategories : {
					required : true
				},
                tags : {
					required : true
				},
				subContent : {
					required : true,
                    maxlength : 4000
				},
				
				author : {
					required : true,
					maxlength: 255
				},
				imagesThumbnail : {
					required : true,
                    accept: "image/*"
				},

				video : {

					url: true

				}
			},
			messages : {
				title : {
					required : "Vui Lòng Nhập Tiêu Đề",
					maxlength : "Tiêu Đề Không Dài Hơn 255 Ký Tự"
				},
				slug : {
					required : "Vui Lòng Nhập Đường Dẫn",
					maxlength : "Đường Dẫn Không Dài Hơn 255 Ký Tự"
				},
				articleCategories : {
					required : "Vui Lòng Chọn Danh Mục"
				},
				tags : {
					required : "Vui Lòng Nhập Thẻ"
				},
				subContent : {
					required : "Vui Lòng Nhập Tóm Tắt",
                    maxlength : "Tóm Tắt Không Dài Hơn 4000 Ký Tự"
				},
				
				author : {
					required : "Vui Lòng Nhập Tác Giả/Nguồn",
                    maxlength : "Tác Giả/Nguồn Không Dài Hơn 255 Ký Tự"
				},
				imagesThumbnail : {
					required : "Vui Lòng Chọn Ảnh",
                    accept : "Vui Lòng Chọn File Ảnh"
				},

				video : {

					url : "Vui Lòng Nhập Đúng URL. Ví Dụ: https://www.youtube.com/embed/cMg8KaMdDYo "
				}

			}
		});
	});

