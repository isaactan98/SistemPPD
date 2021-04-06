package jdbc;

import java.util.*;
import java.sql.*;
/**
 *
 * @author User
 */
public class JDBCUtility 
{
    Connection con;
    String driver;
    String db;
    String url;
    String userName;
    String password;

    //use this constructor if using ConnectionPool
    public JDBCUtility(){}

    public  void jdbc()
    {
        try
	{
            Class.forName (driver);
            con = DriverManager.getConnection(url+ "", userName, password);

            DatabaseMetaData dma = con.getMetaData ();
            System.out.println("\nConnected to " + dma.getURL());
            System.out.println("Driver       " + dma.getDriverName());
            System.out.println("Version      " + dma.getDriverVersion());
            System.out.println("");
	}
        
	catch (SQLException ex)
	{
            while (ex != null)
            {
		System.out.println ("SQLState: " +
                                    ex.getSQLState ());
                System.out.println ("Message:  " +
                                    ex.getMessage ());
		System.out.println ("Vendor:   " +
                                    ex.getErrorCode ());
                ex = ex.getNextException ();
		System.out.println ("");
            }

            System.out.println("Connection to the database error");
	}
	catch (java.lang.Exception ex)
	{
            ex.printStackTrace ();
	}
    }
    
    // first db
    public Connection db1_connect(){
//        this.driver = "com.mysql.jdbc.Driver";
        this.driver = "org.postgresql.Driver";
        this.db = "d5ajfirc7rp0tr";
//        this.url = "jdbc:mysql://localhost:3306/"+db+"?";
        this.url = "jdbc:postgresql://ec2-34-192-122-0.compute-1.amazonaws.com:5432/"+db+"?";
        this.userName = "vvleslarnooevw";
        this.password = "ead12da7584c757b997d2140b88b5cecf107407eb737e1b023ab9b5b46d04e74";
        this.jdbc();
        return con;
    }

    public void jdbcConClose()
    {
	try
	{
            con.close();
	}
	catch (Exception ex)
	{
	}
    }
}
