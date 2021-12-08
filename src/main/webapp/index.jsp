<html>
<body>
<h2>Hello World!</h2>
    <%
        RequestDispatcher dispatcher = request.getRequestDispatcher("/hello");
        dispatcher.forward(request , response);
    %>
</body>
</html>
