<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profile - Perfume Paradise</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Dancing+Script:wght@400;700&display=swap" rel="stylesheet">
    <link href="css/profile-style.css" rel="stylesheet"> <!-- Adjust path as needed -->
    <style>
        body {
          background-color: #333; /* Màu nền */
/*    font-family: 'Roboto', sans-serif;
    background-image: url('images/bannervip11.avif');  Đường dẫn tới ảnh nền 
    background-size: cover;  Đảm bảo ảnh nền phủ kín toàn bộ phần nền 
    background-repeat: no-repeat;  Không lặp lại ảnh 
    background-attachment: fixed;  Giữ ảnh nền cố định khi cuộn trang */
}
        .profile-container {
            margin-top: 50px;
        }
        .profile-heading {
            font-family: 'Dancing Script', cursive;
            font-size: 3rem;
            text-align: center;
            margin-bottom: 0px;
            color: #333; /* Adjust as needed */
        }
        .profile-btn-lg {
            border-radius: 25px;
            padding: 10px 20px;
            margin: 10px 10px; /* Adjust margin for spacing */
            background-color: #512da8; /* Primary button color */
            border: none;
            color: white;
            transition: background-color 0.3s;
        }
        .profile-btn-lg:hover {
            background-color: #cc0000; /* Darker shade on hover */
        }
        .profile-form-outline {
            margin-bottom: 20px;
        }
        .profile-form-control {
            border-radius: 25px;
            padding: 10px 20px;
        }
        .profile-btn-reset {
            background-color: #6c757d; /* Secondary button color */
            color: white;
        }
        .profile-btn-reset:hover {
            background-color: #5a6268; /* Darker shade on hover */
        }
        .profile-text-center h3 {
            color: red; /* Error message color */
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <jsp:include page="template/header2.jsp"/>
    <hr>
    <div class="container profile-container bootstrap snippet">
        <h1 class="profile-heading">Profile</h1>
        <div class="text-center mb-4"> <!-- Adjust margin-bottom as needed -->
            <a href="changepassword"><button class="btn profile-btn-lg">Change Password</button></a>
            <a href="logout"><button class="btn profile-btn-lg">Logout</button></a>
        </div>
        <!-- Form section -->
        <div class="row justify-content-center">
            <div class="col-md-8">
                <form action="profile" method="post">
                    <div class="tab-content">
                        <div class="tab-pane active" id="home">
                            <hr>
                            <div class="profile-form-outline">
                                <h4>Name</h4>
                                <input type="text" class="form-control profile-form-control" name="name" value="${account.name}" placeholder="Name">
                            </div>
                            <div class="profile-form-outline">
                                <h4>Phone</h4>
                                <input type="text" class="form-control profile-form-control" name="phone" value="${account.phone}" placeholder="Phone" >
                            </div>
                            <div class="profile-form-outline">
                                <h4>Email</h4>
                                <input type="text" class="form-control profile-form-control" name="email" value="${account.email}"  >
                            </div>
                            <div class="profile-form-outline">
                                <h4>Username</h4>
                                <input type="text" class="form-control profile-form-control" name="username" value="${account.username}"  >
                            </div>
                            <br>
                            <div class="text-center">
                                <button class="btn profile-btn-lg btn-success" type="submit"><i class="fas fa-save me-2"></i> Save</button>
                                <button class="btn profile-btn-lg profile-btn-reset" type="reset"><i class="fas fa-redo me-2"></i> Reset</button>
                                <h3 class="profile-text-center">${mess}</h3> <!-- Error message display -->
                            </div>
                        </div><!--/tab-pane-->
                    </div><!--/tab-content-->
                </form>
            </div>
        </div>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</body>
</html>
