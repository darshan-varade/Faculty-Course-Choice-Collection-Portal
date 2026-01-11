package com.Tejas.FCCCP;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
public class SubmitChoices extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String[] selectedCourses = request.getParameterValues("course");
        String facultyName = request.getParameter("facultyname");

        // Debug statements to log the received parameters
        System.out.println("Faculty Name: " + facultyName);
        if (selectedCourses != null) {
            for (String course : selectedCourses) {
                System.out.println("Selected Course: " + course);
            }
        } else {
            System.out.println("No courses selected");
        }

        if (selectedCourses != null && selectedCourses.length == 3 && facultyName != null) {
            Connection con = null;
            PreparedStatement ps = null;
            try {
                con = connectDB.dbCon();
                String query = "INSERT INTO faculty_courses (name, choice_1, choice_2, choice_3) VALUES (?, ?, ?, ?)";
                ps = con.prepareStatement(query);

                ps.setString(1, facultyName);
                ps.setString(2, selectedCourses[0]);
                ps.setString(3, selectedCourses[1]);
                ps.setString(4, selectedCourses[2]);

                ps.executeUpdate();

                response.sendRedirect("FacultyOperation.html"); // Redirect to a success page

            } catch (SQLException e) {
                e.printStackTrace();
                response.sendRedirect("error.jsp"); // Redirect to an error page
            } finally {
                if (ps != null) {
                    try {
                        ps.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
                if (con != null) {
                    try {
                        con.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
            }
        } else {
            response.sendRedirect("error.jsp"); // Redirect to an error page if no courses were selected or facultyName is missing
        }
    }
}
