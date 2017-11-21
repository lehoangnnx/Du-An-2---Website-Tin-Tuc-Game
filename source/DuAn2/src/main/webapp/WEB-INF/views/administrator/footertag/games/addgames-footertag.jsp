<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<script type="text/javascript"
        src="${contextPath}/js/jquery/jquery-1.12.3.min.js"></script>

<script type="text/javascript"
        src="${contextPath}/js/js/jquery-3.2.1.min.js"></script>

<script type="text/javascript"
        src="${contextPath}/js/js/jquery.validate.js"></script>
<script type="text/javascript"
        src="${contextPath}/js/js/additional-methods.min.js"></script>
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
</script>
<script>
    $(document).ready(function () {
        var msg = $("#msg").val();
        if (msg != "") {
            alert(msg);
        }

    });
</script>
<script>
    var timeout = null;

    function validatorArticleCategory() {

        clearTimeout(timeout);
        timeout = setTimeout(
            function () {
                var games = {};
                games["name"] = $("#name").val();
                games["slug"] = $("#slug").val();

                var token = $("meta[name='_csrf']").attr("content");
                var header = $("meta[name='_csrf_header']").attr("content");
                $(document).ajaxSend(function (e, xhr, options) {
                    xhr.setRequestHeader(header, token);
                });
                $
                    .ajax({

                        type: "POST",
                        contentType: "application/json",
                        url: "${pageContext.request.contextPath}/admin/validator-games",
                        data: JSON.stringify(games),
                        //dataType: 'json',
                        // timeout: 600000,
                        success: function (result) {
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
                        error: function (e) {

                        }
                    });
            }, 1000);
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

    $(document).ready(function ($) {

        $("#btn-submit").prop("disabled", true);
        /* $("#formArticleCategory").change(function(){
            $("#btnAddArticleCategory").prop("disabled", false);
        }); */
        $("#slug").on('keyup keypress keydown', function (event) {
            if ($("#name").val() != '' && $("#slug").val() != '') {
                validatorArticleCategory();
            } else {
                $("#spanName").text("");
                $("#spanSlug").text("");
            }

        });

        $("#name").on('keyup keypress keydown', function (event) {
            if ($("#name").val() != '' && $("#slug").val() != '') {
                validatorArticleCategory();
            } else {
                $("#spanName").text("");
                $("#spanSlug").text("");
            }

        });

    });
</script>
<script>
    $(document).ready(function () {
        $('#formGames').on('submit', function(e) {

            if($('#summernote').summernote('isEmpty')) {

                $("#systemRequirements-error").text("Vui Lòng Nhập Nội Dung");
                // cancel submit
                e.preventDefault();
            }else {
                $("#systemRequirements-error").text("");
            }

        });
        //Khi bàn phím được nhấn và thả ra thì sẽ chạy phương thức này
        $("#formGames").validate({

            rules: {
                name: {
                    required: true,
                    maxlength: 100
                },
                slug: {
                    required: true,
                    maxlength: 100
                },
                publishers: {
                    required : true
                },
                gameCategories : {
                    required : true
                },
                releases : {
                    required : true
                },
                images : {
                    required : true,
                    accept: "image/*"
                },
                info : {
                    required : true
                },
                homeUrl :{
                    required: true,
                    url: true
                },
                downloadUrl :{
                    required: true,
                    url: true
                }

            },
            messages: {
                name: {
                    required: "Vui Lòng Nhập Tên ",
                    maxlength: "Tiêu Đề Không Dài Hơn 100 Ký Tự"
                },
                slug: {
                    required: "Vui Lòng Nhập Đường Dẫn",
                    maxlength: "Đường Dẫn Không Dài Hơn 100 Ký Tự"
                },
                publishers : {
                  required : "Vui Lòng Nhập Tên Nhà Phát Hành"
                },
                gameCategories : {
                    required: "Vui Lòng Chọn Danh Mục Game"
                },
                releases:{
                    required : "Vui Lòng Chọn Ngày Phát Hành"
                },
                images : {
                    required : "Vui Lòng Chọn Ảnh",
                    accept : "Vui Lòng Chọn File Ảnh"
                },
                info : {
                    required : "Vui Lòng Nhập Mô Tả Game"
                },
                homeUrl :{
                    required : "Vui Lòng Nhập URL",
                    url : "Vui Lòng Nhập Đúng URL. Ví Dụ: https://lienquan.garena.vn/"
                },
                downloadUrl :{
                    required : "Vui Lòng Nhập URL",
                    url : "Vui Lòng Nhập Đúng URL. Ví Dụ: https://lienquan.garena.vn/"
                }


            }
        });
    });
</script>