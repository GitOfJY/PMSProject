<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>       
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
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

</head>

<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">
		<tiles:insertAttribute name="header"/>
		<tiles:insertAttribute name="content"/>
	</div>

	<tiles:insertAttribute name="footer"/>

</body>

<script>
$(function() {
		
	var role = "${sessionScope.result.role}";
	var levelseq = "${sessionScope.result.levelseq}";
		
	if (levelseq == 1) {
		$(".admin").show();
	} else {
		$(".admin").hide();
	}
		
	if (role == "PL") {
		 $(".adminProject").show();
	} else {
		 $(".adminProject").hide();
	}
		
});
</script>

</html>