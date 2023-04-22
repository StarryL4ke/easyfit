<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="../includes/header.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>공지사항 - Get</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js" integrity="sha512-pumBsjNRGGqkPzKHndZMaAG+bir374sORyzM3uulLV14lN5LyykqNk8eEeUlUkB3U0M4FApyaHraT65ihJhDpQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>


<script src="/resources/vendor/jquery/jquery.min.js"></script>

<link href="/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet"></script>

<script src="/resources/vendor/bootstrap/js/bootstrap.min.js"></script>





</head>
<body>  
	<h1>트레이너 커뮤니티 게시판입니다</h1>
		



		<label>글번호</label>
		<input type="number" name="tbno" value="${trainerboard.tbno}" disabled />	



		<div>
			</div>

		<label>타이틀</label>
		<input type="text" name="tbtitle" value="${trainerboard.tbtitle}"  disabled /><br>

		<label class="default">공지 내용</label> <br>
		<textarea name="tbcontent" rows="10" cols="100" disabled><c:out value="${trainerboard.tbcontent}"/></textarea> <br>
	
		
		<label>작성일자</label>
		<input type="text" name="tbdate" value='<fmt:formatDate pattern="yyyy-MM-dd" value="${trainerboard.tbdate}"/>' disabled/><br />
		
		<label>수정일자</label>
		<input type="text" name="tbdate" value='<fmt:formatDate pattern="yyyy-MM-dd" value="${trainerboard.tbupdatedate}"/>' disabled/><br />
		
		
		<label>작성자</label>
		<input type="number" name="tno" value="${trainerboard.tno}" disabled /> <br>	
		
		
		<!-- 수정, 삭제 버튼 -->
		<button type="button" class="btn btn-default" onclick="location.href = '/easyfit/trainerBoardModify?tbno=${trainerboard.tbno}'">수정·삭제</button>
		
		<button type="button" class="btn btn-default" onclick="location.href = '/easyfit/trainerBoardList?tbno=${trainerboard.tbno}'">목록으로</button>
	

	
	
	
		<div class='row'>			
		  <div class="col-lg-12">			
		    <!-- /.panel -->
			    <div class="panel panel-default">			      
			      <div class="panel-heading">
			        <i class="fa fa-comments fa-fw"></i> Reply
			        <button id='addReplyBtn' class='btn btn-primary btn-xs pull-right'>New Reply</button>
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
	                <label>Reply</label> 
	                <input class="form-control" name='rcontent' value='New Reply!!!!'>
	              </div>      
	              <div class="form-group">
	                <label>tno</label> 
	                <input class="form-control" name='tno' value='tno'>
	              </div>
	              <div class="form-group">
	                <label>Reply Date</label> 
	                <input class="form-control" name='rdate' value='2018-01-01 13:13'>
	              </div>
	      
	            </div>
				<div class="modal-footer">
			        <button id='modalModBtn' type="button" class="btn btn-warning">Modify</button>
			        <button id='modalRemoveBtn' type="button" class="btn btn-danger">Remove</button>
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
            	
            	var tbnoValue = '<c:out value="${trainerboard.tbno}"/>'; //부모글번호            	
            	
            	var replyUL = $(".chat");
            	  
            	showList(1);
            	    
            	/* 댓글목록출력 with paging **********************************************************************/
            	function showList(page){            	    	
            	    	console.log("show list " + page);            	        
            	        replyService.getList({tbno:tbnoValue,page: page|| 1 }, function(replyCnt, list) {

            	        console.log("list: " + list);
            	        console.log(list);
            	        
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
            	        	   +list[i].rno+"] "+list[i].tno+"</strong>"; 
            	           str +="    <small class='pull-right text-muted'>"
            	               +replyService.displayTime(list[i].rdate)+"</small></div>";
            	           str +="    <p>"+list[i].rcontent+"</p></div></li>";
            	         }
            	         
            	         replyUL.html(str);


            	     
            	       });//end function            	         
            	     }
            	     /* showList.끝 */
            	    
            	     
            	    /* 페이지번호 출력 ****************************************************************************/ 
            	    var pageNum = 1;
            	    var replyPageFooter = $(".panel-footer");
            	    
            	    function showReplyPage(replyCnt){
            	      
            	      var endNum = Math.ceil(pageNum / 10.0) * 10;  
            	      var startNum = endNum - 9; 
            	      
            	      var prev = startNum != 1;
            	      var next = false;
            	      
            	      if(endNum * 10 >= replyCnt){
            	        endNum = Math.ceil(replyCnt/10.0);
            	      }
            	      
            	      if(endNum * 10 < replyCnt){
            	        next = true;
            	      }
            	      
            	      var str = "<ul class='pagination pull-right'>";
            	      
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
            	
            	
            	
            	/* 이벤트 처리 **************************************************************************************/
                var modal = $(".modal");
                var modalInputReply = modal.find("input[name='rcontent']");
                var modalInputReplyer = modal.find("input[name='tno']");
                var modalInputReplyDate = modal.find("input[name='rdate']");
                
                var modalModBtn = $("#modalModBtn");
                var modalRemoveBtn = $("#modalRemoveBtn");
                var modalRegisterBtn = $("#modalRegisterBtn");           	
            	
            	
            	$("#addReplyBtn").on("click", function(e){
            	      
            	      modal.find("input").val("");
            	      modalInputReplyDate.closest("div").hide();
            	      modal.find("button[id !='modalCloseBtn']").hide();
            	      
            	      modalRegisterBtn.show();
            	      
            	      $(".modal").modal("show");
            	      
            	    });
            	 modalRegisterBtn.on("click",function(e){
            	        
            	        var rcontent = {
            	              rcontent: modalInputReply.val(),
            	              tno:modalInputReplyer.val(),
            	              tbno:tbnoValue
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
            	 
            	    replyPageFooter.on("click","li a", function(e){
            	        e.preventDefault();
            	        console.log("page click");            	        
            	        var targetPageNum = $(this).attr("href");            	        
            	        console.log("targetPageNum: " + targetPageNum);            	        
            	        pageNum = targetPageNum;
            	        
            	        showList(pageNum);
            	      });     

            	  //댓글 조회 클릭 이벤트 처리 
            	    $(".chat").on("click", "li", function(e){            	      
            	      var rno = $(this).data("rno");
            	      
            	      replyService.get(rno, function(reply){            	      
            	        modalInputReply.val(reply.reply);
            	        modalInputReplyer.val(reply.tno).attr("readonly","readonly");
            	        modalInputReplyDate.val(replyService.displayTime( reply.rdate))
            	        .attr("readonly","readonly");
            	        modal.data("rno", reply.rno);// 모달창에 data-rno생성. 값저장
            	        
            	        modal.find("button[id !='modalCloseBtn']").hide();
            	        modalModBtn.show();
            	        modalRemoveBtn.show();
            	        
            	        $(".modal").modal("show");
            	            
            	      });
            	    });
            	    //댓글수정
            	    modalModBtn.on("click", function(e){
            	    	  
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