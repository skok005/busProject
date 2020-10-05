<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<%@ page import = "java.util.Arrays" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[ 2020. 9. 16.오후 3:52:31 ]</title>
<meta name="viewport" content="width=device-width">
<style type="text/css">
  body{
    padding: 0;
    background-image: url("img/main.jpg");
    background-repeat: no-repeat;
    background-size: cover;
    background-attachment: fixed;
  }
  .container-fluid{
    width:500px;
    height:720px;
    border:1px solid skyblue;
    border-radius:10px;
    background-color:white;
    float:left;   
    text-align:center;   
    margin:5px;   
    position:absolute;
    left:700px;
    top:140px;
    font-size: 13pt;
  }
</style>
<link rel="stylesheet" type="text/css" href="css/b_seat.css"/>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script type="text/javascript" src="js/b_seat.js"></script>
</head>
<body>
  <input type="hidden" value="${depart}" id="depart">
  <input type="hidden" value="${arrival}" id="arrival">
  <input type="hidden" value="${company}" id="company">
  <input type="hidden" value="${platform}" id="platform">

  <input type="hidden" value="${data}" id="data">
  <input type="hidden" value="${dateR1}" id="dateR1">
  <input type="hidden" value="${dateR2}" id="dateR2">
  <input type="hidden" value="${departR}" id="departR">
  <input type="hidden" value="${arrivalR}" id="arrivalR">
  <input type="hidden" value="${levelR}" id="levelR">
  <input type="hidden" value="${routeno}" id="routeno">
  <input type="hidden" value="${timeno}" id="timeno">
  
  <input type="hidden" value="${dateO}" id="dateO">
  <input type="hidden" value="${departO}" id="departO">
  <input type="hidden" value="${arrivalO}" id="arrivalO">
  <input type="hidden" value="${levelO}" id="levelO">
  
  <input type="hidden" value="${preuserid}" id="preuserid">
  <input type="hidden" value="${preseatcount}" id="preseatcount">
  <input type="hidden" value="${preseatSel}" id="preseatSel">
  <input type="hidden" value="${prerouteno}" id="prerouteno">
  <input type="hidden" value="${pretimeno}" id="pretimeno">
  <input type="hidden" value="${preadult}" id="preadult">
  <input type="hidden" value="${prestudent}" id="prestudent"> 
  <input type="hidden" value="${prefare}" id="prefare"> 
  
<br>
<h3 style="font-size: 20pt; margin-left: 900px;">좌석선택</h3>
<div class="container-fluid">
  <div class="row" align="center" style="width:500px;">
  <div>
  <p>
      <span class="spanBox" style='Background-color:green; width: 100px; height: 35px; color: white;'>선택좌석</span>
      <span class="spanBox" style='Background-color:red; width: 100px; height: 35px; color: white;' >예약좌석</span>
      <span class="spanBox" style='width: 100px; height: 35px; color: white;'>빈좌석</span> <br>
      <span class="spanBox" style='Background-color:#dfffff; width: 100px; height: 50px; font-size: 10pt;'>성인 요금  18,000원</span>
      <span class="spanBox" style='Background-color:#dfffff; width: 100px; height: 50px; font-size: 10pt;'>학생 요금  9,000원</span> <p>
  </div>    
    
    <div class='row text-center'>
        <input type="hidden" class="form-control input" id="Name" value="${id}" placeholder="아이디">
        성인 : <input type="number" min='0' max='28' style="width:7%; margin-right: 10px;" id="Adults" value="0" >
        학생 : <input type="number" min='0' max='28' style="width:7%; margin-right: 10px;" id="Students" value="0" >
         총   : <input type="text" min='0' max='28' class="form-control input" id="Seats" style="width:7%;" placeholder="0" readonly="readonly">명 &nbsp;
        요금 : <input type="text" min='0' class="form-control input" id="Fare" style="width:10%;" placeholder="0" readonly="readonly">원 <br>
        <button type="button" id="Selectseat" class="btn btn-success seatsBtn"
        style="cursor:pointer; border-radius:10%; background-color:skyblue; border-color:white; font-size: 15pt; color: white;">좌석선택</button>
    </div> <p>

    <div class="row">        
      <table id="seatTable" class="table fixed-column td">
          <thead>
              <tr>
                  <th></th>
                  <th>1</th>
                  <th>2</th>
                  <th>3</th>
                  <th>4</th>
              </tr>
          </thead>
          <tbody>
              <tr>
                  <td>A</td>
              </tr>
              <tr>
                  <td>B</td>
              </tr>
              <tr>
                  <td>C</td>
              </tr>
              <tr>
                  <td>D</td>
              </tr>
              <tr>
                  <td>E</td>
              </tr>
              <tr>
                  <td>F</td>
              </tr>
              <tr>
                  <td>G</td>
              </tr>
              <tr>
                  <td>H</td>
              </tr>
              <tr>
                  <td>I</td>
              </tr> 
          </tbody>
      </table><br>
      <input type="button" id="ConfirmSeat" class="btn btn-warning seatsBtn" value="예약" 
      style="cursor:pointer; background-color:skyblue; border-radius:20%; border-color:white; font-size: 20pt; color: white;">    
    </div>
  </div>
</div>
</body>
  <script type="text/javascript">    
  $(document).ready(function () {

   var test = function(){
	   var $fArr1 = ${s_code};	
	   //console.log($fArr1);//[11,14,17]
       //$fArr1 = fvar1.split(',');
       
	   //alert(Array.isArray($fArr1))
	   //alert(typeof $fArr1[0])
	   //console.log($fArr1)
       $('.table').attr('disabled', false);        // table 태그 활성화
       $('.table tbody tr td span').css({opacity: 1});   // 투명도 설정
       var table = document.getElementById("seatTable"); // 좌석테이블
       var TableRows = $('.table tr');           // table>tr
       var emptyCell = '<td></td>';            // 빈td
       
       // Table> SETTING ,seatInit 좌석번호 초기화
       for (var i = 1, seatInit = 1; i < TableRows.length-1; i++) {
           var rowID = 1;// 행시작
           var colId = $('.table tbody tr:nth-child(' + i + ') td:nth-child(' + 1 + ')').text();// 행제목
       
           // 열카운터
           for (var j = 0; j < 4; j++) {
               if (i!=9&&j==2) {rowID--;} 
               else {
                //var $fChk = $fArr1.indexOf((seatInit).toString());
                var $fChk = $fArr1.indexOf(seatInit);
                if($fChk>-1){ // 좌석 id값 비교
                 //console.log('i = ' + i + ', j = ' + j + ', seatInit = ' + seatInit);
                    var tableCell = document.getElementById(seatInit.toString());//좌석테이블 아이디 저장
                    $('#' + seatInit).addClass('redColor');
                 }
                 seatInit++;// 좌석번호증가
               }
               rowID++;
           }
      }
        $('#Seats').val('');
        $('#Adults, #Students').val('0');
        $('.table tbody tr td').unbind('click');
        $('.table tbody tr td span').css({opacity: 0.4});  
   }()
  });
  
  </script>
</html>