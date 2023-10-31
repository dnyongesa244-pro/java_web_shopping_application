import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.Random;
import java.sql.Statement;
import java.sql.ResultSet;

public class addproductservlet extends HttpServlet {
    public boolean checkExistence(int productId) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/eshoping", "root", "");
            Statement stmt = con.createStatement();

            String sql = "SELECT * FROM product_for_sale WHERE product_id = " + productId;

            ResultSet rs = stmt.executeQuery(sql);

            boolean exists = rs.next();

            con.close();

            return exists;
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
            return false;
        }
    }

    public int generateRandomProductId() {
        Random rand = new Random();
        int num1 = rand.nextInt(1000);
        int num2 = rand.nextInt(1000);

        int id = num1 * num2;

        if (id == 0) {
            return generateRandomProductId();
        } else {
            return id;
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            int uniqueRandomNumber;
            do {
                uniqueRandomNumber = generateRandomProductId();
            } while (checkExistence(uniqueRandomNumber));

            String productid = Integer.toString(uniqueRandomNumber);
            String productName = request.getParameter("productname");
            String quantity = request.getParameter("quantity");
            String price = request.getParameter("price");
            String state = "pending";

            String jdbcUrl = "jdbc:mysql://localhost:3306/eshoping";
            String dbUsername = "root";
            String dbPassword = "";

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conn = DriverManager.getConnection(jdbcUrl, dbUsername, dbPassword);

                String query = "INSERT INTO product_for_sale (product_id, product_name, quantity, price, Status) VALUES (?, ?, ?, ?, ?)";
                PreparedStatement preparedStatement = conn.prepareStatement(query);
                preparedStatement.setString(1, productid);
                preparedStatement.setString(2, productName);
                preparedStatement.setString(3, quantity);
                preparedStatement.setString(4, price);
                preparedStatement.setString(5, state);

                int rowsInserted = preparedStatement.executeUpdate();

                if (rowsInserted > 0) {
                    out.println("Data inserted successfully!");
                } else {
                    out.println("Failed to insert data.");
                }

                conn.close();
            } catch (Exception e) {
                out.println("Error: " + e.getMessage());
            }
        }
    }
}
