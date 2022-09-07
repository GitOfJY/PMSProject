<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!-- addproject.jsp -->
	<div class="card shadow mb-4">
		<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
    		<h6 class="m-0 font-weight-bold text-primary">팀 등록</h6>
    	</div>
		
		<div class="card-body">
			<form method="POST" action="/web/addteamok" enctype="multipart/form-data">
				<div class="table-responsive">
				
					<table class="table table-bordered" id="addTable" width="100%" cellspacing="0">
					<tbody>
						<tr>
							<td>팀 명</td>
							<td colspan="3">
								<input type="text" name="team" id="team" oninput='handleOnInput(this, 5)' required/>
								<button type="button" name="중복확인" id="teamcheck" disabled="true" onclick="fn_teamCheck();">							
	                            	<span class="m-0 font-weight-bold text-primary">중복 확인</span>
	                        	</button>	
							</td>
						</tr>
						<tr>
							<td>PL</td>
							<td colspan="3">
								<select name="pl">
								<c:forEach items="${empllist}" var="empl">
									<option value="${empl.employeeseq}">${empl.positionname} ${empl.name}</option>
								</c:forEach>
								</select>
							</td>
						</tr>
					</tbody>	
					</table>
					
					<div class="btnfloat">
						<button type="submit" id="submitResult" class="btn btn-success btn-circle btn-sm float-right" name="등록" disabled="disabled">
							<i class="fas fa-check"></i>
						</button>
						<button type="button" class="btn btn-danger btn-circle btn-sm float-right" name="취소" onclick="location.href='/web/addproject'">
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
	    alert("5글자 이내로 입력하세요.");
	}
}
	
document.getElementById('team').addEventListener('input', function(event) {
	document.getElementById('teamcheck').disabled = !this.value;
}, false);

	
function fn_teamCheck() {
	$.ajax({
		url: "/web/teamcheck",
		type: "POST",
		dataType: "JSON",
		data: {"team" : $("#team").val()},
		success: function(data) {
			if (data==1) {
				alert("중복된 팀명 입니다.");
			} else if (data==0){
				alert("사용 가능한 팀명 입니다.");
				document.getElementById('submitResult').disabled = false;	
			}
		}
	})
}

</script>











			