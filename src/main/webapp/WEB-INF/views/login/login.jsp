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
                            	<div class="form-group"> 
                    	            <input type="text" class="form-control form-control-user" name="email" placeholder="Email Address" required>
                                </div>
                                    
                                <div class="form-group"> 
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
    