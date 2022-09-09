<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<style>
table {
	border: 1px solid #E0E0E0;
	table-layout: fixed;
}

table, td, th {
	border-collapse: collapse;
}

th {
	border: 1px solid #E0E0E0;
	text-align: center;
	background-color: #FAFAFA;
	height: 45px;
}

tr {
	height: 50px;
}

.multi-portlet {
	background: #ffffff;
	padding: 25px;
	margin-bottom: 15px;
	margin-left: 20px;
	margin-right: 20px;
	box-shadow: 0px 0px 13px 0px rgb(82 63 105/ 5%);
}

.search-section {
	padding-top: 20px;
	padding-bottom: 20px;
	background-color: #edf6f9;
	margin-bottom: 10px;
	border-radius: 8px;
	margin-right: 0px;
	margin-left: 0px;
}

.col-md-4 {
	position: relative;
	width: 100%;
	padding-right: 10px;
	padding-left: 10px;
}
</style>
<div class="multi-portlet">
	<div class="row">
		<!-- 검색  -->
		<div class="col-lg-12 col-md-9 col-sm-12 col-xs-12 search-section">
			<div class="row search-form">
				<div class="col-md-10">
					<form id="projectForm">
						<div class="row align-items-center">
							<div class="col-md-3 kt-margin-b-20-tablet-and-mobile">
								<div class="kt-input-icon kt-input-icon--left">
									<select id="pstate" name="pstate" class="form-control select2me select2-hidden-accessible" data-select2-id="ddlStatus" tabindex="-1" aria-hidden="true">
										<option value="" selected>프로젝트 상태를 선택하세요</option>
										<c:forEach items="${statelist}" var="dto">
											<option value="${dto.pstate}">${dto.pstate}</option>
										</c:forEach>
									</select>
								</div>
							</div>

							<div class="col-md-3 kt-margin-b-20-tablet-and-mobile">
								<div class="kt-input-icon kt-input-icon--left">
									<select id="team" name="team" class="select2me form-control select2-hidden-accessible" style="width: 100%;" data-select2-id="ddlProjectList" tabindex="-1" aria-hidden="true">
										<option value="" selected>팀을 선택하세요</option>
										<c:forEach items="${teamlist}" var="dto">
											<option value="${dto.team}">${dto.team}</option>
										</c:forEach>
									</select>
								</div>
							</div>
							<div class="col-md-4 kt-margin-b-20-tablet-and-mobile">
								<div class="input-group">
									<div class="kt-input-icon kt-input-icon--left">
										<button id="search" class="btn btn-primary">검색</button>
									</div>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div> <!-- 검색 끝 -->
		
		<div class="table-responsive">
			<table class="table table-bordered table-hover" id="dataTable" width="100%" cellspacing="0">
				<colgroup>
					<col style="width: 70px" />
				</colgroup>
				<thead class="text-center">
					<tr>
						<th scope="col"><span class="k-link">순번</span></th>
						<th scope="col"><span class="k-link">프로젝트 명</span></th>
						<th scope="col"><span class="k-link">프로젝트 코드</span></th>
						<th scope="col"><span class="k-link">프로젝트 유형</span></th>
						<th scope="col"><span class="k-link">시작일</span></th>
						<th scope="col"><span class="k-link">완료일</span></th>
						<th scope="col"><span class="k-link">계획/실적</span></th>
						<th scope="col"><span class="k-link">산출물</span></th>
						<th scope="col"><span class="k-link">이슈</span></th>
					</tr>
				</thead>
				<c:if test="${fn:length(list) == 0}">
					<tbody>
						<tr>
							<td colspan="9" style="text-align: center;">검색된 결과가 없습니다.</td>
						</tr>
					</tbody>
				</c:if>
				<c:if test="${fn:length(list) > 0}">
					<tbody>
						<c:forEach items="${list}" var="dto" varStatus="status">
							<tr>
								<td class="" role="gridcell" align=center>${dto.projectseq}</td>

								<td style="text-align: left;" class="" role="gridcell" align=center>
									<div class="forum-list-title">
										<a href="/web/project/centerinfo?projectseq=${dto.projectseq}">${dto.name}</a>
									</div>
								</td>

								<td class="" role="gridcell" align=center>${dto.pcode}</td>

								<td class="" role="gridcell" align=center>${dto.type}</td>

								<td class="" role="gridcell" align=center>${dto.startdate.substring(0,10)}</td>

								<td class="" role="gridcell" align=center>${dto.finishdate.substring(0,10)}</td>

								<!-- 프로그래스 바 -->
								<td class="" role="gridcell" align=center>
									<div style="width: 100%; padding-left: 3px">
										<div data-value="100" class="progress progress-sm progress-half-rounded m-md ligh" style="float: left; width: 70%;">
											<div class="progress-bar progress-bar-primary rounded-3" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="background-color: #32c5d2; width: 100%;"></div>
										</div>
										<div style="float: left; text-align: right; color: #808080; font-size: 10px; margin-top: -3px; margin-left: 1px; width: 25%;">100%</div>
									</div>
									<div style="width: 100%; padding-left: 3px">
										<div data-value="${works[status.index].count}" class="progress progress-sm progress-half-rounded m-md light" style="float: left; width: 70%;">
											<div class="progress-bar progress-bar-primary rounded-3" role="progressbar" aria-valuenow="${works[status.index].count}" aria-valuemin="0" aria-valuemax="100" style="width: ${works[status.index].count}%;"></div>
										</div>
										<div style="float: left; text-align: right; color: #808080; font-size: 10px; margin-top: -3px; margin-left: 1px; width: 25%;">${works[status.index].count}%</div>
									</div>
								</td>
								

								<!-- 산출물 -->
								<td class="" role="gridcell" align=center>
									<a href="/web/project/outputlist?projectseq=${dto.projectseq}" target="_blank">
										<span class="kt-badge kt-badge--unified-danger kt-badge--lg kt-badge--bold"> ${not empty dto.outputcnt ? dto.outputcnt : "0"} </span>
									</a>
								</td>

								<!-- 이슈 -->
								<td class="" role="gridcell" align=center>
									<a href="/web/project/issue?projectseq=${dto.projectseq}" target="_blank">
										<span class="kt-badge kt-badge--unified-danger kt-badge--lg kt-badge--bold" style="color: red;"> ${not empty dto.issuecnt ? dto.issuecnt : "0"} </span>
									</a>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</c:if>
			</table>
		</div>
	</div>
</div>

<script>
	$(document).ready(function() {
		
		var form = document.getElementById("projectForm");

		$("#search").click(function() {
			form.action = "/web/project/projectsearch";
			form.method = "GET";
			form.submit();
		});

	});
</script>