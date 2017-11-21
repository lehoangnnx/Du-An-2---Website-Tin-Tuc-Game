<%@ page pageEncoding="UTF-8" %>


<script>
    $(function () {
        $('#profile-image1').on('click', function () {
            $('#profile-image-upload').click();
        });
    });

    function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                $('#profile-image1').attr('src', e.target.result);
            }

            reader.readAsDataURL(input.files[0]);
        }
    }

    $("#profile-image-upload").change(function () {
        readURL(this);
    });
</script>

<script>
    $(document).ready(function () {

        $("#btn-updateprofile").click(function (e) {
            var firstName = $("#firstName").val();
            var lastName = $("#lastName").val();
            var email = $('#email').val();
            var phoneNumber = $("#phoneNumber").val();

            var phone_regex = /^(01[2689]|09)[0-9]{8}$/;
            var name_regex = /^[a-zA-Z_ÀÁÂÃÈÉÊÌÍÒÓÔÕÙÚĂĐĨŨƠàáâãèéêìíòóôõùúăđĩũơƯĂẠẢẤẦẨẪẬẮẰẲẴẶẸẺẼỀỀỂưăạảấầẩẫậắằẳẵặẹẻẽềềểỄỆỈỊỌỎỐỒỔỖỘỚỜỞỠỢỤỦỨỪễệỉịọỏốồổỗộớờởỡợụủứừỬỮỰỲỴÝỶỸửữựỳỵỷỹ]+$/;
            var email_regex = /[A-Z0-9._%+-]+@[A-Z0-9-]+.+.[A-Z]{2,4}/igm;
            if (!email.match(email_regex) || email.length == 0) {

                $('#msgerror').text("* Vui Lòng Nhập Email"); // This Segment Displays The Validation Rule For Email
                $("#email").focus();
                e.preventDefault();
                return false;
            }
            else if (!firstName.match(name_regex) && firstName.length != 0) {
                $('#msgerror').text("* Vui Lòng Nhập Đúng Họ");
                $("#firstName").focus();
                e.preventDefault();
                return false;
            }
            else if (!lastName.match(name_regex) && lastName.length != 0) {
                $('#msgerror').text("* Vui Lòng Nhập Đúng Tên");
                $("#lastName").focus();
                e.preventDefault();
                return false;
            }
            else if (!phoneNumber.match(phone_regex) && phoneNumber.length != 0) {
                $('#msgerror').text("* Vui Lòng Nhập Đúng Số Điện Thoại");
                $("#lastName").focus();
                e.preventDefault();
                return false;
            }
            else {
                $('#msgerror').text("");
                return true;
            }

        });

    });
    var _validFileExtensions = [".jpg", ".jpeg", ".bmp", ".gif", ".png"];

    function ValidateSingleInput(oInput) {
        if (oInput.type == "file") {
            var sFileName = oInput.value;
            if (sFileName.length > 0) {
                var blnValid = false;
                for (var j = 0; j < _validFileExtensions.length; j++) {
                    var sCurExtension = _validFileExtensions[j];
                    if (sFileName.substr(sFileName.length - sCurExtension.length, sCurExtension.length).toLowerCase() == sCurExtension.toLowerCase()) {
                        blnValid = true;
                        break;
                    }
                }

                if (!blnValid) {
                    $('#msgerror').text("* Vui Lòng Chọn Đúng File Ảnh");
                    oInput.value = "";
                    return false;
                }
            }
        }
        return true;
    };
</script>
<script>

    var timeout = null;
    $("#email").on('keyup keypress keydown', function (e) {
        var email = $('#email').val();

        var email_regex = /^[\w\-\.\+]+\@[a-zA-Z0-9\.\-]+\.[a-zA-z0-9]{2,4}$/;
        if (email.match(email_regex) && email.length != 0) {
            clearTimeout(timeout);
            timeout = setTimeout(function () {
                var users = {};
                users["email"] = $("#email").val();
                //alert(users.userId + users.email);
                // $("#btn-update").prop("disabled", true);
                var token = $("meta[name='_csrf']").attr("content");
                var header = $("meta[name='_csrf_header']").attr("content");
                $(document).ajaxSend(function (e, xhr, options) {
                    xhr.setRequestHeader(header, token);
                });

                $.ajax({
                    type: "POST",
                    contentType: "application/json",
                    url: "${pageContext.request.contextPath}/validator-user",
                    data: JSON.stringify(users),
                    //dataType: 'json',
                    // timeout: 600000,
                    success: function (result) {
                        //alert(result);
                        if (result == 'erroremail') {
                            $('#msgerror').text("* Email Đã Tồn Tại"); // This Segment Displays The Validation Rule For Email
                            $("#email").focus();
                            $('#btn-updateprofile').attr('disabled', 'disabled');
                            e.preventDefault();
                            return false;
                        }
                        if (result == 'successemail') {
                            $('#msgerror').text(""); // This Segment Displays The Validation Rule For Email
                            $('#btn-updateprofile').removeAttr('disabled');
                            return true;
                        }

                    },
                    error: function (e) {
                        alert("Lỗi ! Vui Lòng Kiểm Tra Lại");
                    }
                });

            }, 10);
        }
    });
    $("#oldpassword").on('keyup keypress keydown', function (e) {
        var oldpassword = $('#oldpassword').val();
        if (oldpassword.length != 0) {
            clearTimeout(timeout);
            timeout = setTimeout(function () {
                var users = {};
                users["password"] = oldpassword;

                //alert(users.userId + users.email);
                // $("#btn-update").prop("disabled", true);
                var token = $("meta[name='_csrf']").attr("content");
                var header = $("meta[name='_csrf_header']").attr("content");
                $(document).ajaxSend(function (e, xhr, options) {
                    xhr.setRequestHeader(header, token);
                });

                $.ajax({
                    type: "POST",
                    contentType: "application/json",
                    url: "${pageContext.request.contextPath}/validator-password",
                    data: JSON.stringify(users),
                    //dataType: 'json',
                    // timeout: 600000,
                    success: function (result) {
                        //alert(result);
                        if (result == 'errorpassword') {
                            $('#msgerrorp').text("* Mật Khẩu Cũ Không Trùng Khớp"); // This Segment Displays The Validation Rule For Email
                            $("#oldpassword").focus();
                            $('#btn-changepassword').attr('disabled', 'disabled');
                            e.preventDefault();
                            return false;
                        }
                        if (result == 'successpassword') {
                            $('#msgerrorp').text(""); // This Segment Displays The Validation Rule For Email

                            e.preventDefault();
                            return false;
                        }

                    },
                    error: function (e) {
                        alert("Lỗi ! Vui Lòng Kiểm Tra Lại");
                    }
                });

            }, 500);
        }
    });

    $("#newpassword").on('keyup keypress keydown', function (e) {
        var password = $('#newpassword').val();
        var regularExpression = /^(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{6,16}$/;
        if (!password.match(regularExpression)) {
            $('#msgerrorp').text("Mật Khẩu Từ 6 -16 Ký Tự Bao Gồm Chữ, Số Và Ký Tự Đặc Biệt");
            $('#btn-changepassword').attr('disabled', 'disabled');
        }else {
            $('#msgerrorp').text("");

        }

    });
    $("#rnewpassword").on('keyup keypress keydown', function (e) {
        var password = $('#newpassword').val();
        var rpassword = $('#rnewpassword').val();
        if (!rpassword.match(password)) {
            $('#msgerrorp').text("Nhập Lại Mật Khẩu Không Trùng Khớp");
            $('#btn-changepassword').attr('disabled', 'disabled');
        }else {
            $('#msgerrorp').text("");
            $('#btn-changepassword').removeAttr('disabled');
        }

    });
    $('#btn-changepassword').click(function (e){
        var rpassword = $('#rnewpassword').val();
        clearTimeout(timeout);
        timeout = setTimeout(function () {
            var users = {};
            users["password"] = rpassword;
            //alert(users.userId + users.email);
            // $("#btn-update").prop("disabled", true);
            var token = $("meta[name='_csrf']").attr("content");
            var header = $("meta[name='_csrf_header']").attr("content");
            $(document).ajaxSend(function (e, xhr, options) {
                xhr.setRequestHeader(header, token);
            });

            $.ajax({
                type: "POST",
                contentType: "application/json",
                url: "${pageContext.request.contextPath}/changepassword",
                data: JSON.stringify(users),
                //dataType: 'json',
                // timeout: 600000,
                success: function (result) {
                    //alert(result);
                    if (result == 'error') {
                        $('#msgerrorp').text("* Lỗi! Vui Lòng Kiểm Tra Lại"); // This Segment Displays The Validation Rule For Email
                        $("#oldpassword").focus();
                        $('#btn-changepassword').attr('disabled', 'disabled');
                        e.preventDefault();
                        return false;
                    }
                    if (result == 'success') {
                        location.reload();
                    }

                },
                error: function (e) {
                    alert("Lỗi ! Vui Lòng Kiểm Tra Lại");
                }
            });

        }, 500);
        e.preventDefault();
        return false;
    });
    function updateUser() {

        clearTimeout(timeout);
        timeout = setTimeout(function () {
            var users = {};
            users["userId"] = $("#userId").val();
            users["email"] = $("#email").val();
            users["firstName"] = $("#firstName").val();
            users["lastName"] = $("#lastName").val();
            users["phoneNumber"] = $("#phoneNumber").val();
            users["avatar"] = $("#profile-image-upload").val();
            //alert(users.userId + users.email);
            // $("#btn-update").prop("disabled", true);
            var token = $("meta[name='_csrf']").attr("content");
            var header = $("meta[name='_csrf_header']").attr("content");
            $(document).ajaxSend(function (e, xhr, options) {
                xhr.setRequestHeader(header, token);
            });

            $.ajax({
                type: "POST",
                contentType: "application/json",
                url: "${pageContext.request.contextPath}/updateuser",
                data: JSON.stringify(users),
                //dataType: 'json',
                // timeout: 600000,
                success: function (result) {
                    //  alert(result);
                    if (result == 'erroremail') {
                        $('#msgerror').text("Email Đã Tồn Tại"); // This Segment Displays The Validation Rule For Email
                        $("#email").focus();
                        return false;
                    }
                    if (result == 'successemail') {
                        $('#msgerror').text(""); // This Segment Displays The Validation Rule For Email
                        return true;
                    }

                },
                error: function (e) {
                    alert("Lỗi ! Vui Lòng Kiểm Tra Lại");
                }
            });

        }, 1000);
    };
</script>