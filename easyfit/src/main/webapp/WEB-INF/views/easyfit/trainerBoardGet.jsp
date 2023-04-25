<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<sec:authorize access="hasRole('ROLE_ADMIN')"><%@ include file="../includes/adminHeader.jsp" %></sec:authorize>
<sec:authorize access="hasRole('ROLE_MANAGER')"><%@ include file="../includes/header.jsp" %></sec:authorize>  

<div class="card-body shadow bg-light container">
	<!-- 페이지 이름 -->
	<div class="col-lg-12 py-4 d-inline-block ">
		<div class="panel-heading col-lg-9 align-items-center justify-content-start mb-4 d-inline-block"> 
			<h1 class="h3 mb-0 text-gray-800">트레이너 게시판</h1>
		</div>
			<div>
				<div class="form-group mt-3" style="display:flex; align-items: baseline;">
					<label class="form-label h5 mr-3">글 번 호 :</label>
					<input class="box2 width-25" type="number" name="tbno" value="${trainerboard.tbno}" disabled />	
				</div>
				<div class="form-group mt-3">
					<label class="form-label h5 mr-3">타 이 틀 :</label>
					<input class="box2 width-25" type="text" name="tbtitle" value="${trainerboard.tbtitle}"  disabled /><br>
				</div>
				<div class="form-group mt-3">
					<label class="form-label h5 mr-3">작성일자 :</label>
					<input class="box2 width-25" type="text" name="tbdate" value='<fmt:formatDate pattern="yyyy-MM-dd" value="${trainerboard.tbdate}"/>' disabled/><br />
				</div>
				<div class="form-group mt-3">
					<label class="form-label h5 mr-3">수정일자 :</label>
					<input class="box2 width-25" type="text" name="tbdate" value='<fmt:formatDate pattern="yyyy-MM-dd" value="${trainerboard.tbupdatedate}"/>' disabled/><br />
				</div>
				<div class="form-group mt-3">
					<label class="form-label h5 mr-3">작 성 자 :</label>
					<input class="box2 width-25" type="text" name="tname" value="${trainerboard.tname}" disabled /> <br>	
				</div>
				<div class="form-group mt-3">
					<label class="form-label h5 mr-3">공지내용 : </label> <br>
					<textarea class="form-control z-depth-1" name="tbcontent" rows="10" cols="100" disabled><c:out value="${trainerboard.tbcontent}"/></textarea> <br>
				</div>
			</div>
			<div class="float-right">
				<!-- 수정, 삭제, 목록 버튼 -->
				 <sec:authentication property="principal" var="principal"/>
       				<sec:authorize access="isAuthenticated()">
			        	<c:if test="${principal.username eq trainerboard.tid}">
							<button type="button" class="btn btn-info custom-select-sm mb-4" onclick="location.href = '/easyfit/trainerBoardModify?tbno=${trainerboard.tbno}'">수정·삭제</button>
			        	</c:if>
					</sec:authorize>
				<button type="button" class="btn btn btn-secondary custom-select-sm mb-4" onclick="location.href = '/easyfit/trainerBoardList?tbno=${trainerboard.tbno}'">목록으로</button>
			</div>
			
		</div>
			<div class='row'>			
			  <div class="col-lg-12">			
			    <!-- /.panel -->
				    <div class="panel panel-default">			      
				      <div class="panel-heading">
				        <i class="fa fa-comments fa-fw"></i> 댓글
				       	<button id='addReplyBtn' class='btn btn btn-primary custom-select-sm mb-4'>댓글 등록</button>
				      </div>   
				      
				      <!-- /.panel-heading -->
				      <div class="panel-body"> 
				        <ul class="chat">
				        </ul>
				        <!-- ./ end ul -->
				      </div>
				      <!-- /.panel .chat-panel -->
					<div class="panel-footer"></div>
				</div>
			  </div>
			  <!-- ./ end row -->
			</div>  
	</div>
	
	
	
		
		
		<!-- modal ------------------------------------------------------------------>
	      <div class="modal fade" id="myModal" tabindex="-1" role="dialog"
	        aria-labelledby="myModalLabel" aria-hidden="true">
	        <div class="modal-dialog">
	          <div class="modal-content">
	            <div class="modal-header">
	              <button type="button" class="close" data-dismiss="modal"
	                aria-hidden="true">&times;</button>
	              <h4 class="modal-title" id="myModalLabel">REPLY MODAL</h4>
	            </div>
	            <div class="modal-body">
	              <div class="form-group">
	                <label>댓글 내용</label> 
	                <input class="form-control" id='rcontent' name='rcontent' value='New Reply!!!!'>
	              </div>      
	              <div class="form-group">
	                <label>작성자</label> 
	                <input type="hidden" class="form-control" id="tno" name="tno" value="<sec:authentication property="principal.trainerVO.tno"/>" disabled>
	                <input class="form-control" id='tname' name='tname' value="<sec:authentication property="principal.trainerVO.tname"/>" disabled>
	              </div>
	              <div class="form-group">
	                <label>작성 날짜</label> 
	                <input class="form-control" name='rdate' value='2018-01-01 13:13'>
	              </div>
	              
	              <div class="form-group">
  		            <label>작성자</label> 
	                <input type="text" class="form-control" id="tid" name="tid" value="<sec:authentication property="principal.trainerVO.tid"/>" disabled>
	              </div>
	      
	            </div>
				<div class="modal-footer">
				

				        <button id='modalModBtn' type="button" class="btn btn-warning">Modify수정</button>
				        <button id='modalRemoveBtn' type="button" class="btn btn-danger">Remove삭제</button>

							
			        <button id='modalRegisterBtn' type="button" class="btn btn-primary">Register</button>
			        <button id='modalCloseBtn' type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			      </div>          </div>
			          <!-- /.modal-content -->
			        </div>
			        <!-- /.modal-dialog -->
			      </div>
			<!-- /.modal -->
            
            <script type="text/javascript" src="/resources/js/reply.js"></script>
            

            <script>
            $(document).ready(function(){
            	
            	var csrfHeaderName ="${_csrf.headerName}"; 
            	var csrfTokenValue="${_csrf.token}";        
            	
            	$(document).ajaxSend(function(e, xhr, options) { 
            		xhr.setRequestHeader(csrfHeaderName, csrfTokenValue); 
            	}); 
            	
            	var tbnoValue = '<c:out value="${trainerboard.tbno}"/>'; //부모글번호            	
            
            	var replyUL = $(".chat");
            	console.log(showList);
            	showList(1);
            	    
            	/* 댓글목록출력 with paging **********************************************************************/
            	function showList(page){            	    	
            	    	console.log("show list " + page);            	        
            	        replyService.getList({tbno:tbnoValue,page: page|| 1 }, function(replyCnt, list) {
					
            	        if(page == -1){
            	          pageNum = Math.ceil(replyCnt/10.0);
            	          showList(pageNum);
            	          return;
            	        }
            	          
            	         var str="";
            	         
            	         if(list == null || list.length == 0){
            	           return;
            	         }
            	         
            	         for (var i = 0, len = list.length || 0; i < len; i++) {
            	           str +="<li class='left clearfix' style='cursor:pointer' data-rno='"+list[i].rno+"'>";
            	           str +="  <div><div class='header'><strong class='primary-font'>["
            	        	   +list[i].rno+"] "+list[i].tname+"</strong>"; 
            	           str +="    <small class='pull-right text-muted'>"
            	               +replyService.displayTime(list[i].rdate)+"</small></div>";
            	           str +="    <p>"+list[i].rcontent+"</p></div>";
            	           str +="	<p>"+list[i].tid+"</p></li>";
            	         }
            	         
            	         replyUL.html(str);
            	         showReplyPage(replyCnt);
            	     
            	       });//end function            	         
            	     }
            	     /* showList.끝 */
            	    
            	     
            	    /* 페이지번호 출력 ****************************************************************************/ 
            	    var pageNum = 1;
            	    var replyPageFooter = $(".panel-footer");
            	  
            	    function showReplyPage(replyCnt){
            	   
            	      var endNum = Math.ceil(pageNum / 5.0) * 5;  
            	      console.log(endNum);
            	      var startNum = endNum - 4; 
            	      var prev = startNum != 1;
            	      var next = false;
            	      
            	      if(endNum * 5 >= replyCnt){
            	        endNum = Math.ceil(replyCnt/5.0);
            	      }
            	      
            	      if(endNum * 5 < replyCnt){
            	        next = true;
            	      }
            	      
            	      var str = "<ul class='pagination pull-right justify-content-center'>";
            	      
            	      if(prev){
            	        str+= "<li class='page-item'><a class='page-link' href='"+(startNum -1)+"'>Previous</a></li>";
            	      }
            	      
            	       
            	      
            	      for(var i = startNum ; i <= endNum; i++){
            	        
            	        var active = pageNum == i? "active":"";
            	        
            	        str+= "<li class='page-item "+active+" '><a class='page-link' href='"+i+"'>"+i+"</a></li>";
            	      }
            	      
            	      if(next){
            	        str+= "<li class='page-item'><a class='page-link' href='"+(endNum + 1)+"'>Next</a></li>";
            	      }
            	      
            	      str += "</ul></div>";
            	      
            	      console.log(str);
            	      
            	      replyPageFooter.html(str);
            	    }
            	    /* 페이지번호출력.끝 */ 
            	 		replyPageFooter.on("click","li a", function(e){
            	        e.preventDefault();
            	        console.log("page click");            	        
            	        var targetPageNum = $(this).attr("href");            	        
            	        console.log("targetPageNum: " + targetPageNum);            	        
            	        pageNum = targetPageNum;
            	        
            	        showList(pageNum);
            	      });     
            	
            	
            	/* 이벤트 처리 **************************************************************************************/
                var modal = $(".modal");
                var modalInputReply = modal.find("input[name='rcontent']");
                var modalInputReplyer = modal.find("input[name='tname']");
                var modalInputTno = modal.find("input[name='tno']");
                var modalInputReplyDate = modal.find("input[name='rdate']");
                var modalInputReplyTid = modal.find("input[name='tid']");
                
                var modalModBtn = $("#modalModBtn");
                var modalRemoveBtn = $("#modalRemoveBtn");
                var modalRegisterBtn = $("#modalRegisterBtn");           	
            	
            	
            	$("#addReplyBtn").on("click", function(e){
            		
            		
            	      modal.find("input[name='rcontent']").val("");
            	      modalInputReplyDate.closest("div").hide();
            	      modal.find("button[id !='modalCloseBtn']").hide();
            	      
            	      modalRegisterBtn.show();
            	      
            	      $(".modal").modal("show");
            	      
            	    });
            	 modalRegisterBtn.on("click",function(e){
            	        
            		 	if ($('#rcontent').val() === '') {
            		        alert('댓글 내용을 입력해주세요.');
            		        return false;
            		    }
            		 
            	        var rcontent = {
            	              rcontent: modalInputReply.val(),
            	              tname:modalInputReplyer.val(),
            	              tbno:tbnoValue,
            	              tno: modalInputTno.val()
            	            };
            	        
            	 /*    	$.ajax({
            				type : 'post',
            				url : '/replies/new',
            				data : JSON.stringify(reply),
            				contentType : "application/json; charset=utf-8",
            				success : function(result, status, xhr) {
            				  alert(result);
                  	          
                  	          modal.find("input").val("");
                  	          modal.modal("hide");                  	          
            				}
            			});   */          	        
            	        
            	        replyService.add(rcontent, function(result){            	          
            	          alert(result);            	          
            	          modal.find("input").val("");
            	          modal.modal("hide");
            	          
            	          showList(1);
            	          //showList(-1);
            	        }); 
            	   }); 
            	 
            	   

            	  //댓글 조회 클릭 이벤트 처리 
            	    $(".chat").on("click", "li", function(e){            	      
            	      var rno = $(this).data("rno");
            	      
            	      replyService.get(rno, function(reply){            	      
            	        modalInputReply.val(reply.rcontent);
            	        modalInputReplyer.val(reply.tname).attr("readonly","readonly");
            	        modalInputReplyDate.val(replyService.displayTime( reply.rdate))
            	        .attr("readonly","readonly");
            	        modalInputReplyTid.val(reply.tid);
            	        
            	        
            	     /*    
            	        
            	        <sec:authentication property="principal.trainerVO.tid"/>
            	        
       				 <sec:authentication property="principal" var="principal"/>
            				<sec:authorize access="isAuthenticated()">
            				 */
            				//var pusername = ${principal.username};
            				var pusername = '<sec:authentication property="principal.trainerVO.tid"/>'
            				console.log(pusername);
            				console.log(reply.tid);
     				//	</sec:authorize>
     					
            	         	
     					 	if(pusername != reply.tid){
     							$("#modalRemoveBtn").hide();
     							$("#modalModBtn").hide();
     							$("#modalRegisterBtn").hide();
     						} 
     				 		
     						if(pusername == reply.tid){
     							modalModBtn.show();
     							modalRemoveBtn.show();
     							
         						} 
     						
     						
            	        
            	         
            	        
            	  /*       
            	        
     			        	<c:if test="${principal.username eq reply.tid}">
     						
     			        	</c:if>
            	        
            	        
            	         */
            	        
            	        
            	        
            	        
            	        
            	        
            	        
            	        
            	        
            	        
            	        
            	        
            	        modal.data("rno", reply.rno);// 모달창에 data-rno생성. 값저장
            	        
            	        
            	        //modal.find("button[id !='modalCloseBtn']").hide();

            	        
            	        $(".modal").modal("show");
            	            
            	      });
            	    });
            	    //댓글수정
            	    modalModBtn.on("click", function(e){
            	    	  
            	    	if ($('#rcontent').val() === '') {
            		        alert('댓글 내용을 입력해주세요.');
            		        return false;
            		    }
            	    	/* 
            	    	  var originalReplyer = modalInputTno.val();
            	   	  
            	   	      console.log("Original Replyer: " + originalReplyer);
            	   	  
            	   	  	  if($(tname)  != originalReplyer){
            	   		  
            	   		  alert("자신이 작성한 댓글만 수정이 가능합니다.");
            	   		  modal.modal("hide");
            	   		  return;
            	   		  
            	   	    } */
            	     	  var reply = {rno:modal.data("rno"), rcontent: modalInputReply.val()};
            	     	  
            	     	  replyService.update(reply, function(result){
            	     	        
            	     	    alert(result);
            	     	    modal.modal("hide");
            	     	    showList(pageNum);
            	     	    
            	     	  });
            	     	  
            	     	});
            	    
					//댓글삭제
					 modalRemoveBtn.on("click", function (e){
				   	  
				   	  var rno = modal.data("rno");
					   	/*  var originalReplyer = modalInputTno.val();
	           	   	  
	       	   	      console.log("Original Replyer: " + originalReplyer);
	       	   	  
	       	   	  	  if($(tname)  != originalReplyer){
	       	   		  
	       	   		  alert("자신이 작성한 댓글만 삭제가 가능합니다.");
	       	   		  modal.modal("hide");
	       	   		  return;
	       	   		  
	       	   	    } */
				   	  replyService.remove(rno, function(result){
				   	        
				   	      alert(result);
				   	      modal.modal("hide");
				   	      showList(pageNum);
				   	      
				   	  });
				   	  
				   	});
            	 
            	 /* 이벤트처리.끝 */
        	}); 
        </script>    
</body>
</html>


<%@ include file="../includes/footer.jsp" %>