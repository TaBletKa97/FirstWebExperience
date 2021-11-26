<html>
<body>
<h2>Hello World!</h2>
    <%
        RequestDispatcher dispatcher = request.getRequestDispatcher("/HelloPage.jsp");
        dispatcher.forward(request , response);
    %>
</body>
</html>
