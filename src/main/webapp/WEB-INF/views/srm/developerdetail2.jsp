<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>

<head>
    <%@ include file="/WEB-INF/views/common/head.jsp" %>
    <style>
    	:root {
          --line-fill: #87cd36;
           --line-empty: #e0e0e0;
           --now-fill: #F40730;
      }
       .container {
           text-align: center;
      }
      
       
       .circle {
            margin-left : 25px;
           background-color: #fff;
           color: #999;
           height: 40px;
           width: 150px;
           font-size : 20px;
           line-height : 40px;
           border: 3px solid var(--line-empty);
           transition: 0.4s ease;
           border-radius: 10px;
      }
      .bar {
           margin-left : 93px;
           padding : 0px;
           margin: 2px 0
           background-color: #fff;
           color: #999;
           height: 10px;
           width: 10px;
           align-items: center;
           justify-content: center;
           border: 3px solid var(--line-empty);
           transition: 0.4s ease;
           border-radius: 50%;
      }
      .bar:after{
      	margin-bottom: 5px;
      }
      .circle.done {
           border-color: var(--line-fill);
           color : var(--line-fill);
      }
      
      .circle.now {
         border-color : var(--line-fill);
         color : white;
         background-color : var(--line-fill);
      }
      
      .bar.active {
           border-color: var(--line-fill);
      }
	 .css-e23nfx{
	    display: flex;
	    width: 100%;
	    padding: 20px 0px;
	    border-bottom: 1px solid #A7ABB0;
	    border-top: 2px solid #A7ABB0;
	 
	 }
	 .css-e23nfx-a{
		display: flex;
	    width: 100%;
	    padding: 20px 0px;
	    border-bottom: 1px solid RGB(79 117 35);
	    border-top: 2px solid RGB(79 117 35);
	 	
	 }
	 
	 .table-menu{
	    text-align: center;
	    line-height: 20px;
	    font-weight: 400;
	    color: rgb(51, 51, 51);
	    padding-left: 20px;
	    font-weight: bold;
	 }
	 .table-row{
	     display: flex;
   		 flex-direction: row;
   		 border-bottom: 1px solid #dee2e6;
	 }
	 .table-content{
        text-align: center;
    	color: rgb(76, 76, 76);
	 }
	 .table-vertical{
	 	padding-bottom: 25px; 
	 	padding-top: 25px;
	 }
    </style>
</head>

<body id="page-top">
	<script>
		function checkDateToDevelope(){
			console.log('버튼 클릭');
		}
	</script>
    <!-- Page Wrapper -->
    <div id="wrapper">
		
        <!-- Sidebar -->
        <%@ include file="/WEB-INF/views/common/sidebar.jsp" %>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
                <%@ include file="/WEB-INF/views/common/topbar.jsp" %>
                <!-- End of Topbar -->

                <!-- 여기에 내용 담기 start -->
                <div class="container-fluid">
                	 <div id="main">
						<div class="row">
							<!-- 게시글 상세보기 start -->
							<div class="col-9">
								<div class="card card-block sameheight-item">
									<h3 class="title-block font-weight-bold">						
										 요청 정보
									</h3>
									<div class="row mt-3">
										<div class="col-2 font-weight-bold">요청자 :</div>
										<div class="col-4">${request.clientName}</div>
										<div class="col-2 font-weight-bold">소속 기관 :</div>
										<div class="col-4">${request.organ}</div>
									</div>
									<hr/>
									<div class="row">
										<div class="col-2 font-weight-bold">요청일 :</div>
										<div class="col-4"><fmt:formatDate value="${request.reqDate}" pattern="yyyy-MM-dd"/></div>
										<div class="col-2 font-weight-bold">완료 희망일 :</div>
										<div class="col-4"><fmt:formatDate value="${request.reqExpectDate}" pattern="yyyy-MM-dd"/></div>
									</div>
									<hr/>
									<div class="row">
										<div class="col-2 font-weight-bold">시스템 :</div>
										<div class="col-10">${request.systemName}</div>
									</div>
									<hr/>
									<div class="row">
										<div class="col-2 font-weight-bold">요청 유형 :</div>
										<div class="col-4">
											<c:if test="${requestProcess.reqType eq '정규'}">
												<div>정규<i class="far fa-registered text-secondary"></i></div>
											</c:if>
											<c:if test="${requestProcess.reqType eq '긴급'}">
												<div>긴급<i class="fas fa-exclamation-triangle text-secondary"></i></div>
											</c:if>
										</div>
										<div class="col-2 font-weight-bold">중요도 :</div>
										<div class="col-4">
											<c:if test="${requestProcess.priority eq '하' || requestProcess.priority eq '중' ||requestProcess.priority eq '상'}">
												<span class="fa fa-star checked" style="color: orange;"></span>
											</c:if>
											<c:if test="${requestProcess.priority eq '중' || requestProcess.priority eq '상'}">
												<span class="fa fa-star checked" style="color: orange;"></span>
											</c:if>
											<c:if test="${requestProcess.priority eq '상'}">
												<span class="fa fa-star checked" style="color: orange;"></span>
											</c:if>
										</div>
									</div>
									<hr/>
									<div class="row">
										<div class="col-2 font-weight-bold">제목 :</div>
										<div class="col-10">${request.reqTitle}</div>
									</div>
									<hr/>
									<div class="row">
										<div class="col-2 font-weight-bold">내용 :</div>
										<div class="col-10 border" style="min-height:100px;">${request.reqContent}</div>
									</div>
									<hr/>
									<div class="row">
										<div class="col-2 font-weight-bold">요청 첨부파일 :</div>
										<div class="col-10">
											<c:forEach var="statusHistoryFile" items="${request.files}">
												<div>
													<span>${statusHistoryFile.fileName}</span>
													<a href="${pageContext.request.contextPath}/filedouwnload/${statusHistoryFile.fno}" role="button">
														<i class="fas fa-cloud-download-alt"></i>
													</a>
												</div>
											</c:forEach>
										</div>
									</div>
									<div class="d-flex justify-content-end">
										<c:if test="${member.mtype =='developer' && (request.statusNo == 2 || request.statusNo == 3)}">
										<button class="btn btn-primary btn-lg mt-3 ml-3" onclick="getDatemodal()" type="button">개발시작</button>
										</c:if>
										<c:if test="${member.mtype =='developer' && request.statusNo == 4}">
										<button class="btn btn-info btn-lg mt-3" onclick="devEnd()">개발 완료</button>
										</c:if>
									</div>
								</div>
								<!-- 개발자의 개발 요청 글 작성 start-->
								<c:if test="${member.mtype =='developer' && request.statusNo == 4}">
								<div class="card mt-3 mb-3">
									<div class="card-header">작성하기</div>
									<div class="card-body row">
										<div class="col-3 d-flex align-items-center" style="text-align:center;">
											<div>
												<img class="rounded-circle ml-3" src="${pageContext.request.contextPath}/resources/img/hoon.png" width="70%">
												<div class="mt-3">${member.mname}</div>
											</div>
										</div>
										<div class="col-9">
											<form role="form" id="writeform" action="${pageContext.request.contextPath}/devdone" method="POST" enctype="multipart/form-data">
												<input type="hidden" name="rno" value="${request.rno}">
												<div class="col-12 form-group">
													<label class="control-label" >완료예정일</label>
													<input type="text" class="form-control boxed" value="<fmt:formatDate value="${requestProcess.devExpectDate}" pattern="yyyy-MM-dd"/>" readonly>
												</div>
												<div class="col-12 form-group">
													<label class="control-label">개발내용</label>
													<textarea rows="2" class="form-control boxed" name="reply"></textarea>
												</div>
												<div class="col-12 form-group">
													<label class="control-label">배포소스</label>
													<input type="text" class="form-control boxed" name="distSource">
												</div>
												<div class="filebox">
													<label for="files">Choose a file</label>
													<input type="file" id="files" name="files" multiple>
												</div>
											</form>
										</div>
									</div>
								</div>
								</c:if>
								<!-- 개발자의 개발 요청 글 작성 end-->
								<div class="card card-block sameheight-item mt-3">
									<h3 class="title-block font-weight-bold">						
										 PM 검토 정보
									</h3>
									<c:forEach var="statusHistory" items="${pmToAllHistories}">
										<div class="row">
											<div class="col-2 font-weight-bold">PM :</div>
											<div class="col-4">${requestProcess.pm}</div>
											<div class="col-2 font-weight-bold">접수 일자 :</div>
											<div class="col-4"><fmt:formatDate value="${statusHistory.changeDate}" pattern="yyyy-MM-dd"/></div>
										</div>
										<hr/>
										<div class="row">
											<div class="col-2 font-weight-bold">검토 의견 :</div>
											<div class="col-10 border" style="min-height:100px;">${statusHistory.reply}</div>
										</div>
										<hr/>
										<div class="row">
											<div class="col-2 font-weight-bold">검토 첨부파일 :</div>
											<div class="col-10">
												<c:forEach var="statusHistoryFile" items="${statusHistory.fileList}">
													<div>
														<span>${statusHistoryFile.fileName}</span>
														<a href="${pageContext.request.contextPath}/filedouwnload/${statusHistoryFile.fno}" role="button">
															<i class="fas fa-cloud-download-alt"></i>
														</a>
													</div>
												</c:forEach>
											</div>
										</div>
									</c:forEach>
								</div>
								<div class="mb-3" >
									
									<!-- 개발***********************start -->
									<div style="background-color: #ffffff;" class="card mt-3">
										
										<h4 class="ml-3 mt-3">개발내용</h4>
										<div class="css-e23nfx-a mt-2">
											<div class="table-menu" style="width: 100px;">개발차수</div>
											<div class="table-menu" style="width: 180px;">작성인</div>
											<div class="table-menu" style="width: 130px;">개발일자</div>
											<div class="table-menu" style="flex-grow:1">개발내용</div>
										</div>
										<ul  style="padding-left: 5px;">
											<c:forEach varStatus="i" var="statusHistory" items="${devToTester}">
												<li style="list-style:none;">
													<div class="table-row">
															<div class="table-content table-vertical" style="width: 100px;">${i.count}차</div>
															<div class="table-content" style="width: 180px;">
																<div>김옥순</div>
															</div>
															<div class="table-content table-vertical" style="width: 130px;"><fmt:formatDate value="${statusHistory.changeDate}" pattern="yyyy-MM-dd"/></div>
															<div href="#dev${i.count}" class="table-vertical btn btn-sm" data-toggle="collapse" style="flex-grow:1">개발내용확인하기</div>
													</div>
													<div id="dev${i.count}" class="collapse " style="opacity: 1; height: auto;">
														<div style="width: 900px; margin-left: 50px;" >
															<div class="row">
																<div class="col-3">배포소스</div>
																<div class="col-9">asdf.java</div>
															</div>
															<div class="row">
																<div class="col-3">첨부파일</div>
																<div class="col-9">asdf.java</div>
															</div>
															<div class="row">
																<div class="col-3">개발내용</div>
																<div class="col-9">aㅁㄴㅇㄻㄴㅇㄻㄴㅇㄻㄴㅇㄹ</div>
															</div>
														</div>
													</div>
												</li>
											</c:forEach>
											
										</ul>
									</div>
									<!-- 개발***********************end -->
									<!-- *********테스트start******** -->
									
									<div style="background-color: #ffffff;" class="card mt-3">
										<h4 class="ml-3 mt-3">테스트 결함 내용</h4>
										<div class="css-e23nfx mt-2">
											<div class="table-menu" style="width: 100px;">결함차수</div>
											<div class="table-menu" style="width: 180px;">작성인</div>
											<div class="table-menu" style="width: 130px;">작성일자</div>
											<div class="table-menu" style="flex-grow:1">결함내용</div>
										</div>
										<ul style="background-color: #ffffff; padding-left: 10px">
											<c:forEach var="statusHistory" varStatus="i" items="${testerToDev}">
												<li style="list-style:none;">
													<div class="table-row">
															<div class="table-content table-vertical" style="width: 100px;">${i.count}차</div>
															<div class="table-content" style="width: 180px;">
																<img class="rounded-circle" src="${pageContext.request.contextPath}/resources/img/hoon.png" width="40%">
																<div>${requestProcess.tester}</div>
															</div>
															<div class="table-content table-vertical" style="width: 130px;"><fmt:formatDate value="${statusHistory.changeDate}" pattern="yyyy-MM-dd"/></div>
															<div href="#test${i.count}" class="table-vertical btn btn-sm" data-toggle="collapse" style="flex-grow:1">내용확인하기</div>
													</div>
													<div id="test${i.count}" class="collapse " style="opacity: 1; height: auto;">
														<div class="d-flex justify-content-center">
															<table class="table table-bordered" style="width: 800px; table-layout: fixed;">
																<tbody >
																	<tr>
																		<td style="text-align: right;" class="font-weight-bold">첨부파일</td>
																		<td>
																			<c:forEach var="statusHistoryFile" items="${statusHistory.fileList}">
																				<span>${statusHistoryFile.fileName}</span>
																				<a href="${pageContext.request.contextPath}/filedouwnload/${statusHistoryFile.fno}" role="button">
																					<i class="fas fa-cloud-download-alt"></i>
																				</a><br>
																			</c:forEach>
																		</td>
																	</tr>
																	<tr>
																		<td style="text-align: right;" class="font-weight-bold">작성내용</td>
																		<td style="word-wrap:break-word;">${statusHistory.reply}</td>
																	</tr>
																</tbody>
															</table>
														</div>
													</div>
												</li>
											</c:forEach>
											
										</ul>
									</div>
									<!-- *********테스트end******** -->
									
								</div>
	
							</div>
							<!-- 게시글 상세보기 end -->
							<!-- 상태 단계 이력 start -->						
							<div class="col-3">
								<div class="card">
									<div class="card-header">
										<h6 class="m-0 font-weight-bold text-primary">단계 상태</h6>
									</div>
									<div class="card-body mx-auto">
								        <%@ include file="/WEB-INF/views/srm/nowstatusvertical.jsp" %>
									
										<div class="mt-4 text-center small"></div>
									</div>
								</div>
							</div>
							<!-- 상태 단계 이력 end -->						
						</div>
					 </div>
                </div>
                <!-- 여기에 내용 담기 end -->

            </div>
            <!-- End of Main Content -->

            <!-- Footer -->
            <%@ include file="/WEB-INF/views/common/footer.jsp" %>
            <!-- End of Footer -->

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>
    
	<!-- date 입력받는 모달창 start -->
	 <div class="modal fade" id="datemodal" role="dialog" aria-labelledby="developDueDate" aria-hidden="true" >
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="developDueDate">개발 완료 예정일 입력</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body d-flex justify-content-center">
					<form id="formUpdateExpectDate" action="${pageContext.request.contextPath}/devinprogress" method="POST">
						<label class="mt-1" style="color: #343a40;" for="developExpectDate">개발 완료 예정일</label>
						<input type="date" class="form-control ml-2" id="developExpectDate" name="developExpectDate" style="width: 200px; display: inline;">
						<input type="hidden" name="rno" value="${request.rno}">
						<input type="hidden" name="receiptDoneDate" value="<fmt:formatDate value='${receiptDoneDate}' pattern='yyyy-MM-dd'/>">
					</form>
				</div>
				<div class="modal-footer">
					<small id="noInputDate" style="color : red;"></small>
					<button class="btn btn-secondary" type="button" data-dismiss="modal">취소</button>
                    <a class="btn btn-primary" onclick="checkDate()">확인</a>
				</div>
			</div>
		</div>
	</div>
	
	<!-- date 입력받는 모달창 end -->
		
	<!-- 경고 모달창 (50% 이상일 경우)-->
	<div class="modal fade" id="alartDateTooMuch" aria-hidden="true" aria-labelledby="alartOfTimeTooMuch">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<i class="fa fa-exclamation-circle mr-2" aria-hidden="true" style="font-size: 25px; color: red;"></i>
					<h5>경고</h5>
					<button class="close" type="button" data-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<p id="pContent"></p>
				</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button" data-dismiss="modal">취소</button>
                    <a class="btn btn-primary" onclick="getconfirm()" type="button">확인</a>
				</div>
			</div>
		</div>
	</div>
	<!-- 경고 모달창 (50% 이상일 경우) -->
	<!-- 데이트 입력 확인 -->
	<div class="modal fade" id="completeDueDate" aria-hidden="true" aria-labelledby="successOfDueDate">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5>확인</h5>
					<button class="close" type="button" data-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body" style="display: flex; justify-content: center;">
					<p>입력되었습니다.</p>
				</div>
				<div class="modal-footer" style="justify-content: center;">
                    <a class="btn btn-primary" data-dismiss="modal" type="button">확인</a>
				</div>
			</div>
		</div>
	</div>
	<script>
	<!-- 데이트 입력 확인 /-->
	function getDatemodal(){
		$('#datemodal').modal('show');
		
	}
	function checkDate(){
		$('#noInputDate').text("");
		
		if($('#developExpectDate').val() == ""){
			$('#noInputDate').text("날짜를 입력해주세요.");
			return;
		}
		
		
		let today = new Date().getTime();   
		var developExpectDate = new Date($('#developExpectDate').val()).getTime();
		var reqExpectDate = new Date($('#reqExpectDate').text()).getTime();
		var receiptDoneDate = new Date($('input[name="receiptDoneDate"]').val()).getTime();
		console.log(receiptDoneDate);
		
		//오늘보다 이전 날짜를 입력할 경우
		if(today > developExpectDate){
			$('#noInputDate').text("현재보다 앞선 날짜를 입력해주세요.");
			return;
		}
		//총완료예정일보다 큰 일정을 입력할 경우
		if(reqExpectDate <= developExpectDate){
			$('#noInputDate').text("완료예정일보다 과거여야 합니다.");
			return;
		}
		if(((developExpectDate-receiptDoneDate)/(reqExpectDate-receiptDoneDate))>=0.5){
			$('#pContent').text('');
			$('#pContent').text('입력 시간이 완료 예정일 대비 50% 이상 차지합니다. 확인을 누르시면 수정이 불가능합니다.');
			$('#alartDateTooMuch').modal('show');
		} else{
			$('#pContent').text('');
			$('#pContent').text('입력하시겠습니까?. 확인을 누르시면 수정이 불가능합니다.');
			$('#alartDateTooMuch').modal('show');
		}
		
	}
	function getconfirm(){
		$('#alartDateTooMuch').modal('hide');
		//컨트롤러로 값 전달하기
		$('#formUpdateExpectDate').submit();
		
		$('#completeDueDate').modal('show');
	}
	function devEnd(){
		$('#writeform').submit();
	}
	
	function getDevContent(index){
		var content = "#" + index;
		$(content).toggle();
	}
	
	</script>
</body>

</html>