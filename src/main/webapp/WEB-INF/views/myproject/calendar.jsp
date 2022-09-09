<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.11.2/main.css">
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.11.2/main.js"></script>
<!-- 언어 설정 -->
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/locales-all.js"></script>
<!-- 툴팁 설정 -->
<script src="https://unpkg.com/@popperjs/core@2.11.5/dist/umd/popper.min.js"></script>
<script src="https://unpkg.com/tippy.js@6.3.7/dist/tippy-bundle.umd.min.js"></script>
<style>
a, h2 {
	color: #242424;
}

/* 일요일 날짜 빨간색 */
.fc-day-sun a {
	color: red;
	text-decoration: none;
}

/* 토요일 날짜 파란색 */
.fc-day-sat a {
	color: blue;
	text-decoration: none;
}

.fc-toolbar-chunk {
	display: flex;
	align-items: center;
}
</style>

<script>
	document.addEventListener('DOMContentLoaded', function() {
		var calendarEl = document.getElementById('calendar');
		var calendar = new FullCalendar.Calendar(calendarEl, {
			initialView : 'dayGridMonth', // 초기 로드 될때 보이는 캘린더 화면(기본 설정: 달)
			headerToolbar : { // 헤더에 표시할 툴 바
				start : 'addEventButton,today',
				center : 'prev title next',
				end : 'dayGridMonth,dayGridWeek,dayGridDay'
			},
			titleFormat : function(date) {
				return date.date.year + '년 ' + (parseInt(date.date.month) + 1) + '월';
			},
			selectable : true, // 달력 일자 드래그 설정가능
			droppable : true,
			editable : true,
			nowIndicator : true, // 현재 시간 마크
			locale : 'ko', // 한국어 설정
			height: 680,
			fixedWeekCount: false,
			dayMaxEventRows:true,
			eventDidMount: function(info) { // 툴팁 설정
				var tooltip = tippy(info.el, {
			        content: info.event.extendedProps.description,
			        placement: "top",
			        interactive: true
			      });
	        },
 	        eventClick : function(data){ //상세정보
 	        	var scheduleseq = data.event.extendedProps.scheduleseq;
	        		
 	        	$.ajax({
 	        		type: 'post',
 	        		url: 'calendarlist',
                    data: {scheduleseq : scheduleseq},
                    dataType: 'json',
                    success: function(data) {
                    	console.log(data); 
                    	$("#title").attr('value', data.stitle);
                    	$("#start_date").attr('value', data.startdate);
                    	$("#end_date").attr('value', data.enddate);
                    	$("#memo").val(data.smemo);
                    	$("#schedule_seq").val(data.scheduleseq);
                    	$("#employee_seq").val(data.employeeseq);
                    	$("#calendarModal").modal("show"); //modal 나타내기
                    }, error:function(a, b, c){
                    	console.log(a, b, c);
        			}
 	        	}); //정보 불러오기
 	        	
 	        	$("#editCalendar").on("click", function(){  //수정 버튼 시
 	        		 if(confirm("해당일정을 정말로 수정 하시겠습니까?")) {
 	        			//alert("확인");
                         var title = $("#title").val();
                         var start_date = $("#start_date").val();
                         var end_date = $("#end_date").val();
                         var memo = $("#memo").val();
                         var schedule_seq = $("#schedule_seq").val();
                         var employee_seq = $("#employee_seq").val();
                         
                       //내용 입력 여부 확인
                         if(title == null || title == ""){
                             alert("제목을 입력하세요.");
                         }else if(start_date == "" || end_date ==""){
                             alert("날짜를 입력하세요.");
                         }else if(new Date(end_date)- new Date(start_date) < 0){ // date 타입으로 변경 후 확인
                             alert("종료일이 시작일보다 먼저입니다.");
                         }else{ // 정상적인 입력 시
                         	
                         	start_date = new Date(start_date).toISOString().split("T")[0] + ' ' + new Date(start_date).toTimeString().split(" ")[0];
                         	end_date = new Date(end_date).toISOString().split("T")[0] + ' ' + new Date(end_date).toTimeString().split(" ")[0];
                         	
                             var obj = {
                             	"stitle" : title,
                                 "startdate" : start_date,
                                 "enddate" : end_date,
                                 "smemo" : memo,
                                 "scheduleseq" : schedule_seq
                             }//전송할 객체 생성
                             
                             console.log(obj);
                             
                             $.ajax({
                                 type: 'POST',
                                 url: 'calendaredit',
                                 data: obj,
                                 dataType: 'json',
                                 success: function (result) {
                                 	$("#calendarModal").modal("hide");
                                 	location.reload();
                                 },error:function(a, b, c){
                                     console.log(a, b, c);
                                 }
                             });
                         }
 	        		 }
       			}); //수정버튼
       			
       			
       			$("#delCalendar").on("click", function(){  //삭제 버튼 시
	        		 if(confirm("해당일정을 정말로 삭제 하시겠습니까?")) {
                        var schedule_seq = $("#schedule_seq").val();
                            console.log(schedule_seq);
                            $.ajax({
                                type: 'POST',
                                url: 'calendardel',
                                data: {"scheduleseq" : schedule_seq},
                                dataType: 'json',
                                success: function (result) {
                                	$("#calendarModal").modal("hide");
                                	location.reload();
                                },error:function(a, b, c){
                                    console.log(a, b, c);
                                }
                            });
                        }
      			}); //삭제버튼
       			

	        	 //alert(JSON.stringify(data.event));  
	        	  /*
	        	  alert("\n번호 : " + data.event.extendedProps.scheduleseq +
	        			"\n일정명 : " + data.event.title +
	        			"\n설명 : " +data.event.extendedProps.description + 
	        			"\n시작 : " + data.event.start +
	        			"\n끝   : " + data.event.end);
	        	  */
	        	  
	          }, 
			events : [
				<c:forEach items="${calendarList}" var="dto" varStatus="status">
	            {
	            	title : "${dto.stitle}",
	                start : "${dto.startdate}",
	                end : "${dto.enddate}",
	                description: "${dto.smemo}",
	                scheduleseq : "${dto.scheduleseq}"
	             },
	            </c:forEach>
					],
				 customButtons: {
	                    addEventButton: { // 추가한 버튼 설정
	                        text : "일정 추가",  // 버튼 내용
	                        click : function(){ // 버튼 클릭 시 이벤트 추가
	                            $("#calendarAddModal").modal("show"); // modal 나타내기

	                            $("#addCalendar").on("click",function(){  // modal의 추가 버튼 클릭 시
	                                var title = $("#calendar_title").val();
	                                var start_date = $("#calendar_start_date").val();
	                                var end_date = $("#calendar_end_date").val();
	                                var content = $("#calendar_content").val();
	                                
	                                //내용 입력 여부 확인
	                                if(title == null || title == ""){
	                                    alert("제목을 입력하세요.");
	                                }else if(start_date == "" || end_date ==""){
	                                    alert("날짜를 입력하세요.");
	                                }else if(new Date(end_date)- new Date(start_date) < 0){ // date 타입으로 변경 후 확인
	                                    alert("종료일이 시작일보다 먼저입니다.");
	                                }else{ // 정상적인 입력 시
	                                	
	                                	start_date = new Date(start_date).toISOString().split("T")[0] + ' ' + new Date(start_date).toTimeString().split(" ")[0];
	                                	end_date = new Date(end_date).toISOString().split("T")[0] + ' ' + new Date(end_date).toTimeString().split(" ")[0];
	                                	
	                                    var obj = {
                                        	"stitle" : title,
                                            "startdate" : start_date,
                                            "enddate" : end_date,
                                            "smemo" : content
	                                    }//전송할 객체 생성
	                                    
	                                    console.log(obj);
	                                    
	                                    //새로운 일정 저장
	                                    $.ajax({
	                                        type: 'POST',
	                                        url: 'calendaradd',
	                                        data: obj,
	                                        dataType: 'json',
	                                        success: function (result) {
	                                        	$("#calendarModal").modal("hide");
	                                        	location.reload();//새로고침
	                                        	//window.close();
	                                        	//calendar.refetchEvents();
	                                        },error:function(a, b, c){
	                                            console.log("ajax 통신 실패_일정저장");
	                                            console.log(a, b, c);
	                                        }
	                                    });/*ajax 새로운 일정 저장*/
	                                }

	                            });
	                        }
	                    }
	                }
		});
		calendar.render(); //캘린더가 생성됨
	});
</script>

<div class="container-fluid">

	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary">내 일정 관리</h6>
		</div>

		<div class="card-body">
			<div id="calendarBox">
				<div id="calendar"></div>
			</div>

			<!-- 추가 -->
			<div class="modal fade" id="calendarAddModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel">일정을 입력하세요.</h5>
							<button type="button" class="close" data-dismiss="modal" aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
							<div class="form-group">
								<label for="taskId" class="col-form-label">일정명</label>
								<input type="text" class="form-control" id="calendar_title" name="calendar_title">

								<label for="taskId" class="col-form-label">시작 날짜</label>
								<input type="datetime-local" class="form-control" id="calendar_start_date" name="calendar_start_date">

								<label for="taskId" class="col-form-label">종료 날짜</label>
								<input type="datetime-local" class="form-control" id="calendar_end_date" name="calendar_end_date">

								<label for="taskId" class="col-form-label">설명</label>
								<textarea rows="3" cols="50" class="form-control" name="calendar_content" id="calendar_content"></textarea>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-primary" id="addCalendar">추가</button>
							<button type="button" class="btn btn-secondary" data-dismiss="modal" id="sprintSettingModalClose">취소</button>
						</div>
					</div>
				</div>
			</div>
			<!-- 추가 끝 -->

			<!-- 수정, 삭제 -->
			<div class="modal fade" id="calendarModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title">일정을 입력하세요.</h5>
							<button type="button" class="close" data-dismiss="modal" aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body" id="calendarList">
							<div class="form-group">
								<label for="taskId" class="col-form-label">일정명</label>
								<input type="text" class="form-control" id="title" name="calendar_title">
								<label for="taskId" class="col-form-label">시작 날짜</label>
								<input type="datetime-local" class="form-control" id="start_date" name="calendar_start_date">
								<label for="taskId" class="col-form-label">종료 날짜</label>
								<input type="datetime-local" class="form-control" id="end_date" name="calendar_end_date">
								<label for="taskId" class="col-form-label">설명</label>
								<textarea rows="3" cols="50" class="form-control" id="memo" name="calendar_memo"></textarea>

								<input type="hidden" id="schedule_seq" />
								<input type="hidden" id="employee_seq" />
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-danger" id="delCalendar">삭제</button>
							<button type="button" class="btn btn-primary" id="editCalendar">수정</button>
							<button type="button" class="btn btn-secondary" data-dismiss="modal" id="ModalClose">취소</button>
						</div>
					</div>
				</div>
			</div>
			<!-- 수정, 삭제 끝 -->

		</div>
		<!-- body 끝 -->
	</div>
</div>
