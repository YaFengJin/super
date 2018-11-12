<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2018-10-19
  Time: 20:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript" src="../static/js/jquery-3.2.1.min.js"></script>
    <link rel="stylesheet" type="text/css" href="../static/easyui/themes/bootstrap/easyui.css">
    <link rel="stylesheet" type="text/css" href="../static/easyui/themes/icon.css">
    <link rel="stylesheet" href="../static/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="../static/bootstrap/css/bootstrap.min.css">
</head>
<body>
<ul id="demo"></ul>
 <div id="demo1"></div>
<script type="text/javascript" src="../static/easyui/jquery.min.js"></script>
<script type="text/javascript" src="../static/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="../static/layui/layui.js"></script>
<script type="text/javascript">
    $('#demo').tree({
        url: 'query',
        method:'post',
        animate:'true',
        loadFilter: function(rows){
           return convert(rows);
        },
        onClick:function (nodes) {
           $.ajax({
              url:"queryChildFiling",
              type:"post",
              data:{id:nodes.id},
              dataType:"json",
              success:function(data){
                  var a="";
                  for(var i=0;i<data.length;i++){
                      a+="<button type='button' class='btn btn-default btn-sm' ><span class='glyphicon glyphicon-folder-open'></span><span>"+data[i].name+"</span><span style='display: none'>"+data[i].id+"</span></button> ";
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
</body>
</html>
