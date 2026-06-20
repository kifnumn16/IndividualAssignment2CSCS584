<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="model.ProfileBean"%>
<%
    List<ProfileBean> listProfiles = (List<ProfileBean>) request.getAttribute("listProfiles");
    String currentSearch = (String) request.getAttribute("currentSearch");
    String currentFilter = (String) request.getAttribute("currentFilter");
    if(currentSearch == null) currentSearch = "";
    if(currentFilter == null) currentFilter = "";
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>All Student Profiles</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
    @import url('https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600&display=swap');

    body {
        font-family: 'Inter', sans-serif;
        background: linear-gradient(135deg, #ffc0cb, #ffe4e1);
        min-height: 100vh;
        padding: 30px;
    }

    .container {
        max-width: 1200px;
    }
    .page-header {
        text-align: center;
        color: #F54927;
        font-weight: 600;
        margin-bottom: 25px;
    }
    .top-bar {
        background: #ffffff;
        padding: 20px;
        border-radius: 16px;
        margin-bottom: 25px;
        box-shadow: 0 8px 20px rgba(0,0,0,0.08);
    }
    .profile-card {
        background: #ffffff;
        border-radius: 18px;
        padding: 20px;
        height: 100%;
        border-left: 6px solid #F54927;
        box-shadow: 0 10px 25px rgba(0,0,0,0.08);
        transition: 0.3s;
    }

    .profile-card:hover {
        transform: translateY(-5px);
        box-shadow: 0 15px 35px rgba(0,0,0,0.12);
    }

    .profile-name {
        font-size: 1.2rem;
        font-weight: 600;
        color: #F54927;
    }

    .profile-id {
        font-size: 0.8rem;
        color: #888;
        margin-bottom: 10px;
    }

    .profile-info {
        font-size: 0.9rem;
        margin-bottom: 5px;
        color: #444;
    }

    .profile-bio {
        background: #fff4f2;
        padding: 10px;
        border-radius: 10px;
        font-size: 0.85rem;
        margin-top: 10px;
    }
    .btn {
        border-radius: 10px;
        font-size: 0.85rem;
    }

    .btn-edit {
        background: #F54927;
        color: white;
        border: none;
    }

    .btn-edit:hover {
        background: #ff6a4d;
    }

    .btn-delete {
        border: 2px solid #F54927;
        color: #F54927;
    }

    .btn-delete:hover {
        background: #F54927;
        color: white;
    }

    </style>
</head>

<body>

<div class="container">

    <h2 class="page-header">Registered Student Profiles</h2>
    <div class="top-bar">
        <form action="ProfileServlet" method="GET" class="row g-2">
            <input type="hidden" name="action" value="view">

            <div class="col-md-5">
                <input type="text" name="searchQuery" class="form-control"
                       placeholder="Search by Student ID or Name..."
                       value="<%= currentSearch %>">
            </div>

            <div class="col-md-4">
                <input type="text" name="filterProgramme" class="form-control"
                       placeholder="Filter by Programme..."
                       value="<%= currentFilter %>">
            </div>

            <div class="col-md-3 d-flex gap-2">
                <button class="btn btn-primary w-100">Apply</button>
                <a href="ProfileServlet?action=view" class="btn btn-secondary w-100">Reset</a>
            </div>
        </form>
    </div>
    <div class="row g-4">
        <%
            if(listProfiles != null && !listProfiles.isEmpty()) {
                for(ProfileBean p : listProfiles) {
        %>

        <div class="col-md-4">
            <div class="profile-card">

                <div class="profile-name"><%= p.getName() %></div>
                <div class="profile-id">ID: <%= p.getStudentID() %></div>

                <div class="profile-info"><b>Programme:</b> <%= p.getProgramme() %></div>
                <div class="profile-info"><b>Email:</b> <%= p.getEmail() %></div>
                <div class="profile-info"><b>Hobbies:</b> <%= p.getHobbies() != null ? p.getHobbies() : "-" %></div>

                <div class="profile-bio">
                    <b>Bio:</b><br>
                    <%= p.getIntroduction() != null ? p.getIntroduction() : "-" %>
                </div>

                <div class="d-flex gap-2 mt-3">
                    <a href="ProfileServlet?action=editForm&studentId=<%= p.getStudentID() %>"
                       class="btn btn-edit w-50">Edit</a>

                    <a href="ProfileServlet?action=delete&studentId=<%= p.getStudentID() %>"
                       class="btn btn-delete w-50"
                       onclick="return confirm('Delete <%= p.getName() %>?');">Delete</a>
                </div>

            </div>
        </div>

        <%
                }
            } else {
        %>

        <p class="text-center text-muted">No registered student profiles found.</p>

        <%
            }
        %>
    </div>
    <div class="text-center mt-4">
        <a href="menu.html" class="btn btn-outline-dark">Back to Menu</a>
    </div>

</div>

</body>
</html>