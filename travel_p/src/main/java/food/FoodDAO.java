package food;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import conn.DBConnect;

public class FoodDAO {
	private DBConnect dbconn;
	
	public FoodDAO() {
		dbconn = DBConnect.getInstance();
	}
	
	public void insert(FoodVO travel) {
		Connection conn = dbconn.conn();
		String sql = "insert into food values(seq_food.nextval, ?, ?, ?, ?, ?)";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, travel.getName());
			ps.setString(2, travel.getAddress());
			ps.setString(3, travel.getPhone());
			ps.setString(4, travel.getPic1());
			ps.setString(5, travel.getPic2());
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
	
	public void update(FoodVO travel) {
		Connection conn = dbconn.conn();
		String sql = "update travel set name = ?, address = ?, phone = ?, pic1 = ?, pic2 = ? where num = ?";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, travel.getName());
			ps.setString(2, travel.getAddress());
			ps.setString(3, travel.getPhone());
			ps.setString(4, travel.getPic1());
			ps.setString(5, travel.getPic2());
			ps.setInt(6, travel.getNum());
			int num = ps.executeUpdate();
			System.out.println(num + " 줄 수정");
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
	
	public void delete(int num) {
		Connection conn = dbconn.conn();
		String sql = "delete food where num = ?";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, num);
			int ret = ps.executeUpdate();
			System.out.println(ret + " 줄 삭제");
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
	
	public ArrayList<FoodVO> selectByLoc(String loc) {
		Connection conn = dbconn.conn();
		String sql = "select * from food where address like '%'|| ? ||'%'";
		ArrayList<FoodVO> list = new ArrayList<>();
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, loc);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				FoodVO food = new FoodVO(rs.getInt(1), rs.getString(2), rs.getString(3), 
						rs.getString(4), rs.getString(5), rs.getString(6));
				list.add(food);
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
}