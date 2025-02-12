<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="dal.OrderDetailDAO"%>
<%@page import="model.OrderDetail"%>
<%@page import="model.Order"%>
<%@page import="model.Perfume"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Order</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://kit.fontawesome.com/48a04e355d.js" crossorigin="anonymous"></script>
        <link href="css/style.css" rel="stylesheet">
        <style>
            body {
                background-color: #f8f9fa;
            }
            .card {
                margin-top: 20px;
                box-shadow: 0 4px 8px rgba(0,0,0,0.1);
                border-radius: 10px;
            }
            h1 {
                font-weight: bold;
                color: #343a40;
            }
            .btn-custom {
                border-radius: 20px;
                margin: 5px;
            }
            .main {
                background-color: #ffffff;
                border-radius: 10px;
                padding: 15px;
                margin-bottom: 15px;
            }
            .img-fluid {
                max-width: 80px;
                border-radius: 10px;
            }
            .order-info {
                font-size: 0.9em;
                color: #6c757d;
            }
        </style>
        <script type="text/javascript">
            function changeStatus(id, old_status, new_status) {
                if (old_status == 'denied') {
                } else if (old_status == 'complete') {
                } else if (old_status == 'confirming') {
                    if (new_status == 'denied' || new_status == 'preparing') {
                        window.location = "changeorderstatus?id=" + id + "&new_status=" + new_status;
                    }
                } else if (old_status == 'preparing') {
                    if (new_status == 'shipping') {
                        window.location = "changeorderstatus?id=" + id + "&new_status=" + new_status;
                    }
                } else {
                    if (new_status == 'complete') {
                        window.location = "changeorderstatus?id=" + id + "&new_status=" + new_status;
                    }
                }
            }
        </script>
    </head>
    <body>
        <jsp:include page="template/adminheader.jsp"/>
        <div class="container">
            <div class="card">
                <div class="card-body">
                    <h1>Order</h1>
                    <div class="d-flex justify-content-between mb-3">
                        <a href="adminvieworder"><button class="btn btn-outline-success btn-custom">All</button></a>
                        <a href="searchorder?status=denied"><button class="btn btn-outline-danger btn-custom">Denied</button></a>
                        <a href="searchorder?status=confirming"><button class="btn btn-outline-warning btn-custom">Confirming</button></a>
                        <a href="searchorder?status=preparing"><button class="btn btn-outline-info btn-custom">Preparing</button></a>
                        <a href="searchorder?status=shipping"><button class="btn btn-outline-primary btn-custom">Shipping</button></a>
                        <a href="searchorder?status=complete"><button class="btn btn-outline-success btn-custom">Complete</button></a>
                    </div>
                    <span>${requestScope.ms}</span>
                    <br/>
                    <div>
                        <% OrderDetailDAO od= new OrderDetailDAO();
                           request.setAttribute("od",od);
                        %>
                        <c:forEach items="${adminorders}" var="o">
                            <div class="main border-top">
                                <div class="d-flex justify-content-between">
                                    <div>
                                        <button class="btn btn-outline-secondary btn-sm" onclick="changeStatus(${o.id}, '${o.status}', 'denied')">Denied</button>
                                        <button class="btn btn-outline-secondary btn-sm" onclick="changeStatus(${o.id}, '${o.status}', 'preparing')">Prepare order</button>
                                        <button class="btn btn-outline-secondary btn-sm" onclick="changeStatus(${o.id}, '${o.status}', 'shipping')">Shipping</button>
                                        <button class="btn btn-outline-secondary btn-sm" onclick="changeStatus(${o.id}, '${o.status}', 'complete')">Complete</button>
                                    </div>
                                    <div class="order-info">
                                        <strong>${o.customer.username}</strong><br>
                                        ${o.address} | ${o.orderdate} | <span class="text-capitalize">${o.status}</span>
                                    </div>
                                </div>
                                <c:set var="sum" value="0"/>
                                <c:forEach items="${od.getOrderDetailsByOrderID(o.id)}" var="item">
                                    <div class="d-flex align-items-center border-bottom py-2">
                                        <div class="col-2">
                                            <img class="img-fluid" src="images/perfume/${item.getPerfume().image}" alt="${item.getPerfume().name}">
                                        </div>
                                        <div class="col">
                                            <strong>${item.getPerfume().name}</strong>
                                        </div>
                                        <div class="col">
                                            Quantity: ${item.quantity}
                                        </div>
                                        <div class="col">
                                            ${item.total}&dollar;
                                            <c:set var="price" value="${item.total}"/> 
                                            <c:set var="sum" value="${sum+price}"/>
                                        </div>
                                    </div>
                                </c:forEach>
                                <div class="d-flex justify-content-end mt-2">
                                    <strong>Total: ${sum}&dollar;</strong>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="template/footer.jsp"/>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    </body>
</html>
