import java.sql.*;
public class UserInterface {
    public static void main(String[] args) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "kenan", "password");
            Statement stmt=con.createStatement();
            while(true) {
                System.out.println("\nChoose an option:");
                System.out.println("1) View Stock");
                System.out.println("2) Request Stock");
                System.out.println("3) View Vendor Prices");
                System.out.println("4) Purchase Stock");
                System.out.println("5) Quit");
                int option = Integer.parseInt(System.console().readLine());
                switch(option){
                    case 1:
                    ResultSet rs = stmt.executeQuery("SELECT * FROM warehouse_inventory");
                    while(rs.next()) {
                        System.out.println("Warehouse Product " + rs.getInt("Product_id") + "\nName: " + rs.getString("Product_name") + "\nQuantity: " + rs.getInt("Total_quantity"));
                    }
                    rs = stmt.executeQuery("SELECT * FROM branch_inventory");
                    while(rs.next()) {
                        System.out.println("Branch Office Product " + rs.getInt("Product_id") + "\nName: " + rs.getString("Product_name") + "\nQuantity: " + rs.getInt("Total_quantity"));
                    }
                    break;
                    case 2:
                    System.out.println("Enter product to request:");
                    String productInput = System.console().readLine();
                    System.out.println("Enter quantity:");
                    int quantityInput = Integer.parseInt(System.console().readLine());
                    stmt.executeUpdate("INSERT INTO requests (Product_name, Quantity) values ('" + productInput + "'," + quantityInput + ")");
                    System.out.println("Request Successful!");
                    break;
                    case 3:
                    System.out.println("Enter supply name:");
                    String supplyInput = System.console().readLine();
                    rs = stmt.executeQuery("SELECT Vendor_name, Price FROM vendors WHERE Product_name = '" + supplyInput + "'");
                        while (rs.next()) {
                            System.out.println("Vendor:" + rs.getString("Vendor_name"));
                            System.out.println("Price:" + rs.getString("Price"));
                        }
                    break;
                    case 4:
                    System.out.println("Enter supply to purchase:");
                    String purchaseInput = System.console().readLine();
                    rs = stmt.executeQuery("SELECT Vendor_name, Price FROM vendors WHERE Product_name = '" + purchaseInput + "' ORDER BY price ASC LIMIT 1");
                    if (rs.next()) {
                        String vendor = rs.getString("Vendor_name");
                        String price = rs.getString("Price");
                        System.out.println("Purchase " + purchaseInput + " from " + vendor + " for $" + price + "?");
                        System.out.println("yes or no:");
                        String answer = System.console().readLine();
                        if (answer.equals("yes")) {
                        stmt.executeUpdate("INSERT INTO purchases (Product_name, Vendor_name, Price) VALUES ('" + purchaseInput + "', '" + vendor + "', " + price + ")"); 
                        stmt.executeUpdate("UPDATE warehouse_inventory SET Total_quantity = Total_quantity - 1 WHERE Product_name = '" + purchaseInput + "'");
                        System.out.println("Purchase Successful!");
                        }
                    }
                    break;
                    case 5:
                    con.close();
                    System.exit(0);
                    break;
                }
            }
        }
        catch(Exception e) {
            System.out.println(e);
        }
    }
}