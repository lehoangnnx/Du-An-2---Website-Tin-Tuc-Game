<%@ page pageEncoding="UTF-8" %>

<!-- Thích Bài Viết -->
<script>
$('#likearticle').click(function(){
    clearTimeout(timeout);
    timeout = setTimeout(function () {
        var likearticle= $('#likearticle').text();
        var numberUserArticleLike= Number($('#numberUserArticleLike').text());
        if(likearticle == 'Thích'){
            $('#likearticle').text('Bỏ Thích');

            $('#msglikearticle').html("<b>Bạn</b> Và <span id=\"numberUserArticleLike\"> " +numberUserArticleLike + " </span> người khác thích bài viết này" );
            fnlikearticle(true);
        }else {
            $('#likearticle').text('Thích');
            $('#msglikearticle').html("<b id= \"numberUserArticleLike\" > " +numberUserArticleLike + "</b> người khác thích bài viết này" );

            fnlikearticle(false);
        }
    }, 1000);
    function fnlikearticle(status){
            var articleId = $('#articleId').val();
            var token = $("meta[name='_csrf']").attr("content");
            var header = $("meta[name='_csrf_header']").attr("content");
            $(document).ajaxSend(function (e, xhr, options) {
                xhr.setRequestHeader(header, token);
            });
            $.ajax({
                type: "POST",
                //contentType: "application/json",
                url: "${pageContext.request.contextPath}/likearticles",
                data: {
                    articleId: articleId,
                    status: status
                },
                //dataType: 'json',
                // timeout: 600000,
                success: function (result) {

                },
                error: function (e) {
                    alert("Lỗi ! Vui Lòng Kiểm Tra Lại");
                }
            });
    };
})

</script>

<script>
    function gamereivews(starreview){
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
                url: "${pageContext.request.contextPath}/saveorupdategamereviews",
                data: {
                    gameId: gameId,
                    starreview: starreview
                },
                //dataType: 'json',
                // timeout: 600000,
                success: function (result) {

                },
                error: function (e) {
                    alert("Lỗi ! Vui Lòng Kiểm Tra Lại");
                }
            });
        }, 1000);

    }

</script>

<script>

    $('#content').on('keyup keypress keydown',function (){
        var content= $('#content').val();
        if(content != ''){
            $('#btn-newcomment').removeAttr('disabled');
        }else{
            $('#btn-newcomment').attr('disabled','disabled');
        }

    });
    function checkcontent(commentId){
        var content= $('#content'+commentId).val();
        if(content != ''){
            $('#btn-replycomment'+commentId).removeAttr('disabled');
            $('#btn-updatecomment'+commentId).removeAttr('disabled');

        }else{
            $('#btn-replycomment'+commentId).attr('disabled','disabled');
            $('#btn-updatecomment'+commentId).attr('disabled','disabled');
        }
    };
    function replysubcomment(userName,avatar,commentId,subCommentId, usersBySubUserId, usersBySubUserName) {
        $('#showreplycomment'+ commentId).html( "<a href=\"#\" class=\"image-avatar\"> <img src=\""+avatar+"\" data-ot-retina=\""+avatar+"\" alt=\"\" title=\"\">\n" +
            " </a>\n" +
            " <div class=\"comment-text\" style=\"width: auto; overflow: hidden;\">\n" +
            " <strong class=\"user-nick\"><a href=\"#\">"+userName+"</a> <span id=\"msgsubcomment"+commentId+"\"></span></strong>\n" +
            "<textarea onkeydown=\"checkcontent("+commentId+");\" onkeyup=\"checkcontent("+commentId+");\" onkeypress=\"checkcontent("+commentId+");\" id=\"content"+commentId+"\" name=\"content\" placeholder=\"Viết bình luận của bạn..\" style=\"width: 100%; height: 100px;\"></textarea>\n" +
            " <p class=\"form-submit\">\n" +
            " <input id=\"btn-replycomment"+commentId+"\" disabled name=\"submit\" type=\"submit\" onclick=\"postreplycomment("+commentId+","+subCommentId+","+usersBySubUserId+");\" class=\"submit button\" value=\"Trả Lời\">\n" +
            " <input onclick=\"cancelsubcomment("+commentId+");\"  name=\"submit\" type=\"submit\"  class=\"submit button pull-right\" value=\"Hủy\">\n" +
            " </p>\n" +
            " </div>\n");
        $('#msgsubcomment'+ commentId).text('Bạn Đang Trả Lời ' + usersBySubUserName);
        $('#usersBySubUserId').val(usersBySubUserId);
        $('#subCommentId').val(subCommentId);
        return false;
        /*console.log(subCommentId + "--" + usersBySubUserId + "-" + usersBySubUserName);



        $('#cancelsubcomment').show();
        $('html, body').animate({
            scrollTop: $(".xemthemcomment").offset().top
        }, 500);
        console.log($('#usersBySubUserId').val() + $('#subCommentId').val());*/
    };
    function showUpdateComment(userName,avatar,commentId,subCommentId, usersBySubUserId, usersBySubUserName) {
        $('#showreplycomment'+ commentId).html( "<a href=\"#\" class=\"image-avatar\"> <img src=\""+avatar+"\" data-ot-retina=\""+avatar+"\" alt=\"\" title=\"\">\n" +
            " </a>\n" +
            " <div class=\"comment-text\" style=\"width: auto; overflow: hidden;\">\n" +
            " <strong class=\"user-nick\"><a href=\"#\">"+userName+"</a> <span id=\"msgsubcomment"+commentId+"\"></span></strong>\n" +
            "<textarea onkeydown=\"checkcontent("+commentId+");\" onkeyup=\"checkcontent("+commentId+");\" onkeypress=\"checkcontent("+commentId+");\" id=\"content"+commentId+"\" name=\"content\" placeholder=\"Viết bình luận của bạn..\" style=\"width: 100%; height: 100px;\"></textarea>\n" +
            " <p class=\"form-submit\">\n" +
            " <input id=\"btn-updatecomment"+commentId+"\" disabled name=\"submit\" type=\"submit\" onclick=\"postupdatecomment("+commentId+");\" class=\"submit button\" value=\"Trả Lời\">\n" +
            " <input onclick=\"cancelsubcomment("+commentId+");\"  name=\"submit\" type=\"submit\"  class=\"submit button pull-right\" value=\"Hủy\">\n" +
            " </p>\n" +
            " </div>\n");
        $('#msgsubcomment'+ commentId).text('Bạn Đang Sửa Bình Luận');
        var content= $('#spanContent'+commentId).text();
        $('#content'+commentId).val(content);
        return false;

    };
    function cancelsubcomment(commentId) {

        $('#showreplycomment'+ commentId).empty();

    };
    <!-- Sửa Bình Luận -->
    function postupdatecomment(commentId){
        clearTimeout(timeout);
        timeout = setTimeout(function () {
            $("#LoadingImage").show();
            var content = $('#content'+commentId).val();
            var token = $("meta[name='_csrf']").attr("content");
            var header = $("meta[name='_csrf_header']").attr("content");
            $(document).ajaxSend(function (e, xhr, options) {
                xhr.setRequestHeader(header, token);

            });
            $.ajax({
                type: "POST",
                //contentType: "application/json",
                url: "${pageContext.request.contextPath}/updatecomment",
                data: {
                    commentId : commentId,
                    content: content
                },
                //dataType: 'json',
                // timeout: 600000,
                success: function (result) {
                    $("#LoadingImage").hide();
                    $('#spanContent'+commentId).text(content);
                    $('#showreplycomment'+ commentId).empty();
                },
                error: function (e) {
                    alert("Lỗi ! Vui Lòng Kiểm Tra Lại");
                }
            });

        }, 1000);
    };

    <!-- Trả Lời Bình Luận -->
    function postreplycomment(commentId,subCommentId,usersBySubUserId){
        clearTimeout(timeout);
        timeout = setTimeout(function () {
            $("#LoadingImage").show();

            var articleId = $('#articleId').val();
            var content = $('#content'+commentId).val();
            var token = $("meta[name='_csrf']").attr("content");
            var header = $("meta[name='_csrf_header']").attr("content");
            $(document).ajaxSend(function (e, xhr, options) {
                xhr.setRequestHeader(header, token);

            });
            $.ajax({

                type: "POST",
                //contentType: "application/json",
                url: "${pageContext.request.contextPath}/replycomment",
                data: {
                    subCommentId: subCommentId,
                    articleId: articleId,
                    content: content,
                    usersBySubUserId: usersBySubUserId
                },
                //dataType: 'json',
                // timeout: 600000,
                success: function (result) {
                    $("#LoadingImage").hide();

                    var childcomment= "";

                    for (var j = 0; j < Object.keys(result.commentchild).length; j++) {
                        if (result.commentchild[j].subCommentId !== 0 && result.commentchild[j].subCommentId === subCommentId){
                            var checkuserIdLoginCommentChild = '';
                            if(result.userIdLogin != result.commentchild[j].usersByUserId ){
                                checkuserIdLoginCommentChild = " <span class=\"item-meta\"> <a href=\"#\"><i\n" +
                                    "      class=\"fa fa-thumbs-o-up\"></i> Thích</a>\n" +
                                    "       <a class=\"replycomment\"\n" +
                                    "       onclick=\"replysubcomment('"+result.userName+"' ,'"+result.avatar+"' ,"+result.commentchild[j].commentId+","+subCommentId+","+result.commentchild[j].usersByUserId+",'"+result.commentchild[j].usersByUserUserName+"' );\"\n" +
                                    "        href=\"javascript:void(0)\"><i\n" +
                                    "       class=\"fa fa-comment-o\"\n" +
                                    "      style=\"margin-left: 25px;\"></i> \n" +
                                    "Bình luận</a>\n" +
                                    "</span> \n" ;
                            }
                            var editcommentchild = "";
                            if(result.roleEditComment == true || result.userIdLogin == result.commentchild[j].usersByUserId ){
                                editcommentchild ="<div class=\"dropdown time-stamp pull-right right\">\n" +
                                    "   <button onclick=\"myFunction("+result.commentchild[j].commentId+")\" class=\"dropbtn fa fa-ellipsis-h\" style=\"color: #0b0b0b\"></button>\n" +
                                    "  <div id=\"myDropdown"+result.commentchild[j].commentId+"\" class=\"dropdown-content\">\n" +
                                    "  <a onclick=\"showModelDeleteComment("+result.commentchild[j].commentId+");\" href=\"#\" data-toggle=\"modal\" data-target=\"#myModal\" >Xóa</a>\n" +
                                    "   <a onclick=\"showUpdateComment('"+result.userName+"' ,'"+result.avatar+"' ,"+result.commentchild[j].commentId+","+subCommentId+","+result.commentchild[j].usersByUserId+",'"+result.commentchild[j].usersByUserUserName+"' );\" href=\"#\">Sửa</a>\n" +
                                    "   </div>\n" +
                                    "  </div>" ;
                            }

                            childcomment += "<ul class=\"children\">\n" +
                                "   <li class=\"comment\">\n" +
                                "    <div class=\"comment-block\">\n" +
                                "    <a href=\"#\" class=\"image-avatar\"> <img\n" +
                                "    src=\"" + result.commentchild[j].usersByUserAvatar + "\"\n" +
                                "    data-ot-retina=\"" + result.commentchild[j].usersByUserAvatar + "\"\n" +
                                "     alt=\"\"\n" +
                                "     title=\"\">\n" +
                                "     </a>\n" +
                                "     <div class=\"comment-text\">\n" +
                                "     <strong\n" +
                                "     class=\"user-nick\">" +
                                editcommentchild +
                                "<a href=\"#\">"+result.commentchild[j].usersByUserUserName +"</a>\n" +

                                "<span class=\"time-stamp \">"+result.commentchild[j].modifiedDate+"</span>\n" +
                                "</strong>\n" +
                                "        <div class=\"shortcode-content\">\n" +
                                "         <p style=\"color: #ABABAB\">\n" +
                                "        <a style=\"color: #0c91e5;\"\n" +
                                "      href=\"\">@"+result.commentchild[j].usersBySubUserUserName +"</a>\n" +
                                "     <span id=\"spanContent"+result.commentchild[j].commentId+"\">"+result.commentchild[j].content +" </span> </p>\n" +
                                "         </div>\n" +
                                checkuserIdLoginCommentChild +
                                " </div>\n" +
                                "<div class=\"comment-text\">\n" +
                                "   <div id=\"showreplycomment" + result.commentchild[j].commentId + "\" class=\"comment-block\" style=\" margin:0px; margin-top:25px; \">\n" +

                                "   </div>\n" +

                                "</div>\n" +
                                " </div>\n" +
                                "  </li>\n" +
                                "    </ul>\n" ;
                        }
                    }

                    $('#childcomment'+subCommentId).html(childcomment);
                    $('#showreplycomment'+ commentId).empty();
                    $('html, body').animate({
                        scrollTop: $("#comment"+subCommentId).offset().top
                    }, 500);
                },
                error: function (e) {
                    alert("Lỗi ! Vui Lòng Kiểm Tra Lại");
                }
            });

        }, 1000);
    };
    $('#cancelsubcomment').click(function () {

       /* $('#usersBySubUserId').val(0);
        $('#subCommentId').val(0);
        $('#msgsubcomment').text('');
        $('#cancelsubcomment').hide();*/

    });

    <!-- Tạo Mới Bình Luận -->
    $('.btn-postcomment').click(function () {
        clearTimeout(timeout);
        timeout = setTimeout(function () {
            console.log(123);
            $("#LoadingImage").show();

            var articleId = $('#articleId').val();
            var content = $('#content').val();
            var token = $("meta[name='_csrf']").attr("content");
            var header = $("meta[name='_csrf_header']").attr("content");
            $(document).ajaxSend(function (e, xhr, options) {
                xhr.setRequestHeader(header, token);

            });
            $.ajax({
                type: "POST",
                //contentType: "application/json",
                url: "${pageContext.request.contextPath}/newcomment",
                data: {
                    articleId: articleId,
                    content: content
                },
                //dataType: 'json',
                // timeout: 600000,
                success: function (result) {

                    $("#LoadingImage").hide();
                    $('#content').val('');
                    var html = '';

                    if(result.userIdLogin != 0 ){

                        for (var i = 0; i < Object.keys(result.commentparent).length; i++) {
                            if(result.commentparent[i].subCommentId === 0){
                                var childcomment = "";
                                for (var j = 0; j < Object.keys(result.commentchild).length; j++) {
                                    if (result.commentchild[j].subCommentId !== 0 && result.commentchild[j].subCommentId === result.commentparent[i].commentId){
                                        var checkuserIdLoginCommentChild = '';
                                        if(result.userIdLogin != result.commentchild[j].usersByUserId ){
                                            checkuserIdLoginCommentChild = " <span class=\"item-meta\"> <a href=\"#\"><i\n" +
                                                "      class=\"fa fa-thumbs-o-up\"></i> Thích</a>\n" +
                                                "       <a class=\"replycomment\"\n" +
                                                "       onclick=\"replysubcomment('"+result.userName+"' ,'"+result.avatar+"' ,"+result.commentchild[j].commentId+","+result.commentparent[i].commentId+","+result.commentchild[j].usersByUserId+",'"+result.commentchild[j].usersByUserUserName+"' );\"\n" +
                                                "        href=\"javascript:void(0)\"><i\n" +
                                                "       class=\"fa fa-comment-o\"\n" +
                                                "      style=\"margin-left: 25px;\"></i> \n" +
                                                "Bình luận</a>\n" +
                                                "</span> \n" ;
                                        }
                                        var editcommentchild = "";
                                        if(result.roleEditComment == true || result.userIdLogin == result.commentchild[j].usersByUserId ){
                                            editcommentchild ="<div class=\"dropdown time-stamp pull-right right\">\n" +
                                                "   <button onclick=\"myFunction("+result.commentchild[j].commentId+")\" class=\"dropbtn fa fa-ellipsis-h\" style=\"color: #0b0b0b\"></button>\n" +
                                                "  <div id=\"myDropdown"+result.commentchild[j].commentId+"\" class=\"dropdown-content\">\n" +
                                                "  <a onclick=\"showModelDeleteComment("+result.commentchild[j].commentId+");\" href=\"#\" data-toggle=\"modal\" data-target=\"#myModal\" >Xóa</a>\n" +
                                                "   <a onclick=\"showUpdateComment('"+result.userName+"' ,'"+result.avatar+"' ,"+result.commentchild[j].commentId+","+result.commentparent[i].commentId+","+result.commentchild[j].usersByUserId+",'"+result.commentchild[j].usersByUserUserName+"' );\" href=\"#\">Sửa</a>\n" +
                                                "   </div>\n" +
                                                "  </div>" ;
                                        }

                                        childcomment += "<ul class=\"children\">\n" +
                                            "   <li class=\"comment\">\n" +
                                            "    <div class=\"comment-block\">\n" +
                                            "    <a href=\"#\" class=\"image-avatar\"> <img\n" +
                                            "    src=\"" + result.commentchild[j].usersByUserAvatar + "\"\n" +
                                            "    data-ot-retina=\"" + result.commentchild[j].usersByUserAvatar + "\"\n" +
                                            "     alt=\"\"\n" +
                                            "     title=\"\">\n" +
                                            "     </a>\n" +
                                            "     <div class=\"comment-text\">\n" +
                                            "     <strong\n" +
                                            "     class=\"user-nick\">" +
                                            editcommentchild +
                                            "<a href=\"#\">"+result.commentchild[j].usersByUserUserName +"</a>\n" +

                                            "<span class=\"time-stamp \">"+result.commentchild[j].modifiedDate+"</span>\n" +
                                            "</strong>\n" +
                                            "        <div class=\"shortcode-content\">\n" +
                                            "         <p style=\"color: #ABABAB\">\n" +
                                            "        <a style=\"color: #0c91e5;\"\n" +
                                            "      href=\"\">@"+result.commentchild[j].usersBySubUserUserName +"</a>\n" +
                                            "     <span id=\"spanContent"+result.commentchild[j].commentId+"\">"+result.commentchild[j].content +" </span> </p>\n" +
                                            "         </div>\n" +
                                            checkuserIdLoginCommentChild +
                                            " </div>\n" +
                                            "<div class=\"comment-text\">\n" +
                                            "   <div id=\"showreplycomment" + result.commentchild[j].commentId + "\" class=\"comment-block\" style=\" margin:0px; margin-top:25px; \">\n" +

                                            "   </div>\n" +

                                            "</div>\n" +
                                            " </div>\n" +
                                            "  </li>\n" +
                                            "    </ul>\n" ;
                                    }
                                }
                                var checkuserIdLoginCommentParemt = '';
                                if(result.userIdLogin != result.commentparent[i].usersByUserId ){
                                    checkuserIdLoginCommentParemt = " <span class=\"item-meta\"> <a href=\"#\"><i\n" +
                                        "    class=\"fa fa-thumbs-o-up\"></i> Thích</a>\n" +
                                        "    <a class=\"replycomment\" href=\"javascript:void(0)\"\n" +
                                        "     onclick=\"replysubcomment('"+result.userName+"' ,'"+result.avatar+"' ,"+result.commentparent[i].commentId+","+result.commentparent[i].commentId+","+result.commentparent[i].usersByUserId+",'"+result.commentparent[i].usersByUserUserName+"');\">\n" +
                                        "     <i class=\"fa fa-comment-o\" style=\"margin-left: 25px;\"></i> Bình\n" +
                                        "luận</a>\n" +
                                        "</span>\n" ;
                                }
                                var editcommentparen = "";
                                if(result.roleEditComment == true || result.userIdLogin == result.commentparent[i].usersByUserId ){
                                    editcommentparen ="<div class=\"dropdown time-stamp pull-right right\">\n" +
                                        "   <button onclick=\"myFunction("+result.commentparent[i].commentId+")\" class=\"dropbtn fa fa-ellipsis-h\" style=\"color: #0b0b0b\"></button>\n" +
                                        "  <div id=\"myDropdown"+result.commentparent[i].commentId+"\" class=\"dropdown-content\">\n" +
                                        "  <a onclick=\"showModelDeleteComment("+result.commentparent[i].commentId+");\" href=\"#\"data-toggle=\"modal\" data-target=\"#myModal\" >Xóa</a>\n" +
                                        "   <a onclick=\"showUpdateComment('"+result.userName+"' ,'"+result.avatar+"' ,"+result.commentparent[i].commentId+","+result.commentparent[i].commentId+","+result.commentparent[i].usersByUserId+",'"+result.commentparent[i].usersByUserUserName+"');\" href=\"#\">Sửa</a>\n" +
                                        "   </div>\n" +
                                        "  </div>" ;
                                }
                                html += "  <li  class=\"comment\">\n" +
                                    " <div id=\"comment"+result.commentparent[i].commentId+"\" class=\"comment-block\">\n" +
                                    "  <a href=\"#\" class=\"image-avatar\"> <img\n" +
                                    "  src=\" " + result.commentparent[i].usersByUserAvatar + " \" \n" +
                                    "   data-ot-retina=\"" + result.commentparent[i].usersByUserAvatar + " \"\n" +
                                    "   alt=\"\"\n" +
                                    "   title=\"\">\n" +
                                    "    </a>\n" +
                                    "   <div class=\"comment-text\">\n" +
                                    "    <strong\n" +
                                    "      class=\"user-nick\">" +
                                    editcommentparen+
                                    "<a href=\"#\"> "+result.commentparent[i].usersByUserUserName +" </a>" +
                                    "<span class=\"time-stamp \">"+result.commentparent[i].modifiedDate+"</span>" +
                                    "</strong>\n" +
                                    "       <div class=\"shortcode-content\">\n" +
                                    "     <p id=\"spanContent"+result.commentparent[i].commentId+"\">"+result.commentparent[i].content +"</p>\n" +
                                    "    </div>\n" +
                                    checkuserIdLoginCommentParemt +
                                    "   </div>\n" +
                                    "<div class=\"comment-text\">\n" +
                                    "   <div id=\"showreplycomment" + result.commentparent[i].commentId + "\" class=\"comment-block\" style=\" margin-top:25px; \">\n" +
                                    "   </div>\n" +
                                    "</div> \n" +
                                    "  </div>\n" +
                                    "<div id=\"childcomment"+result.commentparent[i].commentId +"\" >\n"+
                                    ""+childcomment+"" +
                                    "</div>\n"+
                                    "   </li>\n" ;

                            }

                        }

                    }
                    $('#comments').html(html);
                    $('html, body').animate({
                        scrollTop: $(".article-main-next-prev").offset().top
                    }, 500);

                },
                error: function (e) {
                    alert("Lỗi ! Vui Lòng Kiểm Tra Lại");
                }
            });


        }, 1000);

    });

</script>

<!-- Lấy Bình Luận -->
<script>
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
                url: "${pageContext.request.contextPath}/getcomment?page=" + page,
                data: {
                    articleId: articleId
                },
                //dataType: 'json',
                // timeout: 600000,
                success: function (result) {
                    var html = '';

                    if(result.userIdLogin != 0 ){

                        for (var i = 0; i < Object.keys(result.commentparent).length; i++) {
                            if(result.commentparent[i].subCommentId === 0){
                                var childcomment = "";
                                for (var j = 0; j < Object.keys(result.commentchild).length; j++) {
                                    if (result.commentchild[j].subCommentId !== 0 && result.commentchild[j].subCommentId === result.commentparent[i].commentId){
                                            var checkuserIdLoginCommentChild = '';
                                            if(result.userIdLogin != result.commentchild[j].usersByUserId ){
                                                checkuserIdLoginCommentChild = " <span class=\"item-meta\"> <a href=\"#\"><i\n" +
                                                    "      class=\"fa fa-thumbs-o-up\"></i> Thích</a>\n" +
                                                    "       <a class=\"replycomment\"\n" +
                                                    "       onclick=\"replysubcomment('"+result.userName+"' ,'"+result.avatar+"' ,"+result.commentchild[j].commentId+","+result.commentparent[i].commentId+","+result.commentchild[j].usersByUserId+",'"+result.commentchild[j].usersByUserUserName+"' );\"\n" +
                                                    "        href=\"javascript:void(0)\"><i\n" +
                                                    "       class=\"fa fa-comment-o\"\n" +
                                                    "      style=\"margin-left: 25px;\"></i> \n" +
                                                    "Bình luận</a>\n" +
                                                    "</span> \n" ;
                                            }
                                        var editcommentchild = "";
                                        if(result.roleEditComment == true || result.userIdLogin == result.commentchild[j].usersByUserId ){
                                            editcommentchild ="<div class=\"dropdown time-stamp pull-right right\">\n" +
                                                "   <button onclick=\"myFunction("+result.commentchild[j].commentId+")\" class=\"dropbtn fa fa-ellipsis-h\" style=\"color: #0b0b0b\"></button>\n" +
                                                "  <div id=\"myDropdown"+result.commentchild[j].commentId+"\" class=\"dropdown-content\">\n" +
                                                "  <a onclick=\"showModelDeleteComment("+result.commentchild[j].commentId+");\" href=\"#\" data-toggle=\"modal\" data-target=\"#myModal\" >Xóa</a>\n" +
                                                "   <a onclick=\"showUpdateComment('"+result.userName+"' ,'"+result.avatar+"' ,"+result.commentchild[j].commentId+","+result.commentparent[i].commentId+","+result.commentchild[j].usersByUserId+",'"+result.commentchild[j].usersByUserUserName+"' );\" href=\"#\">Sửa</a>\n" +
                                                "   </div>\n" +
                                                "  </div>" ;
                                        }

                                        childcomment += "<ul class=\"children\">\n" +
                                            "   <li class=\"comment\">\n" +
                                            "    <div class=\"comment-block\">\n" +
                                            "    <a href=\"#\" class=\"image-avatar\"> <img\n" +
                                            "    src=\"" + result.commentchild[j].usersByUserAvatar + "\"\n" +
                                            "    data-ot-retina=\"" + result.commentchild[j].usersByUserAvatar + "\"\n" +
                                            "     alt=\"\"\n" +
                                            "     title=\"\">\n" +
                                            "     </a>\n" +
                                            "     <div class=\"comment-text\">\n" +
                                            "     <strong\n" +
                                            "     class=\"user-nick\">" +
                                            editcommentchild +
                                            "<a href=\"#\">"+result.commentchild[j].usersByUserUserName +"</a>\n" +

                                            "<span class=\"time-stamp \">"+result.commentchild[j].modifiedDate+"</span>\n" +
                                            "</strong>\n" +
                                            "        <div class=\"shortcode-content\">\n" +
                                            "         <p style=\"color: #ABABAB\">\n" +
                                            "        <a style=\"color: #0c91e5;\"\n" +
                                            "      href=\"\">@"+result.commentchild[j].usersBySubUserUserName +"</a>\n" +
                                            "     <span id=\"spanContent"+result.commentchild[j].commentId+"\">"+result.commentchild[j].content +" </span> </p>\n" +
                                            "         </div>\n" +
                                            checkuserIdLoginCommentChild +
                                            " </div>\n" +
                                            "<div class=\"comment-text\">\n" +
                                            "   <div id=\"showreplycomment" + result.commentchild[j].commentId + "\" class=\"comment-block\" style=\" margin:0px; margin-top:25px; \">\n" +

                                            "   </div>\n" +

                                                "</div>\n" +
                                            " </div>\n" +
                                            "  </li>\n" +
                                            "    </ul>\n" ;
                                    }
                                }
                                var checkuserIdLoginCommentParemt = '';
                                if(result.userIdLogin != result.commentparent[i].usersByUserId ){
                                    checkuserIdLoginCommentParemt = " <span class=\"item-meta\"> <a href=\"#\"><i\n" +
                                        "    class=\"fa fa-thumbs-o-up\"></i> Thích</a>\n" +
                                        "    <a class=\"replycomment\" href=\"javascript:void(0)\"\n" +
                                        "     onclick=\"replysubcomment('"+result.userName+"' ,'"+result.avatar+"' ,"+result.commentparent[i].commentId+","+result.commentparent[i].commentId+","+result.commentparent[i].usersByUserId+",'"+result.commentparent[i].usersByUserUserName+"');\">\n" +
                                        "     <i class=\"fa fa-comment-o\" style=\"margin-left: 25px;\"></i> Bình\n" +
                                        "luận</a>\n" +
                                        "</span>\n" ;
                                }
                                var editcommentparen = "";
                                if(result.roleEditComment == true || result.userIdLogin == result.commentparent[i].usersByUserId ){
                                    editcommentparen ="<div class=\"dropdown time-stamp pull-right right\">\n" +
                                        "   <button onclick=\"myFunction("+result.commentparent[i].commentId+")\" class=\"dropbtn fa fa-ellipsis-h\" style=\"color: #0b0b0b\"></button>\n" +
                                        "  <div id=\"myDropdown"+result.commentparent[i].commentId+"\" class=\"dropdown-content\">\n" +
                                        "  <a onclick=\"showModelDeleteComment("+result.commentparent[i].commentId+");\" href=\"#\"data-toggle=\"modal\" data-target=\"#myModal\" >Xóa</a>\n" +
                                        "   <a onclick=\"showUpdateComment('"+result.userName+"' ,'"+result.avatar+"' ,"+result.commentparent[i].commentId+","+result.commentparent[i].commentId+","+result.commentparent[i].usersByUserId+",'"+result.commentparent[i].usersByUserUserName+"');\" href=\"#\">Sửa</a>\n" +
                                        "   </div>\n" +
                                        "  </div>" ;
                                }
                                html += "  <li  class=\"comment\">\n" +
                                    " <div id=\"comment"+result.commentparent[i].commentId+"\" class=\"comment-block\">\n" +
                                    "  <a href=\"#\" class=\"image-avatar\"> <img\n" +
                                    "  src=\" " + result.commentparent[i].usersByUserAvatar + " \" \n" +
                                    "   data-ot-retina=\"" + result.commentparent[i].usersByUserAvatar + " \"\n" +
                                    "   alt=\"\"\n" +
                                    "   title=\"\">\n" +
                                    "    </a>\n" +
                                    "   <div class=\"comment-text\">\n" +
                                    "    <strong\n" +
                                    "      class=\"user-nick\">" +
                                    editcommentparen+
                                    "<a href=\"#\"> "+result.commentparent[i].usersByUserUserName +" </a>" +
                                    "<span class=\"time-stamp \">"+result.commentparent[i].modifiedDate+"</span>" +
                                    "</strong>\n" +
                                    "       <div class=\"shortcode-content\">\n" +
                                    "     <p id=\"spanContent"+result.commentparent[i].commentId+"\">"+result.commentparent[i].content +"</p>\n" +
                                    "    </div>\n" +
                                    checkuserIdLoginCommentParemt +
                                    "   </div>\n" +
                                    "<div class=\"comment-text\">\n" +
                                    "   <div id=\"showreplycomment" + result.commentparent[i].commentId + "\" class=\"comment-block\" style=\" margin-top:25px; \">\n" +
                                    "   </div>\n" +
                                    "</div> \n" +
                                    "  </div>\n" +
                                        "<div id=\"childcomment"+result.commentparent[i].commentId +"\" >\n"+
                                    ""+childcomment+"" +
                                    "</div>\n"+
                                    "   </li>\n" ;

                            }

                        }

                    } else {
                            for (var i = 0; i < Object.keys(result.commentparent).length; i++) {
                                if(result.commentparent[i].subCommentId === 0){
                                    var childcomment = "";
                                    for (var j = 0; j < Object.keys(result.commentchild).length; j++) {
                                        if (result.commentchild[j].subCommentId !== 0 && result.commentchild[j].subCommentId === result.commentparent[i].commentId){

                                            childcomment += "<ul class=\"children\">\n" +
                                                "   <li class=\"comment\">\n" +
                                                "    <div class=\"comment-block\">\n" +
                                                "    <a href=\"#\" class=\"image-avatar\"> <img\n" +
                                                "    src=\"" + result.commentchild[j].usersByUserAvatar + "\"\n" +
                                                "    data-ot-retina=\"" + result.commentchild[j].usersByUserAvatar + "\"\n" +
                                                "     alt=\"\"\n" +
                                                "     title=\"\">\n" +
                                                "     </a>\n" +
                                                "     <div class=\"comment-text\">\n" +
                                                "     <span class=\"time-stamp right\">"+result.commentchild[j].modifiedDate+"</span>\n" +
                                                "     <strong\n" +
                                                "     class=\"user-nick\"><a\n" +
                                                "      href=\"#\">"+result.commentchild[j].usersByUserUserName +"</a><span\n" +
                                                "       class=\"user-label\">Admin</span></strong>\n" +
                                                "        <div class=\"shortcode-content\">\n" +
                                                "         <p style=\"color: #ABABAB\">\n" +
                                                "        <a style=\"color: #0c91e5;\"\n" +
                                                "      href=\"\">@"+result.commentchild[j].usersBySubUserUserName +"</a>\n" +
                                                "          "+result.commentchild[j].content +"</p>\n" +
                                                "         </div>\n" +
                                                " </div>\n" +
                                                " </div>\n" +
                                                "  </li>\n" +
                                                "    </ul>\n" ;
                                        }
                                    }
                                    html += "  <li class=\"comment\">\n" +
                                        " <div class=\"comment-block\">\n" +
                                        "  <a href=\"#\" class=\"image-avatar\"> <img\n" +
                                        "  src=\"" + result.commentparent[i].usersByUserAvatar + " \" \n" +
                                        "   data-ot-retina=\"" + result.commentparent[i].usersByUserAvatar + " \"\n" +
                                        "   alt=\"\"\n" +
                                        "   title=\"\">\n" +
                                        "    </a>\n" +
                                        "   <div class=\"comment-text\">\n" +
                                        "   <span class=\"time-stamp right\">"+result.commentparent[i].modifiedDate+"</span> <strong\n" +
                                        "      class=\"user-nick\"><a\n" +
                                        "      href=\"#\"> "+result.commentparent[i].usersByUserUserName +" </a></strong>\n" +
                                        "       <div class=\"shortcode-content\">\n" +
                                        "      <p>"+result.commentparent[i].content +"</p>\n" +
                                        "    </div>\n" +
                                        "   </div>\n" +
                                        "  </div>\n" +
                                        ""+childcomment+"" +
                                        "   </li>\n" ;

                                }

                            }

                        }
                    $('#comments').append(html);
                    page = page + 1;
                    if(Object.keys(result.commentparent).length < 10){
                        $('.xemthemcomment').hide();
                    }

                    $("#LoadingGifSmall").hide();
                    $('#morecomment').show();
                },
                error: function (e) {
                    $("#LoadingGifSmall").hide();
                    $('#morecomment').show();
                    alert("Lỗi ! Vui Lòng Kiểm Tra Lại");
                }
            });
        }, 1000);
    };
</script>

<!-- Hiển Thị Popup Xóa Bình Luận -->
<script>
    function showModelDeleteComment(commentId){
        $('#btn-deleteComment').attr('onclick','deletecomment('+commentId+');');
    };
    function deletecomment(commentId) {
        clearTimeout(timeout);
        timeout = setTimeout(function () {
            var articleId = $('#articleId').val();
            $('#morecomment').hide();
            $("#LoadingGifSmall").show();
            var token = $("meta[name='_csrf']").attr("content");
            var header = $("meta[name='_csrf_header']").attr("content");
            $(document).ajaxSend(function (e, xhr, options) {
                xhr.setRequestHeader(header, token);

            });
            $.ajax({

                type: "POST",
                //contentType: "application/json",
                url: "${pageContext.request.contextPath}/deletecomment",
                data: {
                    commentId: commentId
                },
                //dataType: 'json',
                // timeout: 600000,
                success: function (result) {
                    $("#LoadingGifSmall").hide();
                    location.reload();
                },
                error: function (e) {
                    $("#LoadingGifSmall").hide();
                    alert("Lỗi ! Vui Lòng Kiểm Tra Lại");
                }
            });
        }, 1000);
    };
</script>