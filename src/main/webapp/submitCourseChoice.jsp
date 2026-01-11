<%@ page import="java.io.*,javax.servlet.*,javax.servlet.http.*" %>

<%@page import="java.sql.*" %>
<%@page import="com.Tejas.FCCCP.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Faculty Course Choice Collection Portal</title>
    <link rel="stylesheet" href="CSS/index.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <style>
        .form-container {
            margin: 20px 0;
            padding: 20px;
            background-color: #f9f9f9;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        .form-container label {
            display: block;
            margin-bottom: 8px;
            font-weight: 600;
        }
        .form-container select,
        .form-container input[type="checkbox"] {
            margin-bottom: 16px;
        }
        .form-container button {
            padding: 10px 20px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-family: 'Poppins', sans-serif;
            font-size: 16px;
        }
        .form-container button:hover {
            background-color: #0056b3;
        }
    </style>
    <script>
        function validateForm(event) {
            const checkboxes = document.querySelectorAll('input[name="course"]:checked');
            if (checkboxes.length !== 3) {
                alert('Please select exactly three courses.');
                event.preventDefault();
                return false;
            }
            return true;
        }
    </script>
</head>
<body>
    <div class="container">
        <aside class="sidebar">
            <!-- Sidebar content -->
        </aside>
        <div class="main-content">
            <nav class="navbar">
                <!-- Navbar content -->
            </nav>
            <div class="content">
                <div class="form-container">
                    <form action="SubmitChoices" method="get" onsubmit="validateForm(event)">
                        <% 
                        String query = null;
                        String year = request.getParameter("year");
                        String sem = request.getParameter("sem");
                        
                        if ("sy".equals(year) && "sem1".equals(sem)) {
                            query = "SELECT name FROM course WHERE sem = 3";
                        } else if ("sy".equals(year) && "sem2".equals(sem)) {
                            query = "SELECT name FROM course WHERE sem = 4";
                        } else if ("ty".equals(year) && "sem1".equals(sem)) {
                            query = "SELECT name FROM course WHERE sem = 5";
                        } else if ("ty".equals(year) && "sem2".equals(sem)) {
                            query = "SELECT name FROM course WHERE sem = 6";
                        } else if ("btech".equals(year) && "sem1".equals(sem)) {
                            query = "SELECT name FROM course WHERE sem = 7";
                        } else if ("btech".equals(year) && "sem2".equals(sem)) {
                            query = "SELECT name FROM course WHERE sem = 8";
                        }

                        if (query != null) {
                            Connection con = connectDB.dbCon();
                            PreparedStatement ps = con.prepareStatement(query);
                            ResultSet rs = ps.executeQuery();
                            while (rs.next()) { %>
                                <input type="hidden" name="facultyname" value="<%=GetTeacherName.getName()%>" />
                                <label>
                                    <input type="checkbox" name="course" value="<%= rs.getString("name") %>">
                                    <%= rs.getString("name") %>
                                </label>
                            <% }
                            rs.close();
                            ps.close();
                            con.close();
                        } %>
                        <button type="submit">Submit</button>
                    </form>
                </div>
                <div id="dynamic-content"></div>
            </div>
            <footer class="footer">
                <!-- Footer content -->
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
        };

        const checkboxes = document.querySelectorAll('input[type="checkbox"]');
        checkboxes.forEach(checkbox => {
            checkbox.addEventListener('change', () => {
                const checkedCount = document.querySelectorAll('input[type="checkbox"]:checked').length;
                if (checkedCount >= 3) {
                    checkboxes.forEach(box => {
                        if (!box.checked) {
                            box.disabled = true;
                        }
                    });
                } else {
                    checkboxes.forEach(box => {
                        box.disabled = false;
                    });
                }
            });
        });

        function handleSubmit(event) {
            event.preventDefault();
            const form = event.target;
            const submitButton = form.querySelector('button[type="submit"]');
            submitButton.disabled = true;
            submitButton.textContent = 'Submitting...';
            form.submit(); // Submits the form
        }
    </script>
</body>
</html>
