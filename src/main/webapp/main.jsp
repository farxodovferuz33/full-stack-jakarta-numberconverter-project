<%@ page import="uz.pdp.sanoq_sistemas.beans.MyBeans" %>
<%@ page import="java.util.Objects" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="uz.pdp.sanoq_sistemas.utils.DecimalUtil" %>
<html>
<head>
    <title>Main Page</title>
    <link rel="stylesheet" href="resources/css/main.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
</head>
<body style="background: lightgrey">
<div class="first">
    <h1>Please fill inputs to convert a number</h1>
    <a href="${pageContext.request.contextPath}/">
        <button class="button mx-3">Back to home page</button>
    </a>
</div>

<form method="get">
    <label for="number">Number</label><input class="form-control" type="text" name="number" id="number"
                                             placeholder="number">
    <br>

    <label for="baseIndex">In which index is your number</label>
    <select name="baseIndex" id="baseIndex" class="form-control">
        <option value="2">2</option>
        <option value="8">8</option>
        <option value="10">10</option>
        <option value="16">16</option>
    </select>

    <br>
    <label for="toIndex">To which index you want to convert</label>
    <select class="form-control" name="toIndex" id="toIndex">
        <option value="2">2</option>
        <option value="8">8</option>
        <option value="10">10</option>
        <option value="16">16</option>
    </select>

    <input class="btn btn-outline-dark my-3" type="submit" value="Convert">
</form>

<%
    MyBeans bean = new MyBeans();
    String number = request.getParameter("number");
    String baseIndex = request.getParameter("baseIndex");
    String toIndex = request.getParameter("toIndex");
    bean.setNumber(number);
    bean.setBaseIndex(baseIndex);
    bean.setToIndex(toIndex);
%>

<%
    if (Objects.nonNull(bean.getNumber()) && Objects.nonNull(bean.getBaseIndex()) &&
            Objects.nonNull(bean.getToIndex()) && !bean.getNumber().isEmpty() &&
            !bean.getBaseIndex().isEmpty() && !bean.getToIndex().isEmpty()) {
%>
<h6>The number want to convert: <span style="color: green"><%= bean.getNumber()%></span>
</h6>
<h6>The base index of number: <span style="color: green"><%= bean.getBaseIndex()%></span>
</h6>
<h6>The index number want to convert: <span style="color: green"><%= bean.getToIndex()%></span>
</h6>
<%int decimalFormatOfNumber = DecimalUtil.fromAnyToDecimal(baseIndex, number);%>
<%String result = DecimalUtil.fromDecimalToAny(decimalFormatOfNumber, toIndex);%>

<h2 style="color: orangered">Result in DECIMAL: <%= decimalFormatOfNumber%>
</h2>

<h2 style="color: darkgreen">Last result : <%= result%>
</h2>

<%}%>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
        crossorigin="anonymous"></script>

</body>
</html>


