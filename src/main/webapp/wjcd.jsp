<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2018-10-19
  Time: 20:19
  To change this template use File | Settings | File Templates.
--%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="layui/css/layui.css">
    <meta charset="utf-8">
    <title>Bootstrap 实例 - 模态框（Modal）插件</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <meta charset="utf-8">
    <title>Bootstrap 实例 - 水平表单</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="layui/css/layui.css"  media="all">

    <script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="layui/layui.js"></script>
    <script src="<%=basePath %>/static/layui/layui.js"></script>
    <script src="<%=basePath %>/static/layui/lay/modules/form.js"></script>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>



    <script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
    <link rel="stylesheet" type="text/css" href="easyui/themes/bootstrap/easyui.css">
    <link rel="stylesheet" type="text/css" href="easyui/themes/icon.css">
    <script type="text/javascript" src="easyui/jquery.min.js"></script>
    <script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="layui/layui.js"></script>
</head>
<body>
<%--<ul id="demo" style="width: 300px"></ul>--%>
<%--<div id="demo1"></div>--%>
<div class="layui-row layui-col-space15">
    <div class="layui-col-md5">
        <div class="grid-demo grid-demo-bg1">
            <ul id="demo" style="width: 300px"></ul></div>
    </div>
    <div class="layui-col-md7">
        <div class="grid-demo" id="demo1">

        </div>
    </div>
</div>
</body>
</html>

<script type="text/javascript">
    $('#demo').tree({
        url: "journalism/queryfiling",
        method:'post',
        animate:'true',
        loadFilter: function(rows){
            return convert(rows);
        },
        onClick:function (nodes) {
            $.ajax({
                url:"journalism/queryChildFiling",
                type:"post",
                data:{id:nodes.id},
                dataType:"json",
                success:function(data){
                    var a="";
                    for(var i=0;i<data.length;i++){

                        a+="<tr><td>"+data[i].name+"</td></tr><span style='display: none'>"+data[i].id+"</span>";

                    }
                    $("#demo1").html(a);
                }
            });
        }
    });
    function convert(rows){
        function exists(rows,parentid){
            for(var i=0; i<rows.length; i++){
                if (rows[i].id == parentid)
                    return true;
            }
            return false;
        }

        var nodes = [];
        for(var i=0; i<rows.length; i++){
            var row = rows[i];
            if (!exists(rows, row.parentid)){
                nodes.push({
                    id:row.id,
                    text:row.name,
                });
            }
        }

        var toDo = [];
        for(var i=0; i<nodes.length; i++){
            toDo.push(nodes[i]);
        }
        while(toDo.length){
            var node = toDo.shift();	// the parent node
            for(var i=0; i<rows.length; i++){
                var row = rows[i];
                if (row.parentid == node.id){
                    var child = {
                        id:row.id,
                        text:row.name,
                    };
                    if (node.children){
                        node.children.push(child);
                    } else {
                        node.children = [child];
                    }
                    toDo.push(child);
                }
            }
        }
        return nodes;
    }
</script>