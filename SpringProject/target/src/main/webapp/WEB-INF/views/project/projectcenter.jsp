<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	min-height: 570px;
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
		<div class="col-lg-12 col-md-9 col-sm-12 col-xs-12 search-section">
			<div class="row search-form">

				<div class="col-md-10">
					<div class="row align-items-center">
						<div class="col-md-3 kt-margin-b-20-tablet-and-mobile">
							<div class="kt-input-icon kt-input-icon--left">
								<select id="ddlProjectStatus" class="form-control select2me">
									<option value="">프로젝트 상태를 선택하세요</option>
									<option value="시작전">시작전</option>
									<option value="정상진행">진행중</option>
									<option value="지연진행">지연진행</option>
									<option value="홀드">홀드</option>
									<option value="드롭">완료</option>
									<option value="종료">진행중단</option>
								</select>
							</div>
						</div>
						<div class="col-md-3 kt-margin-b-20-tablet-and-mobile">
							<div class="kt-input-icon kt-input-icon--left" style="width: 200px">
								<select id="ddlProjectStatus" class="form-control select2me">
									<option value="">팀을 선택하세요</option>
									<option value="1팀">1팀</option>
									<option value="2팀">2팀</option>
									<option value="3팀">3팀</option>
								</select>
							</div>
						</div>
						<div class="col-md-4 kt-margin-b-20-tablet-and-mobile">
							<div class="input-group">
								<div class="kt-input-icon kt-input-icon--left" style="width: 210px;">
									<input id="searchValue" type="text" class="form-control" placeholder="Search...">
									<span class="kt-input-icon__icon kt-input-icon__icon--left"> <span><i class="la la-search"></i></span>
									</span>
								</div>
								<div class="input-group-append">
									<button type="button" class="btn point-color btn-rounded" onclick="ExcuteSearch();">
										<i class="icon-magnifier"></i> 검색
									</button>
								</div>
							</div>
						</div>
					</div>
				</div>

				<!-- 관리자만 볼 수 있게 -->
				<!--<div class="col-md-2 kt-align-right">
					<a href="/web/project/addproject" class="btn btn-primary btn-icon-split">
						<span class="icon text-white-50"> <i class="fa fa-plus" aria-hidden="true"></i>
						</span> <span class="text">프로젝트 등록</span>
					</a>
				</div> -->
			</div>
		</div>

		<div class="col-lg-12 col-md-9 col-sm-12 col-xs-12">
			<div class="k-widget k-grid pms-default-grid" id="grid">
				<table>
					<colgroup>
						<col style="width: 70px" />
						<col style="width: 550px" />
						<col style="width: 280px" />
						<col style="width: 280px" />
						<col style="width: 230px" />
						<col style="width: 230px" />
						<col style="width: 230px" />
						<col style="width: 160px" />
						<col style="width: 160px" />
					</colgroup>
					<thead class="k-grid-header">
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

					<tbody role="rowgroup">

						<c:forEach items="${list}" var="dto">
							<tr>
								<td class="" role="gridcell" align=center>${dto.projectseq}</td>

								<td style="text-align: left;" class="" role="gridcell" align=center>
									<div class="forum-list-title">
										<a href="/web/project/centerinfo?projectseq=${dto.projectseq}">${dto.name}</a>
									</div>
								</td>

								<td class="" role="gridcell" align=center>${dto.pcode}</td>

								<td class="" role="gridcell" align=center>${dto.type}</td>

								<td class="" role="gridcell" align=center>${dto.startdate}</td>

								<td class="" role="gridcell" align=center>${dto.finishdate}</td>


								<!-- 프로그래스 바 -->
								<td class="" role="gridcell" align=center>
									<div style="width: 100%; padding-left: 3px">
										<div data-value="13" class="progress progress-sm progress-half-rounded m-md ligh" style="float: left; width: 70%;">
											<div class="progress-bar progress-bar-primary rounded-3" role="progressbar" aria-valuenow="13" aria-valuemin="0" aria-valuemax="100" style="background-color: #32c5d2; width: 50%;"></div>
											<!-- width = progress 길이 조절 -->
										</div>
										<div style="float: left; text-align: right; color: #808080; font-size: 10px; margin-top: -3px; margin-left: 1px; width: 25%;">50%</div>
									</div>
									<div style="width: 100%; padding-left: 3px">
										<div data-value="0" class="progress progress-sm progress-half-rounded m-md light" style="float: left; width: 70%;">
											<div class="progress-bar progress-bar-primary rounded-3" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width: 13%;"></div>
										</div>
										<div style="float: left; text-align: right; color: #808080; font-size: 10px; margin-top: -3px; margin-left: 1px; width: 25%;">13%</div>
									</div>
								</td>

								<!-- 산출물 -->
								<td class="" role="gridcell" align=center>
									<a href="/web/project/outputlist?projectseq=${dto.projectseq}">
										<span class="kt-badge kt-badge--unified-danger kt-badge--lg kt-badge--bold"> 0 </span>
									</a>
								</td>

								<!-- 이슈 -->
								<td class="" role="gridcell" align=center>
									<a href="#!">
										<span class="kt-badge kt-badge--unified-danger kt-badge--lg kt-badge--bold"> 0 </span>
									</a>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>