<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
function del(outputseq, projectseq) {
	
	const title = document.getElementById('file').value;
	
	var chk = confirm("정말 삭제하시겠습니까?");
	
	if (chk) {
		location.href='/web/project/outputdel?outputseq='+outputseq+'&projectseq='+projectseq+'&title='+title;
	}
}	 
</script>
<div class="container">
	<br>
	<div class="row">
		<div class="col-lg-7 mx-auto">
			<div class="card">
				<div class="card-header bg-primary text-white">산출물 정보</div>
				<div class="card-body">
					<div class="container">
						<form name="fileForm" method="POST" action="/web/project/outputedit">
							<div class="controls">
								<div class="row">
									<div class="col">
										<div class="form-group">
											<label for="form_file">파일 명</label>
											<input id="file" value="${dto.title}" type="text" name="title" class="form-control" disabled>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-md-6">
										<div class="form-group">
											<label for="form_project">프로젝트 *</label>
											<select id="form_project" name="projectseq" class="form-control" required="required">
												<option value="" selected disabled>프로젝트를 선택하세요</option>
												<c:forEach items="${projectlist}" var="pro">
													<option value="${pro.projectseq}" <c:if test="${pro.name == dto.name}">selected</c:if>>${pro.name}</option>
												</c:forEach>
											</select>
										</div>
									</div>

									<div class="col-md-6">
										<div class="form-group">
											<label for="form_work">작업 *</label>
											<select id="form_work" name="workseq" class="form-control" required="required">
												<option value="" selected disabled>작업을 선택하세요</option>
												<c:forEach items="${worklist}" var="work">
													<option value="${work.wworkseq}" <c:if test="${work.wname == dto.wname}">selected</c:if>>${work.wname}</option>
												</c:forEach>
											</select>
										</div>
									</div>
								</div>

								<div class="row">
									<div class="col-md-6">
										<div class="form-group">
											<label for="form_type">산출물 종류 *</label>
											<select id="form_type" name="otypeseq" class="form-control" required="required">
												<option value="" selected disabled>산출물 종류를 선택하세요</option>
												<option value="1" <c:if test="${dto.type == '개발기획서'}">selected</c:if>>개발기획서</option>
												<option value="2" <c:if test="${dto.type == '개발계획서'}">selected</c:if>>개발계획서</option>
												<option value="3" <c:if test="${dto.type == '개발검증보고서'}">selected</c:if>>개발검증보고서</option>
												<option value="4" <c:if test="${dto.type == '개발완료보고서'}">selected</c:if>>개발완료보고서</option>
												<option value="6" <c:if test="${dto.type == '기타보고'}">selected</c:if>>기타보고</option>
											</select>
										</div>
									</div>
								</div>

								<div class="row">
									<div class="col-md-12">
										<div class="form-group">
											<label for="form_message">파일 설명</label>
											<textarea id="form_message" name="fileexplain" class="form-control" rows="5">${dto.fileexplain}</textarea>
										</div>
									</div>

									<div class="col-md-12 d-md-flex justify-content-md-end">
										<input type="button" class="btn btn-danger mr-1 pt-2" value="삭제" onclick="del(${dto.outputseq},${dto.projectseq});">
										<input type="submit" class="btn btn-primary mr-1 pt-2" value="수정">
										<input type="button" class="btn btn-primary pt-2" value="취소" onclick="history.back();">
									</div>
								</div>
							</div>
							<input type="hidden" name="fileseq" value="${dto.fileseq}" />
							<input type="hidden" name="version" value="${dto.version}" />
							<input type="hidden" name="outputseq" value="${dto.outputseq}" />
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>