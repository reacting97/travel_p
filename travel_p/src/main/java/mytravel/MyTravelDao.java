package mytravel;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import conn.DBConnect;

public class MyTravelDao {
private DBConnect dbconn;
	
	public MyTravelDao() {
		dbconn = DBConnect.getInstance();
	}
	
	public void insert(MyTravelVo vo) {
		Connection conn = dbconn.conn();
		String sql = "insert into my_travel values(seq_my_travel.nextval,?,?)";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, vo.getId());
			ps.setInt(2, vo.getTravel_id());
			int num = ps.executeUpdate();
			System.out.println(num + " 줄 추가");
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	public ArrayList<MyTravelVo> selectById(String id) {
		Connection conn = dbconn.conn();
		ArrayList<MyTravelVo> list = new ArrayList<>();
		String sql = "select * from my_travel where user_id=?";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				list.add(new MyTravelVo(rs.getInt(1),rs.getString(2),rs.getInt(3)));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return list;
	}
	
	public MyTravelVo select(String id, int num) {
		Connection conn = dbconn.conn();
		MyTravelVo vo = null;
		String sql = "select * from my_travel where user_id=? and travel_id=?";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			ps.setInt(2, num);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				vo =new MyTravelVo(rs.getInt(1),rs.getString(2),rs.getInt(3));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return vo;
	}
	
	public void delete(int num) {
		Connection conn = dbconn.conn();
		String sql = "delete from my_travel where num=?";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, num);
			int num2 = ps.executeUpdate();
			System.out.println(num2 + " 줄 삭제");
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}
