<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!-- plstage.jsp -->
	<div class="card shadow mb-4">
		<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
    		<h6 class="m-0 font-weight-bold text-primary">스테이지 관리</h6>
    		<button type="button" style="background-color:transparent; border:0; outline=0; color:#4e73df;" data-toggle="modal" data-target="#myModal">
  				<i class="fa-solid fa-plus"></i>
			</button>
    	</div>
		
		<div class="card-body">
			<div class="table-responsive">
				<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
					<thead style="text-align: center;" class="" role="gridcell">
						<tr>
				           	<th>스테이지 명</th>
			                <th>시작일</th>
			                <th>완료일</th>
			                <th>수정/삭제</th>
	                	</tr>
					</thead>
					<tbody style="text-align: center;" class="" role="gridcell">
					
						<c:if test="${empty stagelist}">
 					 	<td colspan='4'>등록된 stage가 없습니다.</td>
						</c:if>
					
						<c:forEach items="${stagelist}" var="dto">
						<tr>
							<td>${dto.stagename}</td>
							<td>${dto.stagesdate.substring(0,10)}</td>
							<td>${dto.stagefdate.substring(0,10)}</td>
							<td>
								<form action="POST">
								<button type="button" class="btn btn-info btn-circle btn-sm" onclick="location.href='/web/editplstage?stageseq=${dto.stageseq}';">
									<i class="fas fa-info-circle"></i>
								</button>
								<button type="button" class="btn btn-danger btn-circle btn-sm" onclick="deluser();">
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

	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
 	   <div class="modal-dialog" role="document" >
 	   		<div class="modal-content" style="text-align: center; width: 550px; height: 270px;">
      			<form method="POST" action="/web/pladdstageok" enctype="multipart/form-data">
	      			<div class="modal-header">
	        			<h4 class="modal-title" id="myModalLabel">스테이지 추가</h4>
	      			</div>
	      			<div class="modal-body">
	        			<table class="table table-bordered" width="100%" cellspacing="0">
							<tbody>
								<tr>
									<td>스테이지 명</td>
									<td colspan="3">
										<input type="text" name="stagename" oninput='handleOnInput(this, 16)' required/>	
									</td>
								</tr>
								<tr>
									<td>스테이지 기간</td>
									<td colspan="3">
										<input type="date" id="Date" name="stagesdate" required /> ~ <input type="date" id="Date" name="stagefdate" required />
									</td>
								</tr>
							</tbody>	
						</table>			
	      			</div>
			    	<div class="modal-footer" style="text-align: center;">
			    		<input type="hidden" name="projectseq" value="${getpseq.projectseq}">
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

function handleOnInput(el, maxlength) {
	if(el.value.length > maxlength)  {
	    el.value = el.value.substr(0, maxlength);
	    alert("16글자 이내로 입력하세요.");
	}
}

</script>	


