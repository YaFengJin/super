    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
            <%
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort() +request.getContextPath()+"/";
%>
        <html>
        <head>
        <base href="<%=basePath %>">
        <title>Title</title>
        <link rel="stylesheet" href="<%=basePath %>/static/layui/css/layui.css">
        <script type="text/javascript" src="<%=basePath %>/static/js/jquery-3.2.1.min.js"></script>
        <script src="<%=basePath %>/static/layui/layui.js"></script>
        <script src="<%=basePath %>/static/layui/lay/modules/form.js"></script>
        <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
        <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
        </head>
        <body>
        <%--模糊搜索--%>
        <div style="margin-top: 17px;margin-left: 100px;">
        <span>会议申请搜索:</span>
        <input type="text" style="height: 27px;width: 220px;" id="chaxun" placeholder="请输入会议名称进行模糊查询"/>
        </div>
        <%--数据的table--%>
        <div class="layui-card-body">
        <table class="layui-hide" id="test" lay-filter="bianshan"></table>
        </div>
        <%--模态框--%>
        <div id="motaikunag" style="display:none;">
        <table id="dataList" class="layui-table"></table>
        </div>
        </body>
        <script type="text/html" id="barDemo">
        <a class="layui-btn layui-btn-xs" lay-event="look">查看</a>
        <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">撤销申请</a>
        </script>
        <script>
        layui.use(['form','table','laydate',], function (){
        var a ="";
        fall(a);
        });
        //查询数据的分页
        function fall(mk) {
        var table = layui.table //表格
        //执行渲染
        table.render({
        elem: '#test',//制定原始表格元素选择器（id或者class）
        where:{
            "meetRoom":mk,
            "UserId":${id}      //获取登陆人的id
            },
        url: 'ApplyMeetController/QueryWaitMeet',
        limits:[1,3,7,10,50,100],
        limit: 10, //默认为10
        //加载表格内容
        cols: [[//标题栏
        {type: 'checkbox', fixed: 'left'},
        {field: 'order_id', width: 105, title: 'id'}, //sort：true页面可进行排序操作
        {field: 'order_name', width: 150, title: '会议名称'},
        {field: 'UserName', width: 150, title: '申请人', sort: true},
        {field: 'order_startdate', width: 150, title: '开始时间',sort: true},
        {field: 'order_enddate', width: 150, title: '结束时间',sort: true},
        {field: 'm_name', width: 150, title: '会议室', sort: true},
        {fixed: 'right', width: 200, align:'center',title: '操作', toolbar: '#barDemo'}
        ]],
        page: true,//是否显示分页
        done: function (res, curr, count) {
        //数据的回调用，可不写
        }
        });
        //删除 操作
        table.on('tool(bianshan)', function(obj){ //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
        var data = obj.data, //获得当前行数据
        layEvent = obj.event; //获得 lay-event 对应的值
        if(layEvent === 'del'){
        layer.confirm('真的撤销申请么', function(index){
        $.ajax({
        url:"ApplyMeetController/DeleteWaitMeet",
        type:"post",
        data:{
        "orderId":data.order_id
        },
        dataType:"json",
        success:function(data){
        alert(data.message);
        obj.del(); //删除对应行（tr）的DOM结构
        layer.close(index);//向服务端发送删除指令
        }
        });
        });
        }else if(layEvent === 'look'){
        $.ajax({
        url:"CheckMeetController/QueryDetails",
        type:"post",
        data:{
        "oderId":data.order_id
        },
        dataType:"json",
        success:function(data){
            $("#dataList").html("");
        $("#dataList").append("<tr><td>"+"所选会议室："+"</td><td>"+data[0].m_name+"</td></tr>"+
        "<tr><td>"+"会议室管理员："+"</td><td>"+data[0].UserName+"</td></tr>"+
        "<tr><td>"+"会议开始时间："+"</td><td>"+data[0].order_startdate+"</td></tr>"+
        "<tr><td>"+"会议结束时间："+"</td><td>"+data[0].order_enddate+"</td></tr>"+
        "<tr><td>"+"会议描述："+"</td><td>"+data[0].order_time+"</td></tr>"+
        "<tr><td>"+"会议主题："+"</td><td>"+data[0].order_theme+"</td></tr>"+
        "<tr><td>"+"会议名称："+"</td><td>"+data[0].order_name+"</td></tr>"+
        "<tr><td>"+"参加会议人员："+"</td><td>"+data[0].idst+"</td></tr>"
        );
        }
        });
        layer.open({
        type:1,//类型
        title:'查看详情',
        area:['50%','50%'],//定义宽和高
        shadeClose:false,//点击遮罩层关闭
        content: $('#motaikunag') //打开的内容
        });
        }
        });
        }
        //模糊查询的事件
        $(document).ready(function(){
        $("#chaxun").on("keyup",function(cha){
        if (cha.keyCode==13){
        var keyWord=$("#chaxun").val();
        fall(keyWord);
        }
        });
        $("#chaxun").on("blur",function(){
        var keyWord=$("#chaxun").val();
        fall(keyWord);
        });
        });
        </script>
