<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Update Perfume</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://kit.fontawesome.com/48a04e355d.js" crossorigin="anonymous"></script>
    <link href="css/style.css" rel="stylesheet">
</head>
<body>
    <jsp:include page="template/adminheader.jsp"/>
    <div class="container">
        <form action="update_perfume?id=${item.id}" method="post">
            <div class="row mb-3">
                <div class="col-4">
                    <img class="img-fluid" src="images/perfume/${item.image}" alt="${item.name}">
                </div>
                <div class="col">
                    <div class="mb-3">
                        <label for="name" class="form-label">Name</label>
                        <input type="text" id="name" name="name" class="form-control" value="${item.name}" required>
                    </div>
                    <div class="row g-3 align-items-center">
                        <div class="col-auto">
                            Quantity: <input type="number" name="quantity" class="form-control" min="0" value="${item.quantity}" required>
                        </div>
                        <div class="col-auto">
                            Size(ml): <input type="number" name="size" class="form-control" min="0" value="${item.size}" required>
                        </div>
                        <div class="col-auto">
                            Price($): <input type="number" name="price" class="form-control" min="0" value="${item.price}" required>
                        </div>
                    </div>
                    <div class="row g-3 mt-3">
                        <div class="col">
                            <label for="cid" class="form-label">Category</label>
                            <select id="cid" name="cid" class="form-select" required>
                                <option value="${item.category.id}">${item.category.name}</option>
                                <c:forEach items="${sessionScope.listC}" var="c">
                                    <c:if test="${c.id != item.category.id}">
                                        <option value="${c.id}">${c.name}</option>
                                    </c:if>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="col">
                            <label for="bid" class="form-label">Brand</label>
                            <select id="bid" name="bid" class="form-select" required>
                                <option value="${item.brand.id}">${item.brand.name}</option>
                                <c:forEach items="${sessionScope.listB}" var="b">
                                    <c:if test="${b.id != item.brand.id}">
                                        <option value="${b.id}">${b.name}</option>
                                    </c:if>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="mt-3">
                        <button type="submit" class="btn btn-primary">Update</button>
                        <button type="reset" class="btn btn-secondary">Reset</button>
                    </div>
                </div>
            </div>
        </form>
        <span style="color:red">${ms}</span>
    </div>
    <jsp:include page="template/footer.jsp"/>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>
