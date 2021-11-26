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
        <%
            request.setCharacterEncoding("UTF-8");
            String name = request.getParameter("name");
            People client = new People(name);
            HttpSession httpSession = request.getSession();
            httpSession.setAttribute("client", client);
        %>
        <table>
            <tr>
                <td align="center", valign="top">
                    <h1> <%= "Hello "+ client.getName()%></h1>
                    <br>
                    <p>Make your order</p>
                    <form action="OrderPage.jsp" method="post">
                        <select multiple name="goods[]">
                            <%
                                DataBase dataBase = DataBase.getDatabase();
                                String result = "";
                                for (Object entry : dataBase.getGoods().entrySet()) {
                                    Map.Entry<String, Double> e = (Map.Entry<String, Double>) entry;
                                    out.println("<option value=\"" + e.getKey() + "\">" + e.getKey() + ": " + e.getValue() + "руб." + "</option>");
                                }
                            %>
                        </select>
                        <p><input type="submit" value="Submit"></p>
                    </form>
                </td>
            </tr>
        </table>
    </div>

</body>
</html>
