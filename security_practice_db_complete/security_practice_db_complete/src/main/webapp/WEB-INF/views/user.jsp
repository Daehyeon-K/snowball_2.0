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
                                <div class="card mb-4" style="height: 98%;">
                                    <div class="card-header">
                                        <i class="fas fa-chart-area me-1"></i>
                                        쪽지
                                    </div>
                                    <div class="card-body" style="overflow: scroll;display: inline-block; white-space:nowrap;">
                                    
                                     <div style="height:100;" >
                                    	<form action="" method="post" class="msgViewForm">
									      <table class=".table table-striped table-bordered table-hover " style="font-size:1vw; width:100%; height:100%;">
									          <thead>
									          <tr>
										         <th class="text-center col-md-2" scope="col">번호</th> 
										         <th class="text-center col-md-2" scope="col">발신자</th>
										         <th class="text-center col-md-2" scope="col">수신자</th>
										         <th class="text-center col-md-5" scope="col">내용</th>
										         <th class="text-center col-md-1" scope="col"></th>
									          </tr>
									         
									          </thead>
									      <tbody>
									      <c:forEach var="list" items="${mList}">
									          <tr>
									          	<td class="text-center">${list.msg_id}</td>
									            <td class="text-center">${list.sender_id}</td>
									            <td class="text-center">${list.receiver_id}</td>
									            <td class="text-align:left;" id="content-block" style="border:none; padding-left: 0.4vw;padding-top: 0.1vw;">${list.msg_content}</td>
									            <td class="text-center"><button type="button" class="btn btn-primary btn-sm msgView" 
									            onclick="javascript:location.href = '/user/msg/msgRead/?msg_id=${list.msg_id}'" style="width:100%;">보기</button></td>
									          </tr>
									        </c:forEach> 
									        </tbody>
									        </table>
									        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
									        <button type="button" class="btn btn-primary msgBtn" style="margin-top:4px;" onclick="location='/user/msg/msgInsert'">작성</button>
									    </form>
									    
									    <!-- 페이지 나누기 하단 부분 -->
										<div class="text-center">
										  <ul class="pagination">
										     <c:if test="${pageDto.prev}">
										       <li class="paginate_button previous"><a href="${pageDto.startPage-1}">Previous</a></li>
										    </c:if>
										    
										    <!-- 숫자 부분은 루프가 돌아야 하기에 forEach 써주기 -->
										    <c:forEach var="idx" begin="${pageDto.startPage}" end="${pageDto.endPage}">
										         <li class="paginate_button ${pageDto.cri.pageNum == idx?'active':''}"><a href="${idx}">${idx}</a></li>
										    </c:forEach>
										    
										   <c:if test="${pageDto.next}">    
										            <li class="paginate_button next"><a href="${pageDto.endPage+1}">Next</a></li>
										    </c:if> 
										       
										  </ul>
										</div>
										
										<form action="" id="actionForm">
											<input type="hidden" name="pageNum" value="${cri.pageNum}" />
											<input type="hidden" name="amount" value="${cri.amount}" />
											<input type="hidden" name="type" value="${cri.type}" />
											<input type="hidden" name="keyword" value="${cri.keyword}" />
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
											<%-- <input class="form-control" style="width: 15%;" type="text" name="mem_name" value='<sec:authentication property="principal.user.mem_name"/>' readonly="readonly"/>
											<input type="hidden" style="width: 15%;" name="mem_id" value='<sec:authentication property="principal.username"/>' readonly="readonly"/> --%>
											<input class="form-control" style="width: 15%;" type="text" name="mem_name" value="${memoRead.mem_id}" readonly="readonly"/>
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
<script src="/resources/js/list.js"></script>
<%@include file="../views/includes/footer.jsp" %>
</div>

