<%@page import="java.sql.*" %>
<%@page import="com.Tejas.FCCCP.*" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Faculty Course Choice Collection Portal</title>
    <link rel="stylesheet" href="CSS/index.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
</head>
<body>
    <div class="container">
        <aside class="sidebar">
            <div class="sidebar-header">
                <h2>Portal</h2>
            </div>
            <ul class="sidebar-menu">
               <li class="menu-item dropdown">
                    <a href="#" class="dropdown-toggle"><i class="fas fa-user"></i>Faculty<i class="fas fa-caret-down"></i></a>
                    <ul class="dropdown-content">
                    	<li><a href="addFaculty.html">Add Faculty</a></li>
                        <li><a href="viewFaculty.jsp">View Faculty</a></li>
                        <li><a href="deleteFaculty.jsp">Delete Faculty</a></li>
                    </ul>
                </li>
                <li class="menu-item dropdown">
                    <a href="#" class="dropdown-toggle"><i class="fas fa-user"></i>Course<i class="fas fa-caret-down"></i></a>
                    <ul class="dropdown-content">
                        <li><a href="addCourse.html">Add Course</a></li>
                        <li><a href="viewCourse.jsp">View Course</a></li>
                        <li><a href="deleteCourse.jsp">Delete Course</a></li>
                    </ul>
                </li>
            </ul>
        </aside>
        <div class="main-content">
            <nav class="navbar">
                <div class="navbar-left">
                    <span class="menu-toggle"><i class="fas fa-bars"></i></span>
                </div>
                <div class="navbar-right">
                    <div class="nav-item dropdown">
                        <span class="dropdown-toggle"><i class="fas fa-bell"></i> Notifications <i class="fas fa-caret-down"></i></span>
                        <ul class="dropdown-content">
                            <li><a href="#notifications">No new notifications</a></li>
                        </ul>
                    </div>
                    <div class="nav-item dropdown">
                        <span class="dropdown-toggle"><i class="fas fa-envelope"></i> Messages <i class="fas fa-caret-down"></i></span>
                        <ul class="dropdown-content">
                            <li><a href="#messages">No new messages</a></li>
                        </ul>
                    </div>
                    <div class="nav-item dropdown">
                        <span class="dropdown-toggle"><i class="fas fa-user"></i> Profile <i class="fas fa-caret-down"></i></span>
                        <ul class="dropdown-content">
                            <li><a href="index.html">Logout</a></li>
                        </ul>
                    </div>
                </div>
            </nav>
            <div class="content">
                <table class="data-table">
                	<tr>
                	<th>Id</th>
                	<th>Name</th>
                	<th>Age</th>
                	<th>Designation</th>
                	<th>Expertise</th>
                	<th>Experience</th>
                	<th>Email</th>
                	<th>Password</th>
                	<th>Delete</th>
                	</tr>
                <%
                Connection con = connectDB.dbCon();
                PreparedStatement ps = con.prepareStatement("select * from faculty");
                ResultSet rs=ps.executeQuery();
                while(rs.next())
                { %>
                	<tr>
                	<td> <%=rs.getInt(1)%> </td>
                	<td> <%=rs.getString(2)%> </td>
                	<td> <%=rs.getInt(3)%> </td>
                	<td> <%=rs.getString(4)%> </td>
                	<td> <%=rs.getString(5)%> </td>
                	<td> <%=rs.getString(6)%> </td>
                	<td> <%=rs.getString(7)%> </td>
                	<td> <%=rs.getString(8)%> </td>
                	 <td><a href="deleteHidden.jsp?searchKey=<%=rs.getInt("id") %>">Delete</a></td>
            
                	</tr>
               <% }
               
                %>
                </table>
                <div id="dynamic-content"></div>
            </div>
            <footer class="footer">
                <p>&copy; 2024 Faculty Course Choice Collection Portal. All rights reserved.</p>
                <ul class="footer-links">
                    <li><a href="#terms-of-service">Terms of Service</a></li>
                    <li><a href="#privacy-policy">Privacy Policy</a></li>
                    <li><a href="#contact-us">Contact Us</a></li>
                </ul>
            </footer>
        </div>
    </div>
    <script>
        document.querySelectorAll('.dropdown-toggle').forEach(item => {
            item.addEventListener('click', event => {
                const dropdownContent = event.target.nextElementSibling;
                if (dropdownContent.style.display === 'block') {
                    dropdownContent.style.display = 'none';
                } else {
                    dropdownContent.style.display = 'block';
                }
            });
        });

        window.onclick = function(event) {
            if (!event.target.matches('.dropdown-toggle')) {
                document.querySelectorAll('.dropdown-content').forEach(dropdown => {
                    dropdown.style.display = 'none';
                });
            }
        }
    </script>
</body>
</html>
