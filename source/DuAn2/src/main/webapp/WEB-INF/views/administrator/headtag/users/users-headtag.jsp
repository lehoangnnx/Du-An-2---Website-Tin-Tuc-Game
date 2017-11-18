<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!-- Vendor CSS -->
		<link rel="stylesheet" href="${contextPath}/css/bootstrap4/css/bootstrap.min.css">
		<link rel="stylesheet" href="${contextPath}/css/themify-icons/themify-icons.css">
		<link rel="stylesheet" href="${contextPath}/css/font-awesome/css/font-awesome.min.css">
		<link rel="stylesheet" href="${contextPath}/css/animate.css/animate.min.css">
		<link rel="stylesheet" href="${contextPath}/css/jscrollpane/jquery.jscrollpane.css">
		<link rel="stylesheet" href="${contextPath}/css/waves/waves.min.css">
		<link rel="stylesheet" href="${contextPath}/css/switchery/dists/switchery.min.css">
		<link rel="stylesheet" href="${contextPath}/css/DataTables/css/dataTables.bootstrap4.min.css">
		<link rel="stylesheet" href="${contextPath}/css/DataTables/Responsive/css/responsive.bootstrap4.min.css">
		<link rel="stylesheet" href="${contextPath}/css/DataTables/Buttons/css/buttons.dataTables.min.css">
		<link rel="stylesheet" href="${contextPath}/css/DataTables/Buttons/css/buttons.bootstrap4.min.css">

		<!-- Neptune CSS -->
		<link rel="stylesheet" href="${contextPath}/css/css/core.css">
<link rel="stylesheet" href="${contextPath}/css/sweetalert2/sweetalert2.min.css">
		<style>
.add, .updateAndDelete {
	text-align: center;
}
.cbDeleteAll{
text-align: center;
width: 20%;
}
/* Style the tab */
div.tab {
	overflow: hidden;
	border: 1px solid #ccc;
	background-color: #f1f1f1;
}

/* Style the buttons inside the tab */
div.tab button {
	background-color: inherit;
	float: left;
	border: none;
	outline: none;
	cursor: pointer;
	padding: 14px 16px;
	transition: 0.3s;
	font-size: 17px;
}

/* Change background color of buttons on hover */
div.tab button:hover {
	background-color: #ddd;
}

/* Create an active/current tablink class */
div.tab button.active {
	background-color: #ccc;
}

/* Style the tab content */
.tabcontent {
	display: none;
	padding: 6px 12px;
	-webkit-animation: fadeEffect 1s;
	animation: fadeEffect 1s;
}

/* Fade in tabs */
@
-webkit-keyframes fadeEffect {
	from {opacity: 0;
}

to {
	opacity: 1;
}

}
@
keyframes fadeEffect {
	from {opacity: 0;
}

to {
	opacity: 1;
}
}
</style>