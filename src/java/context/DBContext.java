  /*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package context;

/**
 *
 * @author TUF F15
 */
import java.lang.System.Logger;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBContext {

    protected Connection connection;



    public DBContext() {
        try {
            // Edit URL , username, password to authenticate with your MS SQL Server
            String url = "jdbc:sqlserver://localhost\\SQLEPXRESS:1433;databaseName=SWP391;"
                    + "encrypt=true;trustServerCertificate=true";
            String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
            Class.forName(driver);
            String user = "sa";
            String passwd = "12345";
            connection = (Connection) DriverManager
                    .getConnection(url, user, passwd);
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("Loi");
        }

    }

    public Connection getConnection() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
}
