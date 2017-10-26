<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<meta name="_csrf" content="${_csrf.token}" />
<!-- default header name is X-CSRF-TOKEN -->
<meta name="_csrf_header" content="${_csrf.headerName}" />
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!-- Vendor CSS -->
<link rel="stylesheet"
	href="${contextPath}/css/bootstrap4/css/bootstrap.min.css">

<link rel="stylesheet"
	href="${contextPath}/css/themify-icons/themify-icons.css">
<link rel="stylesheet"
	href="${contextPath}/css/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet"
	href="${contextPath}/css/animate.css/animate.min.css">
<link rel="stylesheet"
	href="${contextPath}/css/jscrollpane/jquery.jscrollpane.css">
<link rel="stylesheet" href="${contextPath}/css/waves/waves.min.css">
<link rel="stylesheet"
	href="${contextPath}/css/switchery/dist/switchery.min.css">
<link rel="stylesheet"
	href="${contextPath}/css/summernote/summernote.css">

<link rel="stylesheet"
	href="${contextPath}/css/dropify/dist/css/dropify.min.css">


<!-- Neptune CSS -->
<link rel="stylesheet" href="${contextPath}/css/css/core.css">


<style>
/*! CSS Used from: file:///E:/GiaoDien/Metronic%20-%20Responsive%20Admin%20Dashboard%20Template%20v4.7/metronic_v4.7/theme/assets/global/plugins/bootstrap/css/bootstrap.min.css */
label{max-width:100%;}
input{color:inherit;font:inherit;margin:0;}
input::-moz-focus-inner{border:0;padding:0;}
input[type=radio]{box-sizing:border-box;padding:0;}
@media print{
*,:after,:before{background:0 0!important;color:#000!important;box-shadow:none!important;text-shadow:none!important;}
}
*,:after,:before{-webkit-box-sizing:border-box;-moz-box-sizing:border-box;box-sizing:border-box;}
input{font-family:inherit;font-size:inherit;line-height:inherit;}
label{font-weight:700;}
label{display:inline-block;margin-bottom:5px;}
input[type=radio]{margin:4px 0 0;margin-top:1px\9;line-height:normal;}
input[type=radio]:focus{outline:-webkit-focus-ring-color auto 5px;outline-offset:-2px;}
.form-group{margin-bottom:15px;}
/*! CSS Used from: file:///E:/GiaoDien/Metronic%20-%20Responsive%20Admin%20Dashboard%20Template%20v4.7/metronic_v4.7/theme/assets/global/css/components.min.css */
div,input,label,span{-webkit-border-radius:0!important;-moz-border-radius:0!important;border-radius:0!important;}
.form-md-radios{padding-top:5px;}
.md-radio{position:relative;}
.md-radio input[type=radio]{visibility:hidden;position:absolute;}
.md-radio label{cursor:pointer;padding-left:30px;}
.md-radio label>span{display:block;position:absolute;left:0;-webkit-transition-duration:.3s;-moz-transition-duration:.3s;transition-duration:.3s;}
.md-radio label>span.inc{background:#fff;left:-20px;top:-20px;height:60px;width:60px;opacity:0;border-radius:50%!important;-moz-border-radius:50%!important;-webkit-border-radius:50%!important;-webkit-animation:growCircleRadio .3s ease;-moz-animation:growCircleRadio .3s ease;animation:growCircleRadio .3s ease;}
.md-radio label>.box{top:0;border:2px solid #666;height:20px;width:20px;border-radius:50%!important;-moz-border-radius:50%!important;-webkit-border-radius:50%!important;z-index:5;}
.md-radio label>.check{top:5px;left:5px;width:10px;height:10px;background:#36c6d3;opacity:0;z-index:6;border-radius:50%!important;-moz-border-radius:50%!important;-webkit-border-radius:50%!important;-webkit-transform:scale(0);-moz-transform:scale(0);transform:scale(0);}
.md-radio input[type=radio]:checked~label>.check{opacity:1;-webkit-transform:scale(1);-moz-transform:scale(1);transform:scale(1);}
.md-radio input[type=radio]:disabled:checked~label>.check,.md-radio input[type=radio]:disabled~label,.md-radio input[type=radio]:disabled~label>.box{cursor:not-allowed;opacity:.7;filter:alpha(opacity=70);}
.has-error.md-radio label{color:#e73d4a;}
.has-error.md-radio label>.box{border-color:#e73d4a;}
.has-error.md-radio label>.check{background:#e73d4a;}
.has-warning.md-radio label{color:#c29d0b;}
.has-warning.md-radio label>.box{border-color:#c29d0b;}
.has-warning.md-radio label>.check{background:#c29d0b;}
.form-md-radios>label{font-size:14px;color:#888;opacity:1;filter:alpha(opacity=100);}
.md-radio-inline{margin:5px 0;}
.md-radio-inline .md-radio{display:inline-block;margin-right:20px;}
.md-radio-inline .md-radio:last-child{margin-right:0;}
label{font-weight:400;}
/*! CSS Used keyframes */
@-webkit-keyframes growCircleRadio{0%,100%{-webkit-transform:scale(0);opacity:1;}70%{background:#eee;-webkit-transform:scale(1.25);}}
@-moz-keyframes growCircleRadio{0%,100%{-moz-transform:scale(0);opacity:1;}70%{background:#eee;-moz-transform:scale(1.25);}}
@keyframes growCircleRadio{0%,100%{transform:scale(0);opacity:1;}70%{background:#eee;transform:scale(1.25);}}

</style>
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
.form-horizontal .form-group:after{clear:both;}
.col-md-10,.col-md-2{position:relative;min-height:1px;padding-left:15px;padding-right:15px;}
@media (min-width:992px){
.col-md-10,.col-md-2{float:left;}
.col-md-2{width:16.66667%;}
.col-md-10{width:83.33333%;}
}
label{display:inline-block;margin-bottom:5px;}
input[type=checkbox]{margin:4px 0 0;margin-top:1px\9;line-height:normal;}
input[type=checkbox]:focus{outline:-webkit-focus-ring-color auto 5px;outline-offset:-2px;}
.form-group{margin-bottom:15px;}
@media (min-width:768px){
.form-horizontal .control-label{text-align:right;margin-bottom:0;padding-top:7px;}
}
.form-horizontal .form-group{margin-left:-15px;margin-right:-15px;}
.form-horizontal .form-group:after,.form-horizontal .form-group:before{content:" ";display:table;}
/*! CSS Used from: file:///E:/GiaoDien/Metronic%20-%20Responsive%20Admin%20Dashboard%20Template%20v4.7/metronic_v4.7/theme/assets/global/css/components.min.css */
div,input,label,span{-webkit-border-radius:0!important;-moz-border-radius:0!important;border-radius:0!important;}
.form-horizontal .form-group.form-md-line-input>label{opacity:1;filter:alpha(opacity=100);}
.form-group.form-md-line-input{position:relative;margin:0 0 35px;padding-top:20px;}
.form-horizontal .form-group.form-md-line-input{padding-top:10px;margin:0 -15px 20px;}
.form-horizontal .form-group.form-md-line-input>label{padding-top:5px;font-size:14px;color:#888;}
.md-checkbox{position:relative;}
.md-checkbox input[type=checkbox]{visibility:hidden;position:absolute;}
.md-checkbox label{cursor:pointer;padding-left:30px;}
.md-checkbox label>span{display:block;position:absolute;left:0;-webkit-transition-duration:.3s;-moz-transition-duration:.3s;transition-duration:.3s;}
.md-checkbox label>span.inc{background:#fff;left:-20px;top:-20px;height:60px;width:60px;opacity:0;border-radius:50%!important;-moz-border-radius:50%!important;-webkit-border-radius:50%!important;-webkit-animation:growCircle .3s ease;-moz-animation:growCircle .3s ease;animation:growCircle .3s ease;}
.md-checkbox label>.box{top:0;border:2px solid #666;height:20px;width:20px;z-index:5;-webkit-transition-delay:.2s;-moz-transition-delay:.2s;transition-delay:.2s;}
.md-checkbox label>.check{top:-4px;left:6px;width:10px;height:20px;border:2px solid #36c6d3;border-top:none;border-left:none;opacity:0;z-index:5;-webkit-transform:rotate(180deg);-moz-transform:rotate(180deg);transform:rotate(180deg);-webkit-transition-delay:.3s;-moz-transition-delay:.3s;transition-delay:.3s;}
.md-checkbox input[type=checkbox]:checked~label>.box{opacity:0;-webkit-transform:scale(0) rotate(-180deg);-moz-transform:scale(0) rotate(-180deg);transform:scale(0) rotate(-180deg);}
.md-checkbox input[type=checkbox]:checked~label>.check{opacity:1;-webkit-transform:scale(1) rotate(45deg);-moz-transform:scale(1) rotate(45deg);transform:scale(1) rotate(45deg);}
.md-checkbox input[type=checkbox]:disabled:checked~label>.check,.md-checkbox input[type=checkbox]:disabled~label,.md-checkbox input[type=checkbox]:disabled~label>.box{cursor:not-allowed;opacity:.7;filter:alpha(opacity=70);}
.has-error.md-checkbox label{color:#e73d4a;}
.has-error.md-checkbox label>.box,.has-error.md-checkbox label>.check{border-color:#e73d4a;}
.has-info.md-checkbox label{color:#327ad5;}
.has-info.md-checkbox label>.box,.has-info.md-checkbox label>.check{border-color:#327ad5;}
.md-checkbox-inline{margin:5px 0;}
.form-horizontal .md-checkbox-inline{margin-top:7px;}
.md-checkbox-inline .md-checkbox{display:inline-block;margin-right:20px;}
.md-checkbox-inline .md-checkbox:last-child{margin-right:0;}
label{font-weight:400;}
.control-label{margin-top:1px;font-weight:400;}
/*! CSS Used keyframes */
@-webkit-keyframes growCircle{0%,100%{-webkit-transform:scale(0);opacity:1;}70%{background:#eee;-webkit-transform:scale(1.25);}}
@-moz-keyframes growCircle{0%,100%{-moz-transform:scale(0);opacity:1;}70%{background:#eee;-moz-transform:scale(1.25);}}
@keyframes growCircle{0%,100%{transform:scale(0);opacity:1;}70%{background:#eee;transform:scale(1.25);}}

</style>