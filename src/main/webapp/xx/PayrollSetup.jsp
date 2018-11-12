<%--
  Created by IntelliJ IDEA.
  User: VULCAN
  Date: 2018-10-29
  Time: 19:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="../static/layui/css/layui.css">
    <link rel="stylesheet" href="../static/bootstrap-3.3.7-dist/css/bootstrap.css">
</head>
<script type="text/javascript" src="../static/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="../static/layui/layui.js"></script>
<script src="../static/bootstrap-3.3.7-dist/js/bootstrap.js"></script>
<STYLE>
    #table input {
        text-align: right;
    }
</STYLE>
<body>
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
    <legend> 薪酬基数设置  </legend>
</fieldset>
<div style="margin-left: 30%; width: 50%; float: left;">
    <div class="layui-inline">
        <label class="layui-form-label">月份</label>
        <div class="layui-input-inline">
            <input type="text" class="layui-input b13" id="test3" placeholder="yyyy-MM">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">设置人员</label>
        <div class="layui-input-block">
            <input type="text" name="title" lay-verify="required"  autocomplete="off" placeholder="人员"
                   class="layui-input userId">
            <input type="text" class="userIds b12"  hidden value="">
        </div>
    </div>
<table id="table" class="layui-table" lay-even="" lay-skin="row">
    <colgroup>
        <col width="200">
        <col width="800">
    </colgroup>
    <tbody class="tbody">
    <tr><td>保险项</td><td>金额</td></tr>
    <tr><td>保险基数</td><td><input type="text" value="" class="b0">(基础工资/元)</td></tr>

    <tr STYLE="display: none;"><td>单位%保险</td><td><input type="text" value="" class="bb1"> %</td></tr>
    <tr STYLE="display: none;"><td>个人%保险</td><td><input type="text" value="" class="bb0"> %</td></tr>
    <tr><td>单位养老</td><td><input type="text" value="" class="b1">元</td></tr>
    <tr><td>个人养老</td><td><input type="text" value="" class="b2">元</td></tr>

    <tr STYLE="display: none;"><td>单位%保险</td><td><input type="text" value="" class="bb3"> %</td></tr>
    <tr STYLE="display: none;"><td>个人%保险</td><td><input type="text" value="" class="bb2"> %</td></tr>
    <tr><td>单位医疗</td><td><input type="text" value="" class="b3">元</td></tr>
    <tr><td>个人医疗</td><td><input type="text" value="" class="b4">元</td></tr>

    <tr STYLE="display: none;"><td>单位%保险</td><td><input type="text" value="" class="bb5"> %</td></tr>
    <tr STYLE="display: none;"><td>个人%保险</td><td><input type="text" value="" class="bb4"> %</td></tr>
    <tr><td>单位失业</td><td><input type="text" value="" class="b5">元</td></tr>
    <tr><td>个人失业</td><td><input type="text" value="" class="b6">元</td></tr>

    <tr STYLE="display: none;"><td>单位%公积金</td><td><input type="text" value="" class="bb7"> %</td></tr>
    <tr STYLE="display: none;"><td>个人%公积金</td><td><input type="text" value="" class="bb6"> %</td></tr>
    <tr><td>单位住房</td><td><input type="text" value="" class="b7">元</td></tr>
    <tr><td>个人住房</td><td><input type="text" value="" class="b8">元</td></tr>

    <tr><td>单位工伤</td><td><input type="text" value="" class="b9">元</td></tr>
    <tr STYLE="display: none;"><td>单位%保险</td><td><input type="text" value="" class="bb8"> %</td></tr>

    <tr STYLE="display: none;"><td>单位%保险</td><td><input type="text" value="" class="bb9"> %</td></tr>
    <tr><td>单位生育</td><td><input type="text" value="" class="b10">元</td></tr>

    <tr><td>上报项</td><td>金额<h5 style="color: #d43f3a;">(此人没有薪酬项的填写"1")</h5></td></tr>
    </tbody>
    <tr style="background-color: #1E9FFF;"><td>总金额</td><td><input type="text" disabled="disabled" class="b11" value=""></td></tr>
    <tr style="text-align: center;"><td colspan="2">
        <button id="jisuan" class="layui-btn layui-btn-normal layui-btn-radius">计算</button>
        <button type="button" class="layui-btn layui-btn-warm tjxc">提交</button></td></tr>
</table>
</div>
<!-- 模态框（Modal） -->
<div id="mtk3" style="display: none;" class="modal-content">
    <div class="modal-body">
        <div class="col-xs-2" >
            <select name="from" id="from1" multiple="multiple" class="multiselect form-control" size="8" style="height:150px">

            </select>
        </div>
        <div class="col-xs-3" >
            <select name="from" id="from" multiple="multiple" class="multiselect form-control" size="8" style="height:150px">

            </select>
        </div>
        <div class="col-xs-2">
            <button type="button" id="addAll" class="btn btn-block"><i class="glyphicon glyphicon-forward"></i></button>
            <button type="button" id="addOne" class="btn btn-block"><i class="glyphicon glyphicon-chevron-right"></i></button>
            <button type="button" id="removeOne" class="btn btn-block"><i class="glyphicon glyphicon-chevron-left"></i></button>
            <button type="button" id="removeAll" class="btn btn-block"><i class="glyphicon glyphicon-backward"></i></button>
        </div>
        <div class="col-xs-5">
            <select name="to" id="to" multiple="multiple" class="form-control" size="8" style="height:150px"></select>
        </div>
    </div>
    <div class="modal-footer">
        <button type="button" class="btn btn-default mtk3-gb" data-dismiss="modal">关闭</button>
        <button type="button" class="btn btn-primary mtk3-qr">确认选择</button>
    </div>
</div><!-- /.modal-content -->
<form class="layui-form" id="treeView" style="display: none">
    <div class="layui-form-item">
        <label class="layui-form-label">选择部门</label>
        <div class="layui-input-inline">
            <div id="LAY-auth-tree-index"></div>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-form-item">
            <div class="layui-input-block" id="UserName">

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
<script>
    layui.config({
        base: '../static/extends/',
    }).extend({
        authtree: 'authtree'
    });
    layui.use(['form', 'table', 'laydate', 'layer','authtree'], function () {
        var form = layui.form,
            laydate = layui.laydate,
            layer = layui.layer,
            $ = layui.jquery,
            authtree=layui.authtree;
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
        //年月选择器
        laydate.render({
            elem: '#test3'
            ,type: 'month'
        });

        /*提交计算工资*/
        $(".tjxc").click(function () {
            /*+parseInt($(".shangbao6").val())+ parseInt($(".shangbao7").val()));*/
            if ($(".b11").val()==""||$(".b11").val()==0||isNaN(parseInt($(".b11").val()))) {
                layer.msg('请计算薪资');
            }else{
                var geren = [];
                var shangbao = [];
                for (i=0;i<15;i++){
                    geren[i] = $(".b"+i).val();
                    shangbao[i] = $(".shangbao"+i).val();
                }
                $.ajax({
                    url:"xxWagelevelInsert",
                    type:"post",
                    data:{
                        "userIds":geren[12],"basePay":geren[0],//员工编号//基本工资
                        "subsidy":geren[11],"bonus":geren[2],//总钱数//个人养老
                        "roomSupplement":geren[4],"carSupplement":geren[6],//个人医疗//个人失业
                        "endowmentIns":geren[8],"Time":geren[13],//个人住房//时间
                        "medicalIns":shangbao[0],"money":geren[11],//备用1//备用总钱数
                        "housingFund":shangbao[1],"unemploymentIns":shangbao[2],//备用2//备用3
                        "employmentIns":shangbao[3],"maternityIns":shangbao[4],//备用4//备用5
                        "wone":shangbao[5],"wtwo":shangbao[6],//备用6//备用7
                        "wthree":shangbao[7],"wfour":shangbao[8],//备用8//备用9
                        "wfive":shangbao[9]//备用10
                    },
                    dataType:"json",
                    success:function (all) {
                        alert(all.message);
                        window.parent.location.reload();
                    }
                })
            }
        })


        /*mtk3 模态框3的一些事件  */
        $(".tjry").click(function () {
            layui.use(['layer'], function () {
                var layer = layui.layer, $ = layui.$;
                layer.open({
                    type: 1,//类型
                    area: ['50%', '38%'],//定义宽和高
                    title: '设置班次',//题目
                    shadeClose: false,//点击遮罩层关闭
                    content: $('#mtk3') //打开的内容
                    /*content: 'index.jsp'//打开的内容 type为2*/
                });
            })
        })
        $(".mtk3-gb").click(function(){
            layer.close(layer.index);
        })
        $(".mtk3-qr").click(function(){
            var option = $("#to option").map(function(){
                return $(this).val();
            }).get().join(",");
            var optionText = $("#to option").map(function(){
                return $(this).html();
            }).get().join(",");
            $("#to option").clone().appendTo("#from");
            $("#to option").remove();
            $(".userId").val(optionText);
            $(".userIds").val(option);
            layer.close(layer.index);
        })
        /*！mtk3 模态框3的一些事件  */


        //点击文本框弹出layer
        $(".userId").click(function () {
            jQueryajax("/recruit/queryDept", null, "post", "json", function (data) {
                //生成树形菜单
                authtree.render('#LAY-auth-tree-index', data, {
                    autowidth: true,
                    layfilter: 'lay-check-auth',
                });
                var dept = layer.open({
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
                    var username = "";
                    var userid = "";
                    jQueryajax("/recruit/queryDeptUserNames", {deptid: b}, "post", "json", function (resp) {
                        username = resp.names.join(",");
                        userid = resp.ids.join(",");
                        $("#UserName").html(username);
                        form.render();
                    });
                    $("#saveUser").click(function () {
                        $(".userId").val(username);
                        $(".b12").val(userid);
                        layer.close(dept);
                    })
                });
            });
        });

    });

    $("#jisuan").click(function () {
        $.ajax({
            url: "xxCompantpersonageSelect",
            type: "post",
            data: {},
            dataType: "json",
            success: function (data){
                /*for (var j in data.list[0]){
                    alert(j);
                    a[i] = data.list[0][i]/100;
                }*/
                var a = [];
                a[0] = data.list[0].a0/100;a[1] = data.list[0].a1/100;
                a[2] = data.list[0].a2/100;a[3] = data.list[0].a3/100;
                a[4] = data.list[0].a4/100;a[5] = data.list[0].a5/100;
                a[6] = data.list[0].a6/100;a[7] = data.list[0].a7/100;
                a[8] = data.list[0].a8/100;a[9] = data.list[0].a9/100;
                for (i=0;i<10;i++){
                    $(".bb"+i).val(a[i]);//给个人单位赋值 百分比
                }
                var aa = [];
                var bb = [];
                for (j=0;j<11;j++){
                    aa[j] = $(".b"+j).val();//获取个人单位拿多少钱
                }
                for (k=0;k<11;k++){
                    bb[k] = $(".bb"+k).val();//获取个人单位百分比
                }
                /*for (j=0;j<17;j++){ parseInt(b[j]);}*/
                $(".b1").val(aa[0]*bb[1]);$(".b2").val(aa[0]*bb[0]);
                $(".b3").val(aa[0]*bb[3]);$(".b4").val(aa[0]*bb[2]);
                $(".b5").val(aa[0]*bb[5]);$(".b6").val(aa[0]*bb[4]);
                $(".b7").val(aa[0]*bb[7]);$(".b8").val(aa[0]*bb[6]);
                $(".b9").val(aa[0]*bb[9]);$(".b10").val(aa[0]*bb[8]);
                //parseInt($(".shangbao6").val());parseInt($(".shangbao7").val());
                var b0 = parseInt($(".b0").val());var b2 = parseInt($(".b2").val());//基本工资//个人养老
                var b4 = parseInt($(".b4").val());var b6 = parseInt($(".b6").val());var b8 = parseInt($(".b8").val());//个人医疗//个人失业//个人住房
                var shangbao0 = parseInt($(".shangbao0").val());var shangbao1 = parseInt($(".shangbao1").val());//上报项0//上报项1
                var shangbao2 = parseInt($(".shangbao2").val());var shangbao3 = parseInt($(".shangbao3").val());//上报项2//上报项3
                var shangbao4 = parseInt($(".shangbao4").val());var shangbao5 = parseInt($(".shangbao5").val());//上报项4//上报项5
                var shangbao6 = parseInt($(".shangbao6").val());var shangbao7 = parseInt($(".shangbao7").val());//上报项6//上报项7
                var shangbao8 = parseInt($(".shangbao8").val());var shangbao9 = parseInt($(".shangbao9").val());//上报项8//上报项9
                var shangbao10 = parseInt($(".shangbao10").val());var shangbao11 = parseInt($(".shangbao11").val());//上报项10//上报项11
                var b11 = $(".b11").val();//总金额
                $(".b11").val(b0-b2-b4-b8-b6);//总金额
                if (shangbao0>1&&(shangbao1==0||shangbao1==1)){
                    $(".b11").val(b0-b2-b4-b8-b6+shangbao0);
                }
                if(shangbao0>1&&shangbao1>1&&(shangbao2==0||shangbao2==1)){
                      $(".b11").val(b0-b2-b4-b8-b6+shangbao0+shangbao1);
                }else if(shangbao0==1&&shangbao1>1&&(shangbao2==0||shangbao2==1)){
                    $(".b11").val(b0-b2-b4-b8-b6+shangbao1);
                }
                if(shangbao0>1 && shangbao1>1 && shangbao2>1&&(shangbao3==0||shangbao3==1)){
                      $(".b11").val(b0-b2-b4-b8-b6+shangbao0+shangbao1+shangbao2);
                }else if (shangbao0==1 && shangbao1>1 && shangbao2>1&&(shangbao3==0||shangbao3==1)) {
                    $(".b11").val(b0-b2-b4-b8-b6+shangbao1+shangbao2);
                }else if (shangbao0==1 && shangbao1==1 && shangbao2>1&&(shangbao3==0||shangbao3==1)) {
                    $(".b11").val(b0-b2-b4-b8-b6+shangbao2);
                }else if (shangbao0>1 && shangbao1==1 && shangbao2>1&&(shangbao3==0||shangbao3==1)) {
                    $(".b11").val(b0-b2-b4-b8-b6+shangbao0+shangbao2);
                }
                if(shangbao0>1 && shangbao1>1 && shangbao2>1 && shangbao3>1&&(shangbao4==0||shangbao4==1)){
                      $(".b11").val(b0-b2-b4-b8-b6+shangbao0+shangbao1+shangbao2+shangbao3);
                }else if (shangbao0==1 && shangbao1>1 && shangbao2>1 && shangbao3>1&&(shangbao4==0||shangbao4==1)){
                    $(".b11").val(b0-b2-b4-b8-b6+shangbao1+shangbao2+shangbao3);
                }else if (shangbao0==1 && shangbao1==1 && shangbao2>1 && shangbao3>1&&(shangbao4==0||shangbao4==1)){
                    $(".b11").val(b0-b2-b4-b8-b6+shangbao2+shangbao3);
                }else if (shangbao0==1 && shangbao1==1 && shangbao2==1 && shangbao3>1&&(shangbao4==0||shangbao4==1)){
                    $(".b11").val(b0-b2-b4-b8-b6+shangbao3);
                }else if (shangbao0>1 && shangbao1>1 && shangbao2==1 && shangbao3>1&&(shangbao4==0||shangbao4==1)){
                    $(".b11").val(b0-b2-b4-b8-b6+shangbao0+shangbao1+shangbao3);
                }else if (shangbao0>1 && shangbao1>1 && shangbao2==1 && shangbao3>1&&(shangbao4==0||shangbao4==1)){
                    $(".b11").val(b0-b2-b4-b8-b6+shangbao0+shangbao1+shangbao3);
                }
                if(shangbao0>1&& shangbao1>1&& shangbao2>1 && shangbao3>1&&shangbao4>1&&(shangbao5==0||shangbao5==1)){
                      $(".b11").val(b0-b2-b4-b8-b6+shangbao0+shangbao1+shangbao2+shangbao3+shangbao4);
                }else if (shangbao0==1&& shangbao1>1&& shangbao2>1 && shangbao3>1&&shangbao4>1&&(shangbao5==0||shangbao5==1)) {
                    $(".b11").val(b0-b2-b4-b8-b6+shangbao1+shangbao2+shangbao3+shangbao4);
                }else if (shangbao0==1&& shangbao1==1&& shangbao2>1 && shangbao3>1&&shangbao4>1&&(shangbao5==0||shangbao5==1)) {
                    $(".b11").val(b0-b2-b4-b8-b6+shangbao2+shangbao3+shangbao4);
                }else if (shangbao0==1&& shangbao1==1&& shangbao2==1 && shangbao3>1&&shangbao4>1&&(shangbao5==0||shangbao5==1)) {
                    $(".b11").val(b0-b2-b4-b8-b6+shangbao3+shangbao4);
                }else if (shangbao0==1&& shangbao1==1&& shangbao2==1 && shangbao3==1&&shangbao4>1&&(shangbao5==0||shangbao5==1)) {
                    $(".b11").val(b0-b2-b4-b8-b6+shangbao4);
                }else if (shangbao0>1&& shangbao1>1&& shangbao2>1 && shangbao3==1&&shangbao4>1&&(shangbao5==0||shangbao5==1)) {
                    $(".b11").val(b0-b2-b4-b8-b6+shangbao0+shangbao1+shangbao2+shangbao4);
                }else if (shangbao0>1&& shangbao1>1&& shangbao2==1 && shangbao3==1&&shangbao4>1&&(shangbao5==0||shangbao5==1)) {
                    $(".b11").val(b0-b2-b4-b8-b6+shangbao0+shangbao1+shangbao4);
                }else if (shangbao0>1&& shangbao1==1&& shangbao2==1 && shangbao3==1&&shangbao4>1&&(shangbao5==0||shangbao5==1)) {
                    $(".b11").val(b0-b2-b4-b8-b6+shangbao0+shangbao4);
                }
                if(shangbao0>1 && shangbao1>1 && shangbao2>1 && shangbao3>1 && shangbao4>1 && shangbao5>1&&(shangbao6==0||shangbao6==1)){
                      $(".b11").val(b0-b2-b4-b8-b6+shangbao0+shangbao1+shangbao2+shangbao3+shangbao4+shangbao5);
                }else if (shangbao0==1 && shangbao1>1 && shangbao2>1 && shangbao3>1 && shangbao4>1 && shangbao5>1&&(shangbao6==0||shangbao6==1)){
                    $(".b11").val(b0-b2-b4-b8-b6+shangbao1+shangbao2+shangbao3+shangbao4+shangbao5);
                }else if (shangbao0==1 && shangbao1==1 && shangbao2>1 && shangbao3>1 && shangbao4>1 && shangbao5>1&&(shangbao6==0||shangbao6==1)){
                    $(".b11").val(b0-b2-b4-b8-b6+shangbao2+shangbao3+shangbao4+shangbao5);
                }else if (shangbao0==1 && shangbao1==1 && shangbao2==1 && shangbao3>1 && shangbao4>1 && shangbao5>1&&(shangbao6==0||shangbao6==1)){
                    $(".b11").val(b0-b2-b4-b8-b6+shangbao3+shangbao4+shangbao5);
                }else if (shangbao0==1 && shangbao1==1 && shangbao2==1 && shangbao3==1 && shangbao4>1 && shangbao5>1&&(shangbao6==0||shangbao6==1)){
                    $(".b11").val(b0-b2-b4-b8-b6+shangbao4+shangbao5);
                }else if (shangbao0==1 && shangbao1==1 && shangbao2==1 && shangbao3==1 && shangbao4==1 && shangbao5>1&&(shangbao6==0||shangbao6==1)){
                    $(".b11").val(b0-b2-b4-b8-b6+shangbao5);
                }else if (shangbao0>1 && shangbao1>1 && shangbao2>1 && shangbao3>1 && shangbao4==1 && shangbao5>1&&(shangbao6==0||shangbao6==1)){
                    $(".b11").val(b0-b2-b4-b8-b6+shangbao0+shangbao1+shangbao2+shangbao3+shangbao5);
                }else if (shangbao0>1 && shangbao1>1 && shangbao2>1 && shangbao3==1 && shangbao4==1 && shangbao5>1&&(shangbao6==0||shangbao6==1)){
                    $(".b11").val(b0-b2-b4-b8-b6+shangbao0+shangbao1+shangbao2+shangbao5);
                }else if (shangbao0>1 && shangbao1>1 && shangbao2==1 && shangbao3==1 && shangbao4==1 && shangbao5>1&&(shangbao6==0||shangbao6==1)){
                    $(".b11").val(b0-b2-b4-b8-b6+shangbao0+shangbao1+shangbao5);
                }else if (shangbao0>1 && shangbao1==1 && shangbao2==1 && shangbao3==1 && shangbao4==1 && shangbao5>1&&(shangbao6==0||shangbao6==1)){
                    $(".b11").val(b0-b2-b4-b8-b6+shangbao0+shangbao5);
                }
                    }
            })
        })
$(function () {
    $.ajax({
        url: "xxWageprojectSelect",
        type: "post",
        data: {},
        dataType: "json",
        success: function (data) {
            var tr = "";
            for (i=0;i<data.data.length;i++){
                tr += "<tr><td>"+data.data[i].ProjectName+"</td><td><input type='text' value='1' class='shangbao"+i+"'>元</td></td></tr>";
            }
            tr += "<tr style='display: none;'><td></td><td><input type='text' value='0' class='shangbao"+data.data.length+"'>元</td></td></tr>";
            $(".tbody").append(tr);
        }
    })
        //选择一项
        $("#addOne").click(function(){
            $("#from option:selected").clone().appendTo("#to");
            $("#from option:selected").remove();
        });
        //选择全部
        $("#addAll").click(function(){
            $("#from option").clone().appendTo("#to");
            $("#from option").remove();
        });
        //移除一项
        $("#removeOne").click(function(){
            $("#to option:selected").clone().appendTo("#from");
            $("#to option:selected").remove();
        });
        //移除全部
        $("#removeAll").click(function(){
            $("#to option").clone().appendTo("#from");
            $("#to option").remove();
        });
        $.ajax({
            url:"userdeptselect",
            type:"post",
            dataType:"json",
            success:function(all){
                var option = "";
                for (i=0;i<all.list.length;i++){
                    var obj = all.list;
                    option += "<option class='la' value='"+obj[i].DeptId+"'>"+obj[i].DeptName+"</option>";
                }
                $("#from1").html(option);
            }
        })
        $("body").on("click",".la",function () {
            $.ajax({
                url:"Usersurfaceid",
                type:"post",
                data:{
                    "deptId":$(this).val()
                },
                dataType:"json",
                success:function(all){
                    var option1 = "";
                    for (i=0;i<all.list.length;i++){
                        var obj = all.list;
                        option1 += "<option value='"+obj[i].UserId+"'>"+obj[i].UserName+"</option>";
                    }
                    $("#from").html(option1);
                }
            })
        })
})
</script>
</html>
