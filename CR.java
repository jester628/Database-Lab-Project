import java.sql.*;

public class CR {

    public static void main(String[] args) {
        String url= "jdbmc:mysql://localhost:(itdepends)/";
        String dbName = "hypermarket";
        String driver = "com.mysql.jdbc.Driver";
        String userName = "root"; 
        String password = "";
        
        try {
        Class.forName(driver).newInstance();
        Connection conn = DriverManager.getConnection(url+dbName,userName,password);
        
        Statement st = conn.createStatement();
        
        //add if/else statement or switch statements (for UI)
        ResultSet res1 = st.executeQuery("SELECT * FROM PRODUCTS");
        System.out.println(res1);
        
        ResultSet res2 = st.executeQuery("SELECT * FROM CUSTOMERS");
        System.out.println(res2);
        
        ResultSet res3 = st.executeQuery("SELECT * FROM ORDERS");
        System.out.println(res3);
        
     
        conn.close();
        } catch (Exception e) {
        e.printStackTrace();
        }
        
    }
    
}
