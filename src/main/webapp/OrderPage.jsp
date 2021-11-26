<%@ page import="com.khatkevich.People" %>
<%@ page import="com.khatkevich.DataBase" %><%--
  Created by IntelliJ IDEA.
  User: TaBletKa97
  Date: 23.11.2021
  Time: 18:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Your order</title>
</head>
<body>
    <%
        request.setCharacterEncoding("UTF-8");
        HttpSession httpSession = request.getSession();
        People client = (People) httpSession.getAttribute("client");
        if(client == null) {
            out.print("ERROR");
        }
    %>
    <table>
        <tr>
            <td align="center", valign="top">
                <h1> <%="Dear "+ client.getName() + ",your order:"%></h1>
                <br>
                <%
                    DataBase dataBase = DataBase.getDatabase();
                    String[] parameter = request.getParameterValues("goods[]");
                    double summ = 0.0;
                    for(int i = 0; i < parameter.length; i++) {
                        int j = i + 1;
                        double price = (double) dataBase.getGoods().get(parameter[i]);
                        out.println("<p>"+ j +")"+parameter[i]+" "+ price +"</p>");
                        summ += price;
                    }
                    out.print("<p>Total: " + summ +"</p>");
                %>
            </td>
        </tr>
    </table>
</body>
</html>
