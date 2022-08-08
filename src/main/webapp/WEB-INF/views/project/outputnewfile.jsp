<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="container">
	<div class="text-center mt-5 ">
		<h1>새로운 버전의 파일 등록</h1>
	</div>
	<div class="row">
		<div class="col-lg-8 mx-auto">
			<div class="card mt-2 mx-auto p-4 bg-light">
				<div class="card-body bg-light">
					<div class="container">
						<form name="fileForm" method="POST" action="/web/project/outputnewfileok" enctype="multipart/form-data">
							<div class="controls">
								<div class="row">
									<div class="col-md-6">
										<div class="form-group">
											<label for="form_file">파일 *</label>
											<input id="form_file" type="file" name="title" class="form-control" required="required">
										</div>
									</div>
								</div>

								<div class="row">
									<div class="col-md-12">
										<div class="form-group">
											<label for="form_message">파일 설명</label>
											<textarea id="form_message" name="fileexplain" class="form-control" rows="5"></textarea>
										</div>
									</div>
									
									<div class="col-md-12 d-md-flex justify-content-md-end">
										<input type="submit" class="btn btn-primary mr-1 pt-2" value="저장">
										<input type="button" class="btn btn-primary pt-2" value="취소" onclick="history.back();">
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>