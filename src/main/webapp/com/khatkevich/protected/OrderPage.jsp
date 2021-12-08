<%@ page import="com.khatkevich.People" %>
<%@ page import="com.khatkevich.DataBase" %>
<%@ page import="java.util.ArrayList" %><%--
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
    <style type="text/css">
        TABLE {
            width: 100%; /* Ширина таблицы */
            height: 100%; /* Высота таблицы */
        }
    </style>
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
    <div>
        <table>
            <tr>
                <td align="center", valign="top">
                    <h1> <%="Dear "+ client.getName() + ",your order:"%></h1>
                    <br>
                    <%
                        DataBase dataBase = DataBase.getDatabase();
                        ArrayList<String> parameter = client.getOrder();
                        double summ = 0.0;
                        for(int i = 0; i < parameter.size(); i++) {
                            int j = i + 1;
                            double price = (double) dataBase.getGoods().get(parameter.get(i));
                            out.println("<p>"+ j +")"+parameter.get(i)+" "+ price +"</p>");
                            summ += price;
                        }
                        out.print("<p>Total: " + summ +"</p>");
                    %>
                </td>
            </tr>
        </table>
    </div>
</body>
</html>
