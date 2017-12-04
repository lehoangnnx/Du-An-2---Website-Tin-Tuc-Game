/*window.onload = function () {
    var loadTime = window.performance.timing.domContentLoadedEventEnd
        - window.performance.timing.navigationStart;
    console.log('Page load time is ' + loadTime);
}*/

jQuery(function ($) {
    $('.rvs-container').rvslider();
});

jQuery(".widget-tabbed > h3 span", ".sidebar").on(
    "click",
    function () {
        var thisel = jQuery(this);
        thisel.addClass("active").siblings(".active").removeClass(
            "active").parent().siblings("div").eq(thisel.index())
            .addClass("active").siblings(".active").removeClass(
            "active");
        return false;
    });


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
(function () {
    var morphSearch = document.getElementById('morphsearch'), input = morphSearch
            .querySelector('input.morphsearch-input'), ctrlClose = morphSearch
            .querySelector('span.morphsearch-close'), isOpen = isAnimating = false,
        // show/hide search area
        toggleSearch = function (evt) {

            // return if open and the input gets focused
            if (evt.type.toLowerCase() === 'focus' && isOpen)
                return false;

            var offsets = morphsearch.getBoundingClientRect();
            if (isOpen) {
                $('#morphsearch').removeAttr("style");
                classie.remove(morphSearch, 'open');

                // trick to hide input text once the search overlay closes
                // todo: hardcoded times, should be done after transition ends
                if (input.value !== '') {
                    setTimeout(function () {
                        classie.add(morphSearch, 'hideInput');
                        setTimeout(function () {
                            classie.remove(morphSearch, 'hideInput');
                            input.value = '';
                        }, 300);
                    }, 500);
                }

                input.blur();
            } else {
                $('#morphsearch').css("position", "fixed");
                classie.add(morphSearch, 'open');
            }
            isOpen = !isOpen;
        };

    // events
    input.addEventListener('focus', toggleSearch);
    ctrlClose.addEventListener('click', toggleSearch);
    // esc key closes search overlay
    // keyboard navigation events
    document.addEventListener('keydown', function (ev) {

        var keyCode = ev.keyCode || ev.which;
        if (keyCode === 27 && isOpen) {
            toggleSearch(ev);

        }
    });

    /***** for demo purposes only: don't allow to submit the form *****/
    morphSearch.querySelector('button[type="submit"]').addEventListener(
        'click', function (ev) {
            ev.preventDefault();
        });
})();

$('#inputsearch').keypress(function (e) {
    if (e.which == 13) {
        $('#formsearch').submit();
        return false;
    }
});
$('#btnsearch').click(function () {
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
        $(".header_title").text('Đăng Ký');
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
        $(".header_title").text('Đăng Nhập');
        return false;
    });
});

// Đóng Form Đăng Nhập

// Mở Xử Lý Đăng Nhập , Đăng Ký, Quên Mật Khẩu Bằng Ajax
var timeout = null;

// Mở Đăng Nhập Bằng Ajax
function login() {

    clearTimeout(timeout);
    timeout = setTimeout(function () {
        var data = $('#login-form').serialize();
        var token = $("meta[name='_csrf']").attr("content");
        var header = $("meta[name='_csrf_header']").attr("content");
        $(document).ajaxSend(function (e, xhr, options) {
            xhr.setRequestHeader(header, token);
        });

        $.ajax({
            type: "POST",
            //contentType : "application/json",
            url: contextPath+"/login",
            data: data ,
            //dataType: 'json',
            // timeout: 600000,
            success: function (result) {
                $("#LoadingImage").hide();
                if (result == "Bad credentials") {
                    $('#msgerror')
                        .text("* Sai Tên Đăng Nhập Hoặc Mật Khẩu");
                } else if (result == 'User account is locked') {
                    $('#msgerror').text("* Tài Khoản Đã Bị Khóa");
                } else if (result == "success") {
                    $('#msgerror').text('');
                    location.reload();
                }

            },
            error: function(xhr, status, error) {
                $("#LoadingImage").hide();
                /*var err = eval("(" + xhr.responseText + ")");
                alert("Lỗi ! Đăng Nhập");*/

            }
        });
    }, 100);
};
// Đóng Đăng Nhập Bằng Ajax

// Mở Đăng Ký Bằng Ajax
function register() {
    clearTimeout(timeout);
    timeout = setTimeout(function () {

        var users = {};
        users["userName"] = $("#userNamer").val().trim();
        users["email"] = $("#emailr").val().trim();
        users["password"] = $("#rppasswordr").val().trim();
        var token = $("meta[name='_csrf']").attr("content");
        var header = $("meta[name='_csrf_header']").attr("content");
        $(document).ajaxSend(function (e, xhr, options) {
            xhr.setRequestHeader(header, token);
        });
        $.ajax({

            type: "POST",
            contentType: "application/json",
            url: contextPath+"/register",
            data: JSON.stringify(users),
            //dataType: 'json',
            // timeout: 600000,
            success: function (result) {
                $("#LoadingImage").hide();
                console.log(result);
                if (result == 'errorUserNameAndEmail') {
                    $("#userNamer").focus();
                    $('#msgerror-r').text(
                        '* Tên Đăng Nhập Và Email Đã Tồn Tại');
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
                $("#LoadingImage").hide();
               // alert("Lỗi ! Đăng Ký");
            }
        });
    }, 100);
};
// Đóng Đăng Ký Bằng Ajax

// Mở Quên Mật Khẩu Bằng Ajax
function forgotpassword() {
    clearTimeout(timeout);
    timeout = setTimeout(function () {

        var userName = $('#userNamef').val().trim();
        var token = $("meta[name='_csrf']").attr("content");
        var header = $("meta[name='_csrf_header']").attr("content");
        $(document).ajaxSend(function (e, xhr, options) {
            xhr.setRequestHeader(header, token);
        });
        $.ajax({
            type: "POST",
            contentType: "application/json",
            url: contextPath+"/user/forgotpassword",
            data: userName,
            //dataType: 'json',
            // timeout: 600000,
            success: function (result) {

                grecaptcha.reset();

                if (result == 'error') {
                    $('#msgerror-f').text("* Tài Khoản Không Tồn Tại");
                } else {
                    $('#msgerror-f').text(result);
                }
                var v = grecaptcha.getResponse();
                if (v.length == 0) {
                    $('#btn-forgot').attr('disabled', 'disabled');
                }
                $("#LoadingImage").hide();

            },
            error: function (e) {
                $("#LoadingImage").hide();
               // alert("Lỗi ! Quên Mật Khẩu");
            }
        });
    }, 100);
};
// Đóng Quên Mật Khẩu Bằng Ajax
// Đóng Xử Lý Đăng Nhập , Đăng Ký, Quên Mật Khẩu Bằng Ajax

// Mở Validate Form Đăng Nhập, Đăng Ký, Quên Mật Khẩu

// Enter form đăng nhập
$('#password').keypress(function(event) {
    if (event.keyCode == 13 || event.which == 13) {
    	checklogin();
    }
});
$('#btn-login').click(function () {
	checklogin();
   
});
function checklogin(){
	 var userName = $('#userName').val().trim();
	    var password = $('#password').val().trim();
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
};
//

// Enter form đăng ký
$('#rppasswordr').keypress(function(event) {
    if (event.keyCode == 13 || event.which == 13) {
        if(checkregister()){
            $("#LoadingImage").show();
            register();
        }
    }
});
$('#btn-register').click(function () {

    if(checkregister()){
        $("#LoadingImage").show();
        register();
    }
});
$('#register-form').on('keyup keydown', function () {
	checkregister();
   
});
function checkregister(){
	 var userName = $('#userNamer').val().trim();
	    var email = $('#emailr').val().trim();
	    var password = $('#passwordr').val().trim();
	    var rppassword = $('#rppasswordr').val().trim();
	    var email_regex = /[A-Z0-9._%+-]+@[A-Z0-9-]+.+.[A-Z]{2,4}/igm;
	    var regularExpression = /^(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{6,16}$/;
	    console.log(email);
	    if (userName == '') {
	        $('#msgerror-r').text('* Vui Lòng Nhập UserName');
	        return false;
	    } else if (userName.length < 6 || userName.length > 16 ) {
	        $('#msgerror-r').text(
	            '* Tên Đăng Nhập Từ 6 - 16 Ký Tự');
            return false;
	    } else if (email == '') {
	        $('#msgerror-r').text('* Vui Lòng Nhập Email');
            return false;
	    } else if (!email.match(email_regex)) {
	        $('#msgerror-r').text('* Vui Lòng Nhập Đúng Email');
            return false;
	    } else if (password == '') {
	        $('#msgerror-r').text('* Vui Lòng Nhập Mật Khẩu');
            return false;
	    } else if (!password.match(regularExpression)) {
	        $('#msgerror-r')
	            .text(
	                '* Mật Khẩu Từ 6 -16 Ký Tự Bao Gồm Chữ, Số Và Ký Tự Đặc Biệt');
            return false;
	    } else if (rppassword == '') {
	        $('#msgerror-r').text(
	            '* Vui Lòng Nhập Nhập Lại Mật Khẩu');
            return false;
	    } else if (rppassword != password) {
	        $('#msgerror-r').text(
	            '* Nhập Lại Mật Khẩu Không Khớp');
            return false;
	    } else {
	        $('#btn-register').prop("disabled", false);
	        //$("#LoadingImage").show();
	        $('#msgerror-r').text('');
            return true;


	    }
};
//
// enter form quên mật khẩu

$('#btn-forgot').click(function () {
	checkforgot();

});
$('#userNamef').keypress(function(event) {
	
    if (event.keyCode == 13 || event.which == 13) {
    	
            checkforgot();
            event.preventDefault();
        
    }
});

function checkforgot(){
	 var userNamef = $('#userNamef').val().trim();
	 var v = grecaptcha.getResponse();
	    if (userNamef == '') {
	        $('#msgerror-f').text("* Vui Lòng Nhập Tên Tài Khoản");
	    } 
	    else if(v.length == 0)
        {
            document.getElementById('msgerror-f').innerHTML="* Vui Lòng Xác Nhập Captcha";
           
        }else {
	        $("#LoadingImage").show();
	        forgotpassword();

	    }
};
//
$('#rppasswordfg').keypress(function(event) {

    if (event.keyCode == 13 || event.which == 13) {

        checkupdateforgotpassword();

    }
});
$('#btn-forgotpassword').click(function () {
    checkupdateforgotpassword();

});

function checkupdateforgotpassword() {
    var passwordfg = $('#passwordfg').val().trim();
    var rppasswordfg = $('#rppasswordfg').val().trim();
    var regularExpression = /^(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{6,16}$/;
    if (passwordfg == '') {

        $('#msgerror-fp').text("* Vui Lòng Nhập Mật Khẩu Mới");
    } else if (!passwordfg.match(regularExpression)) {
        $('#msgerror-fp').text("* Mật Khẩu Từ 6 -16 Ký Tự Bao Gồm Chữ, Số Và Ký Tự Đặc Biệt");
    } else if (rppasswordfg == '') {

        $('#msgerror-fp').text("* Vui Lòng Nhập Nhập Lại Mật Khẩu Mới");
    } else if (passwordfg != rppasswordfg) {
        $('#msgerror-fp').text("* Nhập Lại Mật Khẩu Không Trùng Khớp");
    } else {
        $('#btn-forgotpassword').attr("type", "submit");

    }
};


// Đóng Validate Form Đăng Nhập, Đăng Ký, Quên Mật Khẩu


// Mở Đăng Nhập Bằng Facebook
window.fbAsyncInit = function () {
    //SDK loaded, initialize it
    FB.init({
        appId: '1223420154469580',
        xfbml: true,
        version: 'v2.11'
    });

    //check user session and refresh it
    FB.getLoginStatus(function (response) {
        if (response.status === 'connected') {
            //user is authorized

        } else if (response.status === 'not_authorized') {
            // the user is logged in to Facebook,
            // but has not authenticated your app

        } else {
            // the user isn't logged in to Facebook.

        }
    });
};

//load the JavaScript SDK
(function (d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) {
        return;
    }
    js = d.createElement(s);
    js.id = id;
    js.src = "//connect.facebook.com/en_US/sdk.js";
    fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));

document.getElementById('btn-facebook').addEventListener('click', function () {
    //do the login
    FB.login(function (response) {
        if (response.authResponse) {
            //user just authorized your app
            var accessToken = response.authResponse.accessToken;
            var token = $("meta[name='_csrf']").attr("content");
            var header = $("meta[name='_csrf_header']").attr("content");
            $(document).ajaxSend(function (e, xhr, options) {
                xhr.setRequestHeader(header, token);

            });
            $.ajax({
                type: "POST",
                contentType: "application/json",
                url: contextPath+"/signin-facebook",
                data: accessToken,
                //dataType: 'json',
                // timeout: 600000,
                success: function (result) {
                    if (result == "success") {
                        location.reload();
                    }
                },
                error: function (e) {
                 //   alert("Lỗi ! Đăng Nhập FaceBook");
                }
            });

        }
    }, {scope: 'email,public_profile', return_scopes: true});
}, false);
// Đóng Đăng Nhập Bằng Facebook

// Mở Đăng Xuất Bằng Facebook
function logoutFacebook() {
    FB.logout(function (response) {
    });
};
// Đóng Đăng Xuất Bằng Facebook

// Mở Đăng Nhập Bằng Google
var googleUser = {};
var startApp = function () {
    gapi.load('auth2', function () {
        // Retrieve the singleton for the GoogleAuth library and set up the client.
        auth2 = gapi.auth2.init({
            client_id: '957067339527-2a7jir87qgufa498et556ke87d8lv5sb.apps.googleusercontent.com',
            cookiepolicy: 'single_host_origin',
            // Request scopes in addition to 'profile' and 'email'
            //scope: 'additional_scope'
        });
        attachSignin(document.getElementById('btn-google'));
    });
};

function attachSignin(element) {
    //console.log(element.id);
    auth2.attachClickHandler(element, {},
        function (googleUser) {
            var id_token = googleUser.getAuthResponse().id_token;
            var token = $("meta[name='_csrf']").attr("content");
            var header = $("meta[name='_csrf_header']").attr("content");
            $(document).ajaxSend(function (e, xhr, options) {
                xhr.setRequestHeader(header, token);

            });
            $.ajax({
                type: "POST",
                contentType: "application/json",
                url: contextPath+"/signin-google",
                data: id_token,
                //dataType: 'json',
                // timeout: 600000,
                success: function (result) {
                    $("#LoadingImage").hide();
                    location.reload();
                },
                error: function (e) {
                    //alert("Lỗi ! Đăng Nhập Google");
                }
            });
        }, function (error) {

            //alert(JSON.stringify(error, undefined, 2)+"ĐÓng Của Sổ");
        });
}

startApp();
// Đóng Đăng Nhập Bằng Google

// Mở Đăng Xuất Bằng Google
function signOut() {
    firstLogin = 0;
    var auth2 = gapi.auth2.getAuthInstance();
    auth2.signOut().then(function () {

    });
}

// ĐÓng Đăng Xuất Bằng Google

// Mở Đăng Xuất
$('#btn-logout').click(function () {
    clearTimeout(timeout);
    timeout = setTimeout(function () {
        var token = $("meta[name='_csrf']").attr("content");
        var header = $("meta[name='_csrf_header']").attr("content");
        $(document).ajaxSend(function (e, xhr, options) {
            xhr.setRequestHeader(header, token);
        });

        $.ajax({
            type: "POST",
            url: contextPath+"/logout",
            success: function (result) {
                $("#LoadingImage").hide();
                if (result == "success") {
                    signOut();
                    logoutFacebook();
                    location.reload();
                }
            },
            error: function(xhr, status, error) {
                $("#LoadingImage").hide();
                /*var err = eval("(" + xhr.responseText + ")");
                alert("Lỗi Đăng Xuất");*/
                location.reload();
            }
        });
    }, 10);
});
//Đóng Đăng xuất
