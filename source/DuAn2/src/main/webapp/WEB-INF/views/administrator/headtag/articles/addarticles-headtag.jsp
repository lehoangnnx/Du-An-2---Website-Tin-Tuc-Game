<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!-- Vendor CSS -->
		<link rel="stylesheet" href="${contextPath}/css/bootstrap4/css/bootstrap.min.css">

<link rel="stylesheet" href="${contextPath}/css/bootstrap4/css/bootstrap.min.css">
<link rel="stylesheet" href="${contextPath}/css/themify-icons/themify-icons.css">
<link rel="stylesheet" href="${contextPath}/css/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="${contextPath}/css/animate.css/animate.min.css">
<link rel="stylesheet" href="${contextPath}/css/jscrollpane/jquery.jscrollpane.css">
<link rel="stylesheet" href="${contextPath}/css/waves/waves.min.css">
<link rel="stylesheet" href="${contextPath}/css/switchery/dist/switchery.min.css">
<link rel="stylesheet" href="${contextPath}/css/summernote/summernote.css">
<link rel="stylesheet" href="${contextPath}/css/dropify/dist/css/dropify.min.css">


<link rel="stylesheet" href="${contextPath}/css/select2/dist/css/select2.min.css">
<link rel="stylesheet" href="${contextPath}/css/bootstrap-tagsinput/dist/bootstrap-tagsinput.css">
<link rel="stylesheet" href="${contextPath}/css/multi-select/css/multi-select.css">
<link rel="stylesheet" href="${contextPath}/css/bootstrap-touchspin/dist/jquery.bootstrap-touchspin.min.css">


<!-- Neptune CSS -->
<link rel="stylesheet" href="${contextPath}/css/css/core.css">

<style>
	/*! CSS Used from: file:///E:/GiaoDien/Metronic%20-%20Responsive%20Admin%20Dashboard%20Template%20v4.7/metronic_v4.7/theme/assets/global/plugins/bootstrap/css/bootstrap.min.css */
	label{max-width:100%;}
	input{color:inherit;font:inherit;margin:0;}
	input::-moz-focus-inner{border:0;padding:0;}
	input[type=checkbox]{box-sizing:border-box;padding:0;}
	@media print{
		*,:after,:before{background:0 0!important;color:#000!important;box-shadow:none!important;text-shadow:none!important;}
	}
	*,:after,:before{-webkit-box-sizing:border-box;-moz-box-sizing:border-box;box-sizing:border-box;}
	input{font-family:inherit;font-size:inherit;line-height:inherit;}
	label{font-weight:700;}
	label{display:inline-block;margin-bottom:5px;}
	input[type=checkbox]{margin:4px 0 0;margin-top:1px\9;line-height:normal;}
	input[type=checkbox]:focus{outline:-webkit-focus-ring-color auto 5px;outline-offset:-2px;}
	.form-group{margin-bottom:15px;}
	/*! CSS Used from: file:///E:/GiaoDien/Metronic%20-%20Responsive%20Admin%20Dashboard%20Template%20v4.7/metronic_v4.7/theme/assets/global/css/components.min.css */
	div,input,label,span{-webkit-border-radius:0!important;-moz-border-radius:0!important;border-radius:0!important;}
	.form-md-checkboxes{padding-top:5px;}
	.md-checkbox{position:relative;}
	.md-checkbox input[type=checkbox]{visibility:hidden;position:absolute;}
	.md-checkbox label{cursor:pointer;padding-left:30px;}
	.md-checkbox label>span{display:block;position:absolute;left:0;-webkit-transition-duration:.3s;-moz-transition-duration:.3s;transition-duration:.3s;}
	.md-checkbox label>.box{top:0;border:2px solid #666;height:20px;width:20px;z-index:5;-webkit-transition-delay:.2s;-moz-transition-delay:.2s;transition-delay:.2s;}
	.md-checkbox label>.check{top:-4px;left:6px;width:10px;height:20px;border:2px solid #36c6d3;border-top:none;border-left:none;opacity:0;z-index:5;-webkit-transform:rotate(180deg);-moz-transform:rotate(180deg);transform:rotate(180deg);-webkit-transition-delay:.3s;-moz-transition-delay:.3s;transition-delay:.3s;}
	.md-checkbox input[type=checkbox]:checked~label>.box{opacity:0;-webkit-transform:scale(0) rotate(-180deg);-moz-transform:scale(0) rotate(-180deg);transform:scale(0) rotate(-180deg);}
	.md-checkbox input[type=checkbox]:checked~label>.check{opacity:1;-webkit-transform:scale(1) rotate(45deg);-moz-transform:scale(1) rotate(45deg);transform:scale(1) rotate(45deg);}
	.md-checkbox input[type=checkbox]:disabled:checked~label>.check,.md-checkbox input[type=checkbox]:disabled~label,.md-checkbox input[type=checkbox]:disabled~label>.box{cursor:not-allowed;opacity:.7;filter:alpha(opacity=70);}
	.form-md-checkboxes>label{font-size:14px;color:#888;opacity:1;filter:alpha(opacity=100);}
	.md-checkbox-inline{margin:5px 0;}
	.md-checkbox-inline .md-checkbox{display:inline-block;margin-right:20px;}
	.md-checkbox-inline .md-checkbox:last-child{margin-right:0;}
	label{font-weight:400;}
</style>

