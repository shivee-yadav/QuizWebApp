package DAO;
import java.sql.*;


public class DBConnect {
	
	public Connection cn=null;
	public DBConnect() throws Exception{
		Class.forName("oracle.jdbc.pool.OracleDataSource");
		cn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","sys as sysdba","oracle");
		
	}
	
	public void QueryExecuter(String sql) throws Exception{
		Statement st=cn.createStatement();
		st.execute(sql);
		st.close();
	}
	public ResultSet QueryReturner(String sql) throws Exception{
		Statement st=cn.createStatement();
		ResultSet rs=st.executeQuery(sql);
		return rs;
	}

}
