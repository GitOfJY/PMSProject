<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
									<a href="#!">
										<span>이슈</span>
									</a>
								</div>
							</th>

							<th scope="col">
								<div>
									<a href="/web/project/outputlist?projectseq=${seq.projectseq}">
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
				<div class="kt-portlet__head-label" style="margin-left: 30px;">
					<h4 class="kt-portlet__head-title">프로젝트 이슈</h4>
				</div>
				<hr>
				<div class="table-responsive">
					<table class="table table-bordered table-hover" id="dataTable" width="100%" cellspacing="0">
						<thead class="text-center">
							<tr>
								<!-- 헤더 -->
								<th>긴급여부</th>
								<th>이슈제목</th>
								<th>이슈구분</th>
								<th>등록일자</th>
								<th>조치희망일</th>
								<th>처리완료일자</th>
							</tr>
						</thead>
						<c:if test="${fn:length(issue) == 0}">
							<tbody>
								<tr>
									<td colspan="8" style="text-align: center;">검색된 내용이 없습니다.</td>
								</tr>
							</tbody>
						</c:if>
						<c:if test="${fn:length(issue) > 0}">
							<c:forEach items="${issue}" var="list">
								<tbody>
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
										<td>${list.itype}</td>
										<td>${list.regdate}</td>
										<td>${list.hopedate}</td>
										<td>${list.managedate}</td>
									</tr>
								</tbody>
							</c:forEach>
						</c:if>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>