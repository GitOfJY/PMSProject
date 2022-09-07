<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!-- adminuser.jsp -->
	<div class="card shadow mb-4">
		<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
    		<h6 class="m-0 font-weight-bold text-primary">사용자 관리</h6>
    		<div class="dropdown no-arrow">
	    		<button onclick="location.href='/web/adduser';" id="regi" class="btn btn-secondary btn-icon-split btn-sm float-right">
					<span class="icon text-white-50"> <i class="fas fa-flag"></i> </span> 
					<span class="text">사용자 등록</span>
				</button>
    		</div>
    	</div>
		
		<div class="card-body">
			
			<div class="table-responsive">
				<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
					<thead style="text-align: center;" class="" role="gridcell">
						<tr>
							<th>이름</th>
							<th>직위</th>
							<th>e-mail</th>
							<th>내선번호</th>
							<th>level</th>
							<th>수정/삭제</th>
						</tr>
					</thead>
					<tbody style="text-align: center;" class="" role="gridcell">
						<c:forEach items="${elist}" var="dto">
						<tr>
							<td>${dto.ename}</td>
							<td>${dto.eposition}</td>
							<td>${dto.eemail}</td>
							<td>${dto.ephone}</td>
							<td>${dto.elevelseq}</td>
							<td>
								<form action="POST">
								<button type="button" class="btn btn-info btn-circle btn-sm" onclick="location.href='/web/edituser?employeeseq=${dto.eemployeeseq}';">
									<i class="fas fa-info-circle"></i>
								</button>
								<button type="button" class="btn btn-danger btn-circle btn-sm" onclick="deluser(${dto.eemployeeseq});">
                        		<i class="fas fa-trash"></i></button>
								</form>
							</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>


<script type="text/javascript">
 
function deluser(employeeseq){
	   
	var chk = confirm("정말 삭제하시겠습니까?");
		
	if (chk) {
		location.href='/web/deluser?employeeseq='+employeeseq;
	}        
}

</script>


