<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!-- editplproject.jsp -->
<div class="card shadow mb-4">
	<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
    	<h6 class="m-0 font-weight-bold text-primary">프로젝트 수정</h6>
    </div>
		
	<div class="card-body">
		<form method="POST" action="/web/editplprojectok" enctype="multipart/form-data">
			<div class="table-responsive">
				<table class="table table-bordered" id="addTable" width="100%" cellspacing="0">
					<tbody>
						<tr>
							<td>프로젝트명</td>
							<td colspan="3">
								<input type="text" name="name" oninput='handleOnInput(this, 11)' value="${dto.projectname}" required/>
							</td>
						</tr>
						<tr>
							<td>프로젝트 기간</td>
							<td colspan="3"><input type="date" id="Date" name="startdate" required /> ~ <input type="date" id="Date" name="finishdate" required /></td>
						</tr>
						<tr>
							<td>프로젝트 진행 상태</td>
							<td colspan="3">
								<select name="pstateseq">
								<c:forEach items="${pstatelist}" var="psl">
									<option value="${psl.pstateseq}">${psl.pstate}</option>
								</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<td>프로젝트 유형</td>
							<td>
								<select name="ptypeseq">
								<c:forEach items="${ptypelist}" var="type">
									<option value="${type.ptypeseq}">${type.ptype}</option>
								</c:forEach>
								</select>
							</td>
							<td>R&D개발</td>
							<td>
								<select name="rndseq">
									<c:forEach items="${rndlist}" var="rnd">
										<option value="${rnd.rndseq}">${rnd.rndstate}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
					</tbody>	
				</table>
					
				<input type="hidden" name="projectseq" value="${dto.projectseq}">
					
				<div class="btnfloat">
					<button type="submit" class="btn btn-success btn-circle btn-sm float-right" name="수정">
						<i class="fas fa-check"></i>
					</button>
					<button type="button" class="btn btn-danger btn-circle btn-sm float-right" name="취소" onclick="location.href='/web/plproject'">
						<i class="fas fa-trash"></i>
					</button>
				</div>
			
			</div>
		</form>
	</div>
</div>


<script>

function handleOnInput(el, maxlength) {
	  if(el.value.length > maxlength)  {
	    el.value 
	      = el.value.substr(0, maxlength);
	    alert("10글자 이내로 입력하세요.");
	  }
	}
	
</script>
