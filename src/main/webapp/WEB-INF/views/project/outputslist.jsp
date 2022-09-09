<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="container-fluid">
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary">프로젝트 산출물</h6>
		</div>
		<div class="card-body">
			<div class="d-sm-flex align-items-center justify-content-between mb-4">

				<!-- 검색 -->
				<form id="outputForm" class="form-inline">
					<div class="form-group">
						<input type="text" name="title" id=title class="form-control bg-light border-0 small" placeholder="파일명으로 검색..." aria-label="Search" aria-describedby="basic-addon2">
					</div>
					<div class="form-group">
						<button id="search" class="btn btn-primary">
							<i class="fas fa-search fa-sm"></i>
						</button>
					</div>
				</form>

				<a href="outputadd" class="btn btn-primary btn-icon-split">
					<span class="icon text-white-50"> <i class="fa fa-plus" aria-hidden="true"></i>
					</span> <span class="text">산출물 등록</span>
				</a>
			</div>
			<div class="table-responsive">
				<table class="table table-bordered table-hover" >
					<thead class="text-center">
						<tr>
							<th>산출물 정보</th>
							<th>프로젝트</th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${alist}" var="dto">
							<tr>
								<td>
									<a href="/web/project/outputinfo?fileseq=${dto.fileseq}&projectseq=${dto.projectseq}" style="font-weight: bold;">${dto.title}</a>
									<br /> ${dto.regdate}
								</td>
								<td>
									<a href="/web/project/centerwbs?projectseq=${dto.projectseq}" target="_blank">${dto.name}</a>
									<br /> ${dto.wname}
								</td>
								<td style="text-align: right;">
									<!-- 파일 버전 -->
									<!-- <button onclick="#!" class="btn btn-secondary btn-sm" title="파일 버전보기">
										<i class="fa fa-sort-numeric-down"></i>버전
									</button> -->
									<!-- 파일 상세보기 -->
									<button onclick="location.href='/web/project/outputinfo?fileseq=${dto.fileseq}&projectseq=${dto.projectseq}';" class="btn btn-secondary btn-sm" title="파일 상세보기">
										<i class="fa fa-search"></i>
									</button>
									<!-- 파일 다운로드 -->
									<a href="/web/project/download?title=${dto.title}" class="btn btn-secondary btn-sm" title="파일 다운로드">
										<i class="fa fa-download"></i>
									</a>
									<!-- 새로운 파일 올리기 -->
									<!-- <button onclick="location.href='/web/project/outputnewfile';" class="btn btn-secondary btn-sm" title="새로운 버전의 파일 등록">
										<i class="fa fa-upload"></i>
									</button> -->
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>

<script>
	$(document).ready(function() {

		var form = document.getElementById("outputForm");

		$("#search").click(function() {
			form.action = "/web/project/outputssearch";
			form.method = "GET";
			form.submit();
		});
	});
</script>