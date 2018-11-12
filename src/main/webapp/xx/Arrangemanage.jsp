<%--
  Created by IntelliJ IDEA.
  User: VULCAN
  Date: 2018-10-23
  Time: 10:20
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="../static/layui/css/layui.css">
    <link rel="stylesheet" href="../static/bootstrap-3.3.7-dist/css/bootstrap.css">
</head>
<script type="text/javascript" src="../static/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="../static/layui/layui.js"></script>
<script src="../static/bootstrap-3.3.7-dist/js/bootstrap.js"></script>
<body>
<%--数据的table--%>
<div class="layui-card-body">
    <table class="layui-hide" id="test" lay-filter="bianshan"></table>
</div>
<%--模态框--%>
<div id="formmotai" style="display: none;">
    <input style="display: none;" type="text" id="makui">
    <input style="display: none;" type="text" id="makui1">
    <input style="display: none;" type="text" id="makui2">
    <input style="display: none;" type="text" id="makui3">
    <input style="display: none;" type="text" id="makui4">
    <input style="display: none;" type="text" id="makui5">
    <input style="display: none;" type="text" id="makui6">
    <input style="display: none;" type="text" id="mk1">
    <input style="display: none;" type="text" id="mk3">
    <form class="layui-form">
        <div class="layui-form-item">
            <label class="layui-form-label">排班名称：</label>
            <div class="layui-input-block">
                <input type="text" name="username" lay-verify="required" placeholder="请输入" autocomplete="off"
                       class="layui-input arrangeName">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">设置人员</label>
            <div class="layui-input-block">
                <input type="text" name="title" id="userNames" lay-verify="required" autocomplete="off" placeholder="人员"
                       class="layui-input userId">
                <input type="text" class="userIds" hidden id="userIds">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">考勤类型</label>
            <div class="layui-input-block">
                <div class="layui-inline">
                    <label class="layui-form-label">起始时间</label>
                    <div class="layui-input-inline">
                        <input type="text" id="datatime1" lay-verify="required" class="layui-input dateStart"
                               placeholder="yyyy-MM-dd HH:mm:ss">
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">结束日期</label>
                    <div class="layui-input-inline">
                        <input type="text" id="datatime2" lay-verify="required" value=""
                               class="layui-input dateEnd datatime2"
                               placeholder="yyyy-MM-dd HH:mm:ss" v-model="returnReg.returnDate">
                    </div>
                </div>
                <div class="layui-form">
                    <table class="layui-table">
                        <colgroup>
                            <col width="150">
                            <col width="200">
                            <col width="200">
                            <col width="180">
                            <col>
                        </colgroup>
                        <thead>
                        <tr>
                            <th>考勤周期</th>
                            <th>第一次签到---签退</th>
                            <th>第二次签到---签退</th>
                            <th></th>
                            <th></th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>周一</td>
                            <td id="zou1"></td>
                            <td id="zou11"></td>
                            <td style="display: none;"><input type="text" id="zou111"></td>
                            <th>
                                <button type="button" value="1" id="星期一" class="layui-btn tjbc1 z0"><i
                                        class="layui-icon"></i>
                                </button>
                                <button type="button" value="1" class="layui-btn scbc1"><i class="layui-icon"></i>
                                </button>
                            </th>
                        </tr>
                        <tr>
                            <td>周二</td>
                            <td id="zou2"></td>
                            <td id="zou22"></td>
                            <td style="display: none;"><input type="text" id="zou222"></td>
                            <th>
                                <button type="button" value="2" id="星期二" class="layui-btn tjbc1 z1"><i
                                        class="layui-icon"></i>
                                </button>
                                <button type="button" value="2" class="layui-btn scbc1"><i class="layui-icon"></i>
                                </button>
                            </th>
                        </tr>
                        <tr>
                            <td>周三</td>
                            <td id="zou3"></td>
                            <td id="zou33"></td>
                            <td style="display: none;"><input type="text" id="zou333"></td>
                            <th>
                                <button type="button" value="3" id="星期三" class="layui-btn tjbc1 z2"><i
                                        class="layui-icon"></i>
                                </button>
                                <button type="button" value="3" class="layui-btn scbc1"><i class="layui-icon"></i>
                                </button>
                            </th>
                        </tr>
                        <tr>
                            <td>周四</td>
                            <td id="zou4"></td>
                            <td id="zou44"></td>
                            <td style="display: none;"><input type="text" id="zou444"></td>
                            <th>
                                <button type="button" value="4" id="星期四" class="layui-btn tjbc1 z3"><i
                                        class="layui-icon"></i>
                                </button>
                                <button type="button" value="4" class="layui-btn scbc1"><i class="layui-icon"></i>
                                </button>
                            </th>
                        </tr>
                        <tr>
                            <td>周五</td>
                            <td id="zou5"></td>
                            <td id="zou55"></td>
                            <td style="display: none;"><input type="text" id="zou555"></td>
                            <th>
                                <button type="button" value="5" id="星期五" class="layui-btn tjbc1 z4"><i
                                        class="layui-icon"></i>
                                </button>
                                <button type="button" value="5" class="layui-btn scbc1"><i class="layui-icon"></i>
                                </button>
                            </th>
                        </tr>
                        <tr>
                            <td>周六</td>
                            <td id="zou6"></td>
                            <td id="zou66"></td>
                            <td style="display: none;"><input type="text" id="zou666"></td>
                            <th>
                                <button type="button" value="6" id="星期六" class="layui-btn tjbc1 z5"><i
                                        class="layui-icon"></i>
                                </button>
                                <button type="button" value="6" class="layui-btn scbc1"><i class="layui-icon"></i>
                                </button>
                            </th>
                        </tr>
                        <tr>
                            <td>周日</td>
                            <td id="zou7"></td>
                            <td id="zou77"></td>
                            <td style="display: none;"><input type="text" id="zou777"></td>
                            <th>
                                <button type="button" value="7" id="星期日" class="layui-btn tjbc1 z6"><i
                                        class="layui-icon"></i>
                                </button>
                                <button type="button" value="7" class="layui-btn scbc1"><i class="layui-icon"></i>
                                </button>
                            </th>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <input type="text" id="panduan" style="display: none;" value="">
                <button class="layui-btn tj" lay-submit="" value="1" lay-filter="demo1">立即提交</button>
                <button class="layui-btn bc" lay-submit="" value="2" lay-filter="demo1">编辑保存</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>
</div>
<div id="mtk2" class="mtk2" style="display: none;">
    <table id="">
        <input type="text" style="display: none;" value="" id="val">
        <tr>
            <td>班次名称</td>
            <td colspan="3"><select id="mtk2t"></select></td>
        </tr>
        <tr>
            <td colspan="4">
                <input type="text" style="display: none;" id="mtk3t">
            </td>
        </tr>
        <tr>
            <td>班次时间</td>
            <td id="bcsj1"></td>
            <td>——</td>
            <td id="bcsj2"></td>
        </tr>
        <tr>
            <td>
                <button id="bancitj" class="layui-btn layui-btn-normal">确定</button>
            </td>
        </tr>
    </table>
</div>

<!-- 模态框（Modal） -->
<div id="mtk3" style="display: none;" class="modal-content">
    <div class="modal-body">
        <div class="col-xs-2">
            <select name="from" id="from1" multiple="multiple" class="multiselect form-control" size="8"
                    style="height:150px">

            </select>
        </div>
        <div class="col-xs-3">
            <select name="from" id="from" multiple="multiple" class="multiselect form-control" size="8"
                    style="height:150px">

            </select>
        </div>
        <div class="col-xs-2">
            <button type="button" id="addAll" class="btn btn-block"><i class="glyphicon glyphicon-forward"></i></button>
            <button type="button" id="addOne" class="btn btn-block"><i class="glyphicon glyphicon-chevron-right"></i>
            </button>
            <button type="button" id="removeOne" class="btn btn-block"><i class="glyphicon glyphicon-chevron-left"></i>
            </button>
            <button type="button" id="removeAll" class="btn btn-block"><i class="glyphicon glyphicon-backward"></i>
            </button>
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
<%--右边工具栏--%>
<script type="text/html" id="barDemo">
    {{#  if(d.Statusn == '0'){ }}
    <a class="layui-btn layui-btn-xs jinyong" lay-event="jinyong">禁用</a>
    {{#  } else if(d.Statusn == "1"){ }}
    <a class="layui-btn layui-btn-xs qiyong" lay-event="qiyong">启用</a>
    {{#  } }}
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>
<script>
    layui.config({
        base: '../static/extends/',
    }).extend({
        authtree: 'authtree'
    });
    layui.use(['form', 'table', 'laydate', 'layer', 'authtree'], function () {
        var form = layui.form,
            laydate = layui.laydate,
            layer = layui.layer,
            $ = layui.jquery,
            authtree = layui.authtree;

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
        //日期时间选择器
        laydate.render({
            elem: '#datatime1'
            , type: 'datetime',
            done: function (value, date) {//控件选择完毕后的回调
                if (date.month > 10) {
                    date.month = date.month;
                } else {
                    date.month = "0" + date.month;
                }
                if (date.date > 10) {
                    date.date = date.date;
                } else {
                    date.date = "0" + date.date;
                }
                $("#mk1").val("");
                $("#makui").val("");
                $("#makui1").val("");
                $("#makui2").val("");
                $("#mk1").val(date.year + "-" + date.month + "-" + date.date);
                $("#makui").val(date.year);
                $("#makui1").val(date.month - 1);
                $("#makui2").val(date.date);
            }
        });
        laydate.render({
            elem: '#datatime2'
            , type: 'datetime',
            done: function (value, date) {
                if (date.month > 10) {
                    date.month = date.month;
                } else {
                    date.month = "0" + date.month;
                }
                if (date.date > 10) {
                    date.date = date.date;
                } else {
                    date.date = "0" + date.date;
                }
                $("#mk3").val("");
                $("#makui3").val("");
                $("#makui4").val("");
                $("#makui5").val("");
                $("#mk3").val(date.year + "-" + date.month + "-" + date.date);
                $("#makui3").val(date.year);
                $("#makui4").val(date.month - 1);
                $("#makui5").val(date.date);
                //查询选择的时间
                var date1 = new Date($("#mk1").val());
                var date2 = new Date($("#mk3").val());
                var aDay = 24 * 60 * 60 * 1000; // 完整一天有24小时，将小时换算成毫秒时间戳
                var diffDay = (date2 - date1) / aDay; // 计算间隔天数（注意日期隐式转换）
                if (diffDay < 0) {
                    alert("结束时间必须大于开始时间");
                    $(".datatime2").val("");
                    this.returnReg.returnDate = "";
                }
                $.ajax({
                    url: "QueryWeek",
                    type: "post",
                    data: {
                        "year": $("#makui").val(),
                        "month": $("#makui1").val(),
                        "day": $("#makui2").val(),
                        "year1": $("#makui3").val(),
                        "month1": $("#makui4").val(),
                        "day1": $("#makui5").val(),
                    },
                    dateType: "json",
                    success: function (data) {
                        $("#makui6").val(data);
                        var b = $("#makui6").val(); //根据选择时间查询出来的日期
                        for (var i = 0; i < 7; i++) {
                            if (b.indexOf($(".z" + i).attr("id")) != -1) { //判断一个字符串中是否包含某个字符 -1表示未找到
                                $(".z" + i).attr('disabled', false); //允许
                            } else {
                                $(".z" + i).attr('disabled', true); //禁止
                            }
                        }
                    }
                });
            }
        });

        /*mtk3 模态框3的一些事件  */
        $(".tjry").click(function () {
            layui.use(['layer'], function () {
                var layer = layui.layer, $ = layui.$;
                layer.open({
                    type: 1,//类型
                    area: ['40%', '30%'],//定义宽和高
                    title: '设置班次',//题目
                    shadeClose: false,//点击遮罩层关闭
                    content: $('#mtk3') //打开的内容
                    /*content: 'index.jsp'//打开的内容 type为2*/
                });
            })
        })
        $(".mtk3-gb").click(function () {
            layer.close(layer.index);
        })
        $(".mtk3-qr").click(function () {
            var option = $("#to option").map(function () {
                return $(this).val();
            }).get().join(",");
            var optionText = $("#to option").map(function () {
                return $(this).html();
            }).get().join(",");
            $("#to option").clone().appendTo("#from");
            $("#to option").remove();
            $(".userId").val(optionText);
            $(".userIds").val(option);
            layer.close(layer.index);
        })
        /*！mtk3 模态框3的一些事件  */

        //设置考勤模态框
        $(".tjbc1").click(function () {
            $("#val").val($(this).val());
            layui.use(['layer'], function () {
                var layer = layui.layer, $ = layui.$;
                layer.open({
                    type: 1,//类型
                    area: ['30%', '30%'],//定义宽和高
                    title: '设置班次',//题目
                    shadeClose: false,//点击遮罩层关闭
                    content: $('#mtk2') //打开的内容
                    /*content: 'index.jsp'//打开的内容 type为2*/
                });
            })
        })
        $(".scbc1").click(function () {
            var i = $(this).val();
            $("#zou" + i).html("");
            $("#zou" + i + i).html("");
            $("#zou" + i + i + i).val("");
        })
        //设置考勤模态框的确定按钮
        $("#bancitj").click(function () {
            var i = $("#val").val();//获取编辑按钮的值
            var q = $("#bcsj1").children().html();//获取班次时间1-2
            var w = $("#bcsj2").children().html();//获取班次时3-4
            var e = $("#mtk3t").val();//获取班次对应的id
            $("#zou" + i).html(q);
            $("#zou" + i + i).html(w);
            $("#zou" + i + i + i).val(e);
            $("#mtk2t").html("");//清空模态框加载数据
            $("#bcsj1").html("");
            $("#bcsj2").html("");
            $("#mtk3t").val("");
            layer.close(layer.index);
            select();
        })

        //提交添加/更改 排班
        form.on('submit(demo1)', function () {
            $.ajax({
                url: "xxArrangemanageinsert",
                type: "post",
                data: {
                    "arrangeName": $(".arrangeName").val(),
                    "userId": $(".userIds").val(),
                    "dateStart": $(".dateStart").val(),
                    "dateEnd": $(".dateEnd").val(),
                    "monday": $("#zou111").val(),
                    "tuesday": $("#zou222").val(),
                    "wednesday": $("#zou333").val(),
                    "thursday": $("#zou444").val(),
                    "friday": $("#zou555").val(),
                    "saturday": $("#zou666").val(),
                    "sunday": $("#zou777").val(),
                    "id": $(this).val(), //判断编辑还是添加 1为添加 2为编辑
                    "aid": $(this).attr("id")
                },
                dataType: "json",
                success: function (data) {
                    alert(data.message);
                    window.parent.location.reload();
                }
            })
            return false;
        })
        var a = "";
        fall(a);
        select();


        //点击文本框弹出layer
        $("#userNames").click(function () {
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
                        $("#userNames").val(username);
                        $("#userIds").val(userid);
                        layer.close(dept);
                    })
                });
            });
        });
    });

    //查询数据的分页
    function fall(kwx) {
        var table = layui.table //表格
        //执行渲染
        table.render({
            elem: '#test',//制定原始表格元素选择器（id或者class）
            /*where: {"schedulingName": kwx},*/
            url: 'xxArrangemanageselect',
            id: 'weiyi',
            limits: [1, 3, 7, 10, 50, 100],
            limit: 10,  //默认为10
            title: '班次表',
            //加载表格内容
            cols: [[//标题栏
                {type: 'checkbox', width: 80, fixed: 'left'},
                {field: 'ArrangeManagId', width: 100, title: '排班编号'},  //sort：true页面可进行排序操作
                {field: 'ArrangeName', width: 100, title: '排班名称'},
                {field: 'UserIds', width: 180, title: '应用人员', sort: true},
                {field: 'Statusn', width: 180, title: '状态', sort: true},
                {fixed: 'right', width: 200, align: 'center', toolbar: '#barDemo'}
            ]],
            page: true,//是否显示分页
            toolbar: 'default', //开启工具栏，此处显示默认图标，可以自定义模板，详见文档
            done: function (res, curr, count) {
                //数据的回调用，可不写
                $("[data-field='Statusn']").children().each(function () {
                    if ($(this).text() == "0") {
                        $(this).text("启用");
                    } else if ($(this).text() == "1") {
                        $(this).text("禁用");
                    }
                })
            },
        })
        //监听行工具事件
        table.on('tool(bianshan)', function (obj) { //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
            var data = obj.data, //获得当前行数据
                layEvent = obj.event; //获得 lay-event 对应的值
            if (layEvent === 'del') {
                layer.confirm('真的删除行么', function (index) {
                    $.ajax({
                        url: "xxArrangemanagedelete",
                        type: "post",
                        data: {
                            "arrangeManagId": data.ArrangeManagId
                        },
                        dataType: "json",
                        success: function (data) {
                            alert(data.message);
                            obj.del(); //删除对应行（tr）的DOM结构
                            layer.close(index);//向服务端发送删除指令
                        }
                    })
                });
            } else if (layEvent === 'edit') {
                $(".arrangeName").val("");
                $(".userId").val("");
                $(".userIds").val("");
                $(".dateStart").val("");
                $(".dateEnd").val("");
                $("#zou1").html("");
                $("#zou11").html("");
                $("#zou111").val("");
                $("#zou2").html("");
                $("#zou22").html("");
                $("#zou222").val("");
                $("#zou3").html("");
                $("#zou33").html("");
                $("#zou333").val("");
                $("#zou4").html("");
                $("#zou44").html("");
                $("#zou444").val("");
                $("#zou5").html("");
                $("#zou55").html("");
                $("#zou555").val("");
                $("#zou6").html("");
                $("#zou66").html("");
                $("#zou666").val("");
                $("#zou7").html("");
                $("#zou77").html("");
                $("#zou777").val("");
                $(".bc").attr("id", data.ArrangeManagId);
                $("#panduan").val("");
                $("#panduan").val("2");
                var p = $("#panduan").val();
                if (p == "2") {
                    $(".tj").css("display", "none");
                    $(".bc").css("display", "block");
                }
                //点击编辑的时候打印出需要的内容
                $(".arrangeName").val(data.ArrangeName);
                $(".userId").val(data.UserIds);
                $(".userIds").val(data.UserId);
                $(".dateStart").val(data.datestart);
                $(".dateEnd").val(data.dateend);
                $.ajax({
                    url: "xxArrangemanageselect1",
                    data: {
                        "id": data.ArrangeManagId
                    },
                    type: "post",
                    dataType: "json",
                    success: function (all) {
                        if (all.day01 != "") {
                            $("#zou1").html(all.day01);
                            $("#zou11").html(all.day11);
                            $("#zou111").val(all.day01 + "," + all.day11 + "," + all.day21);
                        }
                        if (all.day02 != "") {
                            $("#zou2").html(all.day02);
                            $("#zou22").html(all.day12);
                            $("#zou222").val(all.day02 + "," + all.day12 + "," + all.day22);
                        }
                        if (all.day03 != "") {
                            $("#zou3").html(all.day03);
                            $("#zou33").html(all.day13);
                            $("#zou333").val(all.day03 + "," + all.day13 + "," + all.day23);
                        }
                        if (all.day04 != "") {
                            $("#zou4").html(all.day04);
                            $("#zou44").html(all.day14);
                            $("#zou444").val(all.day04 + "," + all.day14 + "," + all.day24);
                        }
                        if (all.day05 != "") {
                            $("#zou5").html(all.day05);
                            $("#zou55").html(all.day15);
                            $("#zou555").val(all.day05 + "," + all.day15 + "," + all.day25);
                        }
                        if (all.day06 != "") {
                            $("#zou6").html(all.day06);
                            $("#zou66").html(all.day16);
                            $("#zou666").val(all.day06 + "," + all.day16 + "," + all.day26);
                        }
                        if (all.day07 != "") {
                            $("#zou7").html(all.day07);
                            $("#zou77").html(all.day17);
                            $("#zou777").val(all.day07 + "," + all.day17 + "," + all.day27);
                        }
                    }
                })
                layui.use(['layer'], function () {
                    var layer = layui.layer, $ = layui.$;
                    layer.open({
                        type: 1,//类型
                        area: ['60%', '80%'],//定义宽和高
                        title: '编辑',//题目
                        shadeClose: false,//点击遮罩层关闭
                        content: $('#formmotai') //打开的内容
                        /*content: 'index.jsp'//打开的内容 type为2*/
                    });
                })
            } else if (layEvent === 'qiyong') {
                $.ajax({
                    url: "xxArrangemanageUpdate",
                    type: "post",
                    data: {
                        "arrangeManagId": data.ArrangeManagId,
                        "statusn": 0
                    },
                    dataType: "json",
                    success: function (data) {
                        alert(data.message);
                        table.reload(['weiyi'], function () {

                        })

                    }
                })
            } else if (layEvent === 'jinyong') {
                $.ajax({
                    url: "xxArrangemanageUpdate",
                    type: "post",
                    data: {
                        "arrangeManagId": data.ArrangeManagId,
                        "statusn": 1
                    },
                    dataType: "json",
                    success: function (data) {
                        alert(data.message);
                        table.reload(['weiyi'], function () {

                        })

                    }
                })
            }
        });
        //监听头工具栏事件
        table.on('toolbar(bianshan)', function (obj) {
            var checkStatus = table.checkStatus(obj.config.id),
                data = checkStatus.data; //获取选中的数据
            switch (obj.event) {
                case 'add':
                    $(".arrangeName").val("");
                    $(".userId").val("");
                    $(".userIds").val("");
                    $(".dateStart").val("");
                    $(".dateEnd").val("");
                    $("#zou1").html("");
                    $("#zou11").html("");
                    $("#zou111").val("");
                    $("#zou2").html("");
                    $("#zou22").html("");
                    $("#zou222").val("");
                    $("#zou3").html("");
                    $("#zou33").html("");
                    $("#zou333").val("");
                    $("#zou4").html("");
                    $("#zou44").html("");
                    $("#zou444").val("");
                    $("#zou5").html("");
                    $("#zou55").html("");
                    $("#zou555").val("");
                    $("#zou6").html("");
                    $("#zou66").html("");
                    $("#zou666").val("");
                    $("#zou7").html("");
                    $("#zou77").html("");
                    $("#zou777").val("");
                    $(".tj").attr("id", "0");
                    $('#panduan').val("1");
                    var p = $("#panduan").val();
                    if (p == "1") {
                        $(".tj").css("display", "block");
                        $(".bc").css("display", "none");
                    }
                    layui.use(['layer'], function () {
                        var layer = layui.layer, $ = layui.$;
                        layer.open({
                            type: 1,//类型
                            area: ['60%', '80%'],//定义宽和高
                            title: '添加',//题目
                            shadeClose: false,//点击遮罩层关闭
                            content: $('#formmotai') //打开的内容
                            /*content: 'index.jsp'//打开的内容 type为2*/
                        });
                    })
                    break;
            }
            ;
        });
    }

    //查询班次
    function select() {
        $.ajax({
            url: "select",
            data: "",
            type: "post",
            dataType: "json",
            success: function (all) {

                var tr = "<option value='0'> </option>";
                for (i = 0; i < all.data.length; i++) {
                    var obj = all.data[i];
                    tr += "<option class='optio' value='" + obj.SchedulingManagId + "'>" + obj.SchedulingName + "</option>";
                }
                $("#mtk2t").html(tr);
            }
        })
    }

    //根据id查询班次表
    $("#mtk2t").change(function () {
        var sid = $("#mtk2t option:selected").val();
        $.ajax({
            url: "xxSchedulingmanageselect",
            data: {
                "sid": sid
            },
            type: "post",
            dataType: "json",
            success: function (all) {
                var td = "";
                var td1 = "";
                for (i = 0; i < all.list.length; i++) {
                    var obj = all.list[i];
                    td = "<h5>" + obj.DUTYTIME1 + "-" + obj.DUTYTIME2 + "</h5>";
                    td1 = "<h5>" + obj.DUTYTIME3 + "-" + obj.DUTYTIME4 + "</h5>";
                    $("#mtk3t").val(obj.DUTYTIME1 + "-" + obj.DUTYTIME2 + "," + obj.DUTYTIME3 + "-" + obj.DUTYTIME4 + "," + obj.SchedulingManagId);
                }
                $("#bcsj1").html(td);
                $("#bcsj2").html(td1);
            }
        })
    })


    $(function () {
        //选择一项
        $("#addOne").click(function () {
            $("#from option:selected").clone().appendTo("#to");
            $("#from option:selected").remove();
        });
        //选择全部
        $("#addAll").click(function () {
            $("#from option").clone().appendTo("#to");
            $("#from option").remove();
        });
        //移除一项
        $("#removeOne").click(function () {
            $("#to option:selected").clone().appendTo("#from");
            $("#to option:selected").remove();
        });
        //移除全部
        $("#removeAll").click(function () {
            $("#to option").clone().appendTo("#from");
            $("#to option").remove();
        });
        $.ajax({
            url: "userdeptselect",
            type: "post",
            dataType: "json",
            success: function (all) {
                var option = "";
                for (i = 0; i < all.list.length; i++) {
                    var obj = all.list;
                    option += "<option class='la' value='" + obj[i].DeptId + "'>" + obj[i].DeptName + "</option>";
                }
                $("#from1").html(option);
            }
        })
        $("body").on("click", ".la", function () {
            $.ajax({
                url: "Usersurfaceid",
                type: "post",
                data: {
                    "deptId": $(this).val()
                },
                dataType: "json",
                success: function (all) {
                    var option1 = "";
                    for (i = 0; i < all.list.length; i++) {
                        var obj = all.list;
                        option1 += "<option value='" + obj[i].UserId + "'>" + obj[i].UserName + "</option>";
                    }
                    $("#from").html(option1);
                }
            })
        })
    });
</script>
</html>
