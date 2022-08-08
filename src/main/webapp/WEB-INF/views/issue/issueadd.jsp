<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {

		var form = document.getElementById("issueAdd");

		$("#issueAddBtn").click(function() {
			form.action = "/web/issue/issueaddok";
			form.method = "POST";
			form.submit();
		});

	});
</script>

<!-- Begin Page Content -->
<div class="container-fluid">

	<div>이슈</div>

	<!-- Page Heading -->
	<div class="d-sm-flex align-items-center justify-content-between mb-4">
		<h1 class="h3 mb-0 text-gray-800">이슈 등록 정보</h1>
	</div>

	<form id="issueAdd" method="POST" action="/web/issue/issueaddok.do">
		<!-- 이슈등록정보 -->
		<div class="form-group">
			<label for="issuetitle">제목</label>
			<input type="text" class="form-control" id="title" name="title">
		</div>
		<div class="form-group">
			<label for="imergencytype">긴급 여부</label>
			<select class="form-control" id="imergencytype" name="imergency">
				<option value="">선택하세요</option>
				<option value="y">Y</option>
				<option value="n">N</option>
			</select>
		</div>
		<div class="form-group">
			<label for="issuetype">이슈 구분</label>
			<select class="form-control" id="issuetype" name="itype">
				<option value="">선택하세요</option>
				<option value="고객변심">고객변심</option>
				<option value="일정지연">일정지연</option>
				<option value="품질문제">품질문제</option>
				<option value="기타사유">기타사유</option>
			</select>
		</div>
		<div class="form-group">
			<label for="project">프로젝트</label>
			<select class="form-control" id="project" name="projectseq">
				<option value="">선택하세요</option>
	<%-- 			<c:forEach items="${projectList}" var="dto">
					<option value="${dto.projectSeq}">${dto.name}</option>
				</c:forEach> --%>
			</select>
		</div>
		<div class="form-group">
			<label for="work">작업</label>
			<select class="form-control" id="work" name="workseq">
				<option value="">선택하세요</option>
	<%-- 			<c:forEach items="${workList}" var="dto">
					<option value="${dto.workSeq}">${dto.name}</option>
				</c:forEach> --%>
			</select>
		</div>

		<div class="form-group">
			<label for="inputFile">첨부파일</label>
			<input type="file" id="inputFile">
		</div>
		<label for="content">이슈 내용</label>
		<textarea class="form-control" id="content" name="content" rows="3"></textarea>

		<div>
			<label>조치희망일</label>
			<input type="date" id="hopedate" name="hopedate">
		</div>

		<hr>

		<div class="form-group">
			<label for="state">이슈 상태</label>
			<select class="form-control" id="state" name="istateseq">
				<option value="1">조치대기중</option>
				<!-- 
				  <c:forEach items="${stateList}" var="dto">
				  		<option value="${dto.stateSeq}">${dto.state}</option>
				  </c:forEach>
				   -->
			</select>
		</div>
	</form>
	
	<!-- 이슈등록정보 -->
	<div class="btns">
		<input type="button" value="취소" class="btn btn-secondary" onclick="location.href='/web/issue/issuelist';">

		<!-- <input type="button" value="저장" class="btn btn-primary"
					onclick="location.href='/web/issue/issueaddok.do';"> -->
		<input id="issueAddBtn" type="button" value="저장" class="btn btn-primary">
	</div>
</div>