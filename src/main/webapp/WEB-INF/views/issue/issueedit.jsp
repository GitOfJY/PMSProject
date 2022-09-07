<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- Begin Page Content -->
<div class="container">
	<br>
	<div class="row">
		<div class="col-lg-9 mx-auto">
			<div class="card">
				<h6 class="card-header bg-primary text-white">이슈 등록 정보</h6>
				<div class="card-body">
					<form id="issueEdit" method="POST" action="/web/issue/issueeditok" enctype="multipart/form-data">
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
										</c:if>
										<c:if test="${list.itype == '품질문제' }">
											<option selected="selected" value="품질문제">품질문제</option>
										</c:if>
										<c:if test="${list.itype == '일정지연' }">
											<option selected="selected" value="일정지연">일정지연</option>
										</c:if>
										<c:if test="${list.itype == '승인신청' }">
											<option selected="selected" value="승인신청">승인신청</option>
										</c:if>
										<c:if test="${list.itype == '기타이슈' }">
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
										<option value="${list.projectseq}">${list.projectname}</option>
									</select>
								</div>
							</div>

							<div class="col-md-6">
								<div class="form-group">
									<label for="work">작업</label>
									<select class="form-control" id="work" name="workseq" required="required">
										<option value="${list.workseq}">${list.workname}</option>
									</select>
								</div>
							</div>
						</div>

						<div class="form-group">
							<label for="inputFile">첨부파일</label>
							<input class="form-control" type="file" id="ftitle" name="ftitle">
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