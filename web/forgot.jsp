<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Forgot Password</title>
    <script src="https://kit.fontawesome.com/48a04e355d.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <style>
        body {
            background-color: #eee;
        }
        .card {
            border: none;
            border-radius: 20px;
            overflow: hidden;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .btn-primary {
            background: linear-gradient(45deg, #ff4b2b, #ff416c);
            border: none;
        }
        .btn-primary:hover {
            background: linear-gradient(45deg, #ff416c, #ff4b2b);
        }
        .form-control {
            border-radius: 10px;
        }
        .logo {
            width: 50%;
        }
    </style>
</head>
<body>
    <%@ include file="template/header2.jsp" %>
    <section class="h-100 gradient-form">
        <div class="container py-5 h-100">
            <div class="row d-flex justify-content-center align-items-center h-100">
                <div class="col-xl-8">
                    <div class="card">
                        <div class="card-body p-md-5 mx-md-4">
                            <div class="text-center">
                                <img src="images/logo.jpg" alt="logo" class="logo">
                                <h4 class="mt-1 mb-5 pb-1" style="font-family: 'Brush Script MT', cursive; color: #ff4b2b;">Perfume Paradise</h4>
                            </div>
                            <form action="forgot" method="post">
                                <h1 class="mb-4" style="font-family: 'Georgia', serif;">Forgot Password</h1>
                                <div class="form-outline mb-4">
                                    <input type="text" id="username" name="username" class="form-control" required />
                                    <label class="form-label" for="username">Username</label>
                                </div>
                                <div class="form-outline mb-4">
                                    <input type="email" id="email" name="email" class="form-control" required />
                                    <label class="form-label" for="email">Email</label>
                                </div>
                                <div class="text-center pt-1 mb-5 pb-1">
                                    <button class="btn btn-primary btn-block fa-lg gradient-custom-2 mb-3" type="submit">Reset Password</button>
                                    <br><span style="color: red;"><%= request.getAttribute("message") %></span>
                                </div>
                                <div class="text-center">
                                    <a href="login.jsp">Back to Login</a>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>
