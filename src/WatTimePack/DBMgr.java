package WatTimePack;

import java.sql.Connection;
import java.sql.SQLException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class DBMgr {
	private static DBMgr instnace = new DBMgr();
	private DataSource ds;
	
	private DBMgr() {
		try {
			Context initCtx = new InitialContext();
			Context envCtx = (Context) initCtx.lookup("java:comp/env");
			ds = (DataSource) envCtx.lookup("jdbc/wattime");
			
		}catch(Exception eX) {
			eX.printStackTrace();
		}
	}
	
	public static DBMgr getInstance() {
		return instnace;
	}
	
	public Connection getConnection() {
		Connection con = null;
		try {
			con = ds.getConnection();
		}catch(SQLException sqlE) {
			throw new RuntimeException(sqlE);
		}
		return con;
	}
}
