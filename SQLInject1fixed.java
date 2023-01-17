import java.sql.*;
public class SQLInject1fixed {
    public static void main(String[] args) {
            try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "kenan", "password");
            System.out.println("Enter employee ID:");
            String idInput = System.console().readLine();
            PreparedStatement stmt=con.prepareStatement("SELECT * FROM employee WHERE employee_id = ?");
            stmt.setString(1, idInput);
            ResultSet rs=stmt.executeQuery();
            while(rs.next()) {
                System.out.println("Name: " + rs.getString("Name") + "Age" + rs.getInt("Age"));
            }
        }
        catch(Exception e) {
            System.out.println(e);
        }
        }
    }