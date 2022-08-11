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
                       	<div class="card-body">
                       		<c:forEach items="${result}" var="dto">
                           	<nav class="navbar navbar-expand navbar-light bg-light mb-4">
                               	<a class="navbar-brand">${dto}</a>
                            </nav>
                                <p class="mb-0 small">아이디(직급)</p>
                            </c:forEach>  
                        </div>
                    </div>
                </td>
            </tr>
        </table>
      
                
		

