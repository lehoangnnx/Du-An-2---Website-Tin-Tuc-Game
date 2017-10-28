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


<script type="text/javascript" src="${contextPath}/js/js/forms-editors.js"></script>
<script type="text/javascript" src="${contextPath}/js/summernote/summernote.min.js"></script>
<script type="text/javascript" src="${contextPath}/js/dropify/dist/js/dropify.min.js"></script>
	
<script type="text/javascript" src="${contextPath}/js/js/forms-upload.js"></script>


<script type="text/javascript" src="${contextPath}/js/select2/dist/js/select2.min.js"></script>
<script type="text/javascript" src="${contextPath}/js/bootstrap-tagsinput/dist/bootstrap-tagsinput.min.js"></script>
<script type="text/javascript" src="${contextPath}/js/multi-select/js/jquery.multi-select.js"></script>
<script type="text/javascript" src="${contextPath}/js/bootstrap-touchspin/dist/jquery.bootstrap-touchspin.min.js"></script>
<script type="text/javascript" src="${contextPath}/js/bootstrap-maxlength/src/bootstrap-maxlength.js"></script>
		<!-- Neptune JS -->




		<script type="text/javascript" src="${contextPath}/js/js/app.js"></script>
		<script type="text/javascript" src="${contextPath}/js/js/demo.js"></script>


<script type="text/javascript" src="${contextPath}/js/js/forms-plugins.js"></script>

<script>
	$(document).ready(function() {
		
		$('#inputframeVideo').change(function() {
			$("#iframeVideo").addClass('embed-responsive embed-responsive-16by9');
			$("#iframeVideo").html('<iframe width="560" height="315" src="https://www.youtube.com/embed/5hcqd_w3k8s" frameborder="0" allowfullscreen></iframe>');
					
			});
	});

	function ChangeToSlug()
	{
	    var title, slug;
	 
	    //Lấy text từ thẻ input title 
	   title = document.getElementById("title").value;
	 
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
	    slug = slug.replace(/\`|\~|\!|\@|\#|\||\$|\%|\^|\&|\*|\(|\)|\+|\=|\,|\.|\/|\?|\>|\<|\'|\"|\:|\;|_/gi, '');
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