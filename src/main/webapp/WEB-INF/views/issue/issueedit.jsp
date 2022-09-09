<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div class="container">
	<br>
	<div class="row">
		<div class="col-lg-9 mx-auto">
			<div class="card">
				<h6 class="card-header bg-primary text-white">이슈 등록 정보</h6>
				<div class="card-body">
					<form id="issueEdit" method="POST" action="/web/issue/issueeditok" enctype="multipart/form-data" onsubmit="return fnSubmit()">
						<!-- 이슈상세정보 -->
						<div class="form-group">
							<label for="issuetitle">제목</label>
							<input type="text" class="form-control" id="title" name="title" value="${list.title}" required="required">
						</div>

						<div class="row">
							<div class="col-md-6">
								<div class="form-group">
									<label for="imergencytype">긴급 여부</label>
									<select class="form-control" id="imergencytype" name="imergency" required="required">
										<!-- <option>${dto.imergency}</option> -->
										<c:if test="${list.imergency == 'y' }">
											<option value="n">N</option>
											<option selected="selected" value="y">Y</option>
										</c:if>
										<c:if test="${list.imergency == 'n' }">
											<option selected="selected" value="n">N</option>
											<option value="y">Y</option>
										</c:if>
									</select>
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<label for="issuetype">이슈 구분</label>
									<select class="form-control" id="issuetype" name="itype" required="required">
										<c:if test="${list.itype == '고객변심' }">
											<option selected="selected" value="고객변심">고객변심</option>
											<option value="품질문제">품질문제</option>
											<option value="일정지연">일정지연</option>
											<option value="승인신청">승인신청</option>
											<option value="기타이슈">기타이슈</option>
										</c:if>
										<c:if test="${list.itype == '품질문제' }">
											<option value="고객변심">고객변심</option>
											<option selected="selected" value="품질문제">품질문제</option>
											<option value="일정지연">일정지연</option>
											<option value="승인신청">승인신청</option>
											<option value="기타이슈">기타이슈</option>
										</c:if>
										<c:if test="${list.itype == '일정지연' }">
											<option value="고객변심">고객변심</option>
											<option value="품질문제">품질문제</option>
											<option selected="selected" value="일정지연">일정지연</option>
											<option value="승인신청">승인신청</option>
											<option value="기타이슈">기타이슈</option>
										</c:if>
										<c:if test="${list.itype == '승인신청' }">
											<option value="고객변심">고객변심</option>
											<option value="품질문제">품질문제</option>
											<option value="일정지연">일정지연</option>
											<option selected="selected" value="승인신청">승인신청</option>
											<option value="기타이슈">기타이슈</option>
										</c:if>
										<c:if test="${list.itype == '기타이슈' }">
											<option value="고객변심">고객변심</option>
											<option value="품질문제">품질문제</option>
											<option value="일정지연">일정지연</option>
											<option value="승인신청">승인신청</option>
											<option selected="selected" value="기타이슈">기타이슈</option>
										</c:if>
									</select>
								</div>
							</div>
						</div>

						<div class="row">
							<div class="col-md-6">
								<div class="form-group">
									<label for="project">프로젝트</label>
									<select class="form-control" id="project" name="projectseq" required="required">
										<c:forEach items="${projectList}" var="pro">
											<option value="${pro.projectseq}" <c:if test="${pro.name == list.projectname}">selected</c:if>>${pro.name}</option>
										</c:forEach>
									</select>
								</div>
							</div>

							<div class="col-md-6">
								<div class="form-group">
									<label for="work">작업</label>
									<select class="form-control" id="work" name="workseq" required="required">
										<c:forEach items="${workList}" var="dto">
											<option value="${dto.workseq}" <c:if test="${dto.workseq == list.workseq}">selected</c:if>>${dto.name}</option>
										</c:forEach>
									</select>
								</div>
							</div>
						</div>

						<div class="form-group">
							<label for="inputFile">첨부파일</label>
							<c:if test="${not empty list.ftitle}">
								<a href="/web/project/download?title=${list.ftitle}" class="btn btn-primary btn-sm" title="파일 다운로드">
									<i class="fa fa-download"></i>
								</a>
							</c:if>
							<input class="form-control" type="text" id="ftitle" name="ftitle" value="${list.ftitle}" disabled>
						</div>


						<div class="form-group">
							<label for="content">이슈 내용</label>
							<textarea class="form-control" id="content" name="content" rows="3" required="required">${list.content}</textarea>
						</div>
						<div>
							<label>조치희망일</label>
							<input type="date" id="hopedate" name="hopedate" value="${list.hopedate}" required="required">
						</div>

						<hr>

						<div class="form-group">
							<label for="state">이슈 상태</label>
							<select class="form-control" id="state" name="istateseq" required="required">
								<c:if test="${empty list.managedate}">
									<option value="1">조치대기중</option>
								</c:if>
								<c:if test="${not empty list.managedate}">
									<option value="2">조치완료</option>
								</c:if>
							</select>
						</div>
						<div class="btns" style="text-align: right;">
							<input type="submit" value="수정" class="btn btn-primary">
							<input type="button" value="취소" class="btn btn-primary" onclick="history.back();">
						</div>
						<input type="hidden" name="issueseq" value="${list.issueseq}" />
					</form>
				</div>
			</div>
		</div>
	</div>
</div>

<script>
	function fnSubmit() {
		if (confirm("정말 수정하시겠습니까?")) {
			return true;
		}
		return false;
	}
</script>