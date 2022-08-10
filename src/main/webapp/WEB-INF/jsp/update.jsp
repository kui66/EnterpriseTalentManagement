<%--
  Created by IntelliJ IDEA.
  User: 54463
  Date: 2022/7/21
  Time: 15:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
    <style>
        #add{
            background-color: darkgray;
            border: 1px;
        }
        .text { float: left; width: 8em; margin-right: 1em; text-align: right; }
    </style>
</head>
<script src="webjars/jquery/3.6.0/jquery.js"></script>
<script>
    $(function () {
        $("#update").click(function () {
            let name = $("#name").val();
            let workingLife = $("#workingLife").val();
            $("#departmentId").val();
            let departmentId = $("#departmentId option:selected").attr("id");
            let graduateSchool = $("#graduateSchool").val();
            let personalProfile = $("#personalProfile").val();
            let workExperience = $("#workExperience").val();
            let id = $(".eId").attr("id");
            console.log(name,workingLife,departmentId,graduateSchool,personalProfile,workExperience,id);
            //判断为空
            if(name == "" ||name == null || name == undefined){
                alert("人才姓名不能为空")
            }else if ($("#departmentId").val() == "全部") {
                alert("请选择部门")
            }else {
                $.ajax({
                    type: "get",
                    dataType: "json",
                    url: "renew",
                    data:"id="+id+"&name="+name+"&workingLife="+workingLife+"&workExperience="+workExperience
                        +"&personalProfile="+personalProfile+"&departmentId="+departmentId+"&graduateSchool="+graduateSchool,
                    success:function () {
                        console.log("修改成功！");
                        window.location.href="index";
                    }
                })
            }
        })
    })
</script>
<body>
<div align="center">
    <table id="add">
        <c:forEach items="${list}" var="e">
        <tr>
            <td><h1>更新人才信息</h1></td>
        </tr>
        <tr>
            <td style="display: none" class="eId" id="${e.id}"></td>
            <td><span class="text">人才姓名(*)：</span><input value="${e.name}" type="text" id="name"></td>
        </tr>
        <tr>
            <td><span class="text">工作年限：</span><input value="${e.workingLife}"  type="text" id="workingLife"></td>
        </tr>
        <tr>
            <td><span class="text">所属部门(*)：</span>
                <select id="departmentId">
                    <option>全部</option>
                    <c:forEach items="${list}" var="d">
                        <option id="${d.id}" selected>${e.departmentName}</option>
                        <option id="${d.id}">${d.name}</option>
                    </c:forEach>
                </select>
            </td>
        </tr>
        <tr>
            <td><span class="text">毕业学校：</span><input value="${e.graduateSchool}"  type="text" id="graduateSchool"></td>
        </tr>
        <tr>
            <td><span class="text">个人简历：</span> <textarea value="${e.personalProfile}" rows="5" cols="20" id="personalProfile"> </textarea></td>
        </tr>
        <tr>
            <td><span class="text">工作经历：</span><textarea value="${e.workExperience}"  rows="5" cols="20" id="workExperience"> </textarea> </td>
        </tr>
        <tr>
            <td>
                <input type="button" id="update" value="提交">
                <input type="button" onclick="window.location.href='index'" value="返回">
            </td>
        </tr>
        </c:forEach>
    </table>
</div>

</body>
</html>
