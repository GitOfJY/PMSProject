<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="multi-portlet">
	<div class="container-fluid">
		<!-- 표 헤더 -->
		<div class="card shadow mb-4">
			<div class="card-body">
				<div class="list">
					<table>
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
									<a href="/web/project/costlist?projectseq=${dto.projectseq}">
										<span>비용</span>
									</a>
								</div>
							</th>
						</tr>
					</table>
				</div>
				<div class="kt-portlet__head-label" style="margin-left: 30px;">
					<h4 class="kt-portlet__head-title">프로젝트 WBS</h4>
				</div>
				<hr>
				<div id="chart_div"></div>
			</div>
		</div>
	</div>
</div>