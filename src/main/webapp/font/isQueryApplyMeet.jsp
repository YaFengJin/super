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
        <script type="text/javascript" src="<%=basePath %>/static/layui/layui.js"></script>
        <script type="text/javascript" src="<%=basePath %>/static/js/vue.min.js"></script>
        <script type="text/javascript" src="<%=basePath %>/static/js/vue-resource.min.js"></script>
        </head>
        <body>
        <div id="app">
        <fieldset class="layui-elem-field layui-field-title" style="margin-top: 50px;">
        <legend><i class="layui-icon" style="font-size: 25px; color: #EE9A00;">&#xe663;</i>可申请会议室</legend>
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
        <th>可申请日期</th>
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
        <td>{{ i.m_time }}</td>
        <td><input type="button" class="layui-btn apply" value="申请" onclick="find(this)"></td>
        </tr>
        </tbody>
        </table>
        </div>
        </div>

        <div id="motaikunag" style="display:none;">
        <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
        <legend><i class="layui-icon" style="font-size: 25px; color: #EE9A00;">&#xe63c;</i>会议申请</legend>
        </fieldset>
        <form class="layui-form" action="">
        <div class="layui-form-item">
        <label class="layui-form-label">出席人员*</label>
        <div class="layui-input-block">
        <input  id="userName" class="layui-input" type="text" placeholder="请输入" autocomplete="off"
        lay-verify="required">
            <input type="text" id="userid" hidden name="userid">
        </div>
        </div>

        <div class="layui-form-item">
        <div class="layui-inline">
        <label class="layui-form-label">会议名称*</label>
        <div class="layui-input-inline">
        <input name="meetname" class="layui-input" type="tel" autocomplete="off" lay-verify="required">
        </div>
        </div>

        <div class="layui-inline">
        <label class="layui-form-label">会议主题</label>
        <div class="layui-input-inline">
        <input name="orderTheme" class="layui-input" type="text" autocomplete="off" lay-verify="">
        </div>
        </div>
        </div>

        <div class="layui-form-item">
        <div class="layui-inline">
        <label class="layui-form-label">会议室</label>
        <div class="layui-input-inline">
        <input name="meetroom" class="layui-input" type="text" autocomplete="off" lay-verify="" readonly="readonly">
        </div>
        </div>
        <input type="hidden" id="mr">
        <div class="layui-inline">
        <label class="layui-form-label">会议室管理员</label>
        <div class="layui-input-inline">
        <input name="number" class="layui-input" type="text" autocomplete="off" lay-verify="" readonly="readonly">
        </div>
        </div>

        <div class="layui-form-item">
        <div class="layui-inline">
        <label class="layui-form-label">开始时间*</label>
        <div class="layui-input-inline" id="start">
        <input class="layui-input test" id="test1" type="text" placeholder="yyyy-MM-dd HH:mm:ss" lay-verify="required">
        </div>
        </div>

        <div class="layui-inline">
        <label class="layui-form-label">结束时间*</label>
        <div class="layui-input-inline" id="end">
        <input class="layui-input" id="test2" type="text" placeholder="yyyy-MM-dd HH:mm:ss" lay-verify="required">
        </div>
        </div>
        </div>

        <div class="layui-form-item">
        <label class="layui-form-label">周期性会议申请</label>
        <div class="layui-input-block" id="a">
        <input name="sex" title="否" type="radio" checked="" value="0">
        <input name="sex" title="按周" type="radio" value="1">
        </div>
        </div>

        <div class="layui-form-item" id="date" style="display:none;">
        <label class="layui-form-label">可申请日期</label>
        <div class="layui-input-block" id="week">
        <input name="functional" title="星期一" type="checkbox" value="星期一">
        <input name="functional" title="星期二" type="checkbox" value="星期二">
        <input name="functional" title="星期三" type="checkbox" value="星期三">
        <input name="functional" title="星期四" type="checkbox" value="星期四">
        <input name="functional" title="星期五" type="checkbox" value="星期五">
        <input name="functional" title="星期六" type="checkbox" value="星期六">
        <input name="functional" title="星期日" type="checkbox" value="星期日">
        <input type="text" id="mTime" hidden style="width:500px"><input type="text" id="mTimes" hidden style="width:500px">
        </div>
        </div>
        <input type="hidden" id="user" value="${id}"><!--以后要用，登陆人的id-->
        <input type="hidden" id="orderTime" value="0">
        <div class="layui-form-item">
        <label class="layui-form-label">事务提醒</label>
        <div class="layui-input-block">
        <input name="open" type="checkbox" lay-filter="switchTest" lay-skin="switch" lay-text="开启|关闭">
        </div>
        </div>
        <div class="layui-form-item" id="tixing" style="display:none;">
        <div class="layui-inline">
        <label class="layui-form-label">提醒设置</label>
        提前<input type="text" style="width:50px" id="house">小时<input type="text"  hidden id="minus">
        </div>
        </div>
        <input type="hidden" id="makui">
        <input type="hidden" id="makui1">
        <input type="hidden" id="makui2">
        <input type="hidden" id="makui3">
        <input type="hidden" id="makui4">
        <input type="hidden" id="makui5">
        <input type="hidden" id="makui6">
        <input type="hidden" id="mk1">
        <input type="hidden" id="mk2">
        <input type="hidden" id="mk3">
        <input type="hidden" id="mk4">
        <input type="hidden" id="mk7">
        <div class="layui-form-item layui-form-text" style="width:700px">
        <label class="layui-form-label">会议描述</label>
        <div class="layui-input-block">
        <textarea class="layui-textarea layui-hide" name="content" lay-verify="content" id="LAY_demo_editor"></textarea>
        </div>
        </div>
        <div class="layui-form-item">
        <div class="layui-input-block">
        <button class="layui-btn" lay-filter="demo1" lay-submit="" id="btn">立即提交</button>
        <button class="layui-btn layui-btn-primary" type="reset">重置</button>
        </div>
        </div>

        </div>
        </form>
        </div>

            <form class="layui-form" id="treeView" style="display: none">
            <div class="layui-form-item">
            <label class="layui-form-label">选择部门</label>
            <div class="layui-input-inline">
            <div id="LAY-auth-tree-index"></div>
            </div>
            </div>
            <div class="layui-form-item">
            <div class="layui-form-item">
            <div class="layui-input-block" id="UserNames">

            </div>
            </div>
            </div>
            <div class="layui-form-item">
            <div class="layui-input-inline">
            <button class="layui-btn" type="button" id="saveUser" lay-submit lay-filter="LAY-auth-tree-submit">确定
            </button>
            </div>
            </div>
            </form>
        </body>
        </html>
        <script type="text/javascript">
        var datas={
        Meet:"",
        }
        //查询
        function isQuery(){
        new Vue({
        //声明作用范围
        el: "#app", //{UserId:2}换成当前登陆id
        //要存放的数据
        data: datas,
        created: function () {
        //发送异步(post)请求 this.$http.post(url,{jsonData},{options}).then(function(data){}) then回调函数 function(data)
        // data 响应的数据存放在 data.body中
        this.$http.post("ApplyMeetController/QueryApplyMeet",{UserId:${id}},{emulateJSON:true}).then(function (data) {
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
        //申请会议
        //监听提交

            layui.config({
            base: '../static/extends/',
            }).extend({
            authtree: 'authtree'
            });
        layui.use(['layer','layedit','laydate','form','authtree'],function () {
        var layer = layui.layer,
            layedit = layui.layedit,
        $=layui.jquery;
        var laydate = layui.laydate;
        var form = layui.form;
        var authtree=layui.authtree;


            //封装ajax
            function jQueryajax(url, data, type, dataType, response) {
            $(function () {
            $.ajax({
            url: url,
            type: type,
            data: data,
            dataType: dataType,
            success: function (res) {
            response(res);
            }
            });
            });
            };

            //点击文本框弹出layer
            $("#userName").click(function () {
            jQueryajax("/recruit/queryDept", null, "post", "json", function (data) {
            //生成树形菜单
            authtree.render('#LAY-auth-tree-index', data, {
            autowidth: true,
            layfilter: 'lay-check-auth',
            });
            var dept=layer.open({
            type: 1,//类型
            title: '选择部门',//标题
            shadeClose: false,//点击遮罩层关闭
            offset: 't',
            content: $('#treeView') //打开的内容
            });
            authtree.on('change(lay-check-auth)', function () {
            var a = [];
            for (var i = 0; i < authtree.getChecked('#LAY-auth-tree-index').length; i++) {
            a[a.length] = authtree.getChecked('#LAY-auth-tree-index')[i];
            }
            //数组拆分成字符串
            var b = a.join(",");
            //查询用户
            var username="";
            var userid="";
            jQueryajax("/recruit/queryDeptUserNames", {deptid: b}, "post", "json", function (resp) {
            username=resp.names.join(",");
            userid=resp.ids.join(",");
            $("#UserNames").html(username);
            form.render();
            });
            $("#saveUser").click(function() {
            $("#userName").val(username);
            $("#userid").val(userid);
            layer.close(dept);
            })
            });
            });
            });
        //创建一个编辑器
        var editIndex = layedit.build('LAY_demo_editor');
        $(".apply").click(function(){
        layer.open({
        type:1,//类型
        title:'申请会议',
        area:['60%','70%'],//定义宽和高
        shadeClose:false,//点击遮罩层关闭
        content: $('#motaikunag') //打开的内容
        });
        });
        //墨绿主题
        laydate.render({
        elem: '#test1'
        ,theme: 'molv'
        ,type: 'datetime',
        min:0,
        done: function(value, date){//控件选择完毕后的回调
        if(date.month>=10){
        date.month=date.month;
        }else{
        date.month="0"+date.month;
        }
        if(date.date>=10){
        date.date=date.date;
        }else{
        date.date="0"+date.date;
        }
        $("#mk1").val(date.year+"-"+date.month+"-"+date.date);
        if(date.hours>=10){
        date.hours=date.hours;
        }else{
        date.hours="0"+date.hours;
        }
        if(date.minutes>=10){
        date.minutes=date.minutes;
        }else{
        date.minutes="0"+date.minutes;
        }
        if(date.seconds>=10){
        date.seconds=date.seconds;
        }else{
        date.seconds="0"+date.seconds;
        }
        $("#mk2").val(date.hours+":"+date.minutes+":"+date.seconds);
        $("#makui").val(date.year);
        $("#makui1").val(date.month-1);
        $("#makui2").val(date.date);
        }
        });
        laydate.render({
        elem: '#test2'
        ,theme: 'molv'
        ,type: 'datetime',
        min:0,
        done: function(value, date){
        if(date.month>=10){
        date.month=date.month;
        }else{
        date.month="0"+date.month;
        }
        if(date.date>=10){
        date.date=date.date;
        }else{
        date.date="0"+date.date;
        }
        $("#mk3").val(date.year+"-"+date.month+"-"+date.date);
        if(date.hours>=10){
        date.hours=date.hours;
        }else{
        date.hours="0"+date.hours;
        }
        if(date.minutes>=10){
        date.minutes=date.minutes;
        }else{
        date.minutes="0"+date.minutes;
        }
        if(date.seconds>=10){
        date.seconds=date.seconds;
        }else{
        date.seconds="0"+date.seconds;
        }
        $("#mk4").val(date.hours+":"+date.minutes+":"+date.seconds);
        $("#makui3").val(date.year);
        $("#makui4").val(date.month-1);
        $("#makui5").val(date.date);
        $.ajax({
        url:"ApplyMeetController/QueryDate",
        type:"post",
        data:{
        "startdates":$("#mk1").val(),
        "enddates":$("#mk3").val(),
        "starttimes":$("#mk2").val(),
        "endtimes":$("#mk4").val(),
        "mId":$("#mr").val()
        },
        dataType:"json",
        success:function(data){
        $("#mk7").val(data);
        if($("#mk7").val()>0){
        alert("会议时间有冲突，请重新选取");
        $("#test1").val("");
        $("#test2").val("");
        }else{
        $.ajax({
        url:"ApplyMeetController/QueryWeek",
        type:"post",
        data:{
        "year":$("#makui").val(),
        "month":$("#makui1").val(),
        "day":$("#makui2").val(),
        "year1":$("#makui3").val(),
        "month1":$("#makui4").val(),
        "day1":$("#makui5").val(),
        },
        dateType:"json",
        success:function(data){
        $("#makui6").val(data);
        var a=$("#mTimes").val(); //允许申请时间
        var b=$("#makui6").val(); //根据选择时间查询出来的日期
        $("#week :checkbox").each(function(){
        if(a.indexOf($(this).val())!=-1 && b.indexOf($(this).val())!=-1){ //判断一个字符串中是否包含某个字符 -1表示未找到
        $(this).attr('disabled',false); //允许
        }else{
        $(this).attr('disabled',true); //禁止
        }
        });
        }
        });
        }
        }
        });
        }
        });
        form.on('submit(demo1)', function(data){
        var cc=$("#mTimes").val(); //允许申请时间
        var bb=$("#makui6").val(); //选择的时间
        var str = cc.replace(/,/g, "");//取消字符串中出现的所有逗号
        var str1 = bb.replace(/,/g, "");
        if(str.indexOf(str1)!=-1){
        $.ajax({
        url:"ApplyMeetController/AddMeetRoom",
        type:"post",
        data:{
        "meet.mId":$("#mr").val(),
        "orderStartdate":$("#test1").val(),
        "orderEnddate":$("#test2").val(),
        "orderCurdate":$("#mTime").val(),
        "orderHours":$("#house").val(),
        "orderMintes":$("#minus").val(),
        "orderTime":layedit.getContent(editIndex),
        "orderTheme":$("input[name='orderTheme']").val(),
        "orderState":$("#orderTime").val(),
        "userid":$("input[name='userid']").val(),
        "orderName":$("input[name='meetname']").val(),
        "orderUserid":$("input[name='number']").val(),
        "orderUser":$("#user").val()
        },
        dataType:"json",
        success:function(data){
        alert(data.message);
        window.location.reload();
        }
        });
        }else{
        alert("该时间会议室不允许申请");
        }
        return false;
        });
        //监听指定开关
        form.on('switch(switchTest)', function(data){
        layer.msg('事务提醒：'+ (this.checked ? '开启' : '关闭'), {
        offset: '6px'
        });
        if(this.checked){
        $("#tixing").css("display","block");
        }else{
        $("#tixing").css("display","none");
        }
        layer.tips('请认真核对您的选择', data.othis)
        });
        });
        //取得会议室允许申请时间
        function find(obj){
        var x = $(obj).parent().parent().find("td");
        var a=x.eq(0).text(); //id
        var b=x.eq(1).text(); //会议室名称
        var c=x.eq(6).text(); //会议室管理员
        var z = x.eq(7).text(); //允许申请时间
        $("#mTimes").val(z);
        $("#mr").val(a);
        $("input[name='meetroom']").val(b);
        $("input[name='number']").val(c);
        }
        //获取多选框的内容
        $("#week").mouseout(function(){
        var groupCheckbox=$("input[name='functional']");
        var functional="";
        for(var i=0;i<groupCheckbox.length;i++){
        if(groupCheckbox[i].checked){
        var val =groupCheckbox[i].value;
        if(functional.length>0){
        functional+=","+val;
        }else{
        functional+=val;
        }
        }
        }
        $("#mTime").val(functional);
        });
        //显示隐藏可选日期
        //查询选择的时间
        $(function(){
        $("#a").click(function(){
        if($('#a input[name="sex"]:checked ').val()==1){
        var date1= new Date($("#mk1").val());
        var date2= new Date($("#mk3").val());
        var aDay = 24 * 60 * 60 * 1000; // 完整一天有24小时，将小时换算成毫秒时间戳
        var diffDay = (date2 - date1) / aDay; // 计算间隔天数（注意日期隐式转换）
        var begintime=$("#mk2").val();
        var endtime=$("#mk4").val();
        var date = new Date();
        var a = begintime.split(":");
        var b = endtime.split(":");
        if(diffDay>7){
        alert("周期性会议最长只能申请一周呦！");
        $("#test2").val("");
        }
        if(diffDay<0 ||date.setHours(a[0],a[1],a[2])>date.setHours(b[0],b[1],b[2])){
        alert("会议结束日期时间必须大于开始日期时间");
        $("#test2").val("");
        }
        $("#date").css("display","block");
        }else{
        var date1= new Date($("#mk1").val());
        var date2= new Date($("#mk3").val());
        var begintime=$("#test1").val();
        var endtime=$("#test2").val();
        var beginTimes =begintime.replace(/-/g,"/");
        var endTimes =endtime.replace(/-/g,"/");
        var a =(Date.parse(endTimes)-Date.parse(beginTimes))/3600/1000;
        var aDay = 24 * 60 * 60 * 1000; // 完整一天有24小时，将小时换算成毫秒时间戳
        var diffDay = (date2 - date1) / aDay; // 计算间隔天数
        if(diffDay>0){
        alert("非周期性会议只允许申请一天时间");
        $("#test2").val("");
        }
        if(a<0){
        alert("结束时间不能小于开始时间");
        $("#test2").val("");
        }
        $("#date").css("display","none");
        }
        });
        });
        //查询出设置后提前后的时间
        $("#house").mouseout(function(){
        $.ajax({
        url:"ApplyMeetController/QueryDatetime",
        type:"post",
        data:{
        "orderStart":$("#test1").val(),
        "Houses":$("#house").val()
        },
        dataType:"text",
        success:function(data){
        $("#minus").val(data);
        }
        });
        });
        </script>
