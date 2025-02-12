<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PerfumeParadise</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Dancing+Script:wght@400;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Roboto', sans-serif;
        }
        .navbar {
            background-color: #fff;
            padding: 1rem 2rem;
            border-bottom: 1px solid #ccc;
        }
        .navbar-brand {
            font-family: 'Dancing Script', cursive;
            font-size: 2rem;
            color: #333;
        }
        .nav-link {
            color: #333 !important;
            font-size: 1rem;
            margin-left: 1rem;
        }
        .nav-link:hover {
            color: #ff6666 !important;
        }
        .carousel-caption {
            position: absolute;
            top: 50%;
            transform: translateY(-50%);
            text-align: left;
        }
        .carousel-caption h1 {
            font-family: 'Dancing Script', cursive;
            font-size: 3rem;
            font-weight: bold;
            color: #333;
            
        }
        .carousel-caption h2 {
            font-family: 'Dancing Script', cursive;
            font-size: 2rem;
            font-weight: bold;
            color: #333;
        }
        .carousel-caption a {
            font-size: 1rem;
            color: #fff;
            background-color: #ff6666;
            padding: 10px 20px;
            text-decoration: none;
            transition: background-color 0.3s, color 0.3s;
        }
        .carousel-caption a:hover {
            background-color: #cc0000;
            color: #fff;
        }
        .carousel-control-prev-icon,
        .carousel-control-next-icon {
            background-color: #000;
            padding: 10px;
            border-radius: 50%;
        }
        .carousel-inner img {
            width: 100%;
            height: 500px; /* Fixed height */
            object-fit: cover; /* Crop images to fit */
        }
    </style>
</head>
<body>

<header>
    <nav class="navbar navbar-expand-lg">
        <div class="container-fluid">
            <a class="navbar-brand" href="home">PerfumeParadise</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link" aria-current="page" href="home">Home</a>
                    </li>
                    <c:forEach items="${sessionScope.listC}" var="c">
                        <li class="nav-item">
                            <a class="nav-link" href="searchproduct?cid=${c.id}&u=0">${c.name}</a>
                        </li>
                    </c:forEach>
                    <li class="nav-item">
                        <a class="nav-link" aria-current="page" href="viewcart">Cart</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" aria-current="page" href="order">Order</a>
                    </li>
                    <li class="nav-item">
                        <c:if test="${sessionScope.account!=null}">
                            <a class="nav-link" href="profile">Account</a>
                        </c:if>
                        <c:if test="${sessionScope.account==null}">
                            <a class="nav-link" href="login">Login</a>
                        </c:if>
                    </li>
                </ul>
                <form class="d-flex" role="search" action="searchkeyword" method="get">
                    <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search" name="keyword">
                    <button class="btn btn-outline-success" type="submit">Search</button>
                </form>
            </div>
        </div>
    </nav>
</header>


<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
</body>
</html>
