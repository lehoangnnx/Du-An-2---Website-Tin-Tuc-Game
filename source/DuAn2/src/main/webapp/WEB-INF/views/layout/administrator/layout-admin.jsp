<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>

<html lang="en">

	<head>
	<title><tiles:insertAttribute name="title" /></title>
		<tiles:insertAttribute name="head" />
		<tiles:insertAttribute name="headtag" />
	</head>
	<body class="fixed-sidebar fixed-header skin-default content-appear">

		<div class="wrapper">

			<!-- Preloader -->
			<div class="preloader"></div>

			<!-- Sidebar -->
			<div class="site-overlay"></div>
            <tiles:insertAttribute name="sitebar" />
			
			<!-- Sidebar second -->


			<!-- Template options -->
			

			<!-- Header -->
			<div class="site-header">
            <tiles:insertAttribute name="navbar" />
			</div>

			<div class="site-content">
				<!-- Content -->
				<tiles:insertAttribute name="body" />
				<!-- Footer -->
				<tiles:insertAttribute name="footer" />
			</div>

		</div>

		<tiles:insertAttribute name="footertag" />
		<script type="text/javascript">
		// Mở Đăng Xuất
		$('#btn-logout').click(function () {
		        var token = $("meta[name='_csrf']").attr("content");
		        var header = $("meta[name='_csrf_header']").attr("content");
		        $(document).ajaxSend(function (e, xhr, options) {
		            xhr.setRequestHeader(header, token);
		        });
		        $.ajax({
		            type: "POST",
		            url: "${pageContext.request.contextPath}/logout",
		            success: function (result) {
		            
		                if (result == "success") {
		                	window.location.href = "${pageContext.request.contextPath}/";
		                }
		            },
		            error: function(xhr, status, error) {
		                var err = eval("(" + xhr.responseText + ")");
		                alert("Lỗi ! Vui Lòng Kiểm Tra Lại");
		                window.location.href = "${pageContext.request.contextPath}/";
		            }
		        });
		   
		});
		//Đóng Đăng xuất
		</script>
	</body>
</html>