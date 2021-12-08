<%@ page import="java.util.Enumeration" %><%--
  Created by IntelliJ IDEA.
  User: TaBletKa97
  Date: 30.11.2021
  Time: 11:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Error</title>
</head>
<body>
    <h1 align="center">Error</h1>
    <%
        Enumeration<String> parameterNames = request.getParameterNames();
        if (parameterNames.hasMoreElements()) {
            out.println(parameterNames.nextElement());
        }

    %>
</body>
</html>
