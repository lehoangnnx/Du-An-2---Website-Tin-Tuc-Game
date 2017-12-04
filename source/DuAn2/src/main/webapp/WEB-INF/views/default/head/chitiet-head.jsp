<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!-- Meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<meta name="author" content="">
<meta name="_csrf" content="${_csrf.token}" />
<!-- default header name is X-CSRF-TOKEN -->
<meta name="_csrf_header" content="${_csrf.headerName}" />
<meta name="_csrf_header" content="${_csrf.headerName}" />
<meta property="fb:app_id" content="1223420154469580"/>
<meta property="og:url"           content="${pageContext.request.scheme }://${pageContext.request.serverName}${contextPath}/${article.slug}.html" />
 <meta property="og:type"          content="website" />
<meta property="og:title"         content="${title} | Game24h - Kênh Thông Tin Game Lớn Nhất" />
<meta property="og:description"   content="${article.subContent}" />
<meta property="og:image"  content="${pageContext.request.scheme }://${pageContext.request.serverName}${contextPath}/images/articles/${article.imagesThumbnail}" />


<%--<meta name="google-signin-client_id"
	content="957067339527-2a7jir87qgufa498et556ke87d8lv5sb.apps.googleusercontent.com">--%>
<title>${title} | Game24h - Kênh Thông Tin Game Lớn Nhất </title>