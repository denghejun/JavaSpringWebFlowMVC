<%--输入html:xt ＋ Table键 即可快速生成html标注模版--%>
<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <title>Document</title>
</head>
<body>
<h1>View Cart</h1>
<table>
    <tr>
        <td style="vertical-align: top">
            <%--1. products list--%>
            <div>
                <div class="content">
                    <h4>Products for Your Choice</h4>
                    <table>
                        <core:forEach var="product" items="${products}">
                            <tr>
                                <td>${product.id}</td>
                                <td>${product.description}</td>
                                <td>${product.price}</td>
                                <td>
                                    <a href="${flowExecutionUrl}&_eventId=addToShoppingCart&productId=${product.id}">
                                        [${shoppingCart.getProductQuantityFormat(product.id)}]
                                    </a>
                                </td>
                            </tr>
                        </core:forEach>
                    </table>
                </div>
            </div>
        </td>
        <td style="vertical-align: top">
            <%--2. shopping cart--%>
            <div>
                <h4>Items in Your Cart</h4>
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
            </div>
            <div style="float: right" class="footer">
                <a href="${flowExecutionUrl}&_eventId=back">Back</a>
                <a href="${flowExecutionUrl}&_eventId=submit">Submit</a>
            </div>
        </td>
    </tr>
</table>
</body>
</html>
