    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
            <%
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort() +request.getContextPath()+"/";
%>
        <html>
        <head><base href="<%=basePath %>">
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
        <fieldset class="layui-elem-field layui-field-title" style="margin-top: 50px;">
        <legend><i class="layui-icon" style="font-size: 25px; color: #007500;">&#xe654;</i><b style="font-size:
        25px;">新建设备</b></legend>
        </fieldset>
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
        </div>
        </center>
        </body>
        </html>
        <script>
        layui.use([ 'layedit'], function(){
        layedit = layui.layedit,
        $=layui.jquery;
        //创建一个编辑器
        var editIndex = layedit.build('LAY_demo_editor');
        var active={
        content:function(){
        $.ajax({
        url:"NewFacilityController/NewFacility",
        type:"post",
        data:{
        "fNumber":$("input[name='fNumber']").val(),
        "fState":$("select[name='fState']").val(),
        "fName":$("input[name='fName']").val(),
        "fDescribe":layedit.getContent(editIndex),
        "meet.mId":$("select[name='meet']").val()
        },
        dataType:"json",
        success:function(data){
        alert(data.message);
        window.location.reload();
        }
        });
        }
        }
        $('.site-demo-layedit').on('mouseout', function () {
        var type = $(this).data('type');
        active[type] ? active[type].call(this) : '';
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
