<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>合同管理</title>
    <link rel="stylesheet" href="../static/layui/css/layui.css" media="all">
    <script type="text/javascript"  src="../static/dyf_js/jquery-3.2.1.min.js"></script>
</head>
<body>

<center>
    <div class="site-demo-button" id="layerDemo" style="margin-bottom: 0;">
        <button data-method="offset" data-type="auto" class="layui-btn layui-btn-normal">新建合同</button>
    </div>
</center>

<div class="layui-card-body">
    <table class="layui-hide" id="test" lay-filter="tab"></table>
</div>

<div id="saveEmpRecord" style="display: none">
    <form class="layui-form" id="form">
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">雇员:*</label>
                <div class="layui-input-inline">
                    <input type="tel" id="userName" lay-verify="required" autocomplete="off" class="layui-input">
                    <input type="tel" name="userId" hidden id="UserId">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">合同编号:</label>
                <div class="layui-input-inline">
                    <input type="tel" name="contractName" autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">合同签约公司:*</label>
                <div class="layui-input-inline">
                    <select id="Contract_ComId" name="contractComId">
                        <option>请选择</option>
                    </select>
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">合同类型:</label>
                <div class="layui-input-inline">
                    <select id="Contract_TypeId" name="contractTypeId">
                        <option>请选择</option>
                    </select>
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">合同期限属性:</label>
                <div class="layui-input-inline">
                    <select name="contractTime" lay-filter="contractTime">
                        <option>请选择</option>
                        <option value="固定期限">固定期限</option>
                        <option value="无固定期限">无固定期限</option>
                        <option value="以完成一定工作任务为期限">以完成一定工作任务为期限</option>
                    </select>
                </div>
            </div>
            <div class="layui-inline">
                <div class="layui-inline">
                    <label class="layui-form-label">预定工资:</label>
                    <div class="layui-input-inline">
                        <input type="tel" name="contractMoney" autocomplete="off" class="layui-input">
                    </div>
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-inline startdate">
                <label class="layui-form-label">合同签订日期:</label>
                <div class="layui-input-inline">
                    <input type="Date" name="contractSignTime" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">合同生效日期:*</label>
                <div class="layui-input-inline">
                    <input type="Date" name="contractTakeTime" autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-inline enddate">
                <label class="layui-form-label">合同终止日期:</label>
                <div class="layui-input-inline">
                    <input type="Date" name="contractTermTime" autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">是否含使用期:</label>
                <div class="layui-input-inline">
                    <input type="radio" name="probation" value="是" title="是">
                    <input type="radio" name="probation" value="否" title="否" checked>
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">合同是否已解除:</label>
                <div class="layui-input-inline">
                    <input type="radio" name="contractTouch" value="是" title="是">
                    <input type="radio" name="contractTouch" value="否" title="否" checked>
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">合同是否续签:</label>
                <div class="layui-input-inline">
                    <input type="radio" name="contractAdd" value="是" title="是">
                    <input type="radio" name="contractAdd" value="否" title="否" checked>
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">提醒人员:</label>
                <div class="layui-input-inline">
                    <input type="tel" name="remindPhoto" id="remindPhoto" hidden>
                    <input type="tel" id="usename" lay-verify="required" autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">备注:</label>
                <div class="layui-input-inline">
                    <textarea class="layui-textarea" name="contractRemark"></textarea>
                </div>
            </div>
        </div>

        <center>
            <button type="button" class="layui-btn" lay-submit  lay-filter="save">立即提交</button>
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </center>
    </form>
</div>

<div id="updateEmpRecord" style="display: none">
    <form class="layui-form" id="form1">
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">雇员:*</label>
                <div class="layui-input-inline">
                    <input type="tel" id="contractId1" style="display: none" name="contractId">
                    <input type="tel" id="userName1" lay-verify="required" readonly autocomplete="off" class="layui-input">
                    <input type="tel" id="userId1" style="display: none" name="userId">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">合同编号:</label>
                <div class="layui-input-inline">
                    <input type="tel" id="contractName1" name="contractName" autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">合同签约公司:*</label>
                <div class="layui-input-inline">
                    <select id="Contract_ComId1" name="contractComId">
                        <option>请选择</option>
                    </select>
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">合同类型:</label>
                <div class="layui-input-inline">
                    <select id="Contract_TypeId1" name="contractTypeId">
                        <option>请选择</option>
                    </select>
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">合同期限属性:</label>
                <div class="layui-input-inline">
                    <select name="contractTime" id="contractTime1" lay-filter="contractTime">
                        <option>请选择</option>
                        <option value="固定期限">固定期限</option>
                        <option value="无固定期限">无固定期限</option>
                        <option value="以完成一定工作任务为期限">以完成一定工作任务为期限</option>
                    </select>
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">预定工资:</label>
                <div class="layui-input-inline">
                    <input type="tel" name="contractMoney" id="ContractMoney1" autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-inline startdate">
                <label class="layui-form-label">合同签订日期:</label>
                <div class="layui-input-inline">
                    <input type="Date" name="contractSignTime" id="contractSignTime1" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">合同生效日期:*</label>
                <div class="layui-input-inline">
                    <input type="Date" name="contractTakeTime" id="contractTakeTime1" autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-inline enddate">
                <label class="layui-form-label">合同终止日期:</label>
                <div class="layui-input-inline">
                    <input type="Date" name="contractTermTime" id="contractTermTime1" autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">是否含试用期:</label>
                <div class="layui-input-inline">
                    <input type="radio" name="probation" id="probation1" value="是" title="是">
                    <input type="radio" name="probation" id="probation2" value="否" title="否" checked>
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">合同是否已解除:</label>
                <div class="layui-input-inline">
                    <input type="radio" name="contractTouch" id="contractTouch1" value="是" title="是">
                    <input type="radio" name="contractTouch" id="contractTouch2" value="否" title="否" checked>
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">合同是否续签:</label>
                <div class="layui-input-inline">
                    <input type="radio" name="contractAdd" id="contractAdd1" value="是" title="是">
                    <input type="radio" name="contractAdd" id="contractAdd2" value="否" title="否" checked>
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">提醒人员:</label>
                <div class="layui-input-inline">
                    <input type="tel" name="remindPhoto" id="remindPhoto1" hidden>
                    <input type="tel" id="remindPhoto11" lay-verify="required" autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">备注:</label>
                <div class="layui-input-inline">
                    <textarea class="layui-textarea" id="contractRemark" name="contractRemark"></textarea>
                </div>
            </div>
        </div>

        <center>
            <button type="button" class="layui-btn" lay-submit  lay-filter="updateContract">立即提交</button>
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </center>
    </form>
</div>

<div style="display: none" id="queryidcontracct">
    <table border="0" width="100%" cellspacing="0" cellpadding="3" class="small">
        <tr>
            <td class="Big"><img src="/static/images/menu/meeting.gif" width="17" height="17"><span class="big3"> 合同详细信息</span><br>
            </td>
        </tr>
    </table>
    <br>
    <table class="TableBlock" width="90%" align="center" border="1px">
        <tr>
            <td nowrap align="left" width="120" class="TableContent">姓名：</td>
            <td nowrap align="left" class="TableData" width="180" id="UserName3"></td>
            <td nowrap align="left" width="120" class="TableContent">角色：</td>
            <td nowrap align="left" class="TableData" width="180" id="PostName3"></td>
        </tr>
        <tr>
            <td nowrap align="left" width="120" class="TableContent">英文名：</td>
            <td nowrap align="left" class="TableData" width="180"></td>
            <td nowrap align="left" width="120" class="TableContent">合同编号：</td>
            <td nowrap align="left" class="TableData" width="180" id="ContractName3"></td>
        </tr>
        <tr>
            <td nowrap align="left" width="120" class="TableContent">合同签约公司：</td>
            <td align="left" class="TableData" width="180" id="Contract_ComName3"></td>
            <td nowrap align="left" width="120" class="TableContent">所属部门：</td>
            <td nowrap align="left" class="TableData" width="180" id="DeptName3"></td>
        </tr>

        <tr>
            <td nowrap align="left" width="120" class="TableContent">合同类型：</td>
            <td nowrap align="left" class="TableData" width="180" id="Contract_TypeName3"></td>
            <td nowrap align="left" width="120" class="TableContent">合同期限属性：</td>
            <td align="left" class="TableData" width="180" id="Contract_Time3"></td>
        </tr>
        <tr>
            <td nowrap align="left" width="120" class="TableContent">合同状态：</td>
            <td nowrap align="left" class="TableData" width="180"></td>
            <td nowrap align="left" width="120" class="TableContent">合同签订日期：</td>
            <td nowrap align="left" class="TableData" width="180" id="ContractSignTime3"></td>
        </tr>
        <tr>
            <td nowrap align="left" width="120" class="TableContent">合同生效日期：</td>
            <td nowrap align="left" class="TableData" width="180" id="ContractTakeTime3"></td>
            <td nowrap align="left" width="120" class="TableContent">合同终止日期：</td>
            <td align="left" class="TableData" width="180" id="ContractTermTime3"></td>
        </tr>
        <tr>
            <td nowrap align="left" width="120" class="TableContent">是否含试用期：</td>
            <td align="left" class="TableData" width="180" id="probation3"></td>
            <td nowrap align="left" width="120" class="TableContent">试用截止日期：</td>
            <td nowrap align="left" class="TableData" width="180"></td>
        </tr>
        <tr>
            <td nowrap align="left" width="120" class="TableContent">雇员是否转正：</td>
            <td align="left" colspan="3" class="TableData" width="180"></td>
        </tr>

        <tr>
            <td nowrap align="left" width="120" class="TableContent">合同是否已解除：</td>
            <td align="left" class="TableData" width="180" id="contractTouch3"></td>
            <td nowrap align="left" width="120" class="TableContent">合同解除日期：</td>
            <td align="left" class="TableData" width="180"></td>
        </tr>

        <tr>
            <td nowrap align="left" width="120" class="TableContent">登记时间：</td>
            <td nowrap align="left" class="TableData" width="180"></td>
            <td nowrap align="left" width="120" class="TableContent">最后修改时间：</td>
            <td nowrap align="left" class="TableData" width="180"></td>
        </tr>
        </tr>
        <tr>
            <td nowrap align="left" width="120" class="TableContent">提醒人员：</td>
            <td nowrap align="left" colspan="3" class="TableData"id="RemindPhoto3"></td>
        </tr>

        <tr>
            <td nowrap align="left" width="120" class="TableContent">备注：</td>
            <td align="left" class="TableData" colspan="3" id="ContractRemark3"></td>
        </tr>
        <tr>
            <td nowrap align="left" width="120" class="TableContent">附件文档：</td>
            <td nowrap align="left" class="TableData" colspan="3"></td>
        </tr>
    </table>

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

<form class="layui-form" id="retreeView" style="display: none">
    <div class="layui-form-item">
        <label class="layui-form-label">选择部门</label>
        <div class="layui-input-inline">
            <div id="reLAY-auth-tree-index"></div>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-form-item">
            <div class="layui-input-block" id="reUserNames">

            </div>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-inline">
            <button class="layui-btn" type="button" id="resaveUser" lay-submit lay-filter="LAY-auth-tree-submit">确定
            </button>
        </div>
    </div>
</form>

<form class="layui-form" id="updatetreeView" style="display: none">
    <div class="layui-form-item">
        <label class="layui-form-label">选择部门</label>
        <div class="layui-input-inline">
            <div id="updateLAY-auth-tree-index"></div>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-form-item">
            <div class="layui-input-block" id="updateUserNames">

            </div>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-inline">
            <button class="layui-btn" type="button" id="updatesaveUser" lay-submit lay-filter="LAY-auth-tree-submit">确定
            </button>
        </div>
    </div>
</form>

</body>

</html>

<script type="text/html" id="barDemo">
    <button class="layui-btn layui-btn-normal" lay-Event="qi">详细信息</button>
    <button class="layui-btn layui-btn-normal" lay-Event="upd">修改</button>
</script>

<script src="../static/layui/layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>

    layui.config({
        base: '../static/extends/',
    }).extend({
        authtree: 'authtree'
    });

    layui.use(['table','layer','form','layedit', 'laydate','authtree'], function(){
        var layer= layui.layer
            ,form = layui.form
            ,layedit = layui.layedit
            ,laydate = layui.laydate
            ,authtree=layui.authtree;
        var kw='';
        addData(kw);

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
                layer.open({
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
                    jQueryajax("/recruit/queryDeptUser", {deptids: b}, "post", "json", function (resp) {
                        var uname = "";
                        for (var i = 0; i < resp.length; i++) {
                            uname += "<input type='radio' name='uid' value='" + resp[i].id + "' lay-filter='filter' title='" + resp[i].name + "'><span style='display: none'>" + resp[i].name + "</span><br/>";
                        }
                        $("#UserNames").html(uname);
                        form.render();
                    });
                });
            });
        });
        //点击确定的时候获取用户名字和编号
        form.on('radio(filter)', function (data) {
            $("#saveUser").click(function () {
                $("#userName").val(data.elem.title);
                $("#UserId").val(data.value);
                layer.close(layer.index);
            });
        });

        //点击文本框弹出layer
        $("#usename").click(function () {
            jQueryajax("/recruit/queryDept", null, "post", "json", function (data) {
                //生成树形菜单
                authtree.render('#reLAY-auth-tree-index', data, {
                    autowidth: true,
                    layfilter: 'rerelay-check-auth',
                });
                var dept = layer.open({
                    type: 1,//类型
                    title: '选择部门',//标题
                    shadeClose: false,//点击遮罩层关闭
                    offset: 't',
                    content: $('#retreeView') //打开的内容
                });
                authtree.on('change(rerelay-check-auth)', function () {
                    var a = [];
                    for (var i = 0; i < authtree.getChecked('#reLAY-auth-tree-index').length; i++) {
                        a[a.length] = authtree.getChecked('#reLAY-auth-tree-index')[i];
                    }
                    //数组拆分成字符串
                    var b = a.join(",");
                    //查询用户
                    var username = "";
                    var userid = "";
                    jQueryajax("/recruit/queryDeptUserNames", {deptid: b}, "post", "json", function (resp) {
                        username = resp.names.join(",");
                        userid = resp.ids.join(",");
                        $("#reUserNames").html(username);
                        form.render();
                    });
                    $("#resaveUser").click(function () {
                        $("#usename").val(username);
                        $("#remindPhoto").val(userid);
                        layer.close(dept);
                    })
                });
            });
        });
        $("#remindPhoto11").click(function () {
            jQueryajax("/recruit/queryDept", null, "post", "json", function (data) {
                //生成树形菜单
                authtree.render('#updateLAY-auth-tree-index', data, {
                    autowidth: true,
                    layfilter: 'updatelay-check-auth',
                });
                var dept = layer.open({
                    type: 1,//类型
                    title: '选择部门',//标题
                    shadeClose: false,//点击遮罩层关闭
                    offset: 't',
                    content: $('#updatetreeView') //打开的内容
                });
                authtree.on('change(updatelay-check-auth)', function () {
                    var a = [];
                    for (var i = 0; i < authtree.getChecked('#updateLAY-auth-tree-index').length; i++) {
                        a[a.length] = authtree.getChecked('#updateLAY-auth-tree-index')[i];
                    }
                    //数组拆分成字符串
                    var b = a.join(",");
                    //查询用户
                    var username = "";
                    var userid = "";
                    jQueryajax("/recruit/queryDeptUserNames", {deptid: b}, "post", "json", function (resp) {
                        username = resp.names.join(",");
                        userid = resp.ids.join(",");
                        $("#updateUserNames").html(username);
                        form.render();
                    });
                    $("#updatesaveUser").click(function () {
                        $("#remindPhoto11").val(username);
                        $("#remindPhoto1").val(userid);
                        layer.close(dept);
                    })
                });
            });
        });

        var active = {
            offset: function(othis){
                var type = othis.data('type')
                    ,text = othis.text();
                layer.open({
                    type:1,//类型
                    title:'新建合同',
                    area:['40%','60%'],//定义宽和高
                    shadeClose:false,//点击遮罩层关闭
                    content: $('#saveEmpRecord') //打开的内容
                });
                $.ajax({
                    url:"/savecontractquery",
                    type:"post",
                    dataType:"json",
                    success:function(data){
                        var a = data.list1;
                        var b = data.list2;
                        for (var i=0;i<a.length;i++){
                            $("#Contract_ComId").append("<option value='"+a[i].Contract_ComId+"'>"+a[i].Contract_ComName+"</option>");
                            form.render('select');
                        }
                        for (var i=0;i<b.length;i++){
                            $("#Contract_TypeId").append("<option value='"+b[i].Contract_TypeId+"'>"+b[i].Contract_TypeName+"</option>");
                            form.render('select');
                        }

                    }
                });
            }
        };

        $('#layerDemo .layui-btn').on('click', function(){
            var othis = $(this), method = othis.data('method');
            active[method] ? active[method].call(this, othis) : '';
        });

        form.on('select(contractTime)', function (data) {
            var c = data.value;
            if (c=="无固定期限"){
                $(".startdate").css('display','none');
                $(".enddate").css('display','none');
            }else{
                $(".startdate").css('display','block');
                $(".enddate").css('display','block');
            }
        });

        form.on('submit(save)', function(data){
            var a = $("#form").serialize();
            alert(a)
            //发送ajax
            $.ajax({
                url:"/savecontract",
                type:"post",
                data:$("#form").serialize(),
                dataType:"json",
                success:function(data){
                    alert(data.message);
                    location.reload();
                }
            });
            //return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
        });

        form.on('submit(updateContract)', function(data){
            //发送ajax
            $.ajax({
                url:"/updateContract",
                type:"post",
                data:$("#form1").serialize(),
                dataType:"json",
                success:function(data){
                    alert(data.message);
                    layer.closeAll();
                    location.reload();
                }
            });
            //return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
        });




    });
    function addData(kwx){
        var table = layui.table;
        table.render({
            elem: '#test'
            ,url:'/queryContract'
            ,limit:1 //默认为10
            ,page: true
            ,cols: [[
                {field:'ContractId', width:150, title: '序号', sort: true} //sort：true页面可进行排序操作
                ,{field:'UserName', width:200, title: '姓名'}
                ,{field:'DeptName', width:200, title: '部门'}
                ,{field:'Contract_TypeName', width:200, title: '合同类型'}
                ,{field:'Contract_ComName', width:200, title: '签署公司'}
                ,{field:'ContractTakeTime', width:200, title: '合同生效日期'}
                ,{field:'ContractTermTime', width:218   , title: '合同到期日期'}
                ,{fixed: 'right', width: 300,align:'center', toolbar: '#barDemo',title: '操作'}
            ]]
            ,done:function(res, curr, count){
                //数据的回调用，可不写


            }
        });

        table.on('tool(tab)', function (obj) {
            var data = obj.data, LayEvent = obj.event;
            if (LayEvent === 'upd'){
                var ContractId = data.ContractId;
                layer.open({
                type:1,//类型
                title:'修改合同',
                area:['40%','80%'],//定义宽和高
                shadeClose:false,//点击遮罩层关闭
                content: $('#updateEmpRecord') //打开的内容
            });
                layui.use(['form','util'], function() {
                    var form = layui.form;
                    $.ajax({
                        url:"/updatequeryContract",
                        type:"post",
                        data:{
                            "ContractId":ContractId
                        },
                        dataType:"json",
                        success:function(data){
                            var a = data.list1[0];
                            var b = data.list2;
                            var c = data.list3;
                            $("#contractId1").val(a.ContractId);
                            $("#userId1").val(a.UserId);
                            $("#userName1").val(a.UserName);
                            $("#contractName1").val(a.ContractName);
                            $("#ContractMoney1").val(a.ContractMoney);
                            if (a.Contract_Time=='无固定期限'){
                                $(".startdate").css('display','none');
                                $(".enddate").css('display','none');
                            }else{
                                $(".startdate").css('display','block');
                                $(".enddate").css('display','block');
                            }
                            $("#contractTime1").val(a.Contract_Time);
                            $("#contractSignTime1").val(a.ContractSignTime);
                            $("#contractTakeTime1").val(a.ContractTakeTime);
                            $("#contractTermTime1").val(a.ContractTermTime);
                            $("#remindPhoto1").val(a.RemindPhoto);
                            $("#remindPhoto11").val(a.name);
                            $("#contractRemark").val(a.ContractRemark);

                            for (var i=0;i<b.length;i++){
                                if (a.Contract_ComId==b[i].Contract_ComId){
                                    $("#Contract_ComId1").append("<option value='"+a.Contract_ComId+"' selected='selected'>"+a.Contract_ComName+"</option>");
                                }else{
                                    $("#Contract_ComId1").append("<option value='"+b[i].Contract_ComId+"'>"+b[i].Contract_ComName+"</option>");
                                }
                                form.render('select');
                            }
                            for (var i=0;i<c.length;i++){
                                if (a.Contract_TypeId==c[i].Contract_TypeId){
                                    $("#Contract_TypeId1").append("<option value='"+a.Contract_TypeId+"' selected='selected'>"+a.Contract_TypeName+"</option>");
                                }else{
                                    $("#Contract_TypeId1").append("<option value='"+c[i].Contract_TypeId+"'>"+c[i].Contract_TypeName+"</option>");
                                }
                                form.render('select');
                            }
                            for (var i=0;i<b.length;i++){
                                if (a.b_id==b[i].b_id){
                                    $("#b_id").append("<option value='"+a.b_id+"' selected='selected'>"+a.b_bankname+"</option>");
                                }else{
                                    $("#b_id").append("<option value='"+b[i].b_id+"'>"+b[i].b_bankname+"</option>");
                                }
                                form.render('select');
                            }


                        }
                    });


                })
            }
            if (LayEvent === 'qi'){
                var ContractId = data.ContractId;
                layer.open({
                    type:1,//类型
                    title:'查看合同详细信息',
                    area:['40%','60%'],//定义宽和高
                    shadeClose:false,//点击遮罩层关闭
                    content: $('#queryidcontracct') //打开的内容
                });
                layui.use(['form','util'], function() {
                    var form = layui.form;
                    $.ajax({
                        url:"/queryidcontract",
                        type:"post",
                        data:{
                            "ContractId":ContractId
                        },
                        dataType:"json",
                        success:function(data){
                            var a = data.list[0];
                            $("#UserName3").html(a.UserName);
                            $("#PostName3").html(a.PostName);
                            $("#ContractName3").html(a.ContractName);
                            $("#Contract_ComName3").html(a.Contract_ComName);
                            $("#DeptName3").html(a.DeptName);
                            $("#Contract_TypeName3").html(a.Contract_TypeName);
                            $("#Contract_Time3").html(a.Contract_Time);
                            $("#ContractSignTime3").html(a.ContractSignTime);
                            $("#ContractTakeTime3").html(a.ContractTakeTime);
                            $("#ContractTermTime3").html(a.ContractTermTime);
                            $("#probation3").html(a.Probation);
                            $("#contractTouch3").html(a.ContractTouch);
                            $("#RemindPhoto3").html(a.RemindPhoto);
                            $("#ContractRemark3").html(a.ContractRemark);
                        }
                    });


                })
            }
        })


    }

</script>