import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class loginservlet1 extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String Email = request.getParameter("txtname");
            String password = request.getParameter("txtpassword");

            // Defining database connection details
            String jdbcUrl = "jdbc:mysql://localhost:3306/eshoping"; // Change to your database URL
            String dbUsername = "root";
            String dbPassword = "";

            try {
                // Loading the MySQL JDBC driver
                Class.forName("com.mysql.cj.jdbc.Driver");

                Connection conn = DriverManager.getConnection(jdbcUrl, dbUsername, dbPassword);

                String query = "SELECT * FROM customerdatails WHERE Email = ? and Password = ?";
                PreparedStatement preparedStatement = conn.prepareStatement(query);
                preparedStatement.setString(1, Email);
                preparedStatement.setString(2, password);

                ResultSet rs = preparedStatement.executeQuery();
                if (rs.next()) {
                    // Assuming "admin" is the value for admin access in the access_level column
                    String accessLevel = rs.getString("access_level");
                    if ("admin".equals(accessLevel)) {
        // Display a confirmation page
        out.println("Do you want to log in as an admin?");
        out.println("<form method='post' action='http://localhost/shoppingapp/admin.php'>");
        out.println("<input type='hidden' name='txtname' value='" + Email + "'>");
        out.println("<input type='hidden' name='txtpassword' value='" + password + "'>");
        out.println("<button type='submit' name='adminChoice' value='yes'>Yes</button>");
        out.println("<button type='submit' name='adminChoice' value='no'>No</button>");
        out.println("</form>");
    } else {
        // Proceed as a regular user
        out.println("User Login Success!");
        RequestDispatcher rd = request.getRequestDispatcher("homepage.jsp");
        rd.forward(request, response);
    }
                } else { 
                    out.println("<font color=red size=20>Login Failed<br>");
                    out.println("<a href=login.jsp>Try Again!?");
                }

                conn.close();
            } catch (Exception e) { 
                out.println("Error: " + e.getMessage());
            }
        }
    }
}
