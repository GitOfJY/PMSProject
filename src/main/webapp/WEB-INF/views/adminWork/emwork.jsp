<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- emwork.jsp -->
<style>
table {
	border: 1px solid #E0E0E0;
	table-layout: fixed;
}

table, td, th {
	border-collapse: collapse;
}

th {
	border: 1px solid #E0E0E0;
	text-align: center;
	background-color: #FAFAFA;
	height: 45px;
}

tr {
	height: 50px;
}

.multi-portlet {
	background: #ffffff;
	padding: 25px;
	margin-bottom: 15px;
	margin-left: 20px;
	margin-right: 20px;
	min-height: 570px;
	box-shadow: 0px 0px 13px 0px rgb(82 63 105/ 5%);
}

.search-section {
	padding-top: 20px;
	padding-bottom: 20px;
	background-color: #edf6f9;
	margin-bottom: 10px;
	border-radius: 8px;
	margin-right: 0px;
	margin-left: 0px;
}

.col-md-4 {
	position: relative;
	width: 100%;
	padding-right: 10px;
	padding-left: 10px;
}
</style>


<div class="multi-portlet">
	<div class="row">
		
		<div class="col-lg-12 col-md-9 col-sm-12 col-xs-12 search-section">
			<div class="row search-form">
				<div class="col-md-10">
					<form id="projectForm">
						<div class="row align-items-center">
							<div class="col-md-3 kt-margin-b-20-tablet-and-mobile">
								<div class="kt-input-icon kt-input-icon--left">
									<select id="pstate" name="pstate" class="form-control select2me select2-hidden-accessible" data-select2-id="ddlStatus" tabindex="-1" aria-hidden="true">
										<option value="" selected>작업 상태를 선택하세요</option>
										<c:forEach items="${wstatelist}" var="dto">
											<option value="${dto.state}">${dto.state}</option>
										</c:forEach>
									</select>
								</div>
							</div>

							<div class="col-md-4 kt-margin-b-20-tablet-and-mobile">
								<div class="input-group">
									<div class="kt-input-icon kt-input-icon--left">
										<button id="search" class="btn btn-primary">검색</button>
									</div>
								</div>
							</div>
						</div>
					</form>
				</div>
				<a class="btn btn-primary btn-icon-split" data-toggle="modal" data-target="#myModal">
					<span class="icon text-white-50"> <i class="fa fa-plus" aria-hidden="true"></i></span>
					<span class="text">작업 등록</span>
				</a>
			</div>
		</div>
		
		<div class="table-responsive">
			<table class="table table-bordered table-hover" id="workTable" width="100%" cellspacing="0">
				<colgroup>
					<col style="width: 70px" />
				</colgroup>
				<thead class="text-center">
					<tr>
						<th scope="col"><span class="k-link">순번</span></th>
						<th scope="col"><span class="k-link">작업</span></th>
						<th scope="col"><span class="k-link">프로젝트</span></th>
						<th scope="col"><span class="k-link">상태</span></th>
						<th scope="col"><span class="k-link">시작일</span></th>
						<th scope="col"><span class="k-link">완료일</span></th>
						<th scope="col"><span class="k-link">완료율</span></th>
						<th scope="col"><span class="k-link">삭제</span></th>
					</tr>
				</thead>
				 
				<c:if test="${fn:length(wlist) == 0}">
					<tbody>
						<tr>
							<td colspan="9" style="text-align: center;">검색된 결과가 없습니다.</td>
						</tr>
					</tbody>
				</c:if>
				
				<c:if test="${fn:length(wlist) > 0}">
					<tbody>
						<c:forEach items="${wlist}" var="dto">
							<tr>
								<td role="gridcell" align=center>${dto.workseq}</td>
								<td style="text-align: left;" class="" role="gridcell" align=center>
									<div class="forum-list-title">
										<a href="/web/workinfo?workseq=${dto.workseq}">${dto.workname}</a>
									</div>
								</td>
								<td role="gridcell" align=center>${dto.projectname}</td>
								<td role="gridcell" align=center>${dto.wstate}</td>
								<td role="gridcell" align=center>${dto.worksdate.substring(0,10)}</td>
								<td role="gridcell" align=center>${dto.workfdate.substring(0,10)}</td>
								<td role="gridcell" align=center>${dto.wstatenum}</td>
								<td role="gridcell" align=center>
									<button type="button" class="btn btn-danger btn-circle btn-sm" onclick="delwork();">
										<i class="fas fa-trash"></i>
									</button>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</c:if>
			</table>
		</div>
	</div>
</div>


<!-- 작업등록 모달 -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document" >
 	   	<div class="modal-content" style="text-align: center; width: 550px; height: 430px;">
      		<form method="POST" action="/web/emaddworkok" enctype="multipart/form-data">
	      		<div class="modal-header">
	        		<h4 class="modal-title" id="myModalLabel">작업 추가</h4>
	      		</div>
	      		<div class="modal-body">
	        		<table class="table table-bordered" width="100%" cellspacing="0">
						<tbody>
							<tr>
								<td>작업 명</td>
								<td colspan="3">
									<input type="text" name="workname" oninput='handleOnInput(this, 16)' required/>	
								</td>
							</tr>
							<tr>
								<td>작업 기간</td>
								<td colspan="3">
									<input type="date" id="Date" name="worksdate" required /> ~ <input type="date" id="Date" name="workfdate" required />
								</td>
							</tr>
							<tr>
								<td>스테이지</td>
								<td colspan="3">
									<select name="stageseq" class="form-control select2me select2-hidden-accessible" data-select2-id="ddlStatus" tabindex="-1" aria-hidden="true">
										<option selected>스테이지를 선택하세요</option>
										<c:forEach items="${getstage}" var="sdto">
											<option value="${sdto.stageseq}">${sdto.stagename}</option>
										</c:forEach>
									</select>
								</td>
							</tr>
							<tr>
								<td>메모</td>
								<td colspan="3">
									<input type="text" name="workmemo" oninput='memoInput(this, 16)'/>	
								</td>
							</tr>
						</tbody>	
					</table>			
	      		</div>
			    <div class="modal-footer" style="text-align: center;">
			   		<input type="hidden" name="employeeseq" value="${getemseq.employeeseq}">
			   		<button type="submit" class="btn btn-default">등록</button>
			   		<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
			   	</div>
			</form>
	   	</div>
	</div>
</div>


<script type="text/javascript">

$(document).ready(function() {

	var form = document.getElementById("projectForm");

	$("#search").click(function() {
		form.action = "/web/work/worksearch";
		form.method = "GET";
		form.submit();
	});

});


$('#modal').modal("hide");
$('#modal').modal("show");


function handleOnInput(el, maxlength) {
	if(el.value.length > maxlength)  {
	    el.value = el.value.substr(0, maxlength);
	    alert("16글자 이내로 입력하세요.");
	}
}


function memoInput(el, maxlength) {
	if(el.value.length > maxlength)  {
	    el.value = el.value.substr(0, maxlength);
	    alert("16글자 이내로 입력하세요.");
	}
}


function delwork(){
	   
	let seqList = document.getElementById('workTable');
	   
	for (let i = 1; i < seqList.rows.length; i++) {
		seqList.rows[i].cells[7].onclick = function () {
	    	let workseq = seqList.rows[i].cells[0].innerText;
	    	    
	        var chk = confirm("정말 삭제하시겠습니까?");
	            
	        if (chk) {
	        	$("#workTable").append("<button type=\"button\" id=\"del_btn\" onclick=\"location.href=\'/web/emdelwork?workseq="+workseq+"\';\">");
	            $("#workTable").append("</button>");
	            document.getElementById('del_btn').click();
	        }
	    }    
	}
	
}


</script>