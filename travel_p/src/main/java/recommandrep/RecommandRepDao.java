package recommandrep;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import conn.DBConnect;

public class RecommandRepDao {
	private DBConnect dbconn;

	public RecommandRepDao() {
		dbconn = DBConnect.getInstance();
	}

	public void insert(RecommandRepVo vo) {
		Connection conn = dbconn.conn();

		String sql = "insert into img_reps values(seq_img_reps.nextval, ?, ?, ?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, vo.getPnum());
			pstmt.setString(2, vo.getWriter());
			pstmt.setString(3, vo.getContent());

			int num = pstmt.executeUpdate();
			System.out.println(num + " 줄이 추가되었다");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	public ArrayList<RecommandRepVo> selectByPnum(int pnum){
		Connection conn = dbconn.conn();
		ArrayList<RecommandRepVo> list = new ArrayList<RecommandRepVo>();
		String sql = "select * from recommand_reps where pnum=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pnum);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				list.add(new RecommandRepVo(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4)));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return list;
	}
}










