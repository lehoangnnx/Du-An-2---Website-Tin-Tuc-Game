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
<style>


#lean_overlay {
		position: fixed;
		z-index: 100;
		top: 0px;
		left: 0px;
		height: 100%;
		width: 100%;
		background: #000;
		display: none;
}

.popupContainer {
		position: absolute;
		width: 330px;
		height: auto;
		left: 45%;
		top: 60px;
		background: #FFF;
}





.btn_red {
		background: #ED6347;
		color: #FFF;
}

.btn:hover {
		background: #E4E4E2;
}

.btn_red:hover {
		background: #C12B05;
}

a.btn {
		color: #666;
		text-align: center;
		text-decoration: none;
}

a.btn_red {
		color: #FFF;
}

.one_half {
		width: 50%;
		display: block;
		float: left;
}

.one_half.last {
		width: 45%;
		margin-left: 5%;
}
/* Popup Styles*/

.popupHeader {
		font-size: 16px;
		text-transform: uppercase;
}

.popupHeader {
		background: #F4F4F2;
		position: relative;
		padding: 10px 20px;
		border-bottom: 1px solid #DDD;
		font-weight: bold;
}

.popupHeader .modal_close {
		position: absolute;
		right: 0;
		top: 0;
		padding: 10px 15px;
		background: #E4E4E2;
		cursor: pointer;
		color: #aaa;
		font-size: 16px;
}

.popupBody {
		padding: 20px;
}
/* Social Login Form */

.social_login {}

.social_login .social_box {
		display: block;
		clear: both;
		padding: 10px;
		margin-bottom: 10px;
		background: #F4F4F2;
		overflow: hidden;
}

.social_login .icon {
		display: block;
		width: 10px;
		padding: 5px 10px;
		margin-right: 10px;
		float: left;
		color: #FFF;
		font-size: 16px;
		text-align: center;
}

.social_login .fb .icon {
		background: #3B5998;
}

.social_login .google .icon {
		background: #DD4B39;
}

.social_login .icon_title {
		display: block;
		padding: 5px 0;
		float: left;
		font-weight: bold;
		font-size: 16px;
		color: #777;
}

.social_login .social_box:hover {
		background: #E4E4E2;
}

.centeredText {
		text-align: center;
		margin: 20px 0;
		clear: both;
		overflow: hidden;
		text-transform: uppercase;
}

.action_btns {
		clear: both;
		overflow: hidden;
}

.action_btns a {
		display: block;
}
/* User Login Form */

.user_login {
		display: none;
}

.user_login label {
		display: block;
		margin-bottom: 5px;
}

.user_login input[type="text"],
.user_login input[type="email"],
.user_login input[type="password"] {
		display: block;
		width: 90%;
		padding: 10px;
		border: 1px solid #DDD;
		color: #666;
}

.user_login input[type="checkbox"] {
		float: left;
		margin-right: 5px;
}

.user_login input[type="checkbox"]+label {
		float: left;
}

.user_login .checkbox {
		margin-bottom: 10px;
		clear: both;
		overflow: hidden;
}

.forgot_password {
		display: block;
		margin: 20px 0 10px;
		clear: both;
		overflow: hidden;
		text-decoration: none;
		color: #ED6347;
}
/* User Register Form */

.user_register {
		display: none;
}

.user_register label {
		display: block;
		margin-bottom: 5px;
}

.user_register input[type="text"],
.user_register input[type="email"],
.user_register input[type="password"] {
		display: block;
		width: 90%;
		padding: 10px;
		border: 1px solid #DDD;
		color: #666;
}

.user_register input[type="checkbox"] {
		float: left;
		margin-right: 5px;
}

.user_register input[type="checkbox"]+label {
		float: left;
}

.user_register .checkbox {
		margin-bottom: 10px;
		clear: both;
		overflow: hidden;
}
</style>