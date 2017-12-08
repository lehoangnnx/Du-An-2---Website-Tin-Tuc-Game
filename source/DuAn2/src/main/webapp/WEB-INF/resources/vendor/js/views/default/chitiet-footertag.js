

// Thích Bài Viết

$('#likearticle').click(function () {

    clearTimeout(timeout);
    timeout = setTimeout(function () {

            fnlikearticle();

    }, 300);

    function fnlikearticle() {
        var articleId = $('#articleId').val();
        var token = $("meta[name='_csrf']").attr("content");
        var header = $("meta[name='_csrf_header']").attr("content");
        $(document).ajaxSend(function (e, xhr, options) {
            xhr.setRequestHeader(header, token);
        });
        $.ajax({
            type: "POST",
            //contentType: "application/json",
            url: contextPath+"/likearticles",
            data: {
                articleId: articleId,
                status: status
            },
            //dataType: 'json',
            // timeout: 600000,
            success: function (result) {
                var numberUserArticleLike = Number($('#numberUserArticleLike').text());
                if(result == true){
                    $('#textlike').text('Bỏ Thích');
                    $('#msglikearticle').html("<b>Bạn</b> Và <span id=\"numberUserArticleLike\"> " + numberUserArticleLike + " </span> người khác thích bài viết này");

                }else {
                    $('#textlike').text('Thích');
                    $('#msglikearticle').html("<b id= \"numberUserArticleLike\" > " + numberUserArticleLike + "</b> người khác thích bài viết này");

                }
            },
            error: function (e) {
               // alert("Lỗi ! Vui Lòng Kiểm Tra Lại");
            }
        });
    };
})

// Đánh Giá Game

function gamereivews(starreview) {
    clearTimeout(timeout);
    timeout = setTimeout(function () {
        var gameId = $('#gameId').val();
        var token = $("meta[name='_csrf']").attr("content");
        var header = $("meta[name='_csrf_header']").attr("content");
        $(document).ajaxSend(function (e, xhr, options) {
            xhr.setRequestHeader(header, token);

        });
        $.ajax({
            type: "POST",
            //contentType: "application/json",
            url: contextPath+"/saveorupdategamereviews",
            data: {
                gameId: gameId,
                starreview: starreview
            },
            //dataType: 'json',
            // timeout: 600000,
            success: function (result) {

            },
            error: function (e) {
              //  alert("Lỗi ! Vui Lòng Kiểm Tra Lại");
            }
        });
    }, 300);

}



$('#content').on('keyup keypress keydown', function () {
	
	var content = $('#content').val().trim();
    if (content != '') {
        $('#msgsubcomment').text('');
        $('#btn-newcomment').removeAttr('disabled');
    } else {
        $('#msgsubcomment').text(' Vui Lòng Nhập Nội Dung Bình Luận.');
        $('#btn-newcomment').attr('disabled', 'disabled');
    }
});


function checkcontent(commentId) {
    var content = $('#content' + commentId).val().trim();
    if (content != '') {

        $('#btn-replycomment' + commentId).removeAttr('disabled');
        $('#btn-updatecomment' + commentId).removeAttr('disabled');

    } else {

        $('#btn-replycomment' + commentId).attr('disabled', 'disabled');
        $('#btn-updatecomment' + commentId).attr('disabled', 'disabled');
    }
};

function replysubcomment(userName, avatar, commentId, subCommentId, usersBySubUserId, usersBySubUserName) {
    $('#showreplycomment' + commentId).html("<a href=\"javascript:void(0)\" class=\"image-avatar\"> <img src=\"" + avatar + "\" data-ot-retina=\"" + avatar + "\" alt=\"\" title=\"\">\n" +
        " </a>\n" +
        " <div class=\"comment-text\" style=\"width: auto; overflow: hidden;\">\n" +
        " <strong class=\"user-nick\"><a href=\"javascript:void(0)\">" + userName + "</a> <span id=\"msgsubcomment" + commentId + "\"></span></strong>\n" +
        "<textarea onkeydown=\"checkcontent(" + commentId + ");\" onkeyup=\"checkcontent(" + commentId + ");\" onkeypress=\"checkcontent(" + commentId + ");\" id=\"content" + commentId + "\" name=\"content\" placeholder=\"Viết bình luận của bạn...\" style=\"width: 100%; height: 100px;\"></textarea>\n" +
        " <p class=\"form-submit\">\n" +
        " <input id=\"btn-replycomment" + commentId + "\" disabled name=\"submit\" type=\"submit\" onclick=\"postreplycomment(" + commentId + "," + subCommentId + "," + usersBySubUserId + ");\" class=\"submit button\" value=\"Trả Lời\">\n" +
        " <input onclick=\"cancelsubcomment(" + commentId + ");\"  name=\"submit\" type=\"submit\"  class=\"submit button pull-right\" value=\"Hủy\">\n" +
        " </p>\n" +
        " </div>\n");
    $('#msgsubcomment' + commentId).text('Bạn Đang Trả Lời ' + usersBySubUserName);
    $('#usersBySubUserId').val(usersBySubUserId);
    $('#subCommentId').val(subCommentId);
    return false;

};

function showUpdateComment(userName, avatar, commentId, subCommentId, usersBySubUserId, usersBySubUserName) {
    $('#showreplycomment' + commentId).html("<a href=\"javascript:void(0)\" class=\"image-avatar\"> <img src=\"" + avatar + "\" data-ot-retina=\"" + avatar + "\" alt=\"\" title=\"\">\n" +
        " </a>\n" +
        " <div class=\"comment-text\" style=\"width: auto; overflow: hidden;\">\n" +
        " <strong class=\"user-nick\"><a href=\"javascript:void(0)\">" + userName + "</a> <span id=\"msgsubcomment" + commentId + "\"></span></strong>\n" +
        "<textarea onkeydown=\"checkcontent(" + commentId + ");\" onkeyup=\"checkcontent(" + commentId + ");\" onkeypress=\"checkcontent(" + commentId + ");\" id=\"content" + commentId + "\" name=\"content\" placeholder=\"Viết bình luận của bạn..\" style=\"width: 100%; height: 100px;\"></textarea>\n" +
        " <p class=\"form-submit\">\n" +
        " <input id=\"btn-updatecomment" + commentId + "\" disabled name=\"submit\" type=\"submit\" onclick=\"postupdatecomment(" + commentId + ");\" class=\"submit button\" value=\"Sửa\">\n" +
        " <input onclick=\"cancelsubcomment(" + commentId + ");\"  name=\"submit\" type=\"submit\"  class=\"submit button pull-right\" value=\"Hủy\">\n" +
        " </p>\n" +
        " </div>\n");
    $('#msgsubcomment' + commentId).text('Bạn Đang Sửa Bình Luận');
    var content = $('#spanContent' + commentId).text();
    $('#content' + commentId).val(content);
    return false;

};

function cancelsubcomment(commentId) {

    $('#showreplycomment' + commentId).empty();

};

// Sửa Bình Luận
function postupdatecomment(commentId) {
    clearTimeout(timeout);
    timeout = setTimeout(function () {
        
        var content = $('#content' + commentId).val().trim();
        var token = $("meta[name='_csrf']").attr("content");
        var header = $("meta[name='_csrf_header']").attr("content");
        $(document).ajaxSend(function (e, xhr, options) {
            xhr.setRequestHeader(header, token);

        });
        $.ajax({
            type: "POST",
            //contentType: "application/json",
            url: contextPath+"/updatecomment",
            data: {
                commentId: commentId,
                content: content
            },
            //dataType: 'json',
            // timeout: 600000,
            success: function (result) {
                
                $('#spanContent' + commentId).text(content);
                $('#showreplycomment' + commentId).empty();
            },
            error: function (e) {
               
                //alert("Lỗi ! Vui Lòng Kiểm Tra Lại");
            }
        });

    }, 100);
};

// Trả Lời Bình Luận
function postreplycomment(commentId, subCommentId, usersBySubUserId) {
    clearTimeout(timeout);
    timeout = setTimeout(function () {
        

        var articleId = $('#articleId').val();
        var content = $('#content' + commentId).val().trim();
        var token = $("meta[name='_csrf']").attr("content");
        var header = $("meta[name='_csrf_header']").attr("content");
        $(document).ajaxSend(function (e, xhr, options) {
            xhr.setRequestHeader(header, token);

        });
        $.ajax({
            type: "POST",
            //contentType: "application/json",
            url: contextPath+"/replycomment",
            data: {
                subCommentId: subCommentId,
                articleId: articleId,
                content: content,
                usersBySubUserId: usersBySubUserId
            },
            //dataType: 'json',
            // timeout: 600000,
            success: function (result) {
                
                var childcomment = "";

                for (var j = 0; j < Object.keys(result.commentchild).length; j++) {
                    if (result.commentchild[j].subCommentId !== 0 && result.commentchild[j].subCommentId === subCommentId) {
                        var checkuserIdLoginCommentChild = '';
                        if (result.userIdLogin != result.commentchild[j].usersByUserId) {
                            checkuserIdLoginCommentChild = " <span class=\"item-meta\"> <a href=\"javascript:void(0)\"><i\n" +
                                "      class=\"fa fa-thumbs-o-up\"></i> Thích</a>\n" +
                                "       <a class=\"replycomment\"\n" +
                                "       onclick=\"replysubcomment('" + result.userName + "' ,'" + result.avatar + "' ," + result.commentchild[j].commentId + "," + subCommentId + "," + result.commentchild[j].usersByUserId + ",'" + result.commentchild[j].usersByUserUserName + "' );\"\n" +
                                "        href=\"javascript:void(0)\"><i\n" +
                                "       class=\"fa fa-comment-o\"\n" +
                                "      style=\"margin-left: 25px;\"></i> \n" +
                                "Bình luận</a>\n" +
                                "</span> \n";
                        }
                        var editcommentchild = "";
                        if (result.roleEditComment == true || result.userIdLogin == result.commentchild[j].usersByUserId) {
                            editcommentchild = "<div class=\"dropdown time-stamp pull-right right\">\n" +
                                "   <button onclick=\"myFunction(" + result.commentchild[j].commentId + ")\" class=\"dropbtn fa fa-ellipsis-h\" style=\"color: #0b0b0b\"></button>\n" +
                                "  <div id=\"myDropdown" + result.commentchild[j].commentId + "\" class=\"dropdown-content\">\n" +
                                "  <a onclick=\"showModelDeleteComment(" + result.commentchild[j].commentId + ");\" href=\"javascript:void(0)\" data-toggle=\"modal\" data-target=\"#myModal\" >Xóa</a>\n" +
                                "   <a onclick=\"showUpdateComment('" + result.userName + "' ,'" + result.avatar + "' ," + result.commentchild[j].commentId + "," + subCommentId + "," + result.commentchild[j].usersByUserId + ",'" + result.commentchild[j].usersByUserUserName + "' );\" href=\"javascript:void(0)\">Sửa</a>\n" +
                                "   </div>\n" +
                                "  </div>";
                        }

                        childcomment += "<ul style=\"background-color: aliceblue;\" class=\"children\">\n" +
                            "   <li class=\"comment\">\n" +
                            "    <div class=\"comment-block\">\n" +
                            "    <a href=\"javascript:void(0)\" class=\"image-avatar\"> <img\n" +
                            "    src=\"" + result.commentchild[j].usersByUserAvatar + "\"\n" +
                            "    data-ot-retina=\"" + result.commentchild[j].usersByUserAvatar + "\"\n" +
                            "     alt=\"\"\n" +
                            "     title=\"\">\n" +
                            "     </a>\n" +
                            "     <div class=\"comment-text\">\n" +
                            "     <strong\n" +
                            "     class=\"user-nick\">" +
                            editcommentchild +
                            "<a href=\"javascript:void(0)\">" + result.commentchild[j].usersByUserUserName + "</a>\n" +

                            "<span style=\"margin-top: 5px;\" class=\"time-stamp \">" + result.commentchild[j].modifiedDate + "</span>\n" +
                            "</strong>\n" +
                            "        <div class=\"shortcode-content\">\n" +
                            "         <p style=\"color: #ABABAB\">\n" +
                            "        <a style=\"color: #0c91e5;\"\n" +
                            "      href=\"\">@" + result.commentchild[j].usersBySubUserUserName + "</a>\n" +
                            "     <span id=\"spanContent" + result.commentchild[j].commentId + "\">" + result.commentchild[j].content + " </span> </p>\n" +
                            "         </div>\n" +
                            checkuserIdLoginCommentChild +
                            " </div>\n" +
                            "<div class=\"comment-text\">\n" +
                            "   <div id=\"showreplycomment" + result.commentchild[j].commentId + "\" class=\"comment-block\" style=\" margin:0px; margin-top:25px; \">\n" +

                            "   </div>\n" +

                            "</div>\n" +
                            " </div>\n" +
                            "  </li>\n" +
                            "    </ul>\n";
                    }
                }

                $('#childcomment' + subCommentId).html(childcomment);
                $('#showreplycomment' + commentId).empty();
                $('html, body').animate({
                    scrollTop: $("#comment" + subCommentId).offset().top
                }, 500);
            },
            error: function (e) {
                
              //  alert("Lỗi ! Vui Lòng Kiểm Tra Lại");
            }
        });

    }, 100);
};


//Tạo Mới Bình Luận
$('.btn-postcomment').click(function () {
    clearTimeout(timeout);
    timeout = setTimeout(function () {
        

        var articleId = $('#articleId').val();
        var content = $('#content').val().trim();
        var token = $("meta[name='_csrf']").attr("content");
        var header = $("meta[name='_csrf_header']").attr("content");
        $(document).ajaxSend(function (e, xhr, options) {
            xhr.setRequestHeader(header, token);

        });
        $.ajax({
            type: "POST",
            //contentType: "application/json",
            url: contextPath+"/newcomment",
            data: {
                articleId: articleId,
                content: content
            },
            //dataType: 'json',
            // timeout: 600000,
            success: function (result) {
               
              
                $('#content').val('');
                var html = '';

                            var checkuserIdLoginCommentParemt = '';
                            if (result.userIdLogin != result.usersByUserId) {
                                var statusofusercommentlike = "";
                                if(result.statusofusercommentlike == true){
                                    statusofusercommentlike = " Bỏ Thích";
                                }else {
                                    statusofusercommentlike = " Thích";
                                }
                                checkuserIdLoginCommentParemt = " <span class=\"item-meta\"> " +
                                    "<a href=\"javascript:void(0);\" onclick=\"commentlike("+result.commentId+");\">" +
                                    "<span id=\"countcommentlike"+result.commentId+"\" " +
                                    "style=\"margin:10px;\">"+result.countcommentlike+"</span><i\n" +
                                    "    class=\"fa fa-thumbs-o-up\"></i><span id=\"statuscommentlike"+result.commentId+"\" " +
                                    "style=\"margin:5px;\">"+statusofusercommentlike+"</span> </a>\n" +
                                    "    <a class=\"replycomment\" href=\"javascript:void(0)\"\n" +
                                    "     onclick=\"replysubcomment('" + result.userName + "' ,'" + result.avatar + "' ," + result.commentId + "," + result.commentId + "," + result.usersByUserId + ",'" + result.usersByUserUserName + "');\">\n" +
                                    "     <i class=\"fa fa-comment-o\" style=\"margin-left: 25px;\"></i> Bình\n" +
                                    "luận</a>\n" +
                                    "</span>\n";
                            }
                            var editcommentparen = "";
                            if (result.roleEditComment == true || result.userIdLogin == result.usersByUserId) {
                                editcommentparen = "<div class=\"dropdown time-stamp pull-right right\">\n" +
                                    "   <button onclick=\"myFunction(" + result.commentId + ")\" class=\"dropbtn fa fa-ellipsis-h\" style=\"color: #0b0b0b\"></button>\n" +
                                    "  <div id=\"myDropdown" + result.commentId + "\" class=\"dropdown-content\">\n" +
                                    "  <a onclick=\"showModelDeleteComment(" + result.commentId + ");\" href=\"javascript:void(0)\"data-toggle=\"modal\" data-target=\"#myModal\" >Xóa</a>\n" +
                                    "   <a onclick=\"showUpdateComment('" + result.userName + "' ,'" + result.avatar + "' ," + result.commentId + "," + result.commentId + "," + result.usersByUserId + ",'" + result.usersByUserUserName + "');\" href=\"javascript:void(0)\">Sửa</a>\n" +
                                    "   </div>\n" +
                                    "  </div>";
                            }
                            html += "  <li  class=\"comment\">\n" +
                                " <div id=\"comment" + result.commentId + "\" class=\"comment-block\">\n" +
                                "  <a href=\"javascript:void(0)\" class=\"image-avatar\"> <img\n" +
                                "  src=\" " + result.usersByUserAvatar + " \" \n" +
                                "   data-ot-retina=\"" + result.usersByUserAvatar + " \"\n" +
                                "   alt=\"\"\n" +
                                "   title=\"\">\n" +
                                "    </a>\n" +
                                "   <div class=\"comment-text\">\n" +
                                "    <strong\n" +
                                "   class=\"user-nick\">" +
                                editcommentparen +
                                "<a href=\"javascript:void(0)\"> " + result.usersByUserUserName + " </a>" +
                                "<span style=\"margin-top: 5px;\" class=\"time-stamp \">" + result.modifiedDate + "</span>" +
                                "</strong>\n" +
                                "       <div class=\"shortcode-content\">\n" +
                                "     <p id=\"spanContent" + result.commentId + "\">" + result.content + "</p>\n" +
                                "    </div>\n" +
                                checkuserIdLoginCommentParemt +
                                "   </div>\n" +
                                "<div class=\"comment-text\">\n" +
                                "   <div id=\"showreplycomment" + result.commentId + "\" class=\"comment-block\" style=\" margin-top:25px; \">\n" +
                                "   </div>\n" +
                                "</div> \n" +
                                "  </div>\n" +
                                "<div id=\"childcomment" + result.commentId + "\" >\n" +
                                "</div>\n" +
                                "   </li>\n";
                $('#btn-newcomment').attr('disabled', 'disabled');
                $('#comments').prepend(html);
                $('html, body').animate({
                    scrollTop: $(".article-main-next-prev").offset().top
                }, 500);

            },
            error: function (e) {
                
               // alert("Lỗi ! Tạo Bình Luận");
            }
        });


    }, 100);

});

// Like Bình Luận
function commentlike(commentId) {
    clearTimeout(timeout);
    timeout = setTimeout(function () {
        var token = $("meta[name='_csrf']").attr("content");
        var header = $("meta[name='_csrf_header']").attr("content");
        $(document).ajaxSend(function (e, xhr, options) {
            xhr.setRequestHeader(header, token);
        });
        $.ajax({
            type: "POST",
            //contentType: "application/json",
            url: contextPath+"/commentlike",
            data: {
                commentId: commentId
            },
            //dataType: 'json',
            // timeout: 600000,
            success: function (result) {
                $('#countcommentlike'+commentId).text(result.countcommentlike);
                if(result.status == true){
                    $('#statuscommentlike'+commentId).text(" Bỏ Thích");
                }else {
                    $('#statuscommentlike'+commentId).text(" Thích");
                }
            },
            error: function (e) {
                //alert("Lỗi ! Vui Lòng Kiểm Tra Lại");
            }
        });

    }, 300);
}



// Lấy Bình Luận

var page = 0;
$('#morecomment').click(function () {
    morecomment();
});

$(document).ready(function () {
    morecomment();
});

function morecomment() {

    clearTimeout(timeout);
    timeout = setTimeout(function () {
        var articleId = $('#articleId').val();
        $('#morecomment').hide();
        $("#LoadingGifSmall").show();
        $.ajax({
            type: "GET",
            //contentType: "application/json",
            url: contextPath+"/getcomment?page=" + page,
            data: {
                articleId: articleId
            },
            //dataType: 'json',
            // timeout: 600000,
            success: function (result) {
                var html = '';
                if (result.userIdLogin != 0) {

                    for (var i = 0; i < Object.keys(result.commentparent).length; i++) {
                        if (result.commentparent[i].subCommentId === 0) {
                            var childcomment = "";
                            for (var j = 0; j < Object.keys(result.commentchild).length; j++) {
                                if (result.commentchild[j].subCommentId !== 0 && result.commentchild[j].subCommentId === result.commentparent[i].commentId) {
                                    var checkuserIdLoginCommentChild = '';
                                    if (result.userIdLogin != result.commentchild[j].usersByUserId) {
                                        var statusofusercommentlike = "";
                                        if(result.commentchild[j].statusofusercommentlike == true){
                                                statusofusercommentlike = " Bỏ Thích";
                                        }else {
                                            statusofusercommentlike = " Thích";
                                        }
                                        checkuserIdLoginCommentChild = " <span class=\"item-meta\"> " +
                                            "<a href=\"javascript:void(0);\" onclick=\"commentlike("+result.commentchild[j].commentId+");\">" +
                                            "<span id=\"countcommentlike"+result.commentchild[j].commentId+"\" " +
                                            "style=\"margin:10px;\">"+result.commentchild[j].countcommentlike+"</span><i\n" +
                                            "    class=\"fa fa-thumbs-o-up\"></i><span id=\"statuscommentlike"+result.commentchild[j].commentId+"\" " +
                                            "style=\"margin:5px;\">"+statusofusercommentlike+"</span> </a>\n" +
                                            "       <a class=\"replycomment\"\n" +
                                            "       onclick=\"replysubcomment('" + result.userName + "' ,'" + result.avatar + "' ," + result.commentchild[j].commentId + "," + result.commentparent[i].commentId + "," + result.commentchild[j].usersByUserId + ",'" + result.commentchild[j].usersByUserUserName + "' );\"\n" +
                                            "        href=\"javascript:void(0)\"><i\n" +
                                            "       class=\"fa fa-comment-o\"\n" +
                                            "      style=\"margin-left: 25px;\"></i> \n" +
                                            "Bình luận</a>\n" +
                                            "</span> \n";
                                    }
                                    var editcommentchild = "";
                                    if (result.roleEditComment == true || result.userIdLogin == result.commentchild[j].usersByUserId) {
                                        editcommentchild = "<div class=\"dropdown time-stamp pull-right right\">\n" +
                                            "   <button onclick=\"myFunction(" + result.commentchild[j].commentId + ")\" class=\"dropbtn fa fa-ellipsis-h\" style=\"color: #0b0b0b\"></button>\n" +
                                            "  <div id=\"myDropdown" + result.commentchild[j].commentId + "\" class=\"dropdown-content\">\n" +
                                            "  <a onclick=\"showModelDeleteComment(" + result.commentchild[j].commentId + ");\" href=\"javascript:void(0)\" data-toggle=\"modal\" data-target=\"#myModal\" >Xóa</a>\n" +
                                            "   <a onclick=\"showUpdateComment('" + result.userName + "' ,'" + result.avatar + "' ," + result.commentchild[j].commentId + "," + result.commentparent[i].commentId + "," + result.commentchild[j].usersByUserId + ",'" + result.commentchild[j].usersByUserUserName + "' );\" href=\"javascript:void(0)\">Sửa</a>\n" +
                                            "   </div>\n" +
                                            "  </div>";
                                    }

                                    childcomment += "<ul style=\"background-color: aliceblue;\" class=\"children\">\n" +
                                        "   <li class=\"comment\">\n" +
                                        "    <div class=\"comment-block\">\n" +
                                        "    <a href=\"javascript:void(0)\" class=\"image-avatar\"> <img\n" +
                                        "    src=\"" + result.commentchild[j].usersByUserAvatar + "\"\n" +
                                        "    data-ot-retina=\"" + result.commentchild[j].usersByUserAvatar + "\"\n" +
                                        "     alt=\"\"\n" +
                                        "     title=\"\">\n" +
                                        "     </a>\n" +
                                        "     <div class=\"comment-text\">\n" +
                                        "     <strong\n" +
                                        "     class=\"user-nick\">" +
                                        editcommentchild +
                                        "<a href=\"javascript:void(0)\">" + result.commentchild[j].usersByUserUserName + "</a>\n" +

                                        "<span style=\"margin-top: 5px;\" class=\"time-stamp \">" + result.commentchild[j].modifiedDate + "</span>\n" +
                                        "</strong>\n" +
                                        "        <div class=\"shortcode-content\">\n" +
                                        "         <p style=\"color: #ABABAB\">\n" +
                                        "        <a style=\"color: #0c91e5;\"\n" +
                                        "      href=\"\">@" + result.commentchild[j].usersBySubUserUserName + "</a>\n" +
                                        "     <span id=\"spanContent" + result.commentchild[j].commentId + "\">" + result.commentchild[j].content + " </span> </p>\n" +
                                        "         </div>\n" +
                                        checkuserIdLoginCommentChild +
                                        " </div>\n" +
                                        "<div class=\"comment-text\">\n" +
                                        "   <div id=\"showreplycomment" + result.commentchild[j].commentId + "\" class=\"comment-block\" style=\" margin:0px; margin-top:25px; \">\n" +

                                        "   </div>\n" +

                                        "</div>\n" +
                                        " </div>\n" +
                                        "  </li>\n" +
                                        "    </ul>\n";
                                }
                            }
                            var checkuserIdLoginCommentParemt = '';
                            if (result.userIdLogin != result.commentparent[i].usersByUserId) {
                                var statusofusercommentlike = "";
                                if(result.commentparent[i].statusofusercommentlike == true){
                                    statusofusercommentlike = " Bỏ Thích";
                                }else {
                                    statusofusercommentlike = " Thích";
                                }
                                checkuserIdLoginCommentParemt = " <span class=\"item-meta\"> " +
                                    "<a href=\"javascript:void(0);\" onclick=\"commentlike("+result.commentparent[i].commentId+");\">" +
                                    "<span id=\"countcommentlike"+result.commentparent[i].commentId+"\" " +
                                    "style=\"margin:10px;\">"+result.commentparent[i].countcommentlike+"</span><i\n" +
                                    "    class=\"fa fa-thumbs-o-up\"></i><span id=\"statuscommentlike"+result.commentparent[i].commentId+"\" " +
                                    "style=\"margin:5px;\">"+statusofusercommentlike+"</span> </a>\n" +
                                    "    <a class=\"replycomment\" href=\"javascript:void(0)\"\n" +
                                    "     onclick=\"replysubcomment('" + result.userName + "' ,'" + result.avatar + "' ," + result.commentparent[i].commentId + "," + result.commentparent[i].commentId + "," + result.commentparent[i].usersByUserId + ",'" + result.commentparent[i].usersByUserUserName + "');\">\n" +
                                    "     <i class=\"fa fa-comment-o\" style=\"margin-left: 25px;\"></i> Bình\n" +
                                    "luận</a>\n" +
                                    "</span>\n";
                            }
                            var editcommentparen = "";
                            if (result.roleEditComment == true || result.userIdLogin == result.commentparent[i].usersByUserId) {
                                editcommentparen = "<div class=\"dropdown time-stamp pull-right right\">\n" +
                                    "   <button onclick=\"myFunction(" + result.commentparent[i].commentId + ")\" class=\"dropbtn fa fa-ellipsis-h\" style=\"color: #0b0b0b\"></button>\n" +
                                    "  <div id=\"myDropdown" + result.commentparent[i].commentId + "\" class=\"dropdown-content\">\n" +
                                    "  <a onclick=\"showModelDeleteComment(" + result.commentparent[i].commentId + ");\" href=\"javascript:void(0)\"data-toggle=\"modal\" data-target=\"#myModal\" >Xóa</a>\n" +
                                    "   <a onclick=\"showUpdateComment('" + result.userName + "' ,'" + result.avatar + "' ," + result.commentparent[i].commentId + "," + result.commentparent[i].commentId + "," + result.commentparent[i].usersByUserId + ",'" + result.commentparent[i].usersByUserUserName + "');\" href=\"javascript:void(0)\">Sửa</a>\n" +
                                    "   </div>\n" +
                                    "  </div>";
                            }
                            html += "  <li  class=\"comment\">\n" +
                                " <div id=\"comment" + result.commentparent[i].commentId + "\" class=\"comment-block\">\n" +
                                "  <a href=\"javascript:void(0)\" class=\"image-avatar\"> <img\n" +
                                "  src=\" " + result.commentparent[i].usersByUserAvatar + " \" \n" +
                                "   data-ot-retina=\"" + result.commentparent[i].usersByUserAvatar + " \"\n" +
                                "   alt=\"\"\n" +
                                "   title=\"\">\n" +
                                "    </a>\n" +
                                "   <div class=\"comment-text\">\n" +
                                "    <strong\n" +
                                "      class=\"user-nick\">" +
                                editcommentparen +
                                "<a href=\"javascript:void(0)\"> " + result.commentparent[i].usersByUserUserName + " </a>" +
                                "<span style=\"margin-top: 5px;\" class=\"time-stamp \">" + result.commentparent[i].modifiedDate + "</span>" +
                                "</strong>\n" +
                                "       <div class=\"shortcode-content\">\n" +
                                "     <p id=\"spanContent" + result.commentparent[i].commentId + "\">" + result.commentparent[i].content + "</p>\n" +
                                "    </div>\n" +
                                checkuserIdLoginCommentParemt +
                                "   </div>\n" +
                                "<div class=\"comment-text\">\n" +
                                "   <div id=\"showreplycomment" + result.commentparent[i].commentId + "\" class=\"comment-block\" style=\" margin-top:25px; \">\n" +
                                "   </div>\n" +
                                "</div> \n" +
                                "  </div>\n" +
                                "<div id=\"childcomment" + result.commentparent[i].commentId + "\" >\n" +
                                "" + childcomment + "" +
                                "</div>\n" +
                                "   </li>\n";

                        }

                    }

                } else {
                    for (var i = 0; i < Object.keys(result.commentparent).length; i++) {
                        if (result.commentparent[i].subCommentId === 0) {
                            var childcomment = "";
                            for (var j = 0; j < Object.keys(result.commentchild).length; j++) {
                                if (result.commentchild[j].subCommentId !== 0 && result.commentchild[j].subCommentId === result.commentparent[i].commentId) {

                                    childcomment += "<ul style=\"background-color: aliceblue;\" class=\"children\">\n" +
                                        "   <li class=\"comment\">\n" +
                                        "    <div class=\"comment-block\">\n" +
                                        "    <a href=\"javascript:void(0)\" class=\"image-avatar\"> <img\n" +
                                        "    src=\"" + result.commentchild[j].usersByUserAvatar + "\"\n" +
                                        "    data-ot-retina=\"" + result.commentchild[j].usersByUserAvatar + "\"\n" +
                                        "     alt=\"\"\n" +
                                        "     title=\"\">\n" +
                                        "     </a>\n" +
                                        "     <div class=\"comment-text\">\n" +
                                        "     <span class=\"time-stamp right\">" + result.commentchild[j].modifiedDate + "</span>\n" +
                                        "     <strong\n" +
                                        "     class=\"user-nick\"><a\n" +
                                        "      href=\"javascript:void(0)\">" + result.commentchild[j].usersByUserUserName + "</a><span\n" +
                                        "       class=\"user-label\">Admin</span></strong>\n" +
                                        "        <div class=\"shortcode-content\">\n" +
                                        "         <p style=\"color: #ABABAB\">\n" +
                                        "        <a style=\"color: #0c91e5;\"\n" +
                                        "      href=\"\">@" + result.commentchild[j].usersBySubUserUserName + "</a>\n" +
                                        "          " + result.commentchild[j].content + "</p>\n" +
                                        "         </div>\n" +
                                        " </div>\n" +
                                        " </div>\n" +
                                        "  </li>\n" +
                                        "    </ul>\n";
                                }
                            }
                            html += "  <li class=\"comment\">\n" +
                                " <div class=\"comment-block\">\n" +
                                "  <a href=\"javascript:void(0)\" class=\"image-avatar\"> <img\n" +
                                "  src=\"" + result.commentparent[i].usersByUserAvatar + " \" \n" +
                                "   data-ot-retina=\"" + result.commentparent[i].usersByUserAvatar + " \"\n" +
                                "   alt=\"\"\n" +
                                "   title=\"\">\n" +
                                "    </a>\n" +
                                "   <div class=\"comment-text\">\n" +
                                "   <span class=\"time-stamp right\">" + result.commentparent[i].modifiedDate + "</span> <strong\n" +
                                "      class=\"user-nick\"><a\n" +
                                "      href=\"javascript:void(0)\"> " + result.commentparent[i].usersByUserUserName + " </a></strong>\n" +
                                "       <div class=\"shortcode-content\">\n" +
                                "      <p>" + result.commentparent[i].content + "</p>\n" +
                                "    </div>\n" +
                                "   </div>\n" +
                                "  </div>\n" +
                                "" + childcomment + "" +
                                "   </li>\n";

                        }

                    }

                }
                $('#comments').append(html);
                page = page + 1;
                if (Object.keys(result.commentparent).length < 10) {
                    $('.xemthemcomment').hide();
                }

                $("#LoadingGifSmall").hide();
                $('#morecomment').show();
            },
            error: function (e) {
                $("#LoadingGifSmall").hide();
                $('#morecomment').show();
               // alert("Lỗi ! Load Binh LUani");
            }
        });
    }, 100);
};


// Hiển Thị Popup Xóa Bình Luận

function showModelDeleteComment(commentId) {
    $('#btn-deleteComment').attr('onclick', 'deletecomment(' + commentId + ');');
};

function deletecomment(commentId) {
    clearTimeout(timeout);
    timeout = setTimeout(function () {
        var articleId = $('#articleId').val();
       
        var token = $("meta[name='_csrf']").attr("content");
        var header = $("meta[name='_csrf_header']").attr("content");
        $(document).ajaxSend(function (e, xhr, options) {
            xhr.setRequestHeader(header, token);

        });
        $.ajax({

            type: "POST",
            //contentType: "application/json",
            url: contextPath+"/deletecomment",
            data: {
                commentId: commentId
            },
            //dataType: 'json',
            // timeout: 600000,
            success: function (result) {
                
                location.reload();
            },
            error: function (e) {
               
                //alert("Lỗi ! Xoa inh Luan");
            }
        });
    }, 100);
};

//Xóa sửa bình luận

function myFunction(commentId) {
    document.getElementById("myDropdown" + commentId).classList.toggle("show");
}

// Close the dropdown if the user clicks outside of it
window.onclick = function (event) {
        if (!event.target.matches('.dropbtn')) {

            var dropdowns = document.getElementsByClassName("dropdown-content");
            var i;
            for (i = 0; i < dropdowns.length; i++) {
                var openDropdown = dropdowns[i];
                if (openDropdown.classList.contains('show')) {
                    openDropdown.classList.remove('show');
                }
            }
        }
    }

    $(document).ready(function () {

        $('#sharefacebook').attr('href', 'https://www.facebook.com/sharer/sharer.php?' +
            'app_id=1223420154469580&sdk=joey&u=' + window.location.href);
        $('#sharegoogle').attr('href', 'https://plus.google.com/share?' +
            'url=' + window.location.href);
        $('#sharetwitter').attr('href', 'https://twitter.com/home?' +
            'status='+window.location.href);
        coutFacebook();
        coutGoogle();
        coutTwitter();
    });
$('#sharefacebook').click(function (){
    coutFacebook();
});
$('#sharegoogle').click(function (){
    coutGoogle();
});
$('#sharetwitter').click(function (){
    coutTwitter();
});
function coutFacebook() {
    $.ajax({
        type: "GET",
        url: 'https://graph.facebook.com/?fields=og_object{likes.summary(total_count).limit(0)},' +
        'share&id=' + window.location.href,
        success: function (result) {
            $('#countsharefacebook').text(result.share.share_count);
            console.log(result.share.share_count);
        },
        error: function (e) {
           // alert("Lỗi ! Dem Share Face");
        }
    });
};

function coutGoogle() {
    var uri = window.location.href;
    $.ajax({
        type: 'POST',
        url: 'https://clients6.google.com/rpc',
        processData: true,
        contentType: 'application/json',
        data: JSON.stringify({
            'method': 'pos.plusones.get',
            'id': uri,
            'params': {
                'nolog': true,
                'id': uri,
                'source': 'widget',
                'userId': '@viewer',
                'groupId': '@self'
            },
            'jsonrpc': '2.0',
            'key': 'p',
            'apiVersion': 'v1'
        }),
        success: function (response) {
            $('#countsharegoogle').text(response.result.metadata.globalCounts.count);
        }
    });
};

function coutTwitter() {
    $.ajax({
        type: "GET",
        url: 'http://public.newsharecounts.com/count.json?url='+ window.location.href,
        success: function (result) {
            $('#countsharetwitter').text(result.count);
        },
        error: function (e) {
           // alert("Lỗi !Dem Twitter");
        }
    });
};

