<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<meta name="_csrf" content="${_csrf.token}" />
<!-- default header name is X-CSRF-TOKEN -->
<meta name="_csrf_header" content="${_csrf.headerName}" />
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

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
<link rel="stylesheet" href="${contextPath}/css/dropify/css/dropify.min.css">


<link rel="stylesheet" href="${contextPath}/css/select2/css/select2.min.css">
<link rel="stylesheet" href="${contextPath}/css/bootstrap-tagsinput/bootstrap-tagsinput.css">
<link rel="stylesheet" href="${contextPath}/css/multi-select/css/multi-select.css">
<link rel="stylesheet" href="${contextPath}/css/bootstrap-touchspin/jquery.bootstrap-touchspin.min.css">


<!-- Neptune CSS -->
<link rel="stylesheet" href="${contextPath}/css/css/core.css">

<link rel="stylesheet" href="${contextPath}/css/css/custom-form.css">
