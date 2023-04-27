package comment;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import conn.DBConnect;

public class CommentDao {
private DBConnect dbconn;
	
	public CommentDao() {
		dbconn = DBConnect.getInstance();
	}
	
	public void insert(CommentVo vo) {
		Connection conn = dbconn.conn();
		String sql = "insert into comment_join values(seq_comment.nextval, ?, ?, ?, sysdate)";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, vo.getBoard_num());
			ps.setString(2, vo.getContent());
			ps.setString(3, vo.getUser_id());
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
	
	public void update(String content, int num) {
		Connection conn = dbconn.conn();
		String sql = "update comment_join set content=? w_date=sysdate where num=?";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, content);
			ps.setInt(2, num);
			int num2 = ps.executeUpdate();
			System.out.println(num2 + " 줄 수정");
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
		String sql = "delete from comment_join where num=?";
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
	
	public ArrayList<CommentVo> selectByBoard(int num) {
		Connection conn = dbconn.conn();
		String sql = "select * from comment_join where board_num=? order by num";
		ArrayList<CommentVo> list = new ArrayList<>();
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, num);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				CommentVo vo = new CommentVo(rs.getInt(1), rs.getInt(2), rs.getString(3), 
						rs.getString(4), rs.getDate(5));
				list.add(vo);
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
