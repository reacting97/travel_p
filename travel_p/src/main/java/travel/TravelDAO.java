package travel;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import conn.DBConnect;

public class TravelDAO {
	private DBConnect dbconn;
	
	public TravelDAO() {
		dbconn = DBConnect.getInstance();
	}
	
	public void insert(TravelVO travel) {
		Connection conn = dbconn.conn();
		String sql = "insert into travel values(seq_travel.nextval, ?, ?, ?, ?, ?, ?, ?)";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, travel.getName());
			ps.setString(2, travel.getAddress());
			ps.setString(3, travel.getPhone());
			ps.setString(4, travel.getContent());
			ps.setString(5, travel.getPic1());
			ps.setString(6, travel.getPic2());
			ps.setString(7, travel.getPic3());
			int num = ps.executeUpdate();
			System.out.println(num + " 줄 추가");
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(conn != null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	public void update(TravelVO travel) {
		Connection conn = dbconn.conn();
		String sql = "update travel set name = ?, address = ?, phone = ?, content = ?, pic1 = ? , pic2 = ? , pic3 = ? where num = ?";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, travel.getName());
			ps.setString(2, travel.getAddress());
			ps.setString(3, travel.getPhone());
			ps.setString(4, travel.getContent());
			ps.setString(5, travel.getPic1());
			ps.setString(6, travel.getPic2());
			ps.setString(7, travel.getPic3());
			ps.setInt(8, travel.getId());
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
		String sql = "delete travel from where num = ?";
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
	
	public TravelVO selectByNum(int num) {
		Connection conn = dbconn.conn();
		String sql = "select * from travel where num = ? order by num desc";
		TravelVO travel = null;
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, num);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				travel = new TravelVO(rs.getInt(1), rs.getString(2), rs.getString(3), 
						rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8));
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
		
		return travel;
	}
	
	public ArrayList<TravelVO> selectByName(String name) {
		Connection conn = dbconn.conn();
		String sql = "select * from travel where name like '%'|| ? ||'%'order by num desc";
		ArrayList<TravelVO> list = new ArrayList<>();
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, name);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				TravelVO travel = new TravelVO(rs.getInt(1), rs.getString(2), rs.getString(3), 
						rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8));
				list.add(travel);
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
	
	public ArrayList<TravelVO> selectByLoc(String loc) {
		Connection conn = dbconn.conn();
		String sql = "select * from travel where address like '%'|| ? ||'%'order by num desc";
		ArrayList<TravelVO> list = new ArrayList<>();
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, loc);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				TravelVO travel = new TravelVO(rs.getInt(1), rs.getString(2), rs.getString(3), 
						rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8));
				list.add(travel);
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
	
	public ArrayList<TravelVO> selectAll() {
		Connection conn = dbconn.conn();
		String sql = "select * from travel order by num desc";
		ArrayList<TravelVO> list = new ArrayList<>();
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				TravelVO travel = new TravelVO(rs.getInt(1), rs.getString(2), rs.getString(3), 
						rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8));
				list.add(travel);
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
