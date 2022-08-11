<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- mypage.jsp -->
	<div>profile</div>
	<div class="d-sm-flex align-items-center justify-content-between mb-4">
		<h1 class="h3 mb-0 text-gray-800">My Page</h1>
	</div>

	<table width ="1000" height="500">
    	<tr>
        	<td width="400">
        		<div class="card shadow mb-4">
               	 	<!-- Card Body -->
                	<div class="card-body">
						<img src="/web/resources/img/undraw_profile.svg">
                	</div>
            	</div>
                        
            </td>
                <td>
                    <div class="card shadow mb-4">         
                       	<div class="card-body" style="height:396px;">
                       		
                           	<nav class="navbar navbar-expand navbar-light bg-light mb-4">
                               	<a class="navbar-brand">${sessionScope.result.ename}</a>
                            </nav>
                                <p class="mb-0 large">${sessionScope.result.email}(${sessionScope.result.position})</p>
                           		<p class="mb-0 large">소속팀 : ${not empty sessionScope.result.tname ? sessionScope.result.tname : "없음" } (${not empty sessionScope.result.role ? sessionScope.result.role : "없음" })</p>
                           		<p class="mb-0 large">프로젝트 : ${not empty sessionScope.result.pjsdate ? sessionScope.result.pjsdate.substring(0,10) : "00"} ~ ${not empty sessionScope.result.pjfdate ? sessionScope.result.pjfdate.substring(0,10) : "00"} ( ${sessionScope.result.pname}  / ${not empty sessionScope.result.pstate ? sessionScope.result.pstate : "없음"} )</p>
                        </div>
                    </div>
                </td>
            </tr>
        </table>
      
                
		

