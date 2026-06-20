<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.ProfileBean"%>
<%
    ProfileBean p = (ProfileBean) request.getAttribute("profile");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Profile</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
    @import url('https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600&display=swap');

    body {
        font-family: 'Inter', sans-serif;
        background: linear-gradient(135deg, #ffc0cb, #ffe4e1);
        min-height: 100vh;
        display: flex;
        align-items: center;
        justify-content: center;
    }

    .form-card {
        background: #ffffff;
        border-radius: 18px;
        padding: 30px;
        width: 100%;
        max-width: 600px;
        box-shadow: 0 15px 40px rgba(0,0,0,0.1);
        border-top: 6px solid #F54927;
    }

    .form-title {
        text-align: center;
        color: #F54927;
        font-weight: 600;
        margin-bottom: 25px;
    }

    .form-label {
        font-size: 0.85rem;
        color: #555;
    }

    .form-control {
        border-radius: 10px;
        padding: 10px;
        font-size: 0.9rem;
        border: 1px solid #ddd;
        transition: 0.3s;
    }

    .form-control:focus {
        border-color: #F54927;
        box-shadow: 0 0 0 2px rgba(245, 73, 39, 0.2);
    }

    .readonly {
        background: #f9f9f9;
    }

    .btn {
        border-radius: 10px;
        padding: 10px;
        font-size: 0.9rem;
        transition: 0.3s;
    }

    .btn-save {
        background: #F54927;
        color: white;
        border: none;
    }

    .btn-save:hover {
        background: #ff6a4d;
    }

    .btn-cancel {
        border: 2px solid #F54927;
        color: #F54927;
    }

    .btn-cancel:hover {
        background: #F54927;
        color: white;
    }
    </style>
</head>

<body>

<div class="form-card">

    <h3 class="form-title">Update Student Profile</h3>

    <% if(p != null) { %>

    <form action="ProfileServlet" method="POST">
        <input type="hidden" name="action" value="update">

        <div class="mb-3">
            <label class="form-label">Student ID (Read-only)</label>
            <input type="text" name="studentId" class="form-control readonly"
                   value="<%= p.getStudentID() %>" readonly>
        </div>

        <div class="mb-3">
            <label class="form-label">Full Name</label>
            <input type="text" name="name" class="form-control"
                   value="<%= p.getName() %>" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Programme</label>
            <input type="text" name="program" class="form-control"
                   value="<%= p.getProgramme() %>" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Email Address</label>
            <input type="email" name="email" class="form-control"
                   value="<%= p.getEmail() %>" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Hobbies</label>
            <input type="text" name="hobbies" class="form-control"
                   value="<%= p.getHobbies() %>">
        </div>

        <div class="mb-3">
            <label class="form-label">Biography / Introduction</label>
            <textarea name="bio" class="form-control" rows="3"><%= p.getIntroduction() %></textarea>
        </div>

        <div class="d-grid gap-2 mt-4">
            <button type="submit" class="btn btn-save">Save Changes</button>
            <a href="ProfileServlet?action=view" class="btn btn-cancel">Cancel</a>
        </div>
    </form>

    <% } %>

</div>

</body>
</html>