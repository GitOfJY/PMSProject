<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {

		var form = document.getElementById("issueForm");

		$("#search").click(function() {
			form.action = "/web/issue/issuesearch";
			form.method = "GET";
			form.submit();
		});

	});
</script>
<style>
.form-group_r {
	clear: both;
	display: block;
	content: '';
}
</style>
<div class="container-fluid">

	<!-- Container 컨테이너 -->
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary">내 이슈 관리</h6>
		</div>

		<!-- 검색 -->
		<div class="card-body">
			<div class="d-sm-flex align-items-center justify-content-between mb-4">
				<form id="issueForm" class="form-inline">
					<div class="form-group">
						<b style="margin-right: 3px">긴급여부</b>
						<select id="imergency" name="imergency" style="margin-right: 8px">
							<option value="">전체</option>
							<option value="y">긴급</option>
							<option value="n">일반</option>
						</select>
					</div>
					<div class="form-group">
						<input id="title" name="title" type="text" class="form-control bg-light border-0 small" placeholder="이슈제목으로 검색..." aria-label="Search" aria-describedby="basic-addon2">
					</div>
					<div class="form-group">
						<button id="search" class="btn btn-primary">
							<i class="fas fa-search fa-sm"></i>
						</button>
					</div>
				</form>

				<a href="issueadd" class="btn btn-primary btn-icon-split">
					<span class="icon text-white-50"> <i class="fa fa-plus" aria-hidden="true"></i>
					</span> <span class="text">이슈 등록</span>
				</a>
			</div>

			<!-- 리스트 출력 -->
			<!-- 조회 리스트 div -->
			<table class="table table-hover">
				<!-- 헤더 -->
				<thead class="text-center ">
					<tr>
						<th>긴급여부</th>
						<th>이슈제목</th>
						<th>프로젝트 명</th>
						<th>구분</th>
						<th>등록일자</th>
						<th>조치희망일</th>
						<th>조치완료일</th>
					</tr>
				</thead>
				<c:if test="${fn:length(issuelist) == 0}">
					<tr>
						<td colspan="8" style="text-align: center;">검색된 내용이 없습니다.</td>
					</tr>
				</c:if>
				<c:if test="${fn:length(issuelist) > 0}">
					<c:forEach items="${issuelist}" var="list">
						<tr>
							<c:if test="${list.imergency == 'y'}">
								<td style="text-align: center; color: red;">
									<i class="fa fa-exclamation"></i>
								</td>
							</c:if>
							<c:if test="${list.imergency == 'n'}">
								<td></td>
							</c:if>
							<td>
								<a href="/web/issue/issueedit?issueseq=${list.issueseq}">${list.title}</a>
							</td>
							<td>
								<a href="/web/project/centerinfo?projectseq=${list.projectseq}">${list.projectname}</a>
							</td>
							<td>${list.itype}</td>
							<td>${list.regdate}</td>
							<td>${list.hopedate}</td>
							<td>${list.managedate}</td>
						</tr>
					</c:forEach>
				</c:if>
			</table>
		</div>
	</div>
	<!-- Container 컨테이너 끝-->
</div>
