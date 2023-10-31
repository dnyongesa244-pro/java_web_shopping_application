<%@ page import="jakarta.servlet.RequestDispatcher" %>
<%
    String adminChoice = request.getParameter("adminChoice");
    RequestDispatcher rd = null;
    if (adminChoice.equals("yes")) {
        // Redirect to admin page
        rd = request.getRequestDispatcher("admin.jsp");
    } else if (adminChoice.equals("no")) {
        // Redirect to home page
        rd = request.getRequestDispatcher("homepage.jsp");
    }
    rd.forward(request, response);
%>
