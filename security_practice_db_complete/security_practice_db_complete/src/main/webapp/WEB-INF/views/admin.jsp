<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../views/includes/header.jsp" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4 breadcrumb mb-4 layout-center">
							<input type="text" name="mem_id" value='<sec:authentication property="principal.user.mem_name"/>님 안녕하세요' class="login-name" readonly/>   
						</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">Main Page</li>
                        </ol>
                        <div class="row">
                            <div class="col-xl-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-area me-1"></i>
                                        쪽지
                                    </div>
                                    <div class="card-body">
                                     <div style="overflow:scroll; height:449px; letter-spacing:0; word-spacing:0; " >
                                    	<form action="" method="post" class="msgViewForm">
									      <table class=".table table-striped table-bordered table-hover " style="font-size: 18px">
									          <thead>
									          <tr>
										         <th class="text-center" scope="col">번호</th> 
										         <th class="text-center" scope="col">발신자</th>
										         <th class="text-center" scope="col">수신자</th>
										         <th class="text-center" scope="col">내용</th>
										         <th class="text-center" scope="col"></th>
									          </tr>
									          </thead>
									      <tbody>
									      <c:forEach var="list" items="${mList}">
									          <tr>
									          	<td class="text-center">${list.msg_id}</td>
									            <td class="text-center">${list.sender_id}</td>
									            <td class="text-center">${list.receiver_id}</td>
									            <td class="text-align:left;" id="content-block" style="border:none;">${list.msg_content}</td>
									            <td class="text"><button type="button" class="btn btn-primary btn-sm msgView" 
									            onclick="javascript:location.href = '/user/msg/msgRead/?msg_id=${list.msg_id}'">보기</button></td>
									          </tr>
									        </c:forEach> 
									        </tbody>
									        </table>
									        <button type="button" class="btn btn-primary msgBtn" onclick="location='/user/msg/msgInsert'">작성</button>
									    </form>
									   </div>  
									</div>
                                </div>
                            </div>
                            <div class="col-xl-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-bar me-1"></i>
                                        캘린더
                                    </div>
                                    <div class="card-body">
                                    <div id="calendar"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                메모
                            </div>
                            <div class="card-body">
                              <div class="row">
								  <div class="col-mb-3 memocl">
								 	<form action="" method="post" role="form" id="listForm" >
										<div>	
											<input class="form-control" style="width: 15%;" type="text" name="mem_name" value='<sec:authentication property="principal.user.mem_name"/>' readonly="readonly"/>
											<input type="hidden" style="width: 15%;" name="mem_id" value='<sec:authentication property="principal.username"/>' readonly="readonly"/>
										</div>
										<div class="col-mb-6">
									  <textarea class="form-control" style="resize: none;" rows="7" name="memo_content">${memoRead.memo_content}</textarea>
									  </div>
									  <div class="col-mb-3">
									   <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
								      <button type="submit" class="btn btn-primary" id="memoUpdate">Update</button>
								      </div>
								    </form>
								  </div>
								</div>
                            </div>
                        </div>
                    </div>
                </main>
<%@include file="../views/includes/footer.jsp" %>
</div>