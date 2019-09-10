<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>

<html>
<head>
    <title>校历</title>
</head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/table.css">
<body>

<table  class="gradable">
    <thead>
    <tr>
        <th>学期名</th>
        <th>开学日期</th>
        <th>学期周数</th>
    </tr>
    </thead>
    <tbody>

    <c:forEach items="${calendar}" var="calendar">

        <tr>
            <td >${calendar.semester_name}</td>
            <td >${calendar.start_day} </td>
            <td >${calendar.total_weeks}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>

<br>
周数：${weeks}<br>
开学日期：${startDay}<br>
学期：${semName}<br>
<table id="SchoolCalendar" class="gradable">
    <tr>
        <th>周次</th>
        <th>星期一</th>
        <th>星期二</th>
        <th>星期三</th>
        <th>星期四</th>
        <th>星期五</th>
        <th>星期六</th>
        <th>星期日</th>
    </tr>

</table>

</body>

<script>


    var month = ["月份", "一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"];
    var days = [0, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]; //十二个月每个月的天数
    var days1 = [0, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
    var str = "${startDay}"; //假设输入的日期是2019.4.5
    var mystr = str.split("."); //对字符串2019.4.5进行提取
    var y = parseInt(mystr[0]); //将字符串转为整型
    var m = parseInt(mystr[1]); //将字符串转为整型
    var d = parseInt(mystr[2]); //将字符串转为整型
    var str2 = y + "-" + m + "-" + d; //将2019.4.5转为2019-4-5
    var judge = new Date(str2).getDay(); //判断输入的日期是星期几  judge返回数字，0-6分别表示周日-周六
    var weeks =  "${weeks}"; //假设输入的周数为4
    if ((y % 4 === 0 && y % 100 !== 0) || y % 400 === 0) { //判断年数是否为闰年，调整二月份的天数
        days[2] = 29;
        days1[2] = 29;
    }
    days[m] = days[m] - d + 1; //用起始月减去起始日期，得到起始月所剩的天数
    var sum_days = weeks * 7; //总共的天数
    var check_1 = 0; //检验是否跨年
    var sum = 0;
    for (var i = m; sum <= sum_days; i++) { //得到最后的月份是什么
        if (i >= 13) {
            i = i % 12; //超过12，进行取余操作
            check_1 = 1;
        }
        sum = sum + days[i];
        var last_mon = i; //代表最后一个月的月份
    }


    var daydata = [];
    // for (var k = 0; k < weeks; k++) {
    //     daydata[k] = new Array();
    // }

    sum = 0;
    if (check_1 === 0) {
        var count = 0;
        for (i = m; i <= last_mon; i++) { //将日期(几日)存入数组，因为html表格是一行一行生成的，所要的表格中的日期是一列一列的，所以这样就可以一行一行地写入数据
            for (var j = d; sum < sum_days; j++) { //间隔正好为7
                if (j > days1[i]) {
                    d = 1;
                    break;
                }
                var mm = i + "月" + j +"日";
                daydata.push(mm);
                // if (j < 10) document.write("0" + j + " ");
                // else document.write(j + " ");
                // count++;
                // if (count % 7 == 0) document.write("<br>");
                sum = sum + 1;
            }
        }
    } else {
        count = 0;
        for (i = m; i <= 12; i++) {
            for (j = d; sum < sum_days; j++) {
                if (j > days1[i]) {
                    d = 1;
                    break;
                }
                mm = i + "月" + j +"日";
                daydata.push(mm);
                // if (j < 10) document.write("0" + j + " ");
                // else document.write(j + " ");
                // count++;
                // if (count % 7 == 0) document.write("<br>");
                sum = sum + 1;
            }
        }
        for ( i = 1; i <= last_mon; i++) {
            for (j = 1; sum < sum_days; j++) {
                if (j > days1[i]) {
                    d = 1;
                    break;
                }
                 mm = i + "月" + j +"日";
                daydata.push(mm);
                // if (j < 10) document.write("0" + j + " ");
                // else document.write(j + " ");
                // count++;
                // if (count % 7 == 0) document.write("<br>");
                sum = sum + 1;
            }
        }
    }

    //将数据转换为二维数组
    var daydata2 = new Array(Math.ceil(daydata.length / 7));

    for ( i = 0; i < daydata2.length; i++) {

        daydata2[i] = [];

    }

    for (j = 0; j < daydata.length; j++) {

        daydata2[parseInt(j / 7)][j % 7] = daydata[j];

    }




    //填充表格
    var weekNumber = "${weeks}";
    var wsTable = document.getElementById("SchoolCalendar");

    function createWeeklyScheduleTr(trHeadText, trMsg) {
        var tr = document.createElement("tr");
        var th0 = document.createElement("th"); //第一列
        th0.innerHTML = trHeadText;
        tr.appendChild(th0);

        var wsArrayList = eval(trMsg);

        for (var i = 0; i < wsArrayList.length; i++) {
            var td = document.createElement("td");
            td.innerHTML = wsArrayList[i];
            tr.appendChild(td);
        }
        wsTable.appendChild(tr);
    }

    //填充日期
    for ( i = 1; i <= weekNumber; i++) {
        createWeeklyScheduleTr(i, daydata2[i - 1]);
    }


</script>
</html>
