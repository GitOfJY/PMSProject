<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>       
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>SY SoftWare</title>
<tiles:insertAttribute name="asset"/>
<tiles:insertAttribute name="projectchart"/>

</head>

<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">
		<tiles:insertAttribute name="header"/>
	<div class="container-fluid">
		<tiles:insertAttribute name="content"/>
	</div>
	</div>

	<tiles:insertAttribute name="footer"/>

</body>

</html>