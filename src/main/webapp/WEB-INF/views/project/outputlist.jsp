<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
.tap {
	border: 1px solid #E0E0E0;
	margin-left: auto;
	margin-right: auto;
	table-layout: fixed;
	box-shadow: 0px 0px 13px 0px rgb(82 63 105/ 5%);
}

.multi-portlet {
	background: #ffffff;
	padding: 20px;
	margin-bottom: 15px;
	margin-left: 20px;
	margin-right: 20px;
	min-height: 570px;
	box-shadow: 0px 0px 13px 0px rgb(82 63 105/ 5%);
	text-decoration-line: none;
	text-color: #EDF6F9;
}

.tap th {
	border: 1px solid #E0E0E0;
	text-align: center;
	background-color: #FAFAFA;
	height: 50px;
}

.col {text-align = center;
	
}

hr {
	margin-top: 25px;
}

.list {
	padding-top: 20px;
	padding-bottom: 20px;
	margin-bottom: 10px;
	border-radius: 8px;
	margin-right: 0px;
	margin-left: 0px;
}
</style>
<div class="multi-portlet">
	<div class="container-fluid">
		<!-- 표 헤더 -->
		<div class="card shadow mb-4">
			<div class="card-body">
				<div class="list">
					<table class="tap">
						<colgroup>
							<col style="width: 200px" />
							<col style="width: 200px" />
							<col style="width: 200px" />
							<col style="width: 200px" />
							<col style="width: 200px" />
							<col style="width: 200px" />
							<col style="width: 200px" />
						</colgroup>

						<tr>
							<th scope="col">
								<div>
									<a href="/web/project/centerinfo?projectseq=${seq.projectseq}">
										<span>기본정보</span>
									</a>
								</div>
							</th>

							<th scope="col">
								<div>
									<a href="/web/project/centerteam?projectseq=${seq.projectseq}">
										<span>팀원</span>
									</a>
								</div>
							</th>

							<th scope="col">
								<div>
									<a href="/web/project/centerwbs?projectseq=${seq.projectseq}">
										<span>WBS</span>
									</a>
								</div>
							</th>

							<th scope="col">
								<div>
									<a href="/web/project/assignment?projectseq=${seq.projectseq}">
										<span>배정현황</span>
									</a>
								</div>
							</th>

							<th scope="col">
								<div>
									<a href="/web/project/issue?projectseq=${seq.projectseq}">
										<span>이슈</span>
									</a>
								</div>
							</th>

							<th scope="col">
								<div>
									<a href="#!">
										<span>산출물</span>
									</a>
								</div>
							</th>

							<th scope="col">
								<div>
									<a href="/web/project/costlist?projectseq=${seq.projectseq}">
										<span>비용</span>
									</a>
								</div>
							</th>
						</tr>
					</table>
				</div>

				<div class="d-sm-flex align-items-center justify-content-between mb-4">
					<!-- Topbar Search -->
					<form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
						<div class="input-group">
							<input type="text" class="form-control bg-light border-0 small" placeholder="파일명으로 검색..." aria-label="Search" aria-describedby="basic-addon2">
							<div class="input-group-append">
								<button class="btn btn-primary" type="button">
									<i class="fas fa-search fa-sm"></i>
								</button>
							</div>
						</div>
					</form>

					<!-- 산출물 등록 버튼 -->
					<a href="outputadd.do" class="btn btn-primary btn-icon-split">
						<span class="icon text-white-50"> <i class="fa fa-plus" aria-hidden="true"></i>
						</span> <span class="text">산출물 등록</span>
					</a>
				</div>
				<div class="table-responsive">
					<table class="table table-bordered table-hover" id="dataTable" width="100%" cellspacing="0">
						<thead class="text-center">
							<tr>
								<th>산출물 정보</th>
								<th>프로젝트</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${not empty list}">
								<c:forEach items="${list}" var="dto" varStatus="status">
									<tr>
										<td>
											<a href="/web/project/outputinfo?fileseq=${dto.fileseq}" style="font-weight: bold;"> ${dto.title}</a>
											<br /> ${dto.regdate}
											<%-- 확인용 ${status.count} --%>
										</td>
										<td>
											<a href="/web/project/centerwbs?projectseq=${dto.projectseq}">${dto.name}</a>
											<br /> ${dto.wname}
										</td>

										<td style="text-align: right;">

											<!-- 파일 버전 -->
											<button onclick="#!" class="btn btn-secondary btn-sm" title="파일 버전보기">
												<i class="fa fa-sort-numeric-down"></i>버전
											</button>
											<!-- 파일 상세보기 -->
											<button onclick="location.href='/web/project/outputinfo?fileseq=${dto.fileseq}';" class="btn btn-secondary btn-sm" title="파일 상세보기">
												<i class="fa fa-search"></i>
											</button>
											<!-- 파일 다운로드 -->
											<a href="/web/project/download?title=${dto.title}" class="btn btn-secondary btn-sm" title="파일 다운로드">
												<i class="fa fa-download"></i>
											</a>

											<!-- 새로운 파일 올리기 -->
											<button onclick="location.href='/web/project/outputnewfile';" class="btn btn-secondary btn-sm" title="새로운 버전의 파일 등록">
												<i class="fa fa-upload"></i>
											</button>
										</td>
									</tr>
								</c:forEach>
							</c:if>
							<c:if test="${empty list}">
								<tr>
									<td colspan="8" style="text-align: center;">등록된 산출물이 없습니다.</td>
								</tr>
							</c:if>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>