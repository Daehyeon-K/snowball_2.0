<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scaleable=0, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Co-Mapping - Index</title> <!-- 이거 페이지마다 다르게 하려면? -->
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
		        
/* 		        @media all and(max-width: 960px){
						.content{
							width: 700px;
							background-color: dodgerblue;
					    }
				} */
					
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
 	<div class="content">
        <div id="layoutAuthentication">
            <div id="layoutAuthentication_content">
                <main>
                	<div>
                        <div class="justify-content-center" style="padding: 0.4vw;">
<!--                             <div class="col-lg-5">
                                <div class="card shadow-lg border-0 rounded-lg mt-5"> -->
                                    <div class="row card-header mt-3" style="width:17rem;">
										<div class="col-xs-3">
											<i class="fa fa-user fa-3x" style="color:dodgerblue;"></i>
											<div class="mt-2" style="float:right;font-size: 1.5rem;">Comapping</div>
										</div>
									</div>
                                    <div class="card-body" style="flex:1 1 auto; pading:1rem 1rem;">
                                        <form>
                                            <div class="d-flex">
                                            	<sec:authorize access="!isAuthenticated()">
                                             	   <a class="btn btn-lg btn-block mt-3" style="width:100%; background-color: dodgerblue; color: white; border-color: dodgerblue;" href="/login">로그인하기</a>
                                            	</sec:authorize>
                                            	<sec:authorize access="isAuthenticated()">
                                             	   <a class="btn btn-lg btn-block mt-3" style="width:100%; background-color: dodgerblue; color: white; border-color: dodgerblue;"href="/user/index">메인페이지</a>
                                            	</sec:authorize>
                                            </div>
                                        </form>
                                    </div>

                        </div>
                        </div>
                    </main>   
                     
                 </div>
                 
            </div>
            
            </div>

