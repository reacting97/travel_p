package conn;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

//�̱���
public class DBConnect {
	private static DBConnect dbconn = new DBConnect();
	private String url = "jdbc:oracle:thin:@localhost:1521/xe";//@db�����ּ�:�����ʹ�ȣ/sid
	
	private DBConnect() {}
	
	public static DBConnect getInstance() {
		return dbconn;//��� db�۾��� �� conn��ü�� �����Ѵ�.
	}
	
	public Connection conn() {
		try {
			//����̹� �ε�
			Class.forName("oracle.jdbc.OracleDriver");
			
			//���Ǽ���
			return DriverManager.getConnection(url, "hr", "hr");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
}