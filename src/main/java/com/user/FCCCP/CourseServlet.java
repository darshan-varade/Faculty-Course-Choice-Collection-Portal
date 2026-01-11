package com.Tejas.FCCCP;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class CourseServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/your_database", "username", "password");
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM courses");

            StringBuilder json = new StringBuilder();
            json.append("[");
            while (rs.next()) {
                json.append("{");
                json.append("\"course_id\": ").append(rs.getInt("course_id")).append(",");
                json.append("\"course_name\": \"").append(rs.getString("course_name")).append("\",");
                json.append("\"course_description\": \"").append(rs.getString("course_description")).append("\"");
                json.append("},");
            }
            if (json.length() > 1) {
                json.setLength(json.length() - 1); // remove trailing comma
            }
            json.append("]");

            out.print(json.toString());
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            out.close();
        }
    }
}
