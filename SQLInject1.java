import java.sql.*;
public class SQLInject1 {
    public static void main(String[] args) {
            try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "kenan", "password");
            Statement stmt=con.createStatement();
            System.out.println("Enter employee ID:");
            String idInput = System.console().readLine();
            ResultSet rs=stmt.executeQuery("SELECT * FROM employee WHERE employee_id = '" + idInput + "'");
            while(rs.next()) {
                System.out.println("Name: " + rs.getString("Name") + " Age: " + rs.getInt("Age"));
            }
        }
        catch(Exception e) {
            System.out.println(e);
        }
        }
    }