<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>      
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>버스승차권 예약시스템</title>
</head>
<body>
	<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/font-awesome/4.6.2/css/font-awesome.min.css">
	<style>
		@import url(https://fonts.googleapis.com/css?family=Roboto:400,700,500);
		
		/* main Styles */
		
		html { box-sizing: border-box; }
		
		*, *:before, *:after { box-sizing: inherit; }
		
		body {
		  background: #fafafa;
		  font-family: "Roboto", sans-serif;
		  font-size: 14px;
		  margin: 0;
		}
		
		a { text-decoration: none; }
		
		.container {
		  width: 1000px;
		  margin: auto;
		}
		
		h1 { text-align:center; margin-top:150px;}
		
		/* Navigation Styles */
		
		nav { background: #2ba0db; }
		
		nav ul {
		  font-size: 0;
		  margin: 0;
		  padding: 0;
		}
		
		nav ul li {
			display: inline-block;
			z-index:2;
			position: relative;
		}
		
		nav ul li a {
		  color: #fff;
		  display: block;
		  font-size: 14px;
		  padding: 15px 14px;
		  transition: 0.3s linear;
		}
		
		nav ul li:hover { background: #126d9b; }
		
		nav ul li ul {
		  border-bottom: 5px solid #2ba0db;
		  display: none;
		  position: absolute;
		  width: 250px;
		}
		
		nav ul li ul li {
		  border-top: 1px solid #444;
		  display: block;
		}
		
		nav ul li ul li:first-child { border-top: none; }
		
		nav ul li ul li a {
		  background: #373737;
		  display: block;
		  padding: 10px 14px;
		}
		
		nav ul li ul li a:hover { background: #126d9b; }
		
		nav .fa.fa-angle-down { margin-left: 6px; }
	</style>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script type="text/javascript">
			var protocol = "http:";
			var vHeadUrl;
			var vstx = window.location.origin;
			var vctx = location.href.replace(window.location.origin,"").split("/").slice(0,2).join("/");// 서버에 올릴때 처리 않함
			var aCtx = protocol+window.location.origin.replace(window.location.protocol,"") + vctx;
			//console.log(vChatUrl = vstx + vctx + "/")//ws://localhost:8080/webChat3
			console.log("aCtx = "+aCtx + "/")//ws://localhost:8080/webChat3
			console.log("vHeadUrl = " +(vHeadUrl = vstx + vctx + "/"))//http://localhost:8080/bookTest1/chatbot/chatbot2.jsp
	</script>
	<script>
	$(function(){
		$("li a").each(function(){
			anchor =  $(this).attr('href')
			console.log(anchor)
			$(this).attr('href',(anchor!='#'?vHeadUrl+anchor:'#'))  
		});
	})
	
	function Logout(){
		var result = confirm("정말 로그아웃 하시겠습니까?");
		
		if(result==true){
			location.href = "Logout.do";
		}
	}//Logout End
	
	function chatCheck(id){
		if(id==null||id==""){
			alert("로그인 후 이용 가능합니다.");
		} else {
			location.href = "access.do?cnct=mChat";
		}
	}//chatCheck END
	</script>
</head>

<body>
<nav>
  <div class="container">
    <ul>
      <li><a href="b_main.jsp">Home</a></li>
       <li><a href="reserveCheck.do">예매확인/취소</a>
      </li>
		<li><a href="b_timeCheck.jsp">운행시간표조회</a>
      </li>      
      <li class='sub-menu'><a href="#">이용안내<i class='fa fa-angle-down'></i></a>
        <ul>
          <li><a href="access.do?cnct=resGid">예매안내</a></li>
          <li><a href="access.do?cnct=payGid">결제안내</a></li>
        </ul>
      </li>
       <li class='sub-menu'> <a href="noticeList.do">게시판<i class='fa fa-angle-down'></i></a>
        <ul>
          <li><a href="noticeList.do">공지사항</a></li>
          <li><a href="FaQList.do">F&Q</a></li>
        </ul>
      </li>
       <li class='sub-menu'> <a href="#" onclick="chatCheck('${sessionScope.id}')">채팅문의<i class='fa fa-angle-down'></i></a>
        <c:if test="${sessionScope.m_id!=null}">
        <ul>
	        <li><a href="access.do?cnct=mChat">상담사연결</a></li>
          <c:if test="${sessionScope.admin==9}">
	        <li><a href="access.do?cnct=aChat">관리자(회원관리)</a></li>
      	  </c:if>
        </ul>
        </c:if>
      </li>
      <c:choose>
      <c:when test="${empty sessionScope.m_id}">
	      <li> <a href="Login.do">로그인</a></li>
      </c:when>
      <c:otherwise>
       <li><font style="color: orange;">${sessionScope.id}</font></li>
       <li><a href="#" onclick="Logout()">LOGOUT</a></li>
       </c:otherwise>
      </c:choose>
<!--       <li><a><input type="button" value="로그아웃" onclick="location.href='bbs/login/logOut.jsp'"/></a> </li> -->
<!--       <li> <a href="Join.do">회원가입</a> </li> -->
    </ul>
   
    
  </div>
</nav>

<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script> 
<script>
$('nav li').hover(
  function() {
	  $('ul', this).stop().slideDown(200);
  },
	function() {
    $('ul', this).stop().slideUp(200);
  }
);
</script>
</body>
</html>