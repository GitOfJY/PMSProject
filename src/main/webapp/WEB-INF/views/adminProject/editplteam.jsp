<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!-- editplteam.jsp -->
<div class="card shadow mb-4">
	<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
    	<h6 class="m-0 font-weight-bold text-primary">${teamname.teamname} 수정</h6>
      	<button type="button" style="background-color:transparent; border:0; outline=0; color:#4e73df;" data-toggle="modal" data-target="#myModal">
  			<i class="fa-solid fa-plus"></i>
		</button>
    </div>	
	<div class="card-body">
		<div class="table-responsive">
			<table class="table table-bordered" id="addTable" width="100%" cellspacing="0">
				<thead style="text-align: center;" class="" role="gridcell">
					<tr>
				    	<th>팀 원</th>
				        <th>삭 제</th>
	                </tr>
				</thead>
				<tbody style="text-align: center;" class="" role="gridcell">
					<c:forEach items="${plteamlist}" var="tdto">
					<tr>	
						<td>
							${tdto.name}(${tdto.role})
						</td>
						<td>
							<form method="POST" action="/web/editplteamok" enctype="multipart/form-data">
								<input type="hidden" name="employeeseq" id="employeeseq" value="${tdto.employeeseq}">							
								<button type="submit" class="btn btn-danger btn-circle btn-sm">
									<i class="fas fa-trash"></i>
								</button>
							</form>
						</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
										
			<div class="btnfloat">
				<button type="button" class="btn btn-danger btn-circle btn-sm float-right" name="취소" onclick="location.href='/web/plteam'">
					<i class="fa-solid fa-backward"></i>
				</button>
			</div>
		</div>
	</div>
</div>



<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document" >
    	<div class="modal-content" style="text-align: center; width: 350px; height: 230px;">
      		<form method="POST" action="/web/pladdteamok" enctype="multipart/form-data">
	      		<div class="modal-header">
	        		<h4 class="modal-title" id="myModalLabel">팀원 추가</h4>
	      		</div>
	      		<div class="modal-body">
	        		<p>${teamname.teamname}에 추가 할 팀원을 선택해주세요.</p>
	         		<select name="addemseq">
	           		<c:forEach items="${empllist}" var="empl">
	           		<option value="${empl.employeeseq}">${empl.employeename}</option>
	           		</c:forEach>
	       			</select>
			        <select name="setrseq">
			        <c:forEach items="${rolelist}" var="role">
				    <option value="${role.roleseq}">${role.role}</option>
				    </c:forEach>
				    </select>
				    <input type="hidden" name="teamname" id="teamname" value="${teamname.teamname}">
				    <input type="hidden" name="projectseq" id="projectseq" value="${teamname.projectseq}">							
	      		</div>
			    <div class="modal-footer" style="text-align: center;">
			    	<button type="submit" class="btn btn-default">등록</button>
			    	<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
			    </div>
			</form>
	    </div>
	</div>
</div>


<script>
	
$('#modal').modal("hide");
$('#modal').modal("show");

</script>	
