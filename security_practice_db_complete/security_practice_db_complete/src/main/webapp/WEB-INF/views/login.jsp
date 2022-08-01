<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
/* 		            width: 20%;
		            height: 30%; */
		            border: 1px solid black;
		            top: 50%;
		            left: 50%;
		            transform: translate(-50%, -50%);
		            background-color: #fff;
		            border-radius: 20px;
		            /* opacity: 0.5; */
		        }
		        
/* 		        div{
		        	border: 2px solid #000;
		        } */
		        
		        @media all and(max-width: 960px){
						.content{
							width: 700px;
							background-color: dodgerblue;
					    }
				}
					
/* 					@media all and(max-width: 480px){
						.content{
							width: 300px;
							height: 400px;
					    }
					} */
		        
		        
			</style>

        <link rel="stylesheet" type="text/css" href="/resources/css2/style.css" />
        <link href="/resources/css/styles.css" rel="stylesheet" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
    </head>
    <body>
    <script type="module" src="/resources/js/app.js"></script>
    
    
    <!-- <div class="content">
    	<div class="w-auto h-25">
    		<div class="card-header">Co-Mapping</div>
    	</div>
    	<div class="w-auto h-25">
    		<div class="card-body">
    			<form action="/login" method="post" class="form-signin">
    				<div class="form-group h-25">
                    	<input type="text" id="username" name="username" class="form-control" placeholder="아이디를 입력해 주세요" required autofocus/>
                        <label for="username">아이디</label>
                    </div>
                    <div class="form-group h-25">
                        <input type="password" id="password" name="password" class="form-control" placeholder="비밀번호를 입력해 주세요" required/>   
                        <label for="password">비밀번호</label>
                    </div>
                    <div class="form-group">
                        <button class="btn btn-lg btn-block" style="background-color: dodgerblue; color: white; border-color: dodgerblue;" 
                        type="submit" >로그인</button>
                    </div>
    			</form>
    		</div>
    	</div>
    </div> -->
   
	  <div class="row content">
	 	 
	  	<div class="h-100">
        <div id="layoutAuthentication" class="h-100">
            <div id="layoutAuthentication_content" class="h-100" >
                        <div class="h-100 justify-content-center"> 
                                    <!-- <div class="card-header mt-3" style="background: #BDE8F5;border-radius: 20px;opacity: 80%;">
                                    <i class="fa fa-user fa-2x"></i>
									<h3 class="text-center font-weight-light my-2 justify-items-center">Co-Mapping</h3>
									</div> -->
									<div class="row card-header mt-3">
										<div class="col-xs-3">
											<i class="fa fa-user fa-3x" style="color:dodgerblue;"></i>
											<div class="mt-2" style="float:right;font-size: 1.5rem;"><a href="/" style="text-decoration: none;color: black">Comapping</a></div>
										</div>
									</div>
									
									
                                    <div class="card-body">
                                        <form action="/login" method="post" class="form-signin">
                                            <div class="form-floating mb-3">
                                            	<input type="text" id="username" name="username" class="form-control" placeholder="아이디를 입력해 주세요" required autofocus/>
                                                <label for="username">아이디</label>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <input type="password" id="password" name="password" class="form-control" placeholder="비밀번호를 입력해 주세요" required/>   
                                                <label for="password">비밀번호</label>
                                            </div>
                          
                                            <div class="col text-center">
                                                <button class="btn btn-lg btn-block" style="background-color: dodgerblue; color: white; border-color: dodgerblue;" 
                                                type="submit" >로그인</button>
                                            </div>
                                            <input type="hidden" name="${_csrf.parameterName}"  value="${_csrf.token}"/>
											<div class="error-message">
												<span>${loginError}</span>
											</div>
                                        </form>
                                    </div>
                        </div>
  			   </div>          
            </div>
            </div>
         </div>
           
		</body>
</html>