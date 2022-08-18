<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- Begin Page Content -->
<div class="container-fluid">
	<!-- 컨텐츠 영역  -->
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary">내 산출물 관리</h6>
		</div>

		<div class="card-body">
			<div class="mb-4">
				<!-- 검색 -->
				<select name="pseq" id="pseq">
					<option value="">프로젝트 선택</option>
					<c:forEach items="${pname}" var="dto">
						<option value="${dto.projectseq}">${dto.name}</option>
					</c:forEach>
				</select>
				<select name="typeseq" id="typeseq">
					<option value="">산출물 종류 선택</option>
					<c:forEach items="${otype}" var="dto">
						<option value="${dto.otypeseq}">${dto.type}</option>
					</c:forEach>
				</select>
				<input type="text" name="searchfile" id="title" placeholder="파일명으로 검색..." />
				<input type="button" value="검색하기" class="btn btn-sm btn-primary" onclick="search();" />
				<input type="button" value="전체목록보기" class="btn btn-sm btn-primary" onclick="location.href='/web/myproject/myoutputlist';" />
				<input type="button" value="산출물 등록하기" class="btn btn-sm btn-primary" onclick="location.href='/web/project/outputadd';" />
			</div>

			<!-- 리스트 출력 -->
			<table id="myworklist" class="table table-hover">
				<thead class="text-center">
					<tr>
						<th>번호</th>
						<th>파일명</th>
						<th>작업</th>
						<th>프로젝트</th>
						<th>유형</th>
						<th>등록일</th>
						<th>다운로드</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="dto">
						<tr>
							<td style="text-align: center;">${dto.num}</td>
							<td>
								<a href="/web/project/outputinfo?fileseq=${dto.fileseq}">${dto.title}</a>
							</td>
							<td>${dto.wname}</td>
							<td>${dto.name}</td>
							<td>${dto.type}</td>
							<td>${dto.regdate}</td>
							<td style="text-align: center;">
								<a href="/web/project/download?title=${dto.title}" title="파일 다운로드">
									<i class="fa fa-download"></i>
								</a>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>

<script>

function search(){
 	let pseq = $('#pseq').val();
 	let typeseq = $('#typeseq').val();
 	let title = $('#title').val();
	
 	$.ajax({
		type: 'GET',
		url: '/web/myproject/myoutputsearch',
		data:'pseq='+ pseq + '&typeseq='+ typeseq + '&title=' + title,
		dataType:'json',
		success: function(result){
			//alert('통신완');
			let temp = "";
			
			if(result.num == 0) {
				
				temp += '<tr><td colspan="7" style="text-align: center;">등록된 산출물이 없습니다.</td></tr>';
				
			} else {
				
				$(result).each(function(index, item){					
					temp += '<tr>';
					temp += '<td style="text-align: center;">' + item.num + '</td>';
					temp += '<td><a href="/web/project/outputinfo?fileseq='+ item.fileseq +'">' + item.title  + '</a></td>';
					temp += '<td>' + item.wname + '</td>';
					temp += '<td>' + item.name  + '</td>';
					temp += '<td>' + item.type + '</td>';
					temp += '<td>' + item.regdate + '</td>';
					temp += '<td style="text-align: center;"><a href="/web/myproject/download?title=' + item.title + '" title="파일 다운로드"><i class="fa fa-download"></i></a></td>';
					temp += '</tr>';
					
				});
			}
			
			$('tbody').html('');
			$('tbody').html(temp);
			
		},
		error: function(a, b, c){
			console.log(a,b,c);
		}
	
 	});
	
	
}//search

</script>