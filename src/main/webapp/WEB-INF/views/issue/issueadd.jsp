<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- Begin Page Content -->
<div class="container">
<br>
	<div class="row">
		<div class="col-lg-9 mx-auto">
			<div class="card">
				<h6 class="card-header bg-primary text-white">이슈 등록</h6>
				<div class="card-body">
					<div class="container">
						<form id="issueAdd" method="POST" action="/web/issue/issueaddok" enctype="multipart/form-data">
							<!-- 이슈등록정보 -->
							<div class="form-group">
								<label for="issuetitle">제목</label>
								<input type="text" class="form-control" id="title" name="title" required="required">
							</div>

							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<label for="imergencytype">긴급 여부</label>
										<select class="form-control" id="imergencytype" name="imergency" required="required">
											<option value="">선택하세요</option>
											<option value="y">Y</option>
											<option value="n">N</option>
										</select>
									</div>
								</div>

								<div class="col-md-6">
									<div class="form-group">
										<label for="issuetype">이슈 구분</label>
										<select class="form-control" id="issuetype" name="itype" required="required">
											<option value="">선택하세요</option>
											<option value="고객변심">고객변심</option>
											<option value="품질문제">품질문제</option>
											<option value="일정지연">일정지연</option>
											<option value="승인신청">승인신청</option>
											<option value="기타이슈">기타이슈</option>
										</select>
									</div>
								</div>
							</div>

							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<label for="project">프로젝트</label>
										<select class="form-control" id="project" name="projectseq" required="required">
											<option value="">선택하세요</option>
											<c:forEach items="${projectList}" var="dto">
												<option value="${dto.projectseq}">${dto.name}</option>
											</c:forEach>
										</select>
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label for="work">작업</label>
										<select class="form-control" id="work" name="workseq" required="required">
											<option value="">선택하세요</option>
											<c:forEach items="${workList}" var="dto">
												<option value="${dto.workseq}">${dto.name}</option>
											</c:forEach>
										</select>
									</div>
								</div>
							</div>

							<div class="form-group">
								<label for="inputFile">첨부파일</label>
								<input class="form-control" type="file" id="ftitle" name="ftitle" required="required">
							</div>
							<div class="form-group">
								<label for="content">이슈 내용</label>
								<textarea class="form-control" id="content" name="content" rows="3" required="required"></textarea>
							</div>
							<div>
								<label>조치희망일</label>
								<input type="date" id="hopedate" name="hopedate" required="required">
							</div>

							<hr>

							<div class="form-group">
								<label for="state">이슈 상태</label>
								<select class="form-control" id="state" name="istateseq">
									<option value="1">조치대기중</option>
									<!-- 
									  <c:forEach items="${stateList}" var="dto">
									  		<option value="${dto.stateSeq}">${dto.state}</option>
									  </c:forEach>
									   -->
									</select>
							</div>


							<!-- 이슈등록정보 -->
							<div class="btns" style="text-align: right;">
								<input type="submit" value="저장" class="btn btn-primary">
								<input type="button" value="취소" class="btn btn-primary" onclick="history.back();">
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script>
	$(document).ready(function() {

		var form = document.getElementById("issueAdd");

		$("#issueAddBtn").click(function() {
			form.action = "/web/issue/issueaddok";
			form.method = "POST";
			form.submit();
		});

	});
</script>