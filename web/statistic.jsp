<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="model.Stock"%>
<%@ page import="model.Selling"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Statistic</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://kit.fontawesome.com/48a04e355d.js" crossorigin="anonymous"></script>
    <link href="css/style.css" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>
</head>
<body>
    <jsp:include page="template/adminheader.jsp"/>
    <div class="container my-4">
        <div class="row text-center mb-4">
            <div class="col-md-3 col-sm-6">
                <div class="card border-0 shadow-sm">
                    <div class="card-body">
                        <h5 class="card-title">Customers</h5>
                        <p class="card-text display-4 text-primary">${ccount}</p>
                    </div>
                </div>
            </div>
            <div class="col-md-3 col-sm-6">
                <div class="card border-0 shadow-sm">
                    <div class="card-body">
                        <h5 class="card-title">Products</h5>
                        <p class="card-text display-4 text-success">${pcount}</p>
                    </div>
                </div>
            </div>
            <div class="col-md-3 col-sm-6">
                <div class="card border-0 shadow-sm">
                    <div class="card-body">
                        <h5 class="card-title">Complete Orders</h5>
                        <p class="card-text display-4 text-warning">${ocount}</p>
                    </div>
                </div>
            </div>
            <div class="col-md-3 col-sm-6">
                <div class="card border-0 shadow-sm">
                    <div class="card-body">
                        <h5 class="card-title">Total Earning</h5>
                        <p class="card-text display-4 text-danger">${totalprice}$</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-6 mb-4">
                <div class="card border-0 shadow-sm">
                    <div class="card-body">
                        <canvas id="stock" style="width:100%;"></canvas>
                    </div>
                </div>
            </div>
            <div class="col-lg-6 mb-4">
                <div class="card border-0 shadow-sm">
                    <div class="card-body">
                        <canvas id="selling" style="width:100%;"></canvas>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <%
        List<Stock> stocks = (List<Stock>) request.getAttribute("stocks");
        List<Selling> sellings = (List<Selling>) request.getAttribute("sellings");
    %>

    <script>
        var quantity = [];
        var perfume_name = [];
        var totalprice = [];
        var date = [];
        const barColors = ["#FF6384", "#36A2EB", "#FFCE56", "#4BC0C0"];

        <% for (Stock stock : stocks) { %>
        perfume_name.push('<%= stock.getPerfume_name() %>');
        quantity.push('<%= stock.getQuantity() %>');
        <% } %>
        
        <% for (Selling selling : sellings) { %>
        totalprice.push('<%= selling.getTotalprice() %>');
        date.push('<%= selling.getDate() %>');
        <% } %>

        new Chart(document.getElementById("stock"), {
            type: "bar",
            data: {
                labels: perfume_name,
                datasets: [{
                    backgroundColor: barColors,
                    data: quantity
                }]
            },
            options: {
                scales: {
                    yAxes: [{ ticks: { beginAtZero: true } }]
                },
                legend: { display: false },
                title: {
                    display: true,
                    text: "Top Selling Perfume"
                }
            }
        });

        new Chart(document.getElementById("selling"), {
            type: "line",
            data: {
                labels: date,
                datasets: [{
                    fill: false,
                    lineTension: 0.1,
                    backgroundColor: "rgba(75,192,192,0.4)",
                    borderColor: "rgba(75,192,192,1)",
                    data: totalprice
                }]
            },
            options: {
                scales: {
                    yAxes: [{ ticks: { beginAtZero: true } }]
                },
                legend: { display: false },
                title: {
                    display: true,
                    text: "Total Earnings Recently"
                }
            }
        });
    </script>

    <jsp:include page="template/footer.jsp"/>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>
