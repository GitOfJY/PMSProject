<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
						<c:forEach items="${getcost}" var="dto" end="0">
							<tr>
								<th scope="col">
									<div>
										<a href="/web/project/centerinfo?projectseq=${dto.projectseq}">
											<span>기본정보</span>
										</a>
									</div>
								</th>

								<th scope="col">
									<div>
										<a href="/web/project/centerteam?projectseq=${dto.projectseq}">
											<span>팀원</span>
										</a>
									</div>
								</th>

								<th scope="col">
									<div>
										<a href="/web/project/centerwbs?projectseq=${dto.projectseq}">
											<span>WBS</span>
										</a>
									</div>
								</th>

								<th scope="col">
									<div>
										<a href="/web/project/assignment?projectseq=${dto.projectseq}">
											<span>배정현황</span>
										</a>
									</div>
								</th>

								<th scope="col">
									<div>
										<a href="/web/project/issue?projectseq=${dto.projectseq}">
											<span>이슈</span>
										</a>
									</div>
								</th>

								<th scope="col">
									<div>
										<a href="/web/project/outputlist?projectseq=${dto.projectseq}">
											<span>산출물</span>
										</a>

									</div>
								</th>

								<th scope="col">
									<div>
										<a href="#!">
											<span>비용</span>
										</a>
									</div>
								</th>

							</tr>
						</c:forEach>
					</table>
				</div>
				<div class="kt-portlet__head-label" style="margin-left: 30px;">
					<h4 class="kt-portlet__head-title">프로젝트 비용 정보</h4>
				</div>
				<hr>
				<div class="table-responsive">
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
						<table class="table table-bordered table-hover cost" id="dataTable" width="100%" cellspacing="0">
							<thead class="text-center">
								<tr>
									<th>부서</th>
									<th>비용항목</th>
									<th>지출비용</th>
									<th>지출일자</th>
									<th>등록일</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${getcost}" var="dto">
									<tr class="k-master-row" role="row">
										<td style="text-align: center;" class="" role="gridcell">
											<div class="forum-list-title">${dto.name}</div>
										</td>

										<td style="text-align: center;" class="" role="gridcell">
											<div class="forum-list-title">${dto.costdiv}</div>
										</td>

										<td style="text-align: center;" class="" role="gridcell">
											<div class="forum-list-title">${dto.expend}</div>
										</td>

										<td style="text-align: center;" class="" role="gridcell">
											<div class="forum-list-title">${dto.exdate}</div>
										</td>

										<td style="text-align: center;" class="" role="gridcell">
											<div class="forum-list-title">${dto.exdate}</div>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
