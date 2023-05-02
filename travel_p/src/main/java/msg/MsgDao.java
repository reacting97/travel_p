package msg;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import conn.DBConnect;


public class MsgDao {
	private DBConnect dbconn;
	
	public MsgDao() {
		dbconn = DBConnect.getInstance();
	}
	
	public void insert(MsgVo vo) {
		Connection conn = dbconn.conn();
		String sql = "insert into join_msg values(seq_msg.nextval,?,?)";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, vo.getId());
			ps.setString(2, vo.getContent());
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
	
	public void delete(int num) {
		Connection conn = dbconn.conn();
		String sql = "delete from join_msg where num=?";
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
	
	public ArrayList<MsgVo> selectById(String id) {
		Connection conn = dbconn.conn();
		ArrayList<MsgVo> list = new ArrayList<>();
		String sql = "select * from join_msg where receiver=?";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				list.add(new MsgVo(rs.getInt(1),rs.getString(2),rs.getString(3)));
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
