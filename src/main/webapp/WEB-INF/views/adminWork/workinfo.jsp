<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!-- workinfo.jsp -->
<div class="multi-portlet">
	<div class="container-fluid">
		
		<div class="card shadow mb-4">
			<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
		    	<h6 class="m-0 font-weight-bold text-primary">작업 수정</h6>
		    </div>
		
			<div class="card-body">
				<form method="POST" action="/web/emeditworkok" enctype="multipart/form-data">
					<div class="table-responsive">
						<table class="table table-bordered" id="addTable" width="100%" cellspacing="0">
							<tbody>
								<tr>
									<td>작업 명</td>
									<td colspan="3">
										<input class="form-control form-control-view" style="background-color: #F3F6F9;" type="text" name="workname" oninput='workNameInput(this, 33)' value="${getwinfo.workname}" required/>
									</td>
								</tr>
								<tr>
									<td>작업 기간</td>
									<td colspan="3">
										<input class="form-control form-control-view" style="background-color: #F3F6F9;" type="date" id="Date" name="worksdate" required /> ~ <input class="form-control form-control-view" style="background-color: #F3F6F9;" type="date" id="Date" name="workfdate" required />
									</td>
								</tr>
								<tr>
									<td>작업 진행상태</td>
									<td colspan="3">
									<select class="form-control form-control-view" style="background-color: #F3F6F9;" name="wstateseq" class="form-control select2me select2-hidden-accessible" data-select2-id="ddlStatus" tabindex="-1" aria-hidden="true">
										<c:forEach items="${wstatelist}" var="sdto">
											<option value="${sdto.wstateseq}">${sdto.state}</option>
										</c:forEach>
									</select>
									</td>
								</tr>
								<tr>
									<td>작업 완료율</td>
									<td colspan="3">
										<input class="form-control form-control-view" style="background-color: #F3F6F9;" type="text" id="workstatenum" name="workstatenum" value="${getwinfo.workstatenum}" required/>
									</td>
								</tr>
								<tr>
									<td>작업 메모</td>
									<td colspan="3">
										<input class="form-control form-control-view" style="background-color: #F3F6F9;" type="text" name="workmemo" oninput='memoInput(this, 50)' value="${getwinfo.workmemo}"/>
									</td>
								</tr>
							</tbody>	
						</table>
							
						<input type="hidden" name="workseq" value="${getwinfo.workseq}">
							
						<div class="btnfloat">
							<button type="submit" class="btn btn-success btn-circle btn-sm float-right" name="수정">
								<i class="fas fa-check"></i>
							</button>
							<button type="button" class="btn btn-danger btn-circle btn-sm float-right" name="취소" onclick="location.href='/web/emwork'">
								<i class="fas fa-trash"></i>
							</button>
						</div>
					</div>
				</form>
			</div>
		</div>

	</div>
</div>


<script>

function workNameInput(el, maxlength) {
	if(el.value.length > maxlength)  {
	    el.value = el.value.substr(0, maxlength);
	    alert("33글자 이내로 입력하세요.");
	}
}

function memoInput(el, maxlength) {
	if(el.value.length > maxlength)  {
	    el.value = el.value.substr(0, maxlength);
	    alert("50글자 이내로 입력하세요.");
	}
}

</script>
