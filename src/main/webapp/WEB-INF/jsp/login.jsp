<%--
  Created by IntelliJ IDEA.
  User: nbchen
  Date: 2019/7/11
  Time: 11:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h3><font color="red">${msg}</font></h3>
<form action="userLogin" method="post">
    用户名: <input type="text" name="username"> <br/>
    密码: <input type="password" name="userpwd"> <br/>
       <input type="submit" value="提交"> <br/>
</form>
</body>
</html>
