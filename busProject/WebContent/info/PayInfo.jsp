<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<style>
.noti {
	font-size: 14pt;
}
</style>
<meta charset="UTF-8">
<title>결제 안내</title>
<style type="text/css">
.container {
	display: flex;
	flex-direction: column;
}

header {
	border-bottom: 1px solid gray;
	padding-left: 20px;
}

footer {
	border-top: 1px solid gray;
	padding: 20px;
	text-align: center;
}

.noti_top {
	padding: 50px;
	margin: auto;
}

.pay01:before {
	background: url(./info/img/ico_card.png) center center no-repeat;
	display: inline-block;
	content: '';
	width: 130px;
	height: 130px;
}

.pay02:before {
	background: url(./info/img/ico_account.png) center center no-repeat;
	display: inline-block;
	content: '';
	width: 130px;
	height: 130px;
	margin-top: 10px;
}
</style>
</head>
<body>
	<div class="container">
		<section class="content">
			<div class=noti_top>
				<div>
					<br> <br>
					<p class="noti" align="center">

						고속버스 통합 예매 홈페이지를 통한 예매시<br>
						<!--카드 결제 ,  -->
						계좌이체를
						<!-- 프리미엄 마일리지의 결제 수단-->
						이용하실 수 있습니다.
					</p>
					<br> <br> <br>
				</div>
<!-- 				<div class="pay"> -->
<!-- 					<h3 align="center" style="font-size: 30px">카드결제</h3> -->
<!-- 					<ul class="pay01"> -->
<!-- 						<li class="noti01">카드 결제 정보 입력 시 카드번호, 유효기간, 비밀번호<br> 등을 -->
<!-- 							정상적으로 입력하지 않을 경우 결제가 실패할 수 있으니 정확한 정보를 확인 후 입력해주시기 바랍니다. -->
<!-- 						</li> -->
<!-- 						<li class="noti02">결제하려는 카드의 한도가 초과되었거나 사용 중지된 경우 결제가 실패할 수 -->
<!-- 							있으니 사전에 확인해주시기 바랍니다.</li> -->
<!-- 						<li class="noti03">일부 체크카드 및 일부 법인카드는 예매가 제한될 수 있습니다.</li> -->
<!-- 						<li class="noti04">모든 결제정보는 암호화 처리 후 안전하게 전송됩니다.</li> -->
<!-- 						<li class="noti05">예매가 완료된 후 예매확인/취소/변경 메뉴를 통해 예매 성공 여부를 -->
<!-- 							확인하시기 바랍니다.</li> -->
<!-- 						<li class="noti06">카드결제 후 고속버스 탑승 시 결제에 사용된 카드(창구, 무인기 발권 시), -->
<!-- 							모바일티켓, 홈티켓 중 하나를 가져오셔야 됩니다.</li> -->
<!-- 						<li class="noti07">예매가 완료된 후 예매확인/취소/변경 메뉴를 통해 예매 성공 여부를 -->
<!-- 							확인하시기 바랍니다.</li> -->
<!-- 						<li class="noti08">예매한 카드를 분실하거나 재발급 받은 경우에는 예매 시 사용하신 카드 번호를 -->
<!-- 							매표창구에 제시하시면 발권이 가능합니다.</li> -->
<!-- 						<li class="noti09">E-pass 단말기가 부착된 고속버스에서 E-pass 단말기에 예매 시<br> -->
<!-- 							사용한 카드(교통카드 기능이 있는 신용카드만 해당)를 태그하시면 영수증과 승차권을 한 번에 발권하실 수 있습니다. -->
<!-- 						</li> -->
<!-- 					</ul> -->
<!-- 				</div> -->
			</div>
			<div>
				<h3 align="center" style="font-size: 30px;">계좌이체</h3>
				<ul class="pay02">
					<li class="noti01">계좌이체를 통해 결제할 경우 편도 승차권 예매만 가능하니 참고해주시기
						바랍니다.</li>
					<li class="noti02">계좌이체를 통해 결제할 경우 공인인증서를 이용하여 계좌정보(계좌번호,
						계좌비밀번호 등)를<br> 통해 해당 계좌에서 실시간 이체가 이루어집니다.
					</li>
					<li class="noti03">계좌이체를 통한 결제는 Internet Explorer 브라우저 환경에서
						가능합니다.</li>
					<li class="noti04">예매는 실패하였으나 출금이 되었을 때는 1시간 이내로 결제 취소 후 다시<br>
						입금이 되고 해당 좌석은 최소 30분 후에 예매 가능한 좌석이 됩니다. (경우에 따라 익일 아침에 입금 가능)
					</li>
					<li class="noti05">계좌이체를 통해 결제할 경우 ActiveX를 설치하여야 합니다.</li>
					<li class="noti06">ActiveX는 고객의 결제에 필요한 중요 데이터를 안전하게 암호화하여
						전송하기 위한 프로그램입니다.</li>
					<li class="noti07">예매가 완료된 후 예매확인/취소/변경 메뉴를 통해 예매 성공 여부를 확인하시기
						바랍니다.</li>
					<li class="noti08">최소 30분 이내에 계좌이체 예매를 완료해야 합니다. (시간 경과 시 계좌이체
						예매 불가능)</li>
					<li class="noti09">예매가 완료된 후 예매확인/취소/변경 메뉴를 통해 예매 성공 여부를 확인하시기
						바랍니다.</li>
					<li class="noti10">계좌이체 예매 시 개인 계좌의 경우 365일 24시간 사용가능하나, <br>법인
						계좌일 경우 평일 및 토요일에는 오전 8시부터 오후 10시까지 사용이 가능하며 공휴일에는 사용이 불가능합니다.
					</li>
				</ul>
			</div>
		</section>
	</div>
	<br> <br> <br> <br> <br> <br>
</body>
</html>
