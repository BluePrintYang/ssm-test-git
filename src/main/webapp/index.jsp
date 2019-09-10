<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="${pageContext.request.contextPath}/layui/css/layui.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/layui/layui.js" charset="utf-8"></script>
</head>
<body>

<a href="account/findAll">测试查询</a>

<h3>测试包</h3>

<form action="account/save" method="post">
    姓名：<input type="text" name="name"/><br/>
    金额：<input type="text" name="money"/><br/>
    <input type="submit" value="保存"/><br/>
</form>

<form action="account/saveSemester" method="post">
    开学日期：<input type="date" name="start_day" id="startDay"/><br>
    学期周数：<input type="number" name="total_weeks" id="totalWeeks"/><br>
    学期名称：<input type="text" name="semester_name" id="semesterName"/><br>
    <input type="submit" value="提交" onclick="submitSem()"/>
</form>

<a href="account/getCalendar">查看校历</a><br>
<a href="account/getCalendar2">查看校历(横向)</a>


</body>
</html>
