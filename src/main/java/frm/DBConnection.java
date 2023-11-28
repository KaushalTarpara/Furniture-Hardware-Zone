package frm;
import java.sql.*;

public class DBConnection 
{	
		Connection connection;	
		String ConnString;
		String username,password;
		String driverName;
		public DBConnection(String connString, 
				String username, 
				String password,
				String driverName) 
		{					
			this.ConnString = connString;
			this.username = username;
			this.password = password;
			this.driverName = driverName;							
		}
		
		public boolean openConn()
		{
			try
			{
				Class.forName(driverName);
				connection = DriverManager.getConnection
						(ConnString,username,password);
				
				return true;
			}
			catch (Exception e){
				return false;	
			}
			
		}
		public boolean exeQuery(String qry) 
		{
			 try {
				 
			//	ResultSet rs= connection.createStatement().executeQuery(qry);
				boolean more=connection.createStatement().executeQuery(qry).next();
				if(more)
					return true;
				else
					return false;
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				System.out.print("Error : " + e.toString());
				return false;
			}
		}
		public boolean exeUpdate(String qry) 
		{
			 try {
				 
			
				int more=connection.createStatement().executeUpdate(qry);
				if(more == 1)
					return true;
				else
					return false;
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				System.out.print("Error : " + e.toString());
				return false;
			}
		}
		public int exeSelect(String qry) 
		{
			  int pro = 0;
			 try {
				 PreparedStatement ps=connection.prepareStatement(qry);
 			      ResultSet rs2=ps.executeQuery();
	  		      while (rs2.next()) {
	  		        pro++;
	  		      }
 			     
 			    
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				System.out.print("Error : " + e.toString());
				
			}
			return pro;
		}
		public ResultSet getResultSet(String qry) 
		{
			try {
				return connection.createStatement().executeQuery(qry);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}		
			return null;
		}
		
		
}





















