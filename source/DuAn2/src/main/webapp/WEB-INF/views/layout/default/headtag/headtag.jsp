<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<link type="text/css" rel="stylesheet" href="${contextPath}/css/css/bootstrap.min.css" />
<link type="text/css" rel="stylesheet" href="${contextPath}/css/css/bootstrap1.min.css" />

<link type="text/css" rel="stylesheet" href="${contextPath}/css/css/font-awesome.min.css" />

<link href="${contextPath}/css/css/main.css" rel="stylesheet">
<link type="text/css" rel="stylesheet" href="${contextPath}/css/css/responsive.css" />
<link rel="shortcut icon" href="images/ico/favicon-.png">

<link type="text/css" rel="stylesheet" href="${contextPath}/css/css/main-stylesheet.css" />
<link type="text/css" rel="stylesheet" href="${contextPath}/css/css/reset.css" />

<link type="text/css" rel="stylesheet" href="${contextPath}/css/css/responsive1.css" />
<link rel="stylesheet" type="text/css"
	href="${contextPath}/sliderengine/amazingslider-1.css">
 <link rel="stylesheet" href="${contextPath}/css/css/reset-login.css"> <!-- CSS reset --> 
	<link rel="stylesheet" href="${contextPath}/css/css/style-login.css"> <!-- Gem style -->
	<style>
body {
	background-color: #fff;
}

.feed-widget-header .widget-title {
	margin: 0 10px 5px 0;
	float: left;
}

.widget-title a {
	color: #EB6435;
	margin-bottom: 0px;
}

.widget-title a:hover {
	color: #EA3A00;
}

.feed-widget-viewall a {
	color: #EB6435;
}

.feed-widget-viewall a:hover {
	color: #EA3A00;
}

.feed-widget-viewall {
	float: right;
	margin: 10px 0 0;
}

.content .content-block .content-panel-title h2 {
	margin-bottom: 5px;
}

div.clear {
	clear: both;
}

@media only screen and (max-width: 499px) {
	.feed-widget-header .widget-title {
		font-size: 16px;
	}
}
</style>


<style>
.shad {
	-webkit-box-shadow: 2px 2px 3px rgba(0, 0, 0, .05);
	-o-box-shadow: 2px 2px 3px rgba(0, 0, 0, .05);
	-ms-box-shadow: 2px 2px 3px rgba(0, 0, 0, .05);
	box-shadow: 2px 2px 3px rgba(0, 0, 0, .05);
}

a.scroll-up {
	height: 40px;
	width: 40px;
	text-align: center;
	cursor: pointer;
	text-decoration: none;
	color: #FF3D00;
}

a.scroll-up {
	z-index: 99;
	font-size: 25px;
	line-height: 40px;
	-o-border-radius: 2px;
	-ms-border-radius: 2px;
	-webkit-border-radius: 2px;
	border-radius: 2px;
	position: fixed;
	bottom: 10px;
	right: 10px;
	overflow: font-size;
	background: #fff;
}

a.scroll-up:hover {
	background: currentColor;
}

a.scroll-up:hover i {
	color: #fff;
}

@media only screen and (max-width: 699px) {
	a.scroll-up {
		width: 30px;
		height: 30px;
		line-height: 30px;
		right: 5px;
	}
}

@media print {
	.scroll-up {
		display: none !important;
	}
	.shad {
		-webkit-box-shadow: none !important;
		-o-box-shadow: none !important;
		-ms-box-shadow: none !important;
		box-shadow: none !important;
	}
}

#back-to-top {
	position: fixed;
	z-index: 9999;
	cursor: pointer;
	transition: opacity 0.2s ease-out;
	opacity: 0;
}

#back-to-top.show {
	opacity: 1;
}
</style>