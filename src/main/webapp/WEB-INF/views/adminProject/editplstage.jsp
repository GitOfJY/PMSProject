<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>
	.hideCol { display:none; }
</style>


<!-- editproject.jsp -->
<div class="card shadow mb-4">
	<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
    	<h6 class="m-0 font-weight-bold text-primary">스테이지 수정</h6>
    </div>
		
	<div class="card-body">
		<form method="POST" action="/web/editplstageok" enctype="multipart/form-data">
			<div class="table-responsive">
				<table id="origintable" class="table table-bordered" width="100%" cellspacing="0">
					<tbody>
						<tr>
							<td>스테이지 명</td>
							<td colspan="3">
								<input type="text" name="stagename" oninput='handleOnInput(this, 16)' value="${ndto.stagename}" required/>
								<input type="hidden" name="stageseq" value="${sdto.stageseq}">
							</td>
							<td class="hideCol">스테이지seq</td>
						</tr>
						<tr>
							<td>스테이지 기간</td>
							<td colspan="3">
								<input type="date" id="Date" name="stagesdate" required /> ~ <input type="date" id="Date" name="stagefdate" required />
							</td>
							<td class="hideCol">${sdto.stageseq}</td>
						</tr>
					</tbody>	
				</table>					
										
				<div class="btnfloat">
					<button type="submit" class="btn btn-success btn-circle btn-sm float-right">
						<i class="fas fa-check"></i>
					</button>
					<button type="button" class="btn btn-danger btn-circle btn-sm float-right" onclick="location.href='/web/plstage'">
						<i class="fa-solid fa-backward"></i>
					</button>
				</div>		
			</div>
		</form>
	</div>
</div>


<div class="card shadow mb-4">
	<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
    	<h6 class="m-0 font-weight-bold text-primary">해당 스테이지 (${not empty ndto.stagename ? ndto.stagename : "작업 없음"}) 작업 수정</h6>
    	<button type="button" id="addwork" onclick="getStageSeq();" style="background-color:transparent; border:0; outline=0; color:#4e73df;" data-toggle="modal" data-target="#editModal" data-backdrop="static" data-keyboard="false">
  			<i class="fa-solid fa-plus"></i>
		</button>
    </div>
		
	<div class="card-body">
		<div class="table-responsive">
			<table class="table table-bordered" id="editwork" width="100%" cellspacing="0">
				
				<tr>
					<td>작업명</td>
					<td>작업자</td>
					<td class="hideCol">작업seq</td>
					<td class="hideCol">작업statenum</td>
					<td>수정</td>
					<td>삭제</td>
				</tr>
				<c:forEach items="${sworkerlist}" var="sw">
				<tr>
					<td>${sw.workname}</td>
					<td>${sw.employeename}</td>
					<td class="hideCol">${sw.workseq}</td>
					<td class="hideCol">${sw.statenum}</td>
					<td>
						<button type="button" class="btn btn-success btn-circle btn-sm " onclick="getworkUser()" data-toggle="modal" data-target="#myModal" data-backdrop="static" data-keyboard="false">
						 	<i class="fas fa-info-circle"></i>
						</button>
					</td>
					<td>
						<button type="button" class="btn btn-danger btn-circle btn-sm" onclick="delwork();">
							<i class="fas fa-trash"></i>
						</button>
						<form name="hiddenForm" method="POST" action="/web/pldelwork">
							<input type="hidden" name="workseq" value="${sw.workseq}">
						</form>
					</td>
				</tr>	
				</c:forEach>
				
				<c:if test="${empty sworkerlist}">
 					<tr><td colspan='4'>등록된 작업이 없습니다.</td></tr>
				</c:if>
				
			</table>							
		</div>
	</div>
</div>


<!-- 작업 추가 모달 -->
<div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document" >
    	<div class="modal-content" style="text-align: center; width: 550px; height: 380px;">
      		<form method="POST" action="/web/pladdwork" enctype="multipart/form-data">
	      		<div class="modal-header">
	        		<h4 class="modal-title" id="myModalLabel">작업 추가</h4>
	      		</div>
	      		<div class="modal-body">
	        		<p>해당 스테이지의 작업을 추가하세요.</p>
	        		<table id="addsseq" class="table table-bordered" width="100%" cellspacing="0" >
	        			<tbody>
							<tr>
								<td>작업명</td>
								<td colspan="3">
									<input type="text" name="workname" oninput='handleOnWInput(this, 33)' required/>	
								</td>
							</tr>
							<tr>
								<td>작업 기간</td>
								<td colspan="3">
									<input type="date" id="Date" name="worksdate" required /> ~ <input type="date" id="Date" name="workfdate" required />
								</td>
							</tr>
							<tr>
								<td>작업자</td>
								<td colspan="3">
									<select name="selem">
					           		<c:forEach items="${editworkerlist}" var="empl">
					           		<option value="${empl.employeeseq}">${empl.employeename}</option>
					           		</c:forEach>
				       			</select>
								</td>
							</tr>
						</tbody>	
					</table>				
	      		</div>
			    <div class="modal-footer" style="text-align: center;">
			    	<button type="submit" class="btn btn-default">등록</button>
			    	<button type="button" id="delsseq" class="btn btn-default" data-dismiss="modal">닫기</button>
			    </div>
			</form>
	    </div>
	</div>
</div>




<!-- 작업 수정 모달 -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document" >
    	<div class="modal-content" style="text-align: center; width: 400px; height: 320px;">
      		<form method="POST" action="/web/pleditworkok" enctype="multipart/form-data">
	      		<div class="modal-header">
	        		<h4 class="modal-title" id="myModalLabel">작업 수정</h4>
	      		</div>
	      		<div class="modal-body">
	        		<p>해당 작업을 수정해주세요.</p>
	        		<table class="table table-bordered" id="addwseq" width="100%" cellspacing="0" >
						<tr>
							<td>작업명</td>
							<td>작업자</td>
						</tr>
						<tr>
							<td>
								<input type="text" name="workname" oninput='handleOnWInput(this, 33)' required/>		
							</td>
							<td>
								<select name="selem">
					           		<c:forEach items="${editworkerlist}" var="empl">
					           		<option value="${empl.employeeseq}">${empl.employeename}</option>
					           		</c:forEach>
				       			</select>
							</td>
						</tr>
					</table>				
	      		</div>
			    <div class="modal-footer" style="text-align: center;">
			    	<button type="submit" class="btn btn-default">등록</button>
			    	<button type="button" id="delwseq" class="btn btn-default" data-dismiss="modal">닫기</button>
			    </div>
			</form>
	    </div>
	</div>
</div>
 


<script>
function delwork(){
	   
	let seqList = document.getElementById('editwork');
	   
	for (let i = 1; i < seqList.rows.length; i++) {
	      
		seqList.rows[i].cells[5].onclick = function () {
	            
	    	let workseq = seqList.rows[i].cells[2].innerText;
	        let workstate = seqList.rows[i].cells[3].innerText;
	         
	        if (workstate != 0) {
	            alert('진행중인 작업은 삭제 불가능합니다.');
	        } else {      
	        	var chk = confirm("정말 삭제하시겠습니까?");
	            
	            if (chk) {
	                $("#editwork").append("<button type=\"button\" id=\"my_btn\" onclick=\"location.href=\'/web/pldelwork?workseq="+workseq+"\';\">");
	                $("#editwork").append("</button>");
	                document.getElementById('my_btn').click()       
	            }
	    	}
		}
	}
}


function getStageSeq() {
    
	let seqList = document.getElementById('origintable');
	
    document.getElementById("addwork").onclick = function () {
    	let stageseq = seqList.rows[1].cells[2].innerText;
    	$("#addsseq").append("<input type=\"hidden\" name=\"stageseq\" class=\"delseq\" value=\""+stageseq+"\">");
 	}
    
    document.getElementById("delsseq").onclick = function () {
    	$(".delseq").remove();
 	}
    
}
	
	
function getworkUser() {
    
	let workList = document.getElementById('editwork');
    let table = document.getElementById('addwseq');
    
    for (let i = 1; i < workList.rows.length; i++) {
    	workList.rows[i].cells[3].onclick = function () {
        	let userName = workList.rows[i].cells[2].innerText;
        	$("#addwseq").append("<input type=\"hidden\" name=\"wseq\" class=\"delthis\" value=\""+userName+"\">");
		}
	}

    document.getElementById("delwseq").onclick = function () {
    	$(".delthis").remove();
 	}
}


$('#modal').modal("hide");
$('#modal').modal("show");

function handleOnInput(el, maxlength) {
	if(el.value.length > maxlength)  {
	    el.value = el.value.substr(0, maxlength);
	    alert("16글자 이내로 입력하세요.");
	}
}

function handleOnWInput(el, maxlength) {
	if(el.value.length > maxlength)  {
	    el.value = el.value.substr(0, maxlength);
	    alert("33글자 이내로 입력하세요.");
	}
}
	
</script>
