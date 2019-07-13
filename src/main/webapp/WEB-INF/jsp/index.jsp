<%--
  Created by IntelliJ IDEA.
  User: nbchen
  Date: 2019/7/11
  Time: 10:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<frameset rows="15%,*,10%" border="1">
    <frame src="head" scrolling="auto" name="head">
    <frameset cols="20%,*">
        <frame src="menu" scrolling="auto" name="menu">
        <frame src="body" scrolling="auto" name="body">
    </frameset>
    <frame src="foot" scrolling="auto" name="foot">
</frameset>
<noframes>
    <body>
        <p>对不起,你的浏览器不支持frameset</p>
    </body>
</noframes>

</html>
