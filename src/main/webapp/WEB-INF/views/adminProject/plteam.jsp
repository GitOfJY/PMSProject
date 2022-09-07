<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!-- plteam.jsp -->
	<div class="card shadow mb-4">
		<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
    		<h6 class="m-0 font-weight-bold text-primary">팀원 관리</h6>
    	</div>
		
		<div class="card-body">
			
			<div class="table-responsive">
				<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
					<thead style="text-align: center;" class="" role="gridcell">
						<tr>
							<th>프로젝트 명</th>
				           	<th>팀 명</th>
				           	<th>팀 원</th>
				           	<th>수정</th>
	                	</tr>
					</thead>
					<tbody style="text-align: center;" class="" role="gridcell">
						<c:forEach items="${pltlist}" var="dto">
						<tr>
							<td>${dto.pname}</td>
							<td>${dto.tname}</td>
							<td>
							<c:forEach items="${plteamlist}" var="tdto">
							${tdto.name}(${tdto.role})
							</c:forEach>
							</td>
							<td>
								<form action="POST">
								<button type="button" class="btn btn-info btn-circle btn-sm" onclick="location.href='/web/editplteam?tname=${dto.tname}';">
									<i class="fas fa-info-circle"></i>
								</button>
								</form>
							</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>



