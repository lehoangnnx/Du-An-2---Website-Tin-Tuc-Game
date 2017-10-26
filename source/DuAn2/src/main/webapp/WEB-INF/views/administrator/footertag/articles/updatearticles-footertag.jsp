<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<script type="text/javascript"
	src="${contextPath}/js/jquery/jquery-1.12.3.min.js"></script>

<script type="text/javascript" src="${contextPath}/js/jquery/jquery-1.12.3.min.js"></script>
		<script type="text/javascript" src="${contextPath}/js/tether/js/tether.min.js"></script>
		<script type="text/javascript" src="${contextPath}/js/bootstrap4/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="${contextPath}/js/detectmobilebrowser/detectmobilebrowser.js"></script>
		<script type="text/javascript" src="${contextPath}/js/jscrollpane/jquery.mousewheel.js"></script>
		<script type="text/javascript" src="${contextPath}/js/jscrollpane/mwheelIntent.js"></script>
		<script type="text/javascript" src="${contextPath}/js/jscrollpane/jquery.jscrollpane.min.js"></script>
		<script type="text/javascript" src="${contextPath}/js/jquery-fullscreen-plugin/jquery.fullscreen-min.js"></script>
		<script type="text/javascript" src="${contextPath}/js/waves/waves.min.js"></script>
		<script type="text/javascript" src="${contextPath}/js/switchery/dist/switchery.min.js"></script>
<script type="text/javascript" src="${contextPath}/js/summernote/summernote.min.js"></script>
<script type="text/javascript" src="${contextPath}/js/dropify/dist/js/dropify.min.js"></script>
		<!-- Neptune JS -->
		<script type="text/javascript" src="${contextPath}/js/js/forms-editors.js"></script>
		<script type="text/javascript" src="${contextPath}/js/js/forms-upload.js"></script>
		
		
		<script type="text/javascript" src="${contextPath}/js/js/app.js"></script>
		<script type="text/javascript" src="${contextPath}/js/js/demo.js"></script>
 		<script src="${contextPath}/js/js/app.min.js" type="text/javascript"></script>


		
		
		
		<script>
		
  $(document).ready(
	function($) {
		var timeout = null;
		$("#email").on('keyup keypress keydown', function(event) {
			
			clearTimeout(timeout);
			timeout = setTimeout(function ()
			{
			var users = {};
			users["userId"] = $("#userId").val();
			users["email"] = $("#email").val();
			//alert(users.userId + users.email);
			// $("#btn-update").prop("disabled", true);
			 var token = $("meta[name='_csrf']").attr("content");
			    var header = $("meta[name='_csrf_header']").attr("content");
			    $(document).ajaxSend(function(e, xhr, options) {
			        xhr.setRequestHeader(header, token);
			    });
			$.ajax({
						
		             type: "POST",
		             contentType: "application/json",
		             url: "${pageContext.request.contextPath}/admin/validator-user",
		             data: JSON.stringify(users),
		             //dataType: 'json',
		            // timeout: 600000,
		             success: function (result) {
			           //  alert(result);
		                 if(result == 'erroremail'){
		                	 $("#btn-update").prop("disabled", true);
			                 $("#divEmail").addClass("has-error");
			                 $("#spanEmail").text("Email Đã Tồn Tại - Vui Lòng Nhập Email Khác");
			             }
		                 if(result == 'successemail'){
		                	 $("#btn-update").prop("disabled", false);
			                 $("#divEmail").removeClass("has-error");
			                 $("#spanEmail").text("Nhập Email");
			             }
			             
		             },
		             error: function (e) {
		                		                
		             }
			});
			}, 1000);
			
		}); 

		

	});
	
</script>

<script>
$(document).ready(function() {
	var msg = $("#msg").val();
	if(msg != "" ){
		alert(msg);
	}

	
});
</script>