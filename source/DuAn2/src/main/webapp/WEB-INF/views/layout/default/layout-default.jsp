<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>

		<tiles:insertAttribute name="head" />
		<tiles:insertAttribute name="headtag" />



</head>

<!--/head-->
<body>

	<!--/Thanh menu điều hướng-->
	<tiles:insertAttribute name="navbar" />
	
	<!--Video mới-->


	<div class="content">

		<div class="container">
			<div class="row">
				<div class="videohighlight"></div>
			</div>
		</div>
	</div>
	<div class="clearfix"></div>
	<!--/Đóng Video mới-->
	<!--Đóng video-->
	<div class="boxed">
		<!-- BEGIN .content -->
		<section class="content">
			<!-- BEGIN .wrapper -->
			<div class="wrapper">
				<div class="content-block has-sidebar">
					<!-- BEGIN .content-block-single -->
					<tiles:insertAttribute name="body" />

					<!-- BEGIN .sidebar -->
					<tiles:insertAttribute name="sitebar" />

				</div>


				<!-- END .wrapper -->
			</div>

			<!-- BEGIN .content -->
		</section>
	</div>
	<!-- END body -->
	<!-- footer -->
	<tiles:insertAttribute name="footer" />
	
	<tiles:insertAttribute name="footertag" />
	<tiles:insertAttribute name="scriptfootertag" />
</body>

</html>