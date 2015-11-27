<%@attribute name="title" type="java.lang.String" required="false" %>
<%@tag pageEncoding="UTF-8"%>
<%@attribute name="description" type="java.lang.String" required="false" %>
<%@attribute name="keywords" type="java.lang.String" required="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="${description}">
    <meta name="keywords" content="${keywords}">
    <meta name="viewport"
          content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <title>${title}</title>

    <!-- Set render engine for 360 browser -->
    <meta name="renderer" content="webkit">

    <!-- No Baidu Siteapp-->
    <meta http-equiv="Cache-Control" content="no-siteapp"/>

    <link rel="icon" type="image/png" href="${ctx}/static/comp/amazeui/i/favicon.png">

    <!-- Add to homescreen for Chrome on Android -->
    <meta name="mobile-web-app-capable" content="yes">
    <link rel="icon" sizes="192x192" href="${ctx}/static/comp/amazeui/i/app-icon72x72@2x.png">

    <!-- Add to homescreen for Safari on iOS -->
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-title" content="Amaze"/>
    <link rel="apple-touch-icon-precomposed" href="${ctx}/static/comp/amazeui/i/app-icon72x72@2x.png">

    <!-- Tile icon for Win8 (144x144 + tile color) -->
    <meta name="msapplication-TileImage" content="${ctx}/static/comp/amazeui/i/app-icon72x72@2x.png">
    <meta name="msapplication-TileColor" content="#0e90d2">
<link href="${ctx }/static/shebao-m/css/style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="${ctx }/static/shebao-m/js/jquery.js"></script>
<script type="text/javascript" src="${ctx }/static/shebao-m/js/web.js"></script>
<script src="${ctx }/static/shebao-m/js/multiregion.js" type="text/javascript"></script>
</head>
<body>