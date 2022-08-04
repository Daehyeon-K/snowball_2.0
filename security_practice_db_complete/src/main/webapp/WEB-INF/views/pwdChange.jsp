<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scaleable=0, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Co-Mapping - Login</title> <!-- 이거 페이지마다 다르게 하려면? -->
            <style>
		        .content{
		            display: inline-block;
		            position: fixed;
		            width: 35%;
		            height: 45%;
		            border: 2px solid black;
		            top: 50%;
		            left: 50%;
		            transform: translate(-50%, -50%);
		            background-color: #fff;
		            border-radius: 20px;
		        }
			</style>

        <link rel="stylesheet" type="text/css" href="/resources/css2/style.css" />
        <link href="/resources/css/styles.css" rel="stylesheet" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    </head>
    <body>
    <script type="module" src="/resources/js/app.js"></script>
	  <div class="content">
        <div id="layoutAuthentication">
            <div id="layoutAuthentication_content">
                <main>
                        <div class="row justify-content-center">
                            <div class="col-lg-5">
                                <div class="card shadow-lg border-0 rounded-lg mt-5">
                                    <div class="card-header"><h3 class="text-center font-weight-light my-4"><a href="/" style="text-decoration: none;color: black">Comapping</a></h3></div>
                                    <div class="card-body">
                                        <form:form method="post" class="form-signin" modelAttribute="change">
                                            <div class="form-floating mb-3">
                                            	<!-- <input type="password" id="mem_pwd" name="mem_pwd" class="form-control" placeholder="현재 비밀번호를 입력하세요" required autofocus/> -->
                                            	<form:input path="mem_pwd" type="password" id="mem_pwd" name="mem_pwd" class="form-control" placeholder="현재 비밀번호를 입력하세요" required="required" autofocus="autofocus"/>
     											<small><form:errors path="mem_pwd" style="color: red"/></small>
                                                <label for="mem_pwd">현재 비밀번호</label>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <!-- <input type="password" id="new_mem_pwd" name="new_mem_pwd" class="form-control" placeholder="새 비밀번호를 입력하세요" required/> -->
                                                <form:input path="new_mem_pwd" type="password" id="new_mem_pwd" name="new_mem_pwd" class="form-control" placeholder="새 비밀번호를 입력하세요" required="required"/>
     											<small><form:errors path="new_mem_pwd" style="color: red"/></small>   
                                                <label for="new_password">새 비밀번호</label>
                                            </div>
                         					<div class="form-floating mb-3">
                                                <!-- <input type="password" id="cur_new_mem_pwd" name="cur_new_mem_pwd" class="form-control" placeholder="새 비밀번호를 다시 입력하세요" required/> --> 
                                                <form:input path="cur_new_mem_pwd" type="password" id="cur_new_mem_pwd" name="cur_new_mem_pwd" class="form-control" placeholder="새 비밀번호를 다시 입력하세요" required="required"/>
     											<small><form:errors path="cur_new_mem_pwd" style="color: red"/></small>    
                                                <label for="cur_new_mem_pwd">새 비밀번호 확인</label>
                                            </div>
                                            <form:input path="mem_id" type="hidden" id="mem_id" name="mem_id" class="form-control" value=""/>
                                            <div class="d-flex align-items-center justify-content-between mt-4 mb-0">
                                                <button class="btn btn-lg btn-primary btn-block" type="submit" >변경하기</button>
                                            </div>
											<div class="error-message">
												<span>${loginError}</span>
											</div>
                                            <input type="hidden" name="${_csrf.parameterName}"  value="${_csrf.token}"/>
                                        </form:form>
                                    </div>
                                </div>
                            </div>
                        </div>
                </main>
  			   </div>          
            </div>
          </div>  
          <script>
          	$(function(){ $('input[name=mem_id]').attr('value',<sec:authentication property="principal.user.mem_id"/>); })
          </script>
		</body>
</html>