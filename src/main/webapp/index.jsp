<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2018-10-18
  Time: 18:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>tree</title>
    <link rel="stylesheet" href="layui/css/layui.css"  media="all">
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">layui 后台界面</div>
        <!-- 头部区域（可配合layui已有的水平导航） -->
        <ul class="layui-nav layui-layout-left">
            <li class="layui-nav-item"><a href="#">控制台</a></li>
            <li class="layui-nav-item"><a href="#">系统管理</a></li>
            <li class="layui-nav-item"><a href="#">在线用户</a></li>
            <li class="layui-nav-item">
                <a href="javascript:;">其它功能</a>
                <dl class="layui-nav-child">
                    <dd><a href="#">邮件管理</a></dd>
                    <dd><a href="#">消息管理</a></dd>
                    <dd><a href="#">授权管理</a></dd>
                </dl>
            </li>
        </ul>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href="javascript:;">
                    <img src="https://image.haha.mx/2018/08/26/middle/2769766_ec964c8590da89ad1bd2a1e55b9dd88a_1535248496.jpg" class="layui-nav-img">
                    admin
                </a>
                <dl class="layui-nav-child">
                    <dd><a href="#">基本资料</a></dd>
                    <dd><a href="#">安全设置</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item"><a href="">退出</a></li>
        </ul>
    </div>

    <!-- 导航菜单栏 -->
    <div id="navBarId" class="layui-side layui-bg-black">
    </div>

    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div style="padding: 15px;">
            <table class="layui-hide layui-col-md12" id="test"></table>
        </div>
    </div>

    <div class="layui-footer">
        <!-- 底部固定区域 -->
        © layui.com - 底部固定区域
    </div>
</div>

<script src="layui/layui.js" type="text/javascript" charset="utf-8"></script>

<script>
    // 导航菜单的间隔像素
    var menuCell = 5;

    layui.use('element', function(){
        var element = layui.element;
        var $ = layui.jquery;

        $.ajax({
            url:"user/queryUser",
            type:"post",
            dataType:"json",
            data:{id:1},
            success:function(data){
                console.log("data: "+data);
                var liStr= "";
                // 遍历生成主菜单
                for( var i = 0; i <data.length; i++){
                    //console.log("--> "+JSON.stringify(data[i]));
                    // 判断是否存在子菜单
                    if(data[i].children!=null&&data[i].children.length>0){
                        console.log("--> "+JSON.stringify(data[i].children));
                        liStr+="<li class=\"layui-nav-item\"><a class=\"\" href=\"javascript:;\">"+data[i].menuname+"</a>\n"+
                            "<dl class=\"layui-nav-child\">\n";
                        // 遍历获取子菜单
                        for( var k = 0; k <data[i].children.length; k++){
                            liStr+=getChildMenu(data[i].children[k],0);
                        }
                        liStr+="</dl></li>";
                    }else{
                        liStr+="<li class=\"layui-nav-item\"><a class=\"\" href=\""+data[i].menuurl+"\">"+data[i].menuname+"</a></li>";
                    }
                };
                console.log(">>>> "+liStr);
                $("#navBarId").html("<ul class=\"layui-nav layui-nav-tree\"  lay-filter=\"test\">\n" +liStr+"</ul>");
                element.init();
            }
        });
    });
    // 递归生成子菜单
    function getChildMenu(subMenu,num) {
        console.log("num: "+num);
        num++;
        var subStr = "";
        if(subMenu.children!=null&&subMenu.children.length>0){
            subStr+="<dd><ul><li class=\"layui-nav-item\" ><a style=\"margin-Left:"+num*menuCell+"px\" class=\"\" href=\"javascript:;\">"+subMenu.menuname+"</a>" +
                "<dl class=\"layui-nav-child\">\n";
            for( var j = 0; j <subMenu.children.length; j++){
                subStr+=getChildMenu(subMenu.children[j],num);
            }
            subStr+="</dl></li></ul></dd>";
        }else{
            subStr+="<dd><a style=\"margin-Left:"+num*menuCell+"px\" href=\""+subMenu.menuurl+"\">"+subMenu.menuname+"</a></dd>";
        }
        return subStr;
    }
</script>
</body>

</html>
