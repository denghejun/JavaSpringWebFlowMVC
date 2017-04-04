<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <title>Document</title>
</head>
<body>

<h1>Order Payment</h1>
<form:form method="post" modelAttribute="order">
    <table>
        <tr>
            <td><form:label path="id">id</form:label></td>
            <td><label>${order.id}</label></td>
            <td></td>
        </tr>
        <tr>
            <td><form:label path="payment">payment</form:label></td>
            <td><label>${order.payment}</label></td>
            <td></td>
        </tr>
        <tr>
            <td><form:label path="payUser">payUser</form:label></td>
            <td>
                <core:choose>
                    <core:when test="${order.hasPaid == false}">
                        <form:input path="payUser"></form:input>
                    </core:when>
                    <core:otherwise>
                        <label>${order.payUser}</label>
                    </core:otherwise>
                </core:choose>
            </td>
            <td><form:errors path="payUser" cssStyle="color: red"></form:errors></td>
        </tr>
        <tr>

            <core:choose>
                <core:when test="${order.hasPaid == false}">
                    <td><a href="${flowExecutionUrl}&_eventId=back">Back</a></td>
                    <td><input type="submit" value="Pay" name="_eventId_refresh"/></td>
                </core:when>
                <core:otherwise>
                    <td><p style="color: lawngreen">Pay Successfully.</p></td>
                    <td><a href="${flowExecutionUrl}&_eventId=backHome">Back Home</a></td>
                </core:otherwise>
            </core:choose>
        </tr>
    </table>
</form:form>
</body>
</html>