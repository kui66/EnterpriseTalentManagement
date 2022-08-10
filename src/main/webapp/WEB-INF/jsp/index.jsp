<%--
  Created by IntelliJ IDEA.
  User: 54463
  Date: 2022/7/21
  Time: 14:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
    <style>
        table
        {
            width: 800px;
            border-collapse: collapse;
            margin: 0 auto;
            text-align: center;
        }
        table td, table th
        {
            border: 1px solid #cad9ea;
            color: #666;
            height: 30px;
        }
        table thead th
        {
            background-color: #CCE8EB;
            width: 100px;
        }
        table tr:nth-child(odd)
        {
            background: #fff;
        }
        table tr:nth-child(even)
        {
            background: #F5FAFA;
        }
    </style>
</head>
<script src="webjars/jquery/3.6.0/jquery.js"></script>
<script>
    $(function () {
        $("#err").hide();
        $("#er2").hide();
        $("#Inquire").click(function () {
            $("#departmentId").val();
            let departmentId = $("#departmentId option:selected").attr("id");
            console.log(departmentId);
            $("#min").load("index","departmentId="+departmentId);
        })
        $(".del").click(function () {
            console.log(this.id);
            let id = this.id;
            $.ajax({
                type: "get",
                dataType: "json",
                url: "del",
                data:"id="+id,
                success:function (data) {
                    if (data != null){
                        console.log("删除成功！");
                        $("#err").show();
                        $("#min").load("index");
                    }else {
                        $("#er2").show();
                    }
                }
            })
        })
    })
</script>
<body>
<div id="min" align="center">
    <select id="departmentId">
        <option>全部</option>
        <c:forEach items="${eList}" var="d">
            <option id="${d.id}">${d.name}</option>
        </c:forEach>
    </select>
    <button id="Inquire">查询</button>
    <input type="button" onclick="window.location.href='add'"  value="新增人员">
    <table>
        <tr>
            <td>人才编号</td>
            <td>人才姓名</td>
            <td>工作年限</td>
            <td>所属部门</td>
            <td>毕业学校</td>
            <td>操作</td>
        </tr>
        <c:forEach var="e" items="${list}">
            <tr>
                <td>${e.id}</td>
                <td>${e.name}</td>
                <td>${e.workingLife}</td>
                <td>${e.departmentName}</td>
                <td>${e.graduateSchool}</td>
                <td><a id="${e.id}" href="#" onclick="window.location.href='update?id=${e.id}'">修改</a>  <a class="del" href="#" id="${e.id}">删除</a></td>
            </tr>
        </c:forEach>
    </table>
</div>
<table id="err">
    <tr>
        <td colspan="6">删除成功！</td>
    </tr>
</table>
<table id="er2">
    <tr>
        <td>删除失败！</td>
    </tr>
</table>

</body>
</html>
