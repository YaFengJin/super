<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";
%>
<html>
<head>
    <base href="<%=basePath %>">
    <title>Title</title>
    <link rel="stylesheet" href="<%=basePath %>/static/layui/css/layui.css">
    <script type="text/javascript" src="<%=basePath %>/static/js/jquery-3.2.1.min.js"></script>
    <script src="<%=basePath %>/static/layui/layui.js"></script>
    <script type="text/javascript" src="<%=basePath %>/static/js/vue.min.js"></script>
    <script type="text/javascript" src="<%=basePath %>/static/js/vue-resource.min.js"></script>
</head>
<body>
<div>
    <i class="layui-icon" style="font-size: 25px; color: #007500;">&#xe654;</i><b style="font-size: 25px;">新建会议室</b></p>
    <div class="site-demo-button" id="layerDemo" style="margin-bottom: 0;">
        <center>
            <button class="layui-btn layui-btn-normal" data-method="offset" data-type="auto">新建会议室</button>
        </center>
    </div>
    </p>
    <div id="app">
        <fieldset class="layui-elem-field layui-field-title" style="margin-top: 50px;">
            <legend><i class="layui-icon" style="font-size: 25px; color: #EE9A00;">&#xe705;</i>管理会议室</legend>
        </fieldset>
        <table class="layui-table" lay-skin="nob" lay-even="">
            <colgroup>
                <col width="160">
                <col width="160">
                <col width="160">
                <col width="160">
                <col width="160">
                <col width="160">
                <col width="160">
                <col width="160">
                <col width="160">
                <col>
            </colgroup>
            <thead>
            <tr>
                <th>名称</th>
                <th>可容纳人数</th>
                <th>设备情况</th>
                <th>所在地点</th>
                <th>会议室描述</th>
                <th>会议室管理员</th>
                <th>申请权限</th>
                <th>会议室状态</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <tr v-for="i in Meet">
                <td style="display:none;">{{ i.m_id }}</td>
                <td>{{ i.m_name }}</td>
                <td>{{ i.m_number }}</td>
                <td>{{ i.m_condition }}</td>
                <td>{{ i.m_adress }}</td>
                <td>{{ i.m_description }}</td>
                <td>{{ i.UserName }}</td>
                <td>{{ i.deptname }}</td>
                <td>{{ i.m_state==0?"禁用":"启用" }}</td>
                <td><input type="button" class="layui-btn layui-btn-xs"  onclick="startuse(this)" value="启用">&nbsp;&nbsp;&nbsp;<input type="button" class="layui-btn layui-btn-xs" onclick="enduse(this)" value="禁用"></td>
            </tr>
            </tbody>
        </table>
        <input type="hidden" id="startFlag">
    </div>
</div>
</body>
</html>
<script>
    layui.use('layer', function () { //独立版的layer无需执行这一句
        var $ = layui.jquery, layer = layui.layer; //独立版的layer无需执行这一句
        //触发事件
        var active = {
            offset: function (othis) {
                var type = othis.data('type')
                    , text = othis.text();
                layer.open({
                    type: 2
                    , offset: type
                    , id: 'layerDemo' + type //防止重复弹出
                    , content: 'font/isMeetRoom.jsp',   //要弹框页面的地址
                    btn: '关闭',
                    area: ['100%', '100%']
                    , btnAlign: 'c' //按钮居中
                    , shade: 0 //不显示遮罩
                    , yes: function () {
                        layer.closeAll();
                    }
                });
            }
        };
        $('#layerDemo .layui-btn').on('click', function () {
            var othis = $(this), method = othis.data('method');
            active[method] ? active[method].call(this, othis) : '';
        });
    });
    var datas={
        Meet:""
    }
      //查询
     function  isQuery(){
         new Vue({
             //声明作用范围
             el: "#app",
             //要存放的数据
             data: datas,
             created: function () {
                 //发送异步(post)请求     this.$http.post(url,{jsonData},{options}).then(function(data){}) then回调函数   function(data)
                 // data  响应的数据存放在 data.body中
                 this.$http.post("meetRoomController/QueryMeetRoom").then(function (data) {
                     this.Meet = data.body;
                     //失败后的响应
                 }, function (response) {
                     alert(response);
                 });
             },
         });
     }
    //页面加载 查询
    $(function(){
        isQuery();
    });
    //启用会议室
    function startuse(obj){
        var x = $(obj).parent().parent().find("td");
        var z = x.eq(0).text();
        var y = x.eq(8).text();
        $("#startFlag").val(z);
        if(y=="启用"){
            alert("会议室已在启用状态哦！");
        }else{
          $.ajax({
            url:"meetRoomController/UpdateRoomStartFlag",
            type:"post",
            data:{
                "mId":$("#startFlag").val()
            },
            dataType:"json",
            success:function(data){
                alert(data.message);
                window.location.reload();
            }
        });
        }
    }
    //禁用会议室
    function enduse(obj){
        var x = $(obj).parent().parent().find("td");
        var z = x.eq(0).text();
        var y = x.eq(8).text();
        $("#startFlag").val(z);
        if(y=="禁用"){
            alert("会议室已在禁用状态哦！");
        }else{
            $.ajax({
                url:"meetRoomController/UpdateRoomEndFlag",
                type:"post",
                data:{
                    "mId":$("#startFlag").val()
                },
                dataType:"json",
                success:function(data){
                    alert(data.message);
                    window.location.reload();
                }
            });
        }
    }
</script>