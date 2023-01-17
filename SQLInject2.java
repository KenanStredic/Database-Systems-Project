import java.sql.*;
public class SQLInject2 {
    public static void main(String[] args) {
            try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "kenan", "password");
            Statement stmt=con.createStatement();
            System.out.println("Enter employee ID:");
            String idInput = System.console().readLine();
            stmt.executeUpdate("UPDATE employee SET Age = Age + 1 WHERE employee_id = '" + idInput + "'");
        }
        catch(Exception e) {
            System.out.println(e);
        }
        }
    }