package dal;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class DBContext {
    protected Connection connection;
    public DBContext()
    {
        try {
    // Load database credentials from environment variables
    String url = System.getenv("jdbc:sqlserver://localhost:1433;databaseName= Perfume1");  // ✅ Load from environment variables
    String username = System.getenv("sa");  // ✅ Load from environment variables
    String password = System.getenv("123");  // ✅ Load from environment variables

    // Ensure JDBC Driver is loaded
    Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

    // Establish connection
    connection = DriverManager.getConnection(url, username, password);
} catch (ClassNotFoundException | SQLException ex) {
    ex.printStackTrace();  // Use proper logging in production
}
    }
}
