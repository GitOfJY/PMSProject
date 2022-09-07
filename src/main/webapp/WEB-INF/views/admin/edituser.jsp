<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!-- edituser.jsp -->
<div class="card shadow mb-4">
		<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
    		<h6 class="m-0 font-weight-bold text-primary">사용자 수정</h6>
    	</div>
		
		<div class="card-body">
			<form method="POST" action="/web/edituserok" enctype="multipart/form-data">
				<div class="table-responsive">
					<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
						<tr>
							<td>이름</td>
							<td><input type="text" name="name" value="${dto.name}" required></td>
						</tr>
						<tr>
							<td>이메일</td>
							<td>
								<input type="text" name="email" value="${dto.email}" readonly="readonly"> 
								<input type="text" value="@sysoft.com" disabled>
							</td>
						</tr>
						<tr>
							<td>비밀번호</td>
							<td><input type="password" name="pw" value="${dto.pw}" required></td>
						</tr>
						<tr>
							<td>내선번호</td>
							<td><input type="text" name="phone" value="${dto.phone}" required></td>
						</tr>
						<tr>
							<td>직위</td>
							<td>
								<select name="positionseq" id="positionseq" required>
								<c:forEach items="${plist}" var="dto2">
									<option value="${dto2.pseq}">${dto2.position}</option>
								</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<td>레벨</td>
							<td>
								<select name="levelseq" id="" value="${dto.levelseq}">
									<option value="1">1</option>
									<option value="2">2</option>
								</select>
							</td>
						</tr>
					</table>
					
					<input type="hidden" name="employeeseq" value="${dto.employeeseq}">
					
					<div class="btnfloat">
						<button type="submit" class="btn btn-success btn-circle btn-sm float-right" name="수정">
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

