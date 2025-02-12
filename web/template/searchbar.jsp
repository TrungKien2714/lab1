<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
    <style>
        .form-container {
            background: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            max-width: 400px;
            width: 100%;
            margin: 0 auto;
        }
        .form-group {
            margin-bottom: 15px;
            display: flex;
            flex-direction: column;
        }
        .form-group label {
            margin-bottom: 5px;
            font-weight: bold;
        }
        .form-group input, .form-group select {
            padding: 8px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 4px;
            width: 100%;
        }
        .form-actions {
            display: flex;
            justify-content: space-between;
        }
        .form-actions input {
            padding: 10px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            color: #fff;
            width: 48%;
        }
        .form-actions input[type="submit"] {
            background-color: #28a745;
        }
        .form-actions input[type="reset"] {
            background-color: #dc3545;
        }
    </style>
</head>
<body>

<div class="form-container">
    <form>
        <div class="form-group">
            <label for="brand">Brand</label>
            <select name="bid" id="brand">
                <option value="0">All</option>
                <c:forEach items="${sessionScope.listB}" var="b">
                    <option value="${b.id}">${b.name}</option>
                </c:forEach>
            </select>
        </div>
        <div class="form-group">
            <label for="category">Category</label>
            <select name="cid" id="category">
                <option value="0">All</option>
                <c:forEach items="${sessionScope.listC}" var="c">
                    <option value="${c.id}">${c.name}</option>
                </c:forEach>
            </select>
        </div>
        <div class="form-group">
            <label for="min-price">Minimum Price</label>
            <input type="number" min="0" name="minimumprice" id="min-price"/>
        </div>
        <div class="form-group">
            <label for="max-price">Maximum Price</label>
            <input type="number" min="0" name="maximumprice" id="max-price"/>
        </div>
        <div class="form-group">
            <label for="from-date">From</label>
            <input type="date" name="fromdate" id="from-date"/>
        </div>
        <div class="form-group">
            <label for="to-date">To</label>
            <input type="date" name="todate" id="to-date"/>
        </div>
        <div class="form-actions">
            <input type="submit" value="Search"/>
            <input type="reset" value="Reset"/>
        </div>
    </form>
</div>

</body>
</html>
