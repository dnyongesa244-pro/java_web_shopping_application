import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class forgotpasswordservlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String Email = request.getParameter("email");
            String squestion = request.getParameter("securityQuestion");
            String answer = request.getParameter("answer");
            String password = request.getParameter("newPassword");

            // Defining database connection details
            String jdbcUrl = "jdbc:mysql://localhost:3306/eshoping"; // Change to your database URL
            String dbUsername = "root";
            String dbPassword = "";

            try {
                // Loading the MySQL JDBC driver
                Class.forName("com.mysql.cj.jdbc.Driver");

                Connection conn = DriverManager.getConnection(jdbcUrl, dbUsername, dbPassword);

                // Check if the email, security question, and answer match in the database
                String selectQuery = "SELECT Email FROM customerdatails WHERE Email = ? AND Securirty_Question = ? AND Answer = ?";
                PreparedStatement selectStatement = conn.prepareStatement(selectQuery);
                selectStatement.setString(1, Email);
                selectStatement.setString(2, squestion);
                selectStatement.setString(3, answer);

                ResultSet rs = selectStatement.executeQuery();
                if (rs.next()) {
                    // If the input matches the database, update the password
                    String updateQuery = "UPDATE customerdatails SET Password = ? WHERE Email = ?";
                    PreparedStatement updateStatement = conn.prepareStatement(updateQuery);
                    updateStatement.setString(1, password);
                    updateStatement.setString(2, Email);

                    int rowsUpdated = updateStatement.executeUpdate();

                    if (rowsUpdated > 0) {
                        RequestDispatcher rd = request.getRequestDispatcher("passwordchanged.jsp");
                        rd.forward(request, response);
                    } else {
                        out.println("<font color=red size=20>Password change failed<br>");
                        out.println("<a href=forgotpassword.jsp>Try Again!?");
                    }
                } else {
                    out.println("<font color=red size=20>Invalid email, security question, or answer<br>");
                    out.println("<a href=login.jsp>Try Again!?");
                }

                conn.close();
            } catch (SQLException e) {
                out.println("SQL Error: " + e.getMessage());
            } catch (Exception e) {
                out.println("Error: " + e.getMessage());
            }
        }
    }
}
