<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- loginok.jsp -->

<div class="container">

	<!-- Outer Row -->
    <div class="row justify-content-center" >
    	<div class="col-xl-10 col-lg-12 col-md-9">
            <div class="card o-hidden border-0 shadow-lg my-5">
                <div class="card-body p-0" style="margin:auto;">
                    
                <!-- Nested Row within Card Body -->
                    <div class="col-lg-6">
                        <div class="p-5" style="width:500px;">
            	            <div class="text-center">
                				<h1 class="h4 text-gray-900 mb-4">SY Company</h1>
                            </div>
                                    
                                    
                            <form class="user" method="POST" action="/web/loginok">
                            	<div class="form-group"> <%-- 로그인 아이디--%>
                    	            <input type="text" class="form-control form-control-user" name="email" placeholder="Email Address" required>
                                </div>
                                    
                                <div class="form-group"> <%-- 로그인 비밀번호--%>
                                	<input type="password" class="form-control form-control-user" name="pw" placeholder="Password" required>
                                </div>
                                <button class="btn btn-primary btn-user btn-block">
      								Login
                                </button>
                            </form>
                             
                                   
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
    
    <!-- 개발 완료 후 지우기 -->
    <div style="text-align:center">
      <form method="POST" action="/web/loginok">
         <input type="hidden" name="email" value="admin@sysoft.com">
         <input type="hidden" name="pw" value="admin12345">
         <input type="submit" value="관리자(admin)" class="btn btn-success">
      </form>
      &nbsp;
      <form method="POST" action="/web/loginok">
         <input type="hidden" name="email" value="Aguistin@sysoft.com">
         <input type="hidden" name="pw" value="Aguistin12345">
         <input type="submit" value="신동민(사원)" class="btn btn-success">
      </form>
       &nbsp;
      <form method="POST" action="/web/loginok">
         <input type="hidden" name="email" value="Jedediah@sysoft.com">
         <input type="hidden" name="pw" value="Jedediah12345">
         <input type="submit" value="이한별" class="btn btn-success">
      </form>
   </div>
   

   

  
