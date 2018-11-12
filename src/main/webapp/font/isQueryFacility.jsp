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
        <span>设备搜索:</span>
        <input type="text" style="height: 27px;width: 220px;" id="chaxun" placeholder="请输入设备名称进行模糊查询"/>
        </div>
        <%--数据的table--%>
        <div class="layui-card-body">
        <table class="layui-hide" id="test" lay-filter="bianshan"></table>
        </div>
        <div id="motaikunag" style="display:none;">
        <center>
        <div>
        <div>
        <table class="table" style="width:600px;">
        <tbody>
        <tr class="success">
        <th>设备编号:<input type="text" name="fNumber"></th>
        <th>设备状态:<select name="fState">
        <option value="">请选择</option>
        <option value="不可用">不可用</option>
        <option value="可用">可用</option>
        </select></th>
        </tr>
        <tr class="danger">
        <td>设备名称/型号:<input type="text" name="fName"></td>
        <td>所属会议室:<select name="meet" id="meet">
        <option value="" >请选择</option>
        </select></td>
        </tr>
        <tr class="warning">
        <td colspan=2>设备描述</td>
        </tr>
        </tbody>
        </table>
        </div>
        <div class="layui-form-item layui-form-text">
        <div class="layui-input-block" style="width:600px;position:relative;bottom:18px;left:-55px">
        <textarea class="layui-textarea layui-hide" name="content" lay-verify="content" id="LAY_demo_editor"
        ></textarea>
        </div>
        </div>
        <button class="site-demo-layedit" style="width:50px" data-type="content" id="btn">确定</button>
        <input type="hidden" id="content">
            <input type="hidden" id="mk">
        </div>
        </center>
        </div>
        </body>
        <script type="text/html" id="barDemo">
        <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
        <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
        </script>
        <script>
        layui.use(['form','table','laydate',], function () {
        var a ="";
        fall(a);
        });
        //查询数据的分页
        function fall(mk) {
        var table = layui.table //表格
        //执行渲染
        table.render({
        elem: '#test',//制定原始表格元素选择器（id或者class）
        where:{"fName":mk},
        url: 'NewFacilityController/queryRole',
        limits:[1,3,7,10,50,100],
        limit: 10, //默认为10
        //加载表格内容
        cols: [[//标题栏
        {type: 'checkbox', fixed: 'left'},
        {field: 'f_id', width: 100, title: '设备id'}, //sort：true页面可进行排序操作
        {field: 'f_number', width: 300, title: '设备编号'},
        {field: 'f_name', width: 300, title: '设备名称', sort: true},
        {field: 'm_name', width: 300, title: '所属会议室',sort: true},
        {field: 'f_state', width: 300, title: '设备状态',sort: true},
        {field: 'f_describe', width: 300, title: '设备描述', sort: true},
        {fixed: 'right', width: 200, align:'center',title: '操作', toolbar: '#barDemo'}
        ]],
        page: true,//是否显示分页
        done: function (res, curr, count) {
        //数据的回调用，可不写
        }
        });
        //编辑 删除 操作
        table.on('tool(bianshan)', function(obj){ //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
        var data = obj.data, //获得当前行数据
        layEvent = obj.event; //获得 lay-event 对应的值
        if(layEvent === 'del'){
        layer.confirm('真的删除行么', function(index){
        $.ajax({
        url:"NewFacilityController/DeleteFacility",
        type:"post",
        data:{
        "fId":data.f_id
        },
        dataType:"json",
        success:function(data){
            alert(data.message);
        obj.del(); //删除对应行（tr）的DOM结构
        layer.close(index);//向服务端发送删除指令
         }
        })
        });
        } else if(layEvent === 'edit'){
        $("#mk").val(data.f_id);
        $("input[name='fNumber']").val(data.f_number);
        $("select[name='fState']").val(data.f_state);
        $("input[name='fName']").val(data.f_name);
        $("select[name='meet']").val(data.m_id);
        $("#LAY_demo_editor").val(data.f_describe);
        layui.use(['layer','layedit'],function () {
            var layer = layui.layer,
            layedit = layui.layedit,
            $=layui.jquery;
            //创建一个编辑器
            var editIndex = layedit.build('LAY_demo_editor');

            $('.site-demo-layedit').on('mouseout', function () {
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
            });
        layer.open({
        type:1,//类型
        title:'修改设备信息',
        area:['40%','60%'],//定义宽和高
        shadeClose:false,//点击遮罩层关闭
        content: $('#motaikunag') //打开的内容
        });
            $("#btn").click(function(){
            $.ajax({
            url:"NewFacilityController/UpdateFacility",
            type:"post",
            data:{
            "fNumber":$("input[name='fNumber']").val(),
            "fState":$("select[name='fState']").val(),
            "fName":$("input[name='fName']").val(),
            "fDescribe":layedit.getContent(editIndex),  //获取编辑器内容
            "meet.mId":$("select[name='meet']").val(),
            "fId":$("#mk").val()
            },
            dataType:"json",
            success:function(data){
                alert(data.message);
                window.location.reload();
              }
            });
            }) ;
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
        //查询会议室类型
        $(function(){
        $.ajax({
        url:"NewFacilityController/QueryMeetType",
        type:"post",
        dataType:"json",
        success:function(data) {
        $("#meet").html("");
        var a ="";
        for(var i=0;i<data.length;i++){
        a+="<option value="+data[i].m_id+">"+data[i].m_name+"</option>";
        }
        $("#meet").append(a);
        }
        });
        });
        </script>
