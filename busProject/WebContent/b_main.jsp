<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="./header.jsp" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>[ 2020. 9. 14.오전 10:46:31 ]</title>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<!--   <link rel="stylesheet" href="/resources/demos/style.css"> -->
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<link rel="stylesheet" type="text/css" href="css/b_main.css"/>
	<style type="text/css">
		body{
		  padding: 0;
		  background-image: url("img/main.jpg");
		  background-repeat: no-repeat;
		  background-size: cover;
		  background-attachment: fixed;
		}
	</style>
	<script type="text/javascript" src="js/b_main.js"></script>
	<script>
		$(function() {
			$("#datepicker1").datepicker({minDate:0, maxDate:"+1M +10D", dateFormat:"yy/mm/dd"});
			$("#datepicker1").datepicker("setDate", "today");
		});
		$(function() {
			$("#datepicker2").datepicker({minDate:0, maxDate:"+1M +10D", dateFormat:"yy/mm/dd"});
			$("#datepicker2").datepicker("setDate", "today");
		});
		$(function() {
		   $("#datepicker3").datepicker({minDate:0, maxDate:"+1M +10D", dateFormat:"yy/mm/dd"});
		   $("#datepicker3").datepicker("setDate", "today");
		});
	</script>
</head>
<body>
<div class="bd" >
  <div align="center" class="tab">
    <button class="tablinks" onclick="openCity(event, 'oneway')">편도</button>
    <button class="tablinks" onclick="openCity(event, 'round')">왕복</button>
  </div>
  
  <div id="oneway" class="tabcontent" align="center">
  <form name="mainformA" action="main.do">
    <table style="width: 630px;">
      <tr>
        <td width="20%"> <p id="btnSel">출발지</p></td> 
        <td width="20%"> <p id="btnSel">도착지</p></td>
      </tr>
      <tr>
        <td> <input type="text" class="txt" id="departO" name="departO" readonly="readonly" value="출발" onclick="selectA()"> </td> 
        <td> <input type="text" class="txt" id="arrivalO" name="arrivalO" readonly="readonly" value="도착" onclick="selectB()"> </td>
        <td width="35%" id="btnSel"> 가는날 <input type="text" name="datepicker1" id="datepicker1"> </td>
        <td width="15%"> 
          <input type="button" class="btnlevel" name="normal1" id="normal1" value="일반" onclick="seatLevel1()"> <br>
          <input type="button" class="btnlevel" name="superior1" id="superior1" value="우등" onclick="seatLevel2()">
          <input type="hidden" name="levelO" id="levelO" value="1">
        </td>
      </tr>
      <tr align="center">
       <td colspan ="4" class="submit_btn"> <input type="button" id="btnSearch" value=" 조 회 " onclick="searchA()"></td>
     </tr> 
    </table>
  </form>
  </div>
  
  <div id="round" class="tabcontent" align="center">
  <form name="mainformB" action="main2.do">
    <table style="width: 630px;">
      <tr>
        <td width="20%"> <p id="btnSel">출발지</p> </td> 
        <td width="20%"> <p id="btnSel">도착지</p> </td>
      </tr>
      <tr>
      	<td> <input type="text" class="txt" name="departR" id="departR" readonly="readonly" value="출발" onclick="selectA()"> </td> 
        <td> <input type="text" class="txt" name="arrivalR" id="arrivalR" readonly="readonly" value="도착" onclick="selectB()"> </td>
      	<td width="35%" id="btnSel"> 
          가는날 <input type="text" name="datepicker2" id="datepicker2"> <br>
          오는날 <input type="text" name="datepicker3" id="datepicker3">
        </td>
        <td width="15%"> 
          <input type="button" class="btnlevel" name="normal2" id="normal2" value="일반" onclick="seatLevel1()"> <br>
          <input type="button" class="btnlevel" name="superior2" id="superior2" value="우등" onclick="seatLevel2()"> 
          <input type="hidden" name="levelR" id="levelR" value="1">
        </td>
      </tr>
     <tr align="center">
       <td colspan ="4" class="submit_btn"> <input type="button" id="btnSearch" value=" 조 회 " onclick="searchB()"></td>
     </tr> 
    </table>
  </form>
  </div>
</div>
</body>
</html>