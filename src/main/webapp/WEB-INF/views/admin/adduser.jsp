<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!-- adduser.jsp -->
<style>

#checkid {
	border: 0px;
	border-radius: 5px;
}

</style>

	<div class="card shadow mb-4">
		<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
    		<h6 class="m-0 font-weight-bold text-primary">사용자 등록</h6>
    	</div>
		
		<div class="card-body">
			<form method="POST" action="/web/adduserok" enctype="multipart/form-data">
				<div class="table-responsive">
					<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
						<tr>
							<td>이름</td>
							<td><input type="text" name="name" required></td>
						</tr>
						<tr>
							<td>이메일</td>
							<td>
								<input type="text" name="email" id="email" required> 
								<input type="text" value="@sysoft.com" disabled>
								
								<button type="button" name="중복확인" id="emailcheck" disabled="true" onclick="fn_emailCheck();">							
	                            	<span class="m-0 font-weight-bold text-primary">중복 확인</span>
	                            </button>	
                            	
							</td>
						</tr>
						<tr>
							<td>비밀번호</td>
							<td><input type="password" name="pw" required></td>
						</tr>
						<tr>
							<td>내선번호</td>
							<td><input type="text" name="phone" required></td>
						</tr>
						<tr>
							<td>직위</td>
							<td>
								<select name="positionseq" required>
								<c:forEach items="${plist}" var="dto">
									<option value="${dto.pseq}">${dto.position}</option>
								</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<td>레벨</td>
							<td>
								<select name="levelseq">
								<option value="1">1</option>
								<option value="2">2</option>
								</select>
							</td>
						</tr>
					</table>
					
					<div class="btnfloat">
						<button type="submit" id="submitResult" class="btn btn-success btn-circle btn-sm float-right" name="등록" disabled="disabled">
							<i class="fas fa-check"></i>
						</button>
						<button type="button" class="btn btn-danger btn-circle btn-sm float-right" name="취소" onclick="location.href='/web/adminuser'">
							<i class="fas fa-trash"></i>
						</button>
					</div>
				
				</div>
			</form>
		</div>
	</div>


<script>
	
document.getElementById('email').addEventListener('input', function(event) {
    document.getElementById('emailcheck').disabled = !this.value;
}, false);

	
function fn_emailCheck() {
	$.ajax({
		url: "/web/emailcheck",
		type: "POST",
		dataType: "JSON",
		data: {"email" : $("#email").val()},
		success: function(data) {
			if (data==1) {
				alert("중복된 이메일입니다.");
			} else if (data==0){
				alert("사용 가능한 이메일입니다.");
				document.getElementById('submitResult').disabled = false;	
			}
		}
	})
}
	
</script>
