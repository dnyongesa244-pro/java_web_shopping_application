import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class singup extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String FirstName = request.getParameter("fname");
            String LastName = request.getParameter("lname");
            String Gender = request.getParameter("gender");
            String Email = request.getParameter("email");
            String PhoneNo = request.getParameter("pnumber");
            String Password = request.getParameter("password");
            String Address = request.getParameter("address");
            String Security_Question = request.getParameter("squestion");
            String Answer = request.getParameter("answer");

            // Defining  database connection details
            String jdbcUrl = "jdbc:mysql://localhost:3306/eshoping"; // Change to your database URL
            String dbUsername = "root";
            String dbPassword = "";

            try {
                // Loading the MySQL JDBC driver
                Class.forName("com.mysql.cj.jdbc.Driver");

                Connection conn = DriverManager.getConnection(jdbcUrl, dbUsername, dbPassword);

                String query = "INSERT INTO customerdatails (First_name, Last_Name, Gender, Email, Phone_Number, Password, Address, Securirty_Question, Answer) VALUES (?, ?, ? , ?, ?, ? ,? ,? ,?)";
                PreparedStatement preparedStatement = conn.prepareStatement(query);
                preparedStatement.setString(1, FirstName);
                preparedStatement.setString(2, LastName);
                preparedStatement.setString(3, Gender);
                preparedStatement.setString(4, Email);
                preparedStatement.setString(5, PhoneNo);
                preparedStatement.setString(6, Password);
                preparedStatement.setString(7, Address);
                preparedStatement.setString(8, Security_Question);
                preparedStatement.setString(9, Answer);
                 

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
