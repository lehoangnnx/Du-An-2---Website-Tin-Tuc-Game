
    $('#allcb').change(function() {
        $("input[type='checkbox'][name='cb']").prop('checked', $(this).prop('checked'));

    });

    var tableControl = document.getElementById('table-3');
    $("input[name='cb']").change(function() {

        var result = []

        $('input[name=cb]:checked', tableControl).each(function() {
            console.log($(this).val()+"i")
            result.push($(this).val());
            if(result.indexOf('on') == 0){
                result.splice(result.indexOf('on'), 1 );
            }
        });

        $("#arrayId").val(result);

    });


function openTab(evt, tabName) {
    var i, tabcontent, tablinks;
    tabcontent = document.getElementsByClassName("tabcontent");
    for (i = 0; i < tabcontent.length; i++) {
        tabcontent[i].style.display = "none";
    }
    tablinks = document.getElementsByClassName("tablinks");
    for (i = 0; i < tablinks.length; i++) {
        tablinks[i].className = tablinks[i].className.replace(" active", "");
    }
    document.getElementById(tabName).style.display = "block";
    evt.currentTarget.className += " active";
};



	function deleteOne(arrayId){
			$("#arrayId").val(arrayId);
			$("#command").attr("action", contextPath+"/admin/articles/categorys");
		};
	function deleteAll(){
			$("#command").attr("action", contextPath+"/admin/articles/categorys");
	};

$(document).ready(function() {
	var msg = $("#msg").val();
	if(msg != "" ){
		alert(msg);
	}
	
});

		
 
		var timeout = null;
		function updateStatus(id) {
			//var id = $(this).val();
			clearTimeout(timeout);
			timeout = setTimeout(function ()
			{
				var article = {};
				var token = $("meta[name='_csrf']").attr("content");
				var header = $("meta[name='_csrf_header']").attr("content");
				$(document).ajaxSend(function(e, xhr, options) {
					xhr.setRequestHeader(header, token);
				});							
				if ($("#idArticleCheckbox"+id).is(':checked')) {
					
					article["status"] = 'active' ;
					article["articleId"] = id ;
		           
		        }else{
		        	
		        	article["status"] = 'inactive' ;
					article["articleId"] = id ;
			    }


			 $.ajax({

					type : "POST",
					contentType : "application/json",
					url : contextPath+"/admin/updateStatusArticles",
					data : JSON.stringify(article),
					//dataType: 'json',
					// timeout: 600000,
					success : function(result) {
						//alert(result);
						if(result == 'success'){
								alert("Sửa Trạng Thái Bài Viết Thành Công");
						}
						if(result == 'error'){
							alert("Sửa Trạng Thái Bài Viết Thất Bại");
					}
					

					},
					error : function(e) {
						alert("Lỗi ! Vui Lòng Kiểm Tra Lại Thông Tin");
					}
				}); 
			}, 200);
			
		};


