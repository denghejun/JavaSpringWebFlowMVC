<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <title>Document</title>
</head>
<body>
<h1>View Order</h1>
<%--<form:form method="post" modelAttribute="firstProduct">--%>
    <%--<table>--%>
        <%--<tr>--%>
            <%--<td><form:label path="id">id</form:label></td>--%>
            <%--<td><label>${firstProduct.id}</label></td>--%>
            <%--<td></td>--%>
        <%--</tr>--%>
        <%--<tr>--%>
            <%--<td><form:label path="description">description</form:label></td>--%>
            <%--<td><form:input path="description"></form:input></td>--%>
            <%--<td><form:errors cssStyle="color: red" path="description"></form:errors></td>--%>
        <%--</tr>--%>
        <%--<tr>--%>
            <%--<td><form:label path="price">price</form:label></td>--%>
            <%--<td><form:input path="price"></form:input></td>--%>
            <%--<td><form:errors cssStyle="color: red" path="price"></form:errors></td>--%>
        <%--</tr>--%>

    <%--</table>--%>



    <%--<a href="${flowExecutionUrl}&_eventId=back">Back</a>--%>
    <%--<input type="submit" name="_eventId_confirm" value="Confirm"/>--%>
<%--</form:form>--%>

<core:choose>
    <core:when test="${empty shoppingCart.items}">
        <p>Your Shopping Cart Is Empty.</p>
    </core:when>
    <core:otherwise>
        <table>
            <tr>
                <th>Item</th>
                <th>Qty</th>
                <th>Unit Price</th>
                <th style="color:red">Total</th>
            </tr>
            <core:forEach var="cartItem" items="${shoppingCart.items}">
                <tr>
                    <td>${cartItem.product.description}</td>
                    <td>${cartItem.quantity}</td>
                    <td>${cartItem.product.price}</td>
                    <td style="color: red">${cartItem.totalPrice}</td>
                </tr>
            </core:forEach>
            <tr>
                <td></td>
                <td></td>
                <td style="color: red">TOTAL:</td>
                <td style="color: red">${shoppingCart.totalPrice}</td>
            </tr>
        </table>
    </core:otherwise>
</core:choose>
<a href="${flowExecutionUrl}&_eventId=back">Back</a>
<a href="${flowExecutionUrl}&_eventId=confirm">Confirm</a>
</body>
</html>


