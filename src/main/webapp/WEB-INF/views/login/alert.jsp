<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- alert.jsp -->
<script>
	alert('${msg}');
	location.href = '<c:out value="${pageContext.request.contextPath}"/>${url}';
</script>