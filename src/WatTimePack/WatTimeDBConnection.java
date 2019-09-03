package WatTimePack;

import java.sql.Connection;
import java.sql.SQLException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class WatTimeDBConnection {
	private static WatTimeDBConnection instnace = new WatTimeDBConnection();
	private DataSource ds;
	
	private WatTimeDBConnection() {
		try {
			Context initCtx = new InitialContext();
			Context envCtx = (Context) initCtx.lookup("java:comp/env");
			ds = (DataSource) envCtx.lookup("jdbc/wattime");
			
		}catch(Exception eX) {
			eX.printStackTrace();
		}
	}
	
	public static WatTimeDBConnection getInstance() {
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
