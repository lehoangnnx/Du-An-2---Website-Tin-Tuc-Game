
// Mở Script Upload File
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
// Đóng Script Upload File

//Mở Kiểm Tra Trang Profile
$(document).ready(function () {

    $("#btn-updateprofile").click(function (e) {
        var firstName = $("#firstName").val();
        var lastName = $("#lastName").val();
        var email = $('#email').val();
        var phoneNumber = $("#phoneNumber").val();

        var phone_regex = /^(01[2689]|09)[0-9]{8}$/;
        var name_regex = /^[A-Za-zÀÁÂÃÈÉÊÌÍÒÓÔÕÙÚÝàáâãèéêìíòóôõùúýĂăĐđĨĩŨũƠơƯưẠ-ỹ]+$/;
        var email_regex = /[A-Z0-9._%+-]+@[A-Z0-9-]+.+.[A-Z]{2,4}/igm;
        if (!email.match(email_regex) || email.length == 0) {

            $('#msgerror').text("* Vui Lòng Nhập Email");
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
//Đóng Kiểm Tra Trang Profile

// Mở Kiểm Tra Định Dạng File Upload
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
// Mở Kiểm Tra Định Dạng File Upload


// Mở kiểm tra email có tồn tại
var timeout = null;
$("#email").on('keyup keypress keydown', function (e) {
    var email = $('#email').val();

    var email_regex = /^[\w\-\.\+]+\@[a-zA-Z0-9\.\-]+\.[a-zA-z0-9]{2,4}$/;
    if (email.match(email_regex) && email.length != 0) {
        clearTimeout(timeout);
        timeout = setTimeout(function () {
            var users = {};
            users["email"] = $("#email").val();
            var token = $("meta[name='_csrf']").attr("content");
            var header = $("meta[name='_csrf_header']").attr("content");
            $(document).ajaxSend(function (e, xhr, options) {
                xhr.setRequestHeader(header, token);
            });

            $.ajax({
                type: "POST",
                contentType: "application/json",
                url: contextPath+"/validator-user",
                data: JSON.stringify(users),
                //dataType: 'json',
                // timeout: 600000,
                success: function (result) {
                    //alert(result);
                    if (result == 'erroremail') {
                        $('#msgerror').text("* Email Đã Tồn Tại");
                        $("#email").focus();
                        $('#btn-updateprofile').attr('disabled', 'disabled');
                        e.preventDefault();
                        return false;
                    }
                    if (result == 'successemail') {
                        $('#msgerror').text("");
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
// Đóng kiểm tra email có tồn tại

// Mở Kiểm tra mật khẩu cũ có trùng khớp
$("#oldpassword").on('keyup keypress keydown', function (e) {
    var oldpassword = $('#oldpassword').val();
    if (oldpassword.length != 0) {
        clearTimeout(timeout);
        timeout = setTimeout(function () {
            var users = {};
            users["password"] = oldpassword;
            var token = $("meta[name='_csrf']").attr("content");
            var header = $("meta[name='_csrf_header']").attr("content");
            $(document).ajaxSend(function (e, xhr, options) {
                xhr.setRequestHeader(header, token);
            });

            $.ajax({
                type: "POST",
                contentType: "application/json",
                url: contextPath+"/validator-password",
                data: JSON.stringify(users),
                //dataType: 'json',
                // timeout: 600000,
                success: function (result) {
                    //alert(result);
                    if (result == 'errorpassword') {
                        $('#msgerrorp').text("* Mật Khẩu Cũ Không Trùng Khớp");
                        $("#oldpassword").focus();
                        $('#btn-changepassword').attr('disabled', 'disabled');
                        e.preventDefault();
                        return false;
                    }
                    if (result == 'successpassword') {
                        $('#msgerrorp').text("");
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
// Đóng Kiểm tra mật khẩu cũ có trùng khớp

// Mở Kiểm tra Độ mạnh của mật khẩu mới
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
// Đóng Kiểm tra Độ mạnh của mật khẩu mới

// Kiểm tra nhập lại mật khẩu mới có khớp mật khẩu
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
// Kiểm tra nhập lại mật khẩu mới có khớp mật khẩu

// Mở thay đổi mật khẩu bằng Ajax
$('#btn-changepassword').click(function (e){
    var rpassword = $('#rnewpassword').val();
    clearTimeout(timeout);
    timeout = setTimeout(function () {
        var users = {};
        users["password"] = rpassword;
        var token = $("meta[name='_csrf']").attr("content");
        var header = $("meta[name='_csrf_header']").attr("content");
        $(document).ajaxSend(function (e, xhr, options) {
            xhr.setRequestHeader(header, token);
        });
        $.ajax({
            type: "POST",
            contentType: "application/json",
            url: contextPath+"/changepassword",
            data: JSON.stringify(users),
            //dataType: 'json',
            // timeout: 600000,
            success: function (result) {
                //alert(result);
                if (result == 'error') {
                    $('#msgerrorp').text("* Lỗi! Vui Lòng Kiểm Tra Lại");
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
// Đóng thay đổi mật khẩu bằng Ajax


