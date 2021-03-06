// Mở Load Gif Trang
$(document).ready(function () {
    $("#LoadingImage").show();
});
$(window).load(function () {
    // Animate loader off screen
    $("#LoadingImage").hide();
});
// Đóng Lòa Gif Trang

// Mở Captcha
function recaptchaCallback() {

    $('#btn-forgot').removeAttr('disabled');
};
// Đóng Captcha

// Mở Quay Lại Top
if ($('#back-to-top').length) {
    var scrollTrigger = 100, // px
        backToTop = function () {
            var scrollTop = $(window).scrollTop();
            if (scrollTop > scrollTrigger) {
                $('#back-to-top').addClass('show');
            } else {
                $('#back-to-top').removeClass('show');
            }
        };
    backToTop();
    $(window).on('scroll', function () {
        backToTop();
    });
    $('#back-to-top').on('click', function (e) {
        e.preventDefault();
        $('html,body').animate({
            scrollTop: 0
        }, 700);
    });
}
// Đóng Quay Lại Top

// Mở Tìm Kiếm
(function() {
    var morphSearch = document.getElementById( 'morphsearch' ),
        input = morphSearch.querySelector( 'input.morphsearch-input' ),
        ctrlClose = morphSearch.querySelector( 'span.morphsearch-close' ),
        isOpen = isAnimating = false,
        // show/hide search area
        toggleSearch = function(evt) {

            // return if open and the input gets focused
            if( evt.type.toLowerCase() === 'focus' && isOpen )  return false;

            var offsets = morphsearch.getBoundingClientRect();
            if( isOpen ) {
                $('#morphsearch').removeAttr("style");
                classie.remove( morphSearch, 'open' );

                // trick to hide input text once the search overlay closes
                // todo: hardcoded times, should be done after transition ends
                if( input.value !== '' ) {
                    setTimeout(function() {
                        classie.add( morphSearch, 'hideInput' );
                        setTimeout(function() {
                            classie.remove( morphSearch, 'hideInput' );
                            input.value = '';
                        }, 300 );
                    }, 500);
                }

                input.blur();
            }
            else {
                $('#morphsearch').css("position", "fixed");
                classie.add( morphSearch, 'open' );
            }
            isOpen = !isOpen;
        };

    // events
    input.addEventListener( 'focus', toggleSearch );
    ctrlClose.addEventListener( 'click', toggleSearch );
    // esc key closes search overlay
    // keyboard navigation events
    document.addEventListener( 'keydown', function( ev ) {

        var keyCode = ev.keyCode || ev.which;
        if( keyCode === 27 && isOpen ) {
            toggleSearch(ev);

        }
    } );

    /***** for demo purposes only: don't allow to submit the form *****/
    morphSearch.querySelector( 'button[type="submit"]' ).addEventListener( 'click', function(ev) { ev.preventDefault(); } );
})();

$('#inputsearch').keypress(function (e) {
    if (e.which == 13) {
        $('#formsearch').submit();
        return false;
    }
});
$('#btnsearch').click(function (){
    $('#formsearch').submit();
    return false;
});

// Đóng Tìm Kiếm

// Form Đăng Nhập
$(".modal_trigger").leanModal({
    top: 100,
    overlay: 0.6,
    closeButton: ".modal_close"

});
$(".modal_trigger").click(function () {
    $(".user_forgot").hide();
    $(".user_login").hide();
    $(".user_register").hide();
    $(".social_login").show();
});
$(function () {
    // Calling Login Form
    $("#login_form").click(function () {
        $(".social_login").hide();

        $(".user_login").show();
        return false;
    });

    // Calling Register Form
    $("#register_form").click(function () {
        $(".social_login").hide();
        $(".user_register").show();
        $(".header_title").text('Register');
        return false;
    });
    // Calling Forgot Password Form
    $("#forgot_password").click(function () {
        $(".social_login").hide();
        $(".user_login").hide();
        $(".user_register").hide();
        $(".user_forgot").show();
        $(".header_title").text('Lấy Lại Mật Khẩu');
        return false;
    });
    // Going back to Social Forms
    $(".back_btn").click(function () {
        $(".user_login").hide();
        $(".user_register").hide();
        $(".user_forgot").hide();
        $(".social_login").show();
        $(".header_title").text('Login');
        return false;
    });
});

// Đóng Form Đăng Nhập

// Mở Xử Lý Đăng Nhập , Đăng Ký, Quên Mật Khẩu Bằng Ajax
var timeout = null;
// Mở Đăng Nhập Bằng Ajax
function login() {
    console.log(($('#login-form').serialize()));
    clearTimeout(timeout);
    timeout = setTimeout(
        function () {

            var token = $("meta[name='_csrf']").attr("content");
            var header = $("meta[name='_csrf_header']").attr("content");
            $(document).ajaxSend(function (e, xhr, options) {
                xhr.setRequestHeader(header, token);
            });
            $
                .ajax({

                    type: "POST",
                    //contentType : "application/json",
                    url: "${pageContext.request.contextPath}/login",
                    data: $('#login-form').serialize(),
                    //dataType: 'json',
                    // timeout: 600000,
                    success: function (result) {
                        $("#LoadingImage").hide();

                        if (result == 'Bad credentials') {
                            $('#msgerror')
                                .text(
                                    '* Sai Tên Đăng Nhập Hoặc Mật Khẩu');
                        } else if (result == 'User account is locked') {
                            $('#msgerror').text(
                                '* Tài Khoản Đã Bị Khóa');
                        } else if (result == 'success') {
                            $('#msgerror').text('');
                            location.reload();

                        }

                    },
                    error: function (e) {
                        alert("Lỗi ! Vui Lòng Kiểm Tra Lại");
                    }
                });
        }, 1000);
};
// Đóng Đăng Nhập Bằng Ajax

// Mở Đăng Ký Bằng Ajax
function register() {
    clearTimeout(timeout);
    timeout = setTimeout(function () {

        var users = {};
        users["userName"] = $("#userNamer").val();
        users["email"] = $("#emailr").val();
        users["password"] = $("#rppasswordr").val();
        var token = $("meta[name='_csrf']").attr("content");
        var header = $("meta[name='_csrf_header']").attr("content");
        $(document).ajaxSend(function (e, xhr, options) {
            xhr.setRequestHeader(header, token);
        });
        $
            .ajax({

                type: "POST",
                contentType: "application/json",
                url: "${pageContext.request.contextPath}/register",
                data: JSON.stringify(users),
                //dataType: 'json',
                // timeout: 600000,
                success: function (result) {
                    $("#LoadingImage").hide();
                    console.log(result);
                    if (result == 'errorUserNameAndEmail') {
                        $("#userNamer").focus();
                        $('#msgerror-r').text('* Tên Đăng Nhập Và Email Đã Tồn Tại');
                    } else if (result == 'errorUserName') {

                        $("#userNamer").focus();
                        $('#msgerror-r').text('* Tên Đăng Nhập Đã Tồn Tại');
                    } else if (result == 'errorEmail') {

                        $("#emailr").focus();
                        $('#msgerror-r').text('* Email Đã Tồn Tại');
                    } else if (result == 'error') {
                        $('#msgerror-r').text('* Đăng Ký Thất Bại');
                    } else {
                        location.reload();
                    }

                },
                error: function (e) {
                    alert("Lỗi ! Vui Lòng Kiểm Tra Lại");
                }
            });
    }, 1000);
};
// Đóng Đăng Ký Bằng Ajax

// Mở Quên Mật Khẩu Bằng Ajax
function forgotpassword() {
    clearTimeout(timeout);
    timeout = setTimeout(function () {

        var userName = $('#userNamef').val();
        var token = $("meta[name='_csrf']").attr("content");
        var header = $("meta[name='_csrf_header']").attr("content");
        $(document).ajaxSend(function (e, xhr, options) {
            xhr.setRequestHeader(header, token);
        });
        $
            .ajax({
                type: "POST",
                contentType: "application/json",
                url: "${pageContext.request.contextPath}/user/forgotpassword",
                data: userName,
                //dataType: 'json',
                // timeout: 600000,
                success: function (result) {

                    grecaptcha.reset();

                    console.log(result);
                    if (result == 'error') {
                        $('#msgerror-f').text("* Tài Khoản Không Tồn Tại");
                    } else {
                        $('#msgerror-f').text(result);
                    }
                    var v = grecaptcha.getResponse();
                    if(v.length == 0)
                    {
                        $('#btn-forgot').attr('disabled', 'disabled');
                    }
                    $("#LoadingImage").hide();

                },
                error: function (e) {
                    alert("Lỗi ! Vui Lòng Kiểm Tra Lại");
                }
            });
    }, 1000);
};
// Đóng Quên Mật Khẩu Bằng Ajax
// Đóng Xử Lý Đăng Nhập , Đăng Ký, Quên Mật Khẩu Bằng Ajax

// Mở Validate Form Đăng Nhập, Đăng Ký, Quên Mật Khẩu
$('#btn-login').click(function () {

    var userName = $('#userName').val();
    var password = $('#password').val();
    if (userName == '' && password == '') {
        $('#msgerror').text('* Vui Lòng Nhập Đủ Thông Tin');
    } else if (userName == '') {
        $('#msgerror').text('* Vui Lòng Nhập UserName');
    } else if (password == '') {
        $('#msgerror').text('* Vui Lòng Nhập Mật Khẩu');
    } else {
        $("#LoadingImage").show();
        $('#msgerror').text('');
        login();
    }
});
$('#btn-register').click(function () {
    $("#LoadingImage").show();
    register();
});
$('#btn-forgot').click(function () {
    var userNamef = $('#userNamef').val();
    if (userNamef == '') {
        $('#msgerror-f').text("* Vui Lòng Nhập Tên Tài Khoản");
    } else {
        $("#LoadingImage").show();
        forgotpassword();
    }

});
$('#btn-forgotpassword').click(function () {
    var passwordfg = $('#passwordfg').val();
    var rppasswordfg = $('#rppasswordfg').val();
    console.log(passwordfg + rppasswordfg)
    if (passwordfg == '') {

        $('#msgerror-fp').text("* Vui Lòng Nhập Mật Khẩu Mới");
    }
    else if (rppasswordfg == '') {

        $('#msgerror-fp').text("* Vui Lòng Nhập Nhập Lại Mật Khẩu Mới");
    }
    else if (passwordfg != rppasswordfg) {
        $('#msgerror-fp').text("* Nhập Lại Mật Khẩu Không Trùng Khớp");
    } else {
        $('#btn-forgotpassword').attr("type", "submit");


    }

});

$('#register-form').on('keyup keydown', function () {
    $('#btn-register').prop("disabled", true);
    var userName = $('#userNamer').val();
    var email = $('#emailr').val();
    var password = $('#passwordr').val();
    var rppassword = $('#rppasswordr').val();
    var email_regex = /[A-Z0-9._%+-]+@[A-Z0-9-]+.+.[A-Z]{2,4}/igm;
    var regularExpression = /^(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{6,16}$/;
    console.log(email);
    if (userName == '') {
        $('#msgerror-r').text('* Vui Lòng Nhập UserName');
    }else if(userName.length < 6){
        $('#msgerror-r').text('* Tên Đăng Nhập Phải Lớn Hơn 6 Ký Tự');
    } else if (email == '') {
        $('#msgerror-r').text('* Vui Lòng Nhập Email');
    } else if (!email.match(email_regex)) {
        $('#msgerror-r').text('* Vui Lòng Nhập Đúng Email');
    } else if (password == '') {
        $('#msgerror-r').text('* Vui Lòng Nhập Mật Khẩu');
    } else if(!password.match(regularExpression)){
        $('#msgerror-r').text('* Mật Khẩu Từ 6 -16 Ký Tự Bao Gồm Chữ, Số Và Ký Tự Đặc Biệt');
    }
    else if (rppassword == '') {
        $('#msgerror-r').text('* Vui Lòng Nhập Nhập Lại Mật Khẩu');
    } else if (rppassword != password) {
        $('#msgerror-r').text('* Nhập Lại Mật Khẩu Không Khớp');
    } else {
        $('#btn-register').prop("disabled", false);
        //$("#LoadingImage").show();
        $('#msgerror-r').text('');

    }
});
// Đóng Validate Form Đăng Nhập, Đăng Ký, Quên Mật Khẩu

// Mở Đăng Nhập Bằng Google
var firstLogin = 0;

$('#btn-google').click(function () {
    firstLogin = 1;
});

function onSignIn(googleUser) {

    // The ID token you need to pass to your backend:
    var id_token = googleUser.getAuthResponse().id_token;
    console.log("id_token: " + id_token);
    var token = $("meta[name='_csrf']").attr("content");
    var header = $("meta[name='_csrf_header']").attr("content");
    $(document).ajaxSend(function (e, xhr, options) {
        xhr.setRequestHeader(header, token);

    });
    $.ajax({
        type: "POST",
        contentType: "application/json",
        url: "${pageContext.request.contextPath}/signin-google",
        data: id_token,
        //dataType: 'json',
        // timeout: 600000,
        success: function (result) {
            $("#LoadingImage").hide();
            console.log(result);
            if (firstLogin == 1) {
                firstLogin = 0;
                location.reload();
            }
        },
        error: function (e) {
            alert("Lỗi ! Vui Lòng Kiểm Tra Lại");
        }
    });

}
// ĐÓng Đăng Nhập Bằng Google

// Mở Đăng Xuất Bằng Google

function signOut() {
    firstLogin = 0;
    var auth2 = gapi.auth2.getAuthInstance();
    auth2.signOut().then(function () {
        console.log('User signed out.');

        location.reload();
    });
}
// ĐÓng Đăng Xuất Bằng Google