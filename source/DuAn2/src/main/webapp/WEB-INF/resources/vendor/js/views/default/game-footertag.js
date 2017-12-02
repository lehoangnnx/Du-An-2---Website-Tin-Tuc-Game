
$(document).ready(function(ev){
    $('#custom_carousel').on('slide.bs.carousel', function (evt) {
        $('#custom_carousel .controls li.active').removeClass('active');
        $('#custom_carousel .controls li:eq('+$(evt.relatedTarget).index()+')').addClass('active');
    })
});

$(document).ready(function() {
    var $btnSets = $('#responsive'),
        $btnLinks = $btnSets.find('a');

    $btnLinks.click(function(e) {
        e.preventDefault();
        $(this).siblings('a.active').removeClass("active");
        $(this).addClass("active");
        var index = $(this).index();
        $("div.user-menu>div.user-menu-content").removeClass("active");
        $("div.user-menu>div.user-menu-content").eq(index).addClass("active");
    });
});

$( document ).ready(function() {
    $("[rel='tooltip']").tooltip();

    $('.view').hover(
        function(){
            $(this).find('.caption').slideDown(250); //.fadeIn(250)
        },
        function(){
            $(this).find('.caption').slideUp(250); //.fadeOut(205)
        }
    );
});

$(document).ready(function(){
    var searchParams = new URLSearchParams(window.location.search);
    if(searchParams.has('gamecategory')){
        $('#gameCategorySlug').find('option').each(function(i,e){
            if($(e).val() == searchParams.get('gamecategory')){
                $('#gameCategorySlug').prop('selectedIndex',i);
            }
        });
    }else {
        $('#gameCategorySlug').find('option').each(function(i,e){
            if($(e).val() == 'all'){
                $('#gameCategorySlug').prop('selectedIndex',i);
            }
        });
    }
    getGame();
});
$('#btn-searchgame').click(function () {
    getGame();
});
var nameGame = [];
$( function() {
    $( "#keysearch" ).autocomplete({
        source: nameGame
    });
});
$(document).ready(function () {
    $.ajax({
        type: 'GET',
        contentType: "application/json",
        url: contextPath+'/getgamesname',
        success: function (result) {

            var n =Object.keys(result.gamesName).length;

            for(var i =0 ; i< n; i++){
                nameGame.push(unescapeHtml(result.gamesName[i]));
            }


        }
    });
});
function unescapeHtml(safe) {
    return $('<div />').html(safe).text();
}
var timeout1 = null;
var page = 1;
function getGame() {
    var searchParams = new URLSearchParams(window.location.search);
    if(searchParams.has('sorted')){
        var sorted = searchParams.get('sorted');

    }else {
        var sorted = 'news';
    }
    var gameCategorySlug = $('#gameCategorySlug').val();
    var publishers = $('#publishers').val();
    var keysearch = $('#keysearch').val();

    clearTimeout(timeout1);
    timeout1 = setTimeout(function () {
        $.ajax({
            type: 'GET',
            contentType: "application/json",
            url: contextPath+'/getgames',
            data:{gameCategorySlug:gameCategorySlug,
                publishers:publishers,
                keysearch:keysearch,
                sorted:sorted,
                page: page
            },

            success: function (result) {
                var html ='';
                var n =Object.keys(result).length;

                for(var i =0 ; i< n; i++){
                    var gameCategory = '';
                    for (var j=0;j<Object.keys(result[i].gamesCategories).length;j++){
                        gameCategory += " "+result[i].gamesCategories[j].name+" | ";
                    }
                    html+="<div style=\"height:250px;\" class=\"col-md-4\">\n" +
                        "   <div class=\"artist-data pull-left\">\n" +
                        "   <div class=\"artst-pic pull-left\">\n" +
                        "   <span class=\"artst-like\"><a href=\"#\"><i class=\"glyphicon glyphicon-heart-empty\"></i></a></span>\n" +
                        "  <span class=\"artst-share\"><a href=\"#\"><i class=\"glyphicon glyphicon-share\"></i></a></span>\n" +
                        "  <span class=\"artst-plus\"><a href=\"#\"><i class=\"glyphicon glyphicon-plus-sign\"></i></a></span>\n" +
                        "  <a href=\""+contextPath+"/games/" + result[i].slug + ".html \">\n" +
                        "  <img style=\"width: 100%; height: 160px;\" src=\""+contextPath+"/images/games/" + result[i].images + "\" alt=\"\" class=\"img-responsive\" />\n" +
                        " </a>\n" +
                        " </div>\n" +
                        " <div class=\"artst-prfle pull-right\">\n" +
                        " <div class=\"art-title\">\n" +
                        " <a href=\""+contextPath+"/games/" + result[i].slug + ".html \">"+result[i].name+" </a> \n" +
                        " <span class=\"artst-sub\">Thể loại : <span class=\"byname\"> "+gameCategory+" </span> <span class=\"daysago\"></span></span>\n" +
                        "  </div>\n" +
                        "  <div class=\"counter-tab\">\n" +
                        "   <ul class=\"list-inline mrg-0 btm-mrg-10 clr-535353\">\n" +
                        "  <li>Điểm Đánh Giá : </li>\n" +
                        "  <li>"+result[i].pointGameReviews+"/10</li>\n" +
                        "  </ul>\n" +
                        "  <ul class=\"list-inline mrg-0 btm-mrg-10 clr-535353\">\n" +
                        " <li>Số lượt bình chọn : </li>\n" +
                        "  <li>"+result[i].gameReviews+"</li>\n" +
                        " </ul>\n" +
                        " </div>\n" +
                        " </div>\n" +
                        "<div class=\"bot-links\">\n" +
                        " <a href=\""+contextPath+"/games/" + result[i].slug + ".html\">Xem chi tiết</a>\n" +
                        " <a target=\"_blank\" href=\""+result[i].homeUrl+"\">Trang Chủ</a>\n" +
                        " <a target=\"_blank\" href=\""+result[i].downloadUrl+"\">Tải game</a>\n" +
                        " </div>\n" +
                        " </div>\n" +
                        " </div>";
                }

                if(n < 9){
                    $('#next').css({"pointer-events" : "none","cursor":"default"});
                   // $('#preview').css({"pointer-events" : "","cursor":""});
                }else {
                    $('#next').css({"pointer-events" : "","cursor":""});
                }
                 if(page == 1){
                    $('#preview').css({"pointer-events" : "none","cursor":"default"});
                   // $('#next').css({"pointer-events" : "","cursor":""});
                }else {
                     $('#preview').css({"pointer-events" : "","cursor":""});
                 }

                $('#danhsachgame').html(html)
            }
        });
    }, 100);
};
$('#next').click(function(){
    page = page +1;

    getGame();
});
$('#preview').click(function(){
    page = page - 1;

    getGame();

});



