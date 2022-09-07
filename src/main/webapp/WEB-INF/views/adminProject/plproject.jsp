<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!-- plproject.jsp -->
	<div class="card shadow mb-4">
		<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
    		<h6 class="m-0 font-weight-bold text-primary">프로젝트 관리</h6>
    	</div>
		
		<div class="card-body">
			
			<div class="table-responsive">
				<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
					<thead style="text-align: center;" class="" role="gridcell">
						<tr>
							<th>프로젝트 코드</th>
				           	<th>프로젝트 명</th>
				           	<th>프로젝트 유형</th>
			                <th>시작일</th>
			                <th>완료일</th>
			                <th>수정</th>
	                	</tr>
					</thead>
					<tbody style="text-align: center;" class="" role="gridcell">
						
						<c:forEach items="${projectlist}" var="dto">
						<tr>
							<td>${dto.projectcode}</td>
							<td>${dto.projectname}</td>
							<td>${dto.rndstate}</td>
							<td>${dto.projectsdate.substring(0,10)}</td>
							<td>${dto.projectfdate.substring(0,10)}</td>
							<td>
								<form action="POST">
								<button type="button" class="btn btn-info btn-circle btn-sm" onclick="location.href='/web/editplproject?projectseq=${dto.projectseq}';">
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



