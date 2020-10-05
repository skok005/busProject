package SampleDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;


import DBConnect.DBConnect;
import SampleDTO.reserveCheckDTO;
import SampleDTO.reserveDTO;

public class reserveCheckDAO {
	DBConnect dbconnect = null;
	
	private Statement ST;
	private Connection CN;
	private PreparedStatement PST;
	private ResultSet RS;
	
	private String msg;
	
	//DB연결
	public reserveCheckDAO() { 
		dbconnect = new DBConnect();
		CN = dbconnect.getConnection();
	}//end
	
	public ArrayList<reserveCheckDTO> dbcheck(String id) {
		ArrayList<reserveCheckDTO> list = new ArrayList<reserveCheckDTO>();
		try {		
			String a = "select to_char(t.t_depart,'yyyy/mm/dd hh24:mi') as depart, ";
			String b = " to_char(t.t_arrival,'yyyy/mm/dd hh24:mi') as arrival, ";
			String c = " t.t_company, t.t_rank, t.t_platform, t.t_timeNo, t.t_routeNo, ";
			String d = " s.s_adult, s.s_student, s.s_fare, listagg(s.s_code, ',') within group(order by s.s_code) as s_code, ";
			String e = " r.r_depart, r.r_arrival from busSeat s , busTime t, busRoute r  ";
			String f = " where s.s_id=? and s_timeNo=t_timeNo and r_routeNo=s_routeNo group by  ";
			String g = " to_char(t.t_depart,'yyyy/mm/dd hh24:mi'), to_char(t.t_arrival,'yyyy/mm/dd hh24:mi'),";
			String h = " t.t_company, t.t_rank, t.t_platform, t.t_timeNo, t.t_routeNo, s.s_adult, s.s_student, ";
			String i = " s.s_fare, r.r_depart, r.r_arrival";
			msg = a+b+c+d+e+f+g+h+i;
			PST = CN.prepareStatement(msg);
			PST.setString(1, id); 
			RS = PST.executeQuery();
			while(RS.next()) {
				reserveCheckDTO rcdto = new reserveCheckDTO();
				rcdto.setDepartDate(RS.getString("depart"));
				rcdto.setArrivalDate(RS.getString("arrival"));
				rcdto.setDepart(RS.getString("r_depart"));
				rcdto.setArrival(RS.getString("r_arrival"));
				rcdto.setCompany(RS.getString("t_company"));
				rcdto.setRank(RS.getString("t_rank"));
				rcdto.setPlatform(RS.getInt("t_platform"));
				rcdto.setAdult(RS.getInt("s_adult"));
				rcdto.setStudent(RS.getInt("s_student"));
				rcdto.setFare(RS.getInt("s_fare"));
				rcdto.setSelected(RS.getString("s_code"));
				rcdto.setTimeno(RS.getInt("t_timeNo"));
				rcdto.setRouteno(RS.getInt("t_routeNo"));
				list.add(rcdto);		
			}
		}catch (Exception e) {System.out.println(e);}
		return list;
	}//end
	
//	public ArrayList<reserveCheckDTO> dbcheck(String id) {
//		ArrayList<reserveCheckDTO> list = new ArrayList<reserveCheckDTO>();
//		try {		
//			String a = "select rownum as rn, to_char(t.t_depart,'yyyy/mm/dd hh24:mi') as depart, ";
//			String b = " to_char(t.t_arrival,'yyyy/mm/dd hh24:mi') as arrival, ";
//			String c = " t.t_company, t.t_rank, t.t_platform, t.t_timeNo, t.t_routeNo, ";
//			String d = " s.s_adult, s.s_student, s.s_fare, s.s_code, ";
//			String e = " r.r_depart, r.r_arrival  ";
//			String f = " from busSeat s , busTime t, busRoute r ";
//			String g = " where s.s_id=? and s_timeNo=t_timeNo and r_routeNo=s_routeNo";
//			msg = a+b+c+d+e+f+g;
//			PST = CN.prepareStatement(msg);
//			PST.setString(1, id); 
//			RS = PST.executeQuery();
//			while(RS.next()) {
//				reserveCheckDTO rcdto = new reserveCheckDTO();
//				rcdto.setDepartDate(RS.getString("depart"));
//				rcdto.setArrivalDate(RS.getString("arrival"));
//				rcdto.setDepart(RS.getString("r_depart"));
//				rcdto.setArrival(RS.getString("r_arrival"));
//				rcdto.setCompany(RS.getString("t_company"));
//				rcdto.setRank(RS.getString("t_rank"));
//				rcdto.setPlatform(RS.getInt("t_platform"));
//				rcdto.setAdult(RS.getInt("s_adult"));
//				rcdto.setStudent(RS.getInt("s_student"));
//				rcdto.setFare(RS.getInt("s_fare"));
//				rcdto.setSelected(RS.getInt("s_code"));
//				rcdto.setRownum(RS.getInt("rn"));
//				rcdto.setTimeno(RS.getInt("t_timeNo"));
//				rcdto.setRouteno(RS.getInt("t_routeNo"));
//				list.add(rcdto);		
//			}
//		}catch (Exception e) {System.out.println(e);}
//		return list;
//	}//end
}//class edn
