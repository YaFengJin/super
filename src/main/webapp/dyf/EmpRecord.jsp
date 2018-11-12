<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>人事档案管理</title>
    <link rel="stylesheet" href="../static/layui/css/layui.css" media="all">
    <script type="text/javascript"  src="../static/dyf_js/jquery-3.2.1.min.js"></script>
</head>
<body>

<center>
    <div class="site-demo-button" id="layerDemo" style="margin-bottom: 0;">
        <button data-method="offset" data-type="auto" class="layui-btn layui-btn-normal">新建用户档案</button>
    </div>
</center>

<div class="layui-card-body">
    <table class="layui-hide" id="test" lay-filter="tab"></table>
</div>

<div id="saveEmpRecord" style="display: none">

    <form class="layui-form" id="form">
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">OA用户名:</label>
                <div class="layui-input-inline">
                    <input type="tel" lay-verify="required" name="userAccount" id="UserAccount" lay-verify="required" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">姓名:</label>
                <div class="layui-input-inline">
                    <input type="tel" lay-verify="required" name="empInfoName" id="empInfoName" autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">部门</label>
                <div class="layui-input-inline">
                    <input type="tel" name="deptId" readonly id="deptId" autocomplete="off" style="display:none;" class="layui-input">
                    <input type="tel" readonly id="deptname" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">角色</label>
                <div class="layui-input-inline">
                    <select name="postId" id="postId" lay-verify="required">
                        <option value="">请选择</option>
                    </select>
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">在职状态</label>
                <div class="layui-input-inline">
                    <select id="empStateId" name="empStateId" lay-verify="required">
                        <option value="">请选择</option>
                    </select>
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">政治面貌</label>
                <div class="layui-input-inline">
                    <select id="dictionariesId" name="dictionariesId">
                        <option value="">请选择</option>
                    </select>
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">员工类型</label>
                <div class="layui-input-inline">
                    <select id="empTypeId" name="empTypeId" lay-verify="required">
                        <option value="">请选择</option>
                    </select>
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">用户编号</label>
                <div class="layui-input-inline">
                    <input type="tel" name="userId" id="userId" readonly autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">所学专业</label>
                <div class="layui-input-inline">
                    <select id="dicDictionariesId" name="dicDictionariesId">
                        <option value="">请选择</option>
                    </select>
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">工号</label>
                <div class="layui-input-inline">
                    <input type="tel" name="jobNumber" id="jobNumber" autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">性别</label>
                <div class="layui-input-inline">
                    <select id="empInfoGender" name="empInfoGender">
                        <option value="">请选择</option>
                        <option>男</option>
                        <option>女</option>
                    </select>
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">出生年月</label>
                <div class="layui-input-inline">
                    <input type="Date" id="empInfoBrith" name="empInfoBrith" autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">年龄</label>
                <div class="layui-input-inline">
                    <input type="tel" id="empInfoAge" name="empInfoAge" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">生肖</label>
                <div class="layui-input-inline">
                    <input type="tel" id="empInfoAny" name="empInfoAny" autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">血型</label>
                <div class="layui-input-inline">
                    <select name="empInfoBlood">
                        <option value="">请选择</option>
                        <option>A</option>
                        <option>B</option>
                        <option>O</option>
                        <option>AB</option>
                    </select>
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">照片上传</label>
                <div class="layui-input-inline">
                    <input type="file" id="empInfoPhoto" name="empInfoPhoto" autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">手机号</label>
                <div class="layui-input-inline">
                    <input type="tel" id="empInfoPhone" name="empInfoPhone" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">邮箱</label>
                <div class="layui-input-inline">
                    <input type="tel" id="empInfoEmail" name="empInfoEmail" autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">QQ</label>
                <div class="layui-input-inline">
                    <input type="tel" id="empInfoQq" name="empInfoQq" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">登录设置</label>
                <div class="layui-input-inline">
                    <input type="tel" id="empInfoSet" name="empInfoSet" autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">入职日期</label>
                <div class="layui-input-inline">
                    <input type="Date" id="entryTime" name="entryTime" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">转正日期</label>
                <div class="layui-input-inline">
                    <input type="Date" id="becomeTime" name="becomeTime" autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">离职日期</label>
                <div class="layui-input-inline">
                    <input type="Date" id="quiteTime" name="quiteTime" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">身份证号</label>
                <div class="layui-input-inline">
                    <input type="tel" id="idNumber" name="idNumber" autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">户口类别</label>
                <div class="layui-input-inline">
                    <select name="accountType">
                        <option value="">请选择</option>
                        <option>本市城镇职工</option>
                        <option>外阜城镇职工</option>
                        <option>本市农民工</option>
                        <option>外市农民工</option>
                        <option>本市农村劳动力</option>
                        <option>外阜农村劳动力</option>
                    </select>
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">户口所在地</label>
                <div class="layui-input-inline">
                    <input type="tel" id="accountHome" name="accountHome" autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">民族</label>
                <div class="layui-input-inline">
                    <input type="tel" id="democrats" name="democrats" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">籍贯</label>
                <div class="layui-input-inline">
                    <input type="tel" id="ernative" name="ernative" autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">英文名</label>
                <div class="layui-input-inline">
                    <input type="tel" id="englishName" name="englishName" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">国籍</label>
                <div class="layui-input-inline">
                    <input type="tel" id="nationality" name="nationality" autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">婚姻状态</label>
                <div class="layui-input-inline">
                    <select name="maritalStatus">
                        <option value="">请选择</option>
                        <option>已婚</option>
                        <option>未婚</option>
                        <option>离婚</option>
                        <option>丧偶</option>
                    </select>
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">参加工作日期</label>
                <div class="layui-input-inline">
                    <input type="Date" id="workTime" name="workTime" autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">岗位级别</label>
                <div class="layui-input-inline">
                    <select name="gmOffice">
                        <option value="">请选择</option>
                        <option>初级</option>
                        <option>中级</option>
                        <option>高级</option>
                        <option>特级</option>
                    </select>
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">岗位</label>
                <div class="layui-input-inline">
                    <select name="station">
                        <option value="">请选择</option>
                        <option>技术研发</option>
                        <option>技术支持</option>
                        <option>销售</option>
                    </select>
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">职称级别</label>
                <div class="layui-input-inline">
                    <select name="positionLeval">
                        <option value="">请选择</option>
                        <option>初级</option>
                        <option>中级</option>
                        <option>高级</option>
                        <option>特级</option>
                    </select>
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">职称</label>
                <div class="layui-input-inline">
                    <select name="position">
                        <option value="">请选择</option>
                        <option>高级职称</option>
                        <option>助理工程师</option>
                        <option>工程师</option>
                        <option>高级工程师</option>
                        <option>研高工</option>
                        <option>职称</option>
                    </select>
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">最高学历</label>
                <div class="layui-input-inline">
                    <select name="highestEduction" id="highestEduction">
                        <option value="">请选择</option>
                    </select>
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">毕业学校</label>
                <div class="layui-input-inline">
                    <input type="tel" id="graduateSchool" name="graduateSchool" autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">毕业日期</label>
                <div class="layui-input-inline">
                    <input type="Date" id="graduateTime" name="graduateTime" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">最高学位</label>
                <div class="layui-input-inline">
                    <select name="highestDegree" id="highestDegree">
                        <option value="">请选择</option>
                    </select>
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">业余爱好</label>
                <div class="layui-input-inline">
                    <input type="tel" id="amateureHobby" name="amateureHobby" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">健康状态</label>
                <div class="layui-input-inline">
                    <select name="healthState">
                        <option value="">请选择</option>
                        <option>健康</option>
                        <option>良好</option>
                        <option>一般</option>
                    </select>
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">身高</label>
                <div class="layui-input-inline">
                    <input type="tel" id="height" name="height" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">体重</label>
                <div class="layui-input-inline">
                    <input type="tel" id="weight" name="weight" autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">银行</label>
                <div class="layui-input-inline">
                    <input type="tel" id="bank" name="bank" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">银行账户</label>
                <div class="layui-input-inline">
                    <input type="tel" id="bankAccount" name="bankAccount" autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">紧急联系人</label>
                <div class="layui-input-inline">
                    <input type="tel" id="urgentPhoto" name="urgentPhoto" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">紧急联系人电话</label>
                <div class="layui-input-inline">
                    <input type="tel" id="urgentphone" name="urgentphone" autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">备注</label>
                <div class="layui-input-inline">
                    <textarea class="layui-textarea" name="empRecordRemake" id="empRecordRemake"></textarea>
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">上传文件</label>
                <div class="layui-input-inline">
                    <input type="file" id="empRecordFile" name="empRecordFile" autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">简历</label>
                <div class="layui-input-inline">
                    <input type="tel" id="empRecResume" name="empRecResume" autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-input-block">
                <button type="button" class="layui-btn" lay-submit="" lay-submit  lay-filter="saveEmpRecord">立即提交</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>
</div>

<div id="queryEmpRecordid" style="display: none">

        <table class="TableBlock" width="80%" align="center" border="1px">
            <tr>
                <td nowrap class="TableHeader" colspan="6"><b>&nbsp;基本信息</b></td>
            </tr>
            <tr>
                <td nowrap align="left" class="TableContent">OA用户名：</td>
                <td class="TableData"  colspan="4" id="Emp_InfoName"></td>
                <td class="TableData" align="center" rowspan="6" colspan="2">
                    <div class="avatar"><img src="/static/images/avatar/1.png" width=130></div>
                </td>
            </tr>
            <tr>
                <td nowrap align="left" class="TableContent">部门：</td>
                <td nowrap align="left" class="TableData" id="DeptId1"></td>
                <td nowrap align="left" class="TableContent">角色：</td>
                <td class="TableData"  colspan="2" id="PostId1"></td>
            </tr>
            <tr>
                <td nowrap align="left" class="TableContent">编号：</td>
                <td nowrap align="left" class="TableData" width="180" id="UserId1"></td>
                <td nowrap align="left" class="TableContent">工号：</td>
                <td class="TableData" colspan="2" id="JobNumber1"></td>
            </tr>
            <tr>
                <td nowrap align="left" class="TableContent">姓名：</td>
                <td class="TableData" width="180" id="Emp_InfoName1"></td>
                <td nowrap align="left" class="TableContent">血型</td>
                <td class="TableData" id="Emp_InfoBlood1"></td>
            </tr>
            <tr>
                <td nowrap align="left" class="TableContent">英文名：</td>
                <td class="TableData"></td>
                <td nowrap align="left" class="TableContent">性别：</td>
                <td class="TableData" colspan="2" id="Emp_InfoGender1"></td>
            </tr>
            <tr>
                <td nowrap align="left" class="TableContent">身份证号：</td>
                <td class="TableData" id="IdNumber1"></td>
                <td nowrap align="left" class="TableContent">出生日期：</td>
                <td class="TableData" colspan="2" id="Emp_InfoBrith1"></td>
            </tr>
            <tr>
                <td nowrap align="left" class="TableContent">生肖</td>
                <td class="TableData"  id="Emp_InfoAny1"></td>
                <td nowrap align="left" class="TableContent">特长：</td>
                <td class="TableData" colspan="5"></td>
            </tr>
            <tr>
                <td nowrap align="left" class="TableContent">年龄：</td>
                <td class="TableData" width="180" id="Emp_InfoAge1"></td>
                <td nowrap align="left" class="TableContent">年休假:</td>
                <td class="TableData"  colspan="3"></td>
            </tr>
            <tr>
                <td nowrap align="left" class="TableContent">籍贯：</td>
                <td class="TableData" id="AccountHome1"></td>
                <td nowrap align="left" class="TableContent">民族：</td>
                <td class="TableData" colspan="3" id="Democrats1"></td>
            </tr>
            <tr>
                <td nowrap align="left" class="TableContent">婚姻状况：</td>
                <td class="TableData" width="180" id="MaritalStatus1"></td>
                <td nowrap align="left" class="TableContent">健康状况：</td>
                <td class="TableData"  colspan="3" id="HealthState1"></td>
            <tr>
                <td nowrap align="left" class="TableContent">政治面貌：</td>
                <td class="TableData" width="180" id="DictionariesName1"></td>
                <td nowrap align="left" class="TableContent">入党时间：</td>
                <td class="TableData"  colspan="3"></td>
            </tr>
            <tr>
                <td nowrap align="left" class="TableContent">户口类别：</td>
                <td class="TableData"  width="180" id="AccountType1"></td>
                <td nowrap align="left" class="TableContent">户口所在地:</td>
                <td class="TableData"  colspan="3" id="Native1"></td>
            </tr>
            <tr>
                <td nowrap class="TableHeader" colspan="6"><b>&nbsp;职位情况及联系方式：</b></td>
            </tr>
            <tr>
                <td nowrap align="left" class="TableContent">工种：</td>
                <td class="TableData"  width="180"></td>
                <td nowrap align="left" class="TableContent">行政级别：</td>
                <td class="TableData"  width="180" id="PostName1"></td>
                <td nowrap align="left" class="TableContent">员工类型:</td>
                <td class="TableData"></td>
            </tr>
            <tr>
                <td nowrap align="left" class="TableContent">职称级别：</td>
                <td class="TableData"  width="180" id="PositionLeval1"></td>
                <td nowrap align="left" class="TableContent">岗位：</td>
                <td class="TableData"  width="180" id="Station1"></td>
                <td nowrap align="left" class="TableContent">考勤排班类型：</td>
                <td class="TableData"  width="180"></td>
            </tr>
            <tr>
                <td nowrap align="left" class="TableContent">职务：</td>
                <td class="TableData"  width="180" id="Duty1"></td>
                <td nowrap align="left" class="TableContent">职称：</td>
                <td class="TableData"  width="180" id="Position1"></td>
                <td nowrap align="left" class="TableContent">在职状态:</td>
                <td class="TableData"  width="180" id="Emp_StateName1"></td>
            </tr>
            <tr>
                <td nowrap align="left" class="TableContent">手机号码：</td>
                <td class="TableData"  id="Emp_InfoPhone1"></td>
                <td nowrap align="left" class="TableContent">MSN：</td>
                <td class="TableData"  colspan="3"></td>
            </tr>
            <tr>
                <td nowrap align="left" class="TableContent">电子邮件：</td>
                <td class="TableData"  width="180" id="Emp_InfoEmail1"></td>
                <td nowrap align="left" class="TableContent">家庭地址：</td>
                <td class="TableData"  colspan="3" id="AccountHome2"></td>
            </tr>
            <tr>
                <td nowrap align="left" class="TableContent">QQ：</td>
                <td class="TableData"  width="180" id="Emp_InfoQQ1"></td>
                <td nowrap align="left" class="TableContent">其他联系方式：</td>
                <td class="TableData"  colspan="3"></td>
            </tr>
            <tr>
                <td nowrap align="left" class="TableContent">开户行：</td>
                <td class="TableData"  width="180"></td>
                <td nowrap align="left" class="TableContent">账户：</td>
                <td class="TableData"  colspan="3"></td>
            </tr>
            <tr>
                <td nowrap class="TableHeader" colspan="6"><b>&nbsp;教育背景：</b></td>
            </tr>
            <tr>
                <td nowrap align="left" class="TableContent">学历：</td>
                <td class="TableData"  width="180"></td>
                <td nowrap align="left" class="TableContent">学位：</td>
                <td class="TableData"  width="180"></td>
                <td nowrap align="left" class="TableContent">毕业时间：</td>
                <td class="TableData"  width="180"></td>
            </tr>
            <tr>
                <td nowrap align="left" class="TableContent">毕业学校：</td>
                <td class="TableData"  width="180" id="GraduateSchool1"></td>
                <td nowrap align="left" class="TableContent">专业：</td>
                <td class="TableData"  width="180"></td>
                <td nowrap align="left" class="TableContent">计算机水平：</td>
                <td class="TableData"  width="180"></td>
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

</body>

</html>

<script type="text/html" id="barDemo">
    <button class="layui-btn layui-btn-normal" lay-Event="queryEmpRecordId">查看</button>
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
        $("#empInfoName").click(function () {
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
                var userId =  data.value;
                $("#empInfoName").val(data.elem.title);
                $("#userId").val(data.value);
                layer.close(layer.index);
                $.ajax({
                    url: "/queryUserSurFace",
                    data: {
                        "userId": userId
                    },//
                    type: "post",
                    dataType: "json",
                    success: function (data) {
                        var a = data.list[0];
                        $("#deptId").val(a.DeptId);
                        $("#deptname").val(a.DeptName);
                    }
                });
            });
        });

        $("#UserAccount").blur(function(){
            var userAccount=$("#UserAccount").val()
            if(userAccount==""){
                alert("请输入OA用户名！")
            }else {
                $.ajax({
                    url: "/queryUserAccount",
                    data: {
                        "userAccount": userAccount
                    },//
                    type: "post",
                    dataType: "json",
                    success: function (data) {
                        layer.msg(data.message);
                    }
                });
            }
        });

        var active = {
            offset: function(othis){
                var type = othis.data('type')
                    ,text = othis.text();
                layer.open({
                    type:1,//类型
                    title:'新建人事档案',
                    area:['60%','80%'],//定义宽和高
                    shadeClose:false,//点击遮罩层关闭
                    content: $('#saveEmpRecord') //打开的内容
                });
                $.ajax({
                    url:"/seEmpRecord",
                    type:"post",
                    dataType:"json",
                    success:function(data){
                        var a = data.list1;
                        var b = data.list2;
                        var c = data.list3;
                        var d = data.list4;
                        for (var i=0;i<a.length;i++){
                            $("#postId").append("<option value='"+a[i].PostId+"'>"+a[i].PostName+"</option>");
                            form.render('select');
                        }
                        for (var i=0;i<b.length;i++){
                            $("#empStateId").append("<option value='"+b[i].Emp_StateId+"'>"+b[i].Emp_StateName+"</option>");
                            form.render('select');
                        }
                        for (var i=0;i<c.length;i++){
                            $("#empTypeId").append("<option value='"+c[i].Emp_TypeId+"'>"+c[i].Emp_TypeName+"</option>");
                            form.render('select');
                        }
                        for (var i=0;i<d.length;i++){
                            if(d[i].DictionariesTypeName=='学历') {
                                $("#highestEduction").append("<option value='"+d[i].DictionariesId+"'>"+d[i].DictionariesName+"</option>");
                                $("#highestDegree").append("<option value='"+d[i].DictionariesId+"'>"+d[i].DictionariesName+"</option>");
                            }else if(d[i].DictionariesTypeName=='所学专业'){
                                $("#dicDictionariesId").append("<option value='"+d[i].DictionariesId+"'>"+d[i].DictionariesName+"</option>");
                            }else if(d[i].DictionariesTypeName=='政治面貌'){
                                $("#dictionariesId").append("<option value='"+d[i].DictionariesId+"'>"+d[i].DictionariesName+"</option>");
                            }
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

        form.on('submit(saveEmpRecord)', function(data){
            //发送ajax
            $.ajax({
                url:"/saveEmpRecord",
                type:"post",
                data:$("#form").serialize(),
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
            ,url:'/queryEmpRecord'
            ,limit:1 //默认为10
            ,page: true
            ,cols: [[
                {field:'Emp_InfoId', width:100, title: '序号', sort: true} //sort：true页面可进行排序操作
                ,{field:'Emp_InfoName', width:150, title: '姓名'}
                ,{field:'Emp_InfoPhoto', width:150, title: '用户头像'}
                ,{field:'PostName', width:150, title: 'OA角色'}
                ,{field:'Emp_InfoGender', width:150, title: '性别'}
                ,{field:'Emp_InfoBrith', width:150, title: '出生日期'}
                ,{field:'Democrats', width:150, title: '民族'}
                ,{field:'Native', width:165   , title: '籍贯'}
                ,{field:'DictionariesName', width:200, title: '政治面貌'}
                ,{field:'EntryTime', width:200, title: '入职时间'}
                ,{fixed: 'right', width: 100,align:'center', toolbar: '#barDemo',title: '操作'}
            ]]
            ,done:function(res, curr, count){
                //数据的回调用，可不写
                $("[data-field='Emp_InfoPhoto']").children().each(function () {
                    if ($(this).text()==""){
                        $(this).text("未上传").css('color','red');
                    }
                })



            }
        });

        table.on('tool(tab)',function (obj) {
            var data = obj.data,LayEvent=obj.event;
            if (LayEvent ==='queryEmpRecordId'){
                var Emp_InfoId = data.Emp_InfoId;
                layer.open({
                    type:1,//类型
                    title:'档案详细信息',
                    area:['60%','80%'],//定义宽和高
                    shadeClose:false,//点击遮罩层关闭
                    content: $('#queryEmpRecordid') //打开的内容
                });
                    $.ajax({
                        url:"/queryEmpRecordid",
                        type:"post",
                        data:{
                            "Emp_InfoId":Emp_InfoId
                        },
                        dataType:"json",
                        success:function(data){
                            var a = data.list[0];
                            $("#Emp_InfoName").html(a.Emp_InfoName);
                            $("#DeptId1").html(a.DeptName);
                            $("#PostId1").html(a.PostName);
                            $("#UserId1").html(a.UserId);
                            $("#JobNumber1").html(a.JobNumber);
                            $("#Emp_InfoName1").html(a.Emp_InfoName);
                            $("#Emp_InfoGender1").html(a.Emp_InfoGender);
                            $("#IdNumber1").html(a.IdNumber);
                            $("#Emp_InfoBrith1").html(a.Emp_InfoBrith);
                            $("#Emp_InfoAny1").html(a.Emp_InfoAny);
                            $("#Emp_InfoBlood1").html(a.Emp_InfoBlood);
                            $("#Emp_InfoAge1").html(a.Emp_InfoAge);
                            $("#AccountHome1").html(a.AccountHome);
                            $("#Democrats1").html(a.Democrats);
                            $("#MaritalStatus1").html(a.MaritalStatus);
                            $("#HealthState1").html(a.Emp_InfoName);
                            $("#HealthState").html(a.Emp_InfoName);
                            $("#AccountType1").html(a.AccountType);
                            $("#Native1").html(a.Native);
                            $("#PostName1").html(a.PostName);
                            $("#PositionLeval1").html(a.PositionLeval);
                            $("#Station1").html(a.Station);
                            $("#Duty1").html(a.PostName);
                            $("#Position1").html(a.Position);
                            $("#Emp_StateName1").html(a.Emp_StateName);
                            $("#Emp_InfoPhone1").html(a.Emp_InfoPhone);
                            $("#Emp_InfoEmail1").html(a.Emp_InfoEmail);
                            $("#AccountHome2").html(a.AccountHome);
                            $("#Emp_InfoQQ1").html(a.Emp_InfoQQ);
                            $("#GraduateSchool1").html(a.GraduateSchool);

                        }
                    });

            };
        });

    }

</script>