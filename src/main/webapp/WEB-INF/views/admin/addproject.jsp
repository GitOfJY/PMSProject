<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!-- addproject.jsp -->
	<div class="card shadow mb-4">
		<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
    		<h6 class="m-0 font-weight-bold text-primary">프로젝트 등록</h6>
    	</div>
		
		<div class="card-body">
			<form method="POST" action="/web/addprojectok" enctype="multipart/form-data">
				<div class="table-responsive">
				
					<table class="table table-bordered" id="addTable" width="100%" cellspacing="0">
						<tbody>
							<tr>
								<td>프로젝트명</td>
								<td colspan="3">
									<input type="text" name="name" oninput='handleOnInput(this, 11)' required />
								</td>
							</tr>
							<tr>
								<td>프로젝트 기간</td>
								<td colspan="3"><input type="date" id="Date" name="startdate" required /> ~ <input type="date" id="Date" name="finishdate" required /></td>
							</tr>
							<tr>
								<td>팀</td>
								<td colspan="3">
									<select name="team">
									<c:forEach items="${teamlist}" var="teaml">
										<option value="${teaml.teamname}">${teaml.teamname}</option>
									</c:forEach>
									</select>
									<a href="addteam" class="btn btn-primary btn-icon-split">
										<span class="icon text-white-50"><i class="fa fa-plus" aria-hidden="true"></i></span> 
									</a>
								</td>
							</tr>
							<tr>
								<td>프로젝트 유형</td>
								<td>
									<select name="ptypeseq" id="">
									<c:forEach items="${ptypelist}" var="type">
										<option value="${type.ptypeseq}">${type.ptype}</option>
									</c:forEach>
									</select>
								</td>
								<td>R&D개발</td>
								<td>
									<select name="rndseq" id="">
										<c:forEach items="${rndlist}" var="rnd">
											<option value="${rnd.rndseq}">${rnd.rndstate}</option>
										</c:forEach>
									</select>
								</td>
							</tr>
						</tbody>	
					</table>
					
					<div class="btnfloat">
						<button type="submit" class="btn btn-success btn-circle btn-sm float-right" name="등록">
							<i class="fas fa-check"></i>
						</button>
						<button type="button" class="btn btn-danger btn-circle btn-sm float-right" name="취소" onclick="location.href='/web/adminproject'">
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
		el.value = el.value.substr(0, maxlength);
	    alert("10글자 이내로 입력하세요.");
	}
}
	
var now_utc = Date.now()
var timeOff = new Date().getTimezoneOffset()*60000;
var today = new Date(now_utc-timeOff).toISOString().split("T")[0];
document.getElementById("Date").setAttribute("min", today);
	
</script>


			