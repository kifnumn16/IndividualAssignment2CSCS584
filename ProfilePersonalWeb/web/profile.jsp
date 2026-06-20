<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.ProfileBean"%>
<%
    ProfileBean profile = (ProfileBean) request.getAttribute("savedProfile");
%>
<!DOCTYPE html>
<html lang="ms">
<head>
    <meta charset="UTF-8">
    <title>Registration Success</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/all.min.css" rel="stylesheet">

    <style>
    @import url('https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600&display=swap');

    body {
        font-family: 'Inter', sans-serif;
        background: linear-gradient(135deg, #ffc0cb, #ffe4e1);
        min-height: 100vh;
    }
    .success-box {
        background: #ffffff;
        border-radius: 16px;
        padding: 25px;
        text-align: center;
        box-shadow: 0 10px 30px rgba(0,0,0,0.1);
    }

    .success-icon {
        font-size: 40px;
        color: #F54927;
        margin-bottom: 10px;
    }
    .profile-card {
        background: #ffffff;
        border-radius: 18px;
        padding: 25px;
        box-shadow: 0 15px 40px rgba(0,0,0,0.1);
        border-top: 6px solid #F54927;
    }
    .section-title {
        font-weight: 600;
        color: #F54927;
        margin-bottom: 20px;
    }
    .info-item {
        margin-bottom: 15px;
    }

    .info-label {
        font-size: 0.8rem;
        color: #888;
    }

    .info-value {
        font-size: 0.95rem;
        font-weight: 500;
        color: #333;
    }
    .bio-box {
        background: #fff4f2;
        padding: 15px;
        border-radius: 10px;
        font-size: 0.9rem;
        white-space: pre-line;
    }
    .btn {
        border-radius: 10px;
        padding: 10px;
        font-size: 0.9rem;
        transition: 0.3s;
    }

    .btn-primary {
        background: #F54927;
        border: none;
    }

    .btn-primary:hover {
        background: #ff6a4d;
    }

    .btn-outline {
        border: 2px solid #F54927;
        color: #F54927;
    }

    .btn-outline:hover {
        background: #F54927;
        color: white;
    }
    </style>
</head>

<body>

<div class="container mt-5">

    <!-- Success Message -->
    <div class="success-box mx-auto mb-4" style="max-width: 600px;">
        <div class="success-icon">
            <i class="fas fa-check-circle"></i>
        </div>
        <h4 class="fw-bold">Profile Successfully Created!</h4>
        <p class="text-muted mb-0">The record has been saved into the database.</p>
    </div>

    <% if (profile != null) { %>

    <!-- Profile Display -->
    <div class="profile-card mx-auto" style="max-width: 600px;">

        <h5 class="section-title text-center">Submitted Student Information</h5>

        <div class="row">

            <div class="col-md-6 info-item">
                <div class="info-label">Student ID</div>
                <div class="info-value"><%= profile.getStudentID() %></div>
            </div>

            <div class="col-md-6 info-item">
                <div class="info-label">Full Name</div>
                <div class="info-value"><%= profile.getName() %></div>
            </div>

            <div class="col-md-6 info-item">
                <div class="info-label">Programme</div>
                <div class="info-value"><%= profile.getProgramme() %></div>
            </div>

            <div class="col-md-6 info-item">
                <div class="info-label">Email</div>
                <div class="info-value text-muted"><%= profile.getEmail() %></div>
            </div>

            <div class="col-12 info-item">
                <div class="info-label">Hobbies</div>
                <div class="info-value">
                    <%= (profile.getHobbies() != null && !profile.getHobbies().trim().isEmpty()) ? profile.getHobbies() : "-" %>
                </div>
            </div>

            <div class="col-12 info-item">
                <div class="info-label">Biography</div>
                <div class="bio-box">
                    <%= (profile.getIntroduction() != null && !profile.getIntroduction().trim().isEmpty()) ? profile.getIntroduction() : "-" %>
                </div>
            </div>

        </div>

        <!-- Buttons -->
        <div class="d-grid gap-2 mt-4">
            <a href="index.html" class="btn btn-primary">
                <i class="fas fa-plus"></i> Add New Record
            </a>

            <a href="ProfileServlet?action=view" class="btn btn-outline">
                <i class="fas fa-list"></i> View All Records
            </a>

            <a href="menu.html" class="btn btn-secondary">
                <i class="fas fa-home"></i> Main Menu
            </a>
        </div>

    </div>

    <% } else { %>

    <div class="alert alert-warning text-center mx-auto mt-4" style="max-width: 600px;">
        <i class="fas fa-exclamation-triangle"></i> Tiada objek profil ditemui.
    </div>

    <% } %>

</div>

</body>
</html>