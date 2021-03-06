package chatbots;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Optional;
import java.util.UUID;


import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;


@ServerEndpoint("/webChat3")
public class webChat3 {

	// clientId와 clientSession정보를 저장
	private static List<User> sUsers = Collections.synchronizedList(new ArrayList<>());// 데이타 동기화
	
	
	// lamda지원하기 위한 인터페이스, clientId와 clientSession 저장 UserClass
	private interface SearchExpression {
		boolean expression(User user);
	}
	private class User {
		Session sSess;
		String sUser;
	}
	private static User getUser(Session wsSess) {
		return searchUser(x -> x.sSess == wsSess);
	}
	private static User getUser(String sUser) {
		return searchUser(x -> x.sUser.equals(sUser));
	}
	// lamda 
	// https://qastack.kr/programming/24054773/java-8-streams-multiple-filters-vs-complex-condition
	// https://www.it-swarm.dev/ko/java/java-8%EC%97%90%EC%84%9C-findany-%EC%99%80-findfirst-%EC%9D%98-%EC%B0%A8%EC%9D%B4%EC%A0%90/824195236/
	// https://futurecreator.github.io/2018/08/26/java-8-streams-advanced/
	private static User searchUser(SearchExpression func) {
		Optional<User> op = sUsers.stream().filter(x -> func.expression(x)).findFirst();// 첫번째 true인 값만 저장
		if (op.isPresent()) {// Optional 개체접근, 값추출
			return op.get();
		}
		return null;
	}
	
	@OnOpen
	public void handleOpen(Session wsSess) {
		User user = new User();																			// 사용자 저장 클래스선언
		user.sUser = UUID.randomUUID().toString().replace("-", "");	// user클래스에 클라이언트 고유아이디생성 저장 abcd1234-a123-a123-a123-a12345a12345
		user.sSess = wsSess;																					// user클래스에 클라이언트 세션값 저장
		System.out.println("webChat3.java handleOpen()");
		System.out.println("user.sUser=" + user.sUser);
		System.out.println("user.sSess=" + user.sSess);
		sUsers.add(user);																						// sUser클래스에 user정보 추가 
		Admin.visit(user.sUser);																		// structure Admin클래스에 사용자이름 전달 
	}
	
	@OnMessage
	public void handleMessage(String message, Session wsSess) throws IOException {
		User user = getUser(wsSess);																// 클라이언트세션과 일치하는 세션을 추출
		if (user != null) {																					// 동일한 세션값을 추출한건지 확인
			System.out.println("webChat3.java handleMessage()");
			System.out.println("wsSess=" + wsSess);
			System.out.println("msgs=" + message);
			Admin.sendMessage(user.sUser, message);										// 관리자에게 클라이언트 접속메세지를 보낸다.
		}
	}
	
	@OnClose
	public void handleClose(Session wsSess) {
		User user = getUser(wsSess);																// 접속한 클라이언트 정보를 얻는다.
		if (user != null) {																					// 접속한 클라이언트 정보가 있다면
			Admin.bye(user.sUser);																		// 관리자에게 클라이언트 종료메세지를 보낸다.
			sUsers.remove(user);																			// 접속종료된 클라이언트 목록에서 삭제
		}
	}
	
	@OnError	
	public void handleError(Throwable e, Session wsSess) {	
	  System.out.println("wsSess = " + wsSess +", 클라이언트가 오류가 났습니다.");
	  System.out.println("클라이언트가 오류가 났습니다.");
	  //e.printStackTrace();	
	}	
	
	
	//관리자가 사용자에게 보내는 메세지 용도
	public static void sendMessage(String sUser, String msgs) {
		User user = getUser(sUser);														// getClientId
		System.out.println("webChat3.java sendMessage()");
		System.out.println("sUser=" + sUser);
		System.out.println("msgs=" + msgs);
		if (user != null) {																		// is getClientId
			try {
				user.sSess.getBasicRemote().sendText(msgs);				// client SessionValue정보로 getBasicRemote()로 msg전송
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	// 관리자 접속시 getClientIdList 정보제공 용도
	public static String[] getClientIds() {
		String[] clentIds = new String[sUsers.size()];	// sUsers 크기만큼 clientIds[] 크기설정
		for (int i = 0; i < clentIds.length; i++) {			// clentIds[] for문 루프
			clentIds[i] = sUsers.get(i).sUser;						// clentIds[]에 sUsers의 clentIds[]로 clientId 저장
		}
		return clentIds;// clientIds[] 반환(clientId의 id값)
	}
	
}// webChat3

