<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!-- dashboardeach.jsp -->
	<div>대시보드</div>
	<div class="d-sm-flex align-items-center justify-content-between mb-4">
		<h1 class="h3 mb-0 text-gray-800">개인별 대시보드</h1>
	</div>
	
	
	<div class="row">
    	<!-- 내작업 -->
        <div class="col-xl-3 col-md-6 mb-4">
        	<div class="card border-left-primary shadow h-100 py-2">
        		<div class="card-body">
        			<div class="row no-gutters align-items-center">
        				<div class="col mr-2">
        					<div class="text-xs font-weight-bold text-info text-uppercase mb-1">내작업</div>
                            <div class="row no-gutters align-items-center">
                            	<div class="col-auto">
                                	<div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">${mywork.wcount}</div>
                                </div>
	                            <div class="col">
	                            	<div class="progress progress-sm mr-2">
	                                	<div class="progress-bar bg-info" role="progressbar" style="width: ${mywork.wcount}%" aria-valuenow="50" aria-valuemin="0" aria-valuemax="50"></div>
	                                </div>
	                            </div>
	                            <div class="col-auto">
	                            	<a href="/web/emwork">
                        			<i class="fa-solid fa-child fa-2x"></i>
                        			</a>
                        		</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- 이슈 -->
        <div class="col-xl-3 col-md-6 mb-4">
        	<div class="card border-left-success shadow h-100 py-2">
        		<div class="card-body">
        			<div class="row no-gutters align-items-center">
        				<div class="col mr-2">
        					<div class="text-xs font-weight-bold text-info text-uppercase mb-1">이슈</div>
                            <div class="row no-gutters align-items-center">
                            	<div class="col-auto">
                                	<div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">${myissue.icount}</div>
                                </div>
	                            <div class="col">
	                            	<div class="progress progress-sm mr-2">
	                                	<div class="progress-bar bg-info" role="progressbar" style="width: ${myissue.icount}%" aria-valuenow="50" aria-valuemin="0" aria-valuemax="50"></div>
	                                </div>
	                            </div>
	                            <div class="col-auto">
	                            	<a href="/web/issue/issuelist">
                        			<i class="fa-regular fa-note-sticky fa-2x"></i>
                        			</a>
                        		</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- 산출물 -->
        <div class="col-xl-3 col-md-6 mb-4">
        	<div class="card border-left-info shadow h-100 py-2">
        		<div class="card-body">
        			<div class="row no-gutters align-items-center">
        				<div class="col mr-2">
        					<div class="text-xs font-weight-bold text-info text-uppercase mb-1">산출물</div>
                            <div class="row no-gutters align-items-center">
                            	<div class="col-auto">
                                	<div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">${myoutput.opcount}</div>
                                </div>
	                            <div class="col">
	                            	<div class="progress progress-sm mr-2">
	                                	<div class="progress-bar bg-info" role="progressbar" style="width: ${myoutput.opcount}%" aria-valuenow="50" aria-valuemin="0" aria-valuemax="50"></div>
	                                </div>
	                            </div>
	                            <div class="col-auto">
	                            	<a href="/web/myproject/myoutputlist">
                        			<i class="fa-regular fa-clipboard fa-2x"></i>
                        			</a>
                        		</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    	<!-- 프로젝트 -->
        <div class="col-xl-3 col-md-6 mb-4">
        	<div class="card border-left-warning shadow h-100 py-2">
        		<div class="card-body">
        			<div class="row no-gutters align-items-center">
        				<div class="col mr-2">
        					<div class="text-xs font-weight-bold text-warning text-uppercase mb-1">프로젝트</div>
        					<div class="row no-gutters align-items-center">
                            	<div class="col-auto">
                                	<div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">${myproject.pcount}</div>
                                </div>
	                            <div class="col">
	                            	<div class="progress progress-sm mr-2">
	                                	<div class="progress-bar bg-info" role="progressbar" style="width: ${myproject.pcount}%" aria-valuenow="50" aria-valuemin="0" aria-valuemax="50"></div>
	                                </div>
	                            </div>
	                            <div class="col-auto">
	                            	<a href="/web/project/projectcenter">
        							<i class="fa-solid fa-laptop-code fa-2x"></i>
        							</a>
        						</div>
                            </div>
                        </div>
        			</div>
        		</div>
        	</div>
        </div>
    </div>
	
	
	<!-- 내 프로젝트 리스트 -->
    <div class="card shadow mb-4">
    	<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
    		<h6 class="m-0 font-weight-bold text-primary">참여 프로젝트</h6>
    		<div class="dropdown no-arrow">
	    		<a href="/web/project/projectcenter">More</a>
    		</div>
    	</div>
	    <div class="card-body">
        	<div class="table-responsive">
            	<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                	<thead>
               	    	<tr>
			            	<th>프로젝트 리스트</th>
		                </tr>
                    </thead>
                    <tbody>
                    	
	                    <c:if test="${eachplist eq '[null]'}">
	 						<td>진행중인 project가 없습니다.</td>
						</c:if>
							
						<c:if test="${eachplist ne '[null]'}">
		                <c:forEach items="${eachplist}" var="dto">
                        <tr>
	                        <td>
		                        <a href="/web/project/centerwbs?projectseq=${dto.eachpseq}">
		              				${dto.eachpname}
		                        </a>
	                        </td>     	
		                </tr>
		                </c:forEach>
		                </c:if>
		                         	
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    
    
    <!-- 예정작업 (금주/차주) -->
    <div class="card shadow mb-4">
    	<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
    		<h6 class="m-0 font-weight-bold text-primary">예정작업 (금주/차주)</h6>
    		<div class="dropdown no-arrow">
    			<!-- 내작업으로 링크 바꾸기 -->
	    		<a href="/web/project/projectcenter">More</a>
    		</div>
    	</div>
	    <div class="card-body">
        	<div class="table-responsive">
            	<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                	<thead style="text-align: center;" class="" role="gridcell">
               	    	<tr>
				          	<th>프로젝트</th>
				           	<th>작업</th>
				           	<th>시작일</th>
			                <th>완료일</th>
				            <th>완료율</th>
	                	</tr>
                    </thead>
                    <tbody style="text-align: center;" class="" role="gridcell">
                    	
	                    <c:if test="${eachwlist eq '[]'}">
	 					    <td colspan='5'>진행중인 work가 없습니다.</td>
						</c:if>
							
		                <c:forEach items="${eachwlist}" var="dto">
                        <tr>
                       	    <td>${dto.pname}</td>
                       	    <td>${dto.wname}</td>
                       	    <td>${dto.wsdate.substring(0,10)}</td>
                       	    <td>${dto.wfdate.substring(0,10)}</td>
                       	    <td>10</td>     	
		                </tr>
		                </c:forEach>
		                         	
                    </tbody>
                </table>
            </div>
        </div>
    </div>


    <!-- 내 산출물 -->
    <div class="card shadow mb-4">
    	<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
    		<h6 class="m-0 font-weight-bold text-primary">내 산출물</h6>
    		<div class="dropdown no-arrow">
    			<!-- 내 산출물로 주소 옮기기 -->
	    		<a href="/web/project/outputslist">More</a>
    		</div>
    	</div>
	    <div class="card-body">
        	<div class="table-responsive">
            	<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                	<thead style="text-align: center;" class="" role="gridcell">
               	    	<tr>
				          	<th>프로젝트</th>
				           	<th>작업</th>
				           	<th>파일</th>
			                <th>등록일자</th>
	                	</tr>
                    </thead>
                    <tbody style="text-align: center;" class="" role="gridcell">
                    	 
                    	 <c:if test="${eachoplist eq '[]'}">
	 					    <td colspan='4'>산출물이 없습니다.</td>
						</c:if>
							
		                <c:forEach items="${eachoplist}" var="dto">
                        <tr>
                       	    <td>${dto.oppname}</td>
                       	    <td>${dto.opwname}</td>
                       	    <td>${not empty dto.opname ? dto.opname : "-"}</td>
                       	    <td>${dto.date.substring(0,10)}</td>
		                </tr>
		                </c:forEach>
		                         	
                    </tbody>
                </table>
            </div>
        </div>
    </div>
  
    
    	<div class="row">
	
		<!-- 작업 진행상태 -->
		<div style="padding: 0px 30px 0px 10px;">
			<div class="card shadow mb-4" style="width: 610px; height:450px;">
				<div class="card-header py-3">
					<h6 class="m-0 font-weight-bold text-primary">작업 진행상태</h6>
				</div>
		        <div class="card-body">
		           <div id="chart1" style="width: 550px; height:350px;"></div>
		        </div>
		    </div>
	    </div>
	    

		<!-- 이슈 현황 -->
		<div class="card shadow mb-4" style="width: 610px; height:450px;">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">이슈 현황</h6>
			</div>
	        <div class="card-body">
	           <div id="chart2"  style="width: 550px; height:350px;"></div>
	        </div>
	    </div>
    </div>
   
    
<script>
	
	Highcharts.chart('chart1', {
	    chart: {
	        plotBackgroundColor: null,
	        plotBorderWidth: null,
	        plotShadow: false,
	        type: 'pie'
	    },
	    title: {text: null},
	    tooltip: {pointFormat: '{series.name}: <b> {point.y}개</b>'},
	    accessibility: {
	        point: {valueSuffix: '개'}
	    },
	    plotOptions: {
	        pie: {
	            allowPointSelect: true,
	            cursor: 'pointer',
	            dataLabels: {enabled: true,format: '<b>{point.y}개'}}
	    	},
	        series: 
	        [{
	           name: '',
	           colorByPoint: true,
	           colors: ['#bce79f', '#a2c4c9', '#ecb67f', '#ea9999'],
	           data: 
	          [<c:forEach items="${ewchart}" var="dto">
              {name: '${dto.ewstate}',y: ${dto.ewcnt}},
	          </c:forEach>]}
	        ]	
		}
	);
	
	
	Highcharts.chart('chart2', {
	    chart: {
	        plotBackgroundColor: null,
	        plotBorderWidth: null,
	        plotShadow: false,
	        type: 'pie'
	    },
	    title: {text: null},
	    tooltip: {pointFormat: '{series.name}: <b> {point.y}개</b>'},
	    accessibility: {
	        point: {valueSuffix: '개'}
	    },
	    plotOptions: {
	        pie: {
	            allowPointSelect: true,
	            cursor: 'pointer',
	            dataLabels: {enabled: true,format: '<b>{point.y}개'}}
	    	},
	        series: 
	        [{
	           name: '',
	           colorByPoint: true,
	           colors: ['#d9d2e9', '#d9ead3', '#fff2cc'],
	           data: 
	          [<c:forEach items="${iwchart}" var="dto">
              {name: '${dto.istate}',y: ${dto.icnt}},
	          </c:forEach>]}
	        ]
	});
    
</script>    
	