<%@ page import="com.khatkevich.People" %>
<%@ page import="com.khatkevich.DataBase" %>
<%@ page import="java.util.Map" %><%--
  Created by IntelliJ IDEA.
  User: TaBletKa97
  Date: 23.11.2021
  Time: 01:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>Online Shop</title>
    <style type="text/css">
        TABLE {
            width: 100%; /* Ширина таблицы */
            height: 100%; /* Высота таблицы */
        }
    </style>
</head>
<body>
    <div>
        <table>
            <tr>
                <td align="center", valign="top">
                    <h1> Hello ${sessionScope.get("client").name} </h1>
                    <br>
                    <%
                        People client = (People) request.getSession().getAttribute("client");
                        if (!client.getOrder().isEmpty()) {
                            out.println("<p>You have already chosen:</p>");
                            for (int i = 0; i < client.getOrder().size(); i++) {
                                int number = i;
                                out.println(++number + ". " + client.getOrder().get(i) + ".<br>");
                            }
                        } else {
                            out.println("<p>Make your order</p>");
                        }
                    %>
                    <br>
                    <form action="/add" method="post">
                        <select name="item">
                            <%
                                DataBase dataBase = DataBase.getDatabase();
                                for (Object entry : dataBase.getGoods().entrySet()) {
                                    Map.Entry<String, Double> e = (Map.Entry<String, Double>) entry;
                                    out.println("<option value=\"" + e.getKey() + "\">" + e.getKey() + ": " + e.getValue() + "руб." + "</option>");
                                }
                            %>
                        </select>
                        <p><input type="submit" value="AddItem"> <button formaction="/OrderPage.jsp">Submit</button></p>
                    </form>
                </td>
            </tr>
        </table>
    </div>
</body>
</html>
