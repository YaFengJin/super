package com.example.demo.controller.dyf;

import com.example.demo.entity.Contract;
import com.example.demo.entity.EmpRecord;
import com.example.demo.entity.LeaveApply;
import com.example.demo.entity.Maintain;
import com.example.demo.service.dyf.dyfService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
public class dyfController {
    @Autowired
    private dyfService ds;

    //办公用品库的分页查询
    @RequestMapping(value = "/showData")
    public Map<String, Object> query1(
            @RequestParam(required = false, defaultValue = "1") int page,
            @RequestParam(required = false, defaultValue = "15") int limit,
            String keyWord
    ) {
        List<Map> datas = ds.query(page, limit, keyWord);
        int countx = ds.queryAllCount(keyWord);
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("code", 0);
        map.put("msg", "");
        map.put("count", countx);
        map.put("data", datas);
        return map;
    }

    //添加办公用品库
    @RequestMapping(value = "/savebank")
    public Map<String,Object> savebank(String b_bankname, String deptid, String userid, int bstate, HttpServletResponse response) {
        response.setContentType("html/text;charset=utf-8");
        response.setCharacterEncoding("utf-8");
        Map<String, Object> map = new HashMap<String, Object>();
        int a = ds.savebank(b_bankname, deptid, userid, bstate);
        if (a > 0) {
            map.put("message", "添加成功");
        } else {
            map.put("message", "添加失败");
        }
        return map;
    }

    //逻辑删除办公用品库
    @RequestMapping(value = "/deletebank")
    public Map<String,Object> deletebank(int b_id, HttpServletResponse response) {
        response.setContentType("html/text;charset=utf-8");
        response.setCharacterEncoding("utf-8");
        Map<String, Object> map = new HashMap<String, Object>();
        int a = ds.deletebank(b_id);
        if (a > 0) {
            map.put("message", "删除成功");
        } else {
            map.put("message", "删除失败");
        }
        return map;
    }

    //修改办公用品库的查询
    @RequestMapping(value = "/updatequerybank")
    public Map<String, Object> updatequerybank(int b_id) {
        List<Map> list = ds.updatequerybank(b_id);
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("list", list);
        return map;
    }

    //修改办公用品库
    @RequestMapping(value = "/updatebank")
    public Map<String,Object> updatebank(int b_id, String b_bankname, String deptid, String userid, HttpServletResponse response) {
        response.setContentType("html/text;charset=utf-8");
        response.setCharacterEncoding("utf-8");
        Map<String, Object> map = new HashMap<String, Object>();
        int a = ds.updatebank(b_id, b_bankname, deptid, userid);
        if (a > 0) {
            map.put("message", "更新成功");
        } else {
            map.put("message", "更新失败");
        }
        return map;
    }

    //办公用品类的查询
    @RequestMapping(value = "/querysort")
    public Map<String, Object> querysort(int b_id) {
        List<Map> datas = ds.querysort(b_id);
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("code", 0);
        map.put("msg", "");
        map.put("data", datas);
        return map;
    }

    //增加办公用品类的时候查询出所属的库
    @RequestMapping(value = "/querybankname")
    public Map<String, Object> querybankname(int b_id) {
        List<Map> list = ds.querybankname(b_id);
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("list", list);
        return map;
    }

    //增加办公用品类
    @RequestMapping(value = "/savesort")
    public Map<String,Object> savesort(int b_id, String sort_number, String sort_style, HttpServletResponse response) {
        response.setContentType("html/text;charset=utf-8");
        response.setCharacterEncoding("utf-8");
        Map<String, Object> map = new HashMap<String, Object>();
        int a = ds.savesort(b_id, sort_number, sort_style);
        if (a > 0) {
            map.put("message", "添加成功");
        } else {
            map.put("message", "添加失败");
        }
        return map;
    }

    //删除办公用品类
    @RequestMapping(value = "/deletesort")
    public Map<String,Object> deletesort(int sort_id, HttpServletResponse response) {
        response.setContentType("html/text;charset=utf-8");
        response.setCharacterEncoding("utf-8");
        Map<String, Object> map = new HashMap<String, Object>();
        int a = ds.deletesort(sort_id);
        if (a > 0) {
            map.put("message", "删除成功");
        } else {
            map.put("message", "删除失败");
        }
        return map;
    }

    //修改办公用品类用到的查询
    @RequestMapping(value = "/querysort1")
    public Map<String, Object> querysort1(int sort_id) {
        List<Map> list = ds.querysort1(sort_id);
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("list", list);
        return map;
    }

    //修改办公用品类
    @RequestMapping(value = "/updatesort")
    public Map<String,Object> updatesort(int sort_id, String sort_number, String sort_style, HttpServletResponse response) {
        response.setContentType("html/text;charset=utf-8");
        response.setCharacterEncoding("utf-8");
        Map<String, Object> map = new HashMap<String, Object>();
        int a = ds.updatesort(sort_id, sort_number, sort_style);
        if (a > 0) {
            map.put("message", "修改成功");
        } else {
            map.put("message", "修改失败");
        }
        return map;
    }

    //分页，条件查询办公用品
    @RequestMapping(value = "/quueryworksurface")
    public Map<String, Object> quueryworksurface(
            @RequestParam(required = false, defaultValue = "1") int page,
            @RequestParam(required = false, defaultValue = "15") int limit,
            String keyWord
    ) {
        List<Map> datas = ds.quueryworksurface(page, limit, keyWord);
        int countx = ds.queryAllworksurface(keyWord);
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("code", 0);
        map.put("msg", "");
        map.put("count", countx);
        map.put("data", datas);
        return map;
    }

    //删除办公用品
    @RequestMapping(value = "/deleteworksurface")
    public Map<String,Object> deleteworksurface(int work_id, HttpServletResponse response) {
        response.setContentType("html/text;charset=utf-8");
        response.setCharacterEncoding("utf-8");
        Map<String, Object> map = new HashMap<String, Object>();
        int a = ds.deleteworksurface(work_id);
        if (a > 0) {
            map.put("message", "删除成功");
        } else {
            map.put("message", "删除失败");
        }
        return map;
    }

    //新建办公用品用到的查询
    @RequestMapping(value = "/queryworkbank")
    public Map<String, Object> queryworkbank() {
        List<Map> list1 = ds.queryworkjin();
        List<Map> list2 = ds.querybankjin();
        List<Map> list3 = ds.queryregisterjin();
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("list1", list1);
        map.put("list2", list2);
        map.put("list3", list3);
        return map;
    }

    //根据办公用品库来查询办公用品类
    @RequestMapping(value = "/querysortjin")
    public Map<String, Object> querysortjin(int b_id) {
        List<Map> list = ds.querysortjin(b_id);
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("list", list);
        return map;
    }

    //增加办公用品
    @RequestMapping(value = "/saveworksurface")
    public Map<String,Object> saveworksurface(String work_name, int b_id, int sort_id, String UserId, String work_specification, int wj_id, String work_unit, String work_sprice, String work_supplier, String setid, int work_repertory, int work_dline, int work_gline, HttpServletResponse response) {
        response.setContentType("html/text;charset=utf-8");
        response.setCharacterEncoding("utf-8");
        Map<String, Object> map = new HashMap<String, Object>();
        int a = ds.saveworksurface(work_name, b_id, sort_id, UserId, work_specification, wj_id, work_unit, work_sprice, work_supplier, setid, work_repertory, work_dline, work_gline);
        if (a > 0) {
            map.put("message", "添加成功");
        } else {
            map.put("message", "添加失败");
        }
        return map;
    }

    //修改办公物品用到的查询
    @RequestMapping(value = "/queryworksurfaceup")
    public Map<String, Object> queryworksurfaceup(int work_id) {
        List<Map> list1 = ds.queryworksurfaceup(work_id);
        List<Map> list2 = ds.querybankjin();
        List<Map> list3 = ds.queryworkjin();
        List<Map> list4 = ds.querysortji();
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("list1", list1);
        map.put("list2", list2);
        map.put("list3", list3);
        map.put("list4", list4);
        return map;
    }

    //修改办公物品
    @RequestMapping(value = "/updateworksurface")
    public Map<String,Object> updateworksurface(int work_id, String work_name, int b_id, int sort_id, String UserId, String work_specification, int wj_id, String work_unit, String work_sprice, String work_supplier, String setid, int work_repertory, int work_dline, int work_gline, HttpServletResponse response) {
        response.setContentType("html/text;charset=utf-8");
        response.setCharacterEncoding("utf-8");
        Map<String, Object> map = new HashMap<String, Object>();
        int a = ds.updateworksurface(work_id, work_name, b_id, sort_id, UserId, work_specification, wj_id, work_unit, work_sprice, work_supplier, setid, work_repertory, work_dline, work_gline);
        if (a > 0) {
            map.put("message", "修改成功");
        } else {
            map.put("message", "修改失败");
        }
        return map;
    }

    //根据办公用品类查询办公物品
    @RequestMapping(value = "/queryworksurfacejin")
    public Map<String, Object> queryworksurfacejin(int sort_id) {
        List<Map> list = ds.queryworksurfacejin(sort_id);
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("list", list);
        return map;
    }

    //根据办公物品查询价格和数量
    @RequestMapping(value = "/queryworksurface")
    public Map<String, Object> queryworksurface(int work_id) {
        List<Map> list = ds.queryworksurface(work_id);
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("list", list);
        return map;
    }

    //新建办公用品申领
    @RequestMapping(value = "/saveApply")
    public Map<String,Object> saveApply(int wj_id, int b_id, int sort_id, int work_id, Double apply_price, int apply_number, String useid,String UserId, String apply_comment, int apply_state, String apply_date, HttpServletResponse response) {
        response.setContentType("html/text;charset=utf-8");
        response.setCharacterEncoding("utf-8");
        Map<String, Object> map = new HashMap<String, Object>();
        int a = ds.saveApply(wj_id, b_id, sort_id, work_id, apply_price, apply_number, useid,UserId, apply_comment, apply_state, apply_date);
        if (a > 0) {
            map.put("message", "添加成功");
        } else {
            map.put("message", "添加失败");
        }
        return map;
    }

    //分页查询申领记录
    @RequestMapping(value = "/showApply")
    public Map<String, Object> showApply(
            @RequestParam(required = false, defaultValue = "1") int page,
            @RequestParam(required = false, defaultValue = "15") int limit,
            int UserId
    ) {
        List<Map> datas = ds.queryApply(page, limit,UserId);
        int countx = ds.countApply(UserId);
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("code", 0);
        map.put("msg", "");
        map.put("count", countx);
        map.put("data", datas);
        System.out.println(map.toString());
        return map;
    }

    //删除申领记录
    @RequestMapping(value = "/deleteApply")
    public Map<String,Object> deleteApply(int apply_id, HttpServletResponse response) {
        response.setContentType("html/text;charset=utf-8");
        response.setCharacterEncoding("utf-8");
        Map<String, Object> map = new HashMap<String, Object>();
        int a = ds.deleteApply(apply_id);
        if (a > 0) {
            map.put("message", "删除成功");
        } else {
            map.put("message", "删除失败");
        }
        return map;
    }

    //修改申领记录用到的查询
    @RequestMapping(value = "/queryApplyup")
    public Map<String, Object> queryApplyup(int apply_id) {
        List<Map> list1 = ds.queryApplyup(apply_id);
        List<Map> list2 = ds.querybankjin();
        List<Map> list3 = ds.queryworkjin();
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("list1", list1);
        map.put("list2", list2);
        map.put("list3", list3);
        return map;
    }

    //修改申领记录
    @RequestMapping(value = "/updateApply")
    public Map<String,Object> updateApply(int apply_id, int wj_id, int b_id, int sort_id, Double apply_price, int apply_number, String apply_comment, String apply_date, HttpServletResponse response) {
        response.setContentType("html/text;charset=utf-8");
        response.setCharacterEncoding("utf-8");
        Map<String, Object> map = new HashMap<String, Object>();
        int a = ds.updateApply(apply_id,wj_id,b_id,sort_id,apply_price,apply_number,apply_comment,apply_date);
        if (a > 0) {
            map.put("message", "修改成功");
        } else {
            map.put("message", "修改失败");
        }
        return map;
    }

    //分页查询需要审批的申领信息
    @RequestMapping(value = "/showApply1")
    public Map<String, Object> showApply1() {
        List<Map> datas = ds.queryApply1();
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("code", 0);
        map.put("msg", "");
        map.put("data", datas);
        return map;
    }

    //查询单个需要审批的申领详细信息
    @RequestMapping(value = "/queryApplyid")
    public Map<String, Object> queryApplyid(int apply_id) {
        List<Map> datas = ds.queryApplyid(apply_id);
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("code", 0);
        map.put("msg", "");
        map.put("data", datas);
        return map;
    }

    //修改申领信息的状态
    @RequestMapping(value = "/updateApplyState")
    public Map<String,Object> updateApplyState(int apply_id, HttpServletResponse response) {
        response.setContentType("html/text;charset=utf-8");
        response.setCharacterEncoding("utf-8");
        Map<String, Object> map = new HashMap<String, Object>();
        int a = ds.updateApplyState(apply_id);
        if (a > 0) {
            map.put("message", "批准成功");
        } else {
            map.put("message", "批准失败");
        }
        return map;
    }

    //审批不通过修改申领信息的状态和备注
    @RequestMapping(value = "/updateApplyState1")
    public Map<String,Object> updateApplyState1(String spyj,int apply_id, HttpServletResponse response) {
        response.setContentType("html/text;charset=utf-8");
        response.setCharacterEncoding("utf-8");
        Map<String, Object> map = new HashMap<String, Object>();
        int a = ds.updateApplyState1(spyj,apply_id);
        if (a > 0) {
            map.put("message", "不批准成功");
        } else {
            map.put("message", "不批准失败");
        }
        return map;
    }

    //办公用品发放
    @RequestMapping(value = "/Applyff")
    public Map<String,Object> Applyff(int apply_id,int apply_number,int work_id, HttpServletResponse response) {
        response.setContentType("html/text;charset=utf-8");
        response.setCharacterEncoding("utf-8");
        Map<String, Object> map = new HashMap<String, Object>();
        int a = ds.ApplyFF(apply_id,work_id,apply_number);
        if (a > 0) {
            map.put("message", "发放成功");
        } else {
            map.put("message", "发放失败");
        }
        return map;
    }

    //办公用品归还申请
    @RequestMapping(value = "/ApplyGHSQ")
    public Map<String,Object> ApplyGHSQ(int apply_id, HttpServletResponse response) {
        response.setContentType("html/text;charset=utf-8");
        response.setCharacterEncoding("utf-8");
        Map<String, Object> map = new HashMap<String, Object>();
        int a = ds.ApplyGHSQ(apply_id);
        if (a > 0) {
            map.put("message", "归还申请成功");
        } else {
            map.put("message", "归还申请失败");
        }
        return map;
    }

    //办公用品归还
    @RequestMapping(value = "/ApplyGH")
    public Map<String,Object> ApplyGH(int apply_id,int apply_number,int work_id, HttpServletResponse response) {
        response.setContentType("html/text;charset=utf-8");
        response.setCharacterEncoding("utf-8");
        Map<String, Object> map = new HashMap<String, Object>();
        int a = ds.ApplyGH(apply_id,work_id,apply_number);
        if (a > 0) {
            map.put("message", "归还成功");
        } else {
            map.put("message", "归还失败");
        }
        return map;
    }

    //办公用品归还不通过
    @RequestMapping(value = "/ApplyGHBTG")
    public Map<String,Object> ApplyGHBTG(int apply_id, String spyj, HttpServletResponse response) {
        response.setContentType("html/text;charset=utf-8");
        response.setCharacterEncoding("utf-8");
        Map<String, Object> map = new HashMap<String, Object>();
        int a = ds.ApplyGHBTG(apply_id,spyj);
        if (a > 0) {
            map.put("message", "归还不通过成功");
        } else {
            map.put("message", "归还不通过失败");
        }
        return map;
    }

    //办公用品归还通过
    @RequestMapping(value = "/ApplyGHTG")
    public Map<String,Object> ApplyGHTG(int apply_id, int work_id, int apply_number, HttpServletResponse response) {
        response.setContentType("html/text;charset=utf-8");
        response.setCharacterEncoding("utf-8");
        Map<String, Object> map = new HashMap<String, Object>();
        int a = ds.ApplyGHTG(apply_id,work_id,apply_number);
        if (a > 0) {
            map.put("message", "归还通过成功");
        } else {
            map.put("message", "归还通过失败");
        }
        return map;
    }

    //办公物品采购
    @RequestMapping(value = "/MaintainCG")
    public Map<String,Object> MaintainCG(Maintain m,int work_id, int mt_number, HttpServletResponse response) {
        response.setContentType("html/text;charset=utf-8");
        response.setCharacterEncoding("utf-8");
        Map<String, Object> map = new HashMap<String, Object>();
        int a = ds.MaintainCG(m,work_id,mt_number);
        if (a > 0) {
            map.put("message", "采购成功");
        } else {
            map.put("message", "采购失败");
        }
        return map;
    }

    //办公物品维护
    @RequestMapping(value = "/MaintainWH")
    public Map<String,Object> MaintainWH(Maintain m,int work_id, int mt_number, HttpServletResponse response) {
        response.setContentType("html/text;charset=utf-8");
        response.setCharacterEncoding("utf-8");
        Map<String, Object> map = new HashMap<String, Object>();
        int a = ds.MaintainWH(m,work_id,mt_number);
        if (a > 0) {
            map.put("message", "维护成功");
        } else {
            map.put("message", "维护失败");
        }
        return map;
    }

    //新建人事档案用到的查询
    @RequestMapping(value = "/seEmpRecord")
    public Map<String, Object> seEmpRecord() {
        List<Map> list1 = ds.queryPost();
        List<Map> list2 = ds.queryEmpState();
        List<Map> list3 = ds.queryEmpType();
        List<Map> list4 = ds.queryDictionaries();
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("list1", list1);
        map.put("list2", list2);
        map.put("list3", list3);
        map.put("list4", list4);
        return map;
    }

    //根据员工ID查询员工信息
    @RequestMapping(value = "/queryUserSurFace")
    public Map<String, Object> queryUserSurFace(int userId) {
        List<Map> list = ds.queryUserSurFace(userId);
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("list", list);
        return map;
    }

    //新建人事档案
    @RequestMapping(value = "/saveEmpRecord")
    public Map<String,Object> saveEmpRecord(EmpRecord er, HttpServletResponse response) {
        response.setContentType("html/text;charset=utf-8");
        response.setCharacterEncoding("utf-8");
        Map<String, Object> map = new HashMap<String, Object>();
        int a = ds.saveEmpRecord(er);
        if (a > 0) {
            map.put("message", "新建成功");
        } else {
            map.put("message", "新建失败");
        }
        return map;
    }

    //分页查询人事档案
    @RequestMapping(value = "/queryEmpRecord")
    public Map<String, Object> queryEmpRecord(
            @RequestParam(required = false, defaultValue = "1") int page,
            @RequestParam(required = false, defaultValue = "15") int limit
    ) {
        List<Map> datas = ds.queryEmpRecord(page, limit);
        int countx = ds.countEmpRecord();
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("code", 0);
        map.put("msg", "");
        map.put("count", countx);
        map.put("data", datas);
        return map;
    }

    //查看单个人事档案的详细信息
    @RequestMapping(value = "/queryEmpRecordid")
    public Map<String, Object> queryEmpRecordid(int Emp_InfoId) {
        List<Map> list = ds.queryEmpRecordid(Emp_InfoId);
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("list", list);
        return map;
    }

    //OA用户名的唯一验证
    @RequestMapping(value = "/queryUserAccount")
    public Map<String,Object> queryUserAccount(String userAccount, HttpServletResponse response) {
        response.setContentType("html/text;charset=utf-8");
        response.setCharacterEncoding("utf-8");
        Map<String, Object> map = new HashMap<String, Object>();
        int a = ds.queryUserAccount(userAccount);
        if (a > 0) {
            map.put("message", "OA用户名已存在，请重新输入！");
        } else {
            map.put("message", "OA用户名可以使用");
        }
        return map;
    }

    //新建合同用到打的查询
    @RequestMapping(value = "/savecontractquery")
    public Map<String, Object> savecontractquery() {
        List<Map> list1 = ds.queryContractCom();
        List<Map> list2 = ds.queryContractType();
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("list1", list1);
        map.put("list2", list2);
        return map;
    }

    //根据用户名字查询用户信息
    @RequestMapping(value = "/queryuser")
    public Map<String, Object> queryuser(String userName) {
        List<Map> list = ds.queryuser(userName);
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("list", list);
        return map;
    }

    //合同分页查询
    @RequestMapping(value = "/queryContract")
    public Map<String, Object> queryContract(
            @RequestParam(required = false, defaultValue = "1") int page,
            @RequestParam(required = false, defaultValue = "15") int limit
    ) {
        List<Map> datas = ds.queryContract(page, limit);
        int countx = ds.countContract();
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("code", 0);
        map.put("msg", "");
        map.put("count", countx);
        map.put("data", datas);
        return map;
    }

    //新建合同
    @RequestMapping(value = "/savecontract")
    public Map<String,Object> savecontract(Contract c, HttpServletResponse response) {
        response.setContentType("html/text;charset=utf-8");
        response.setCharacterEncoding("utf-8");
        Map<String, Object> map = new HashMap<String, Object>();
        int a = ds.savecontract(c);
        if (a > 0) {
            map.put("message", "新建成功");
        } else {
            map.put("message", "新建失败");
        }
        return map;
    }

    //修改合同用到的查询
    @RequestMapping(value = "/updatequeryContract")
    public Map<String, Object> updatequeryContract(int ContractId) {
        List<Map> list1 = ds.updatequeryContract(ContractId);
        List<Map> list2 = ds.queryContractCom();
        List<Map> list3 = ds.queryContractType();
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("list1",list1);
        map.put("list2",list2);
        map.put("list3",list3);
        return map;
    }

    //根据用户ID查询出用户的工资
    @RequestMapping(value = "/querycontractmoney")
    public Map<String, Object> querycontractmoney(int UserId) {
        List<Map> list = ds.querycontractmoney(UserId);
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("list",list);
        return map;
    }

    //修改合同
    @RequestMapping(value = "/updateContract")
    public Map<String,Object> updateContract(Contract c, HttpServletResponse response) {
        response.setContentType("html/text;charset=utf-8");
        response.setCharacterEncoding("utf-8");
        Map<String, Object> map = new HashMap<String, Object>();
        int a = ds.updateContract(c);
        if (a > 0) {
            map.put("message", "修改成功");
        } else {
            map.put("message", "修改失败");
        }
        return map;
    }

    //查看单个合同的详细信息
    @RequestMapping(value = "/queryidcontract")
    public Map<String, Object> queryidcontract(int ContractId) {
        List<Map> list = ds.queryidcontract(ContractId);
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("list",list);
        return map;
    }

    //新建离职申请
    @RequestMapping(value = "/saveLeaveApply")
    public Map<String,Object> saveLeaveApply(LeaveApply la, HttpServletResponse response) {
        response.setContentType("html/text;charset=utf-8");
        response.setCharacterEncoding("utf-8");
        Map<String, Object> map = new HashMap<String, Object>();
        int a = ds.saveLeaveApply(la);
        if (a > 0) {
            map.put("message", "新建成功");
        } else {
            map.put("message", "新建失败");
        }
        return map;
    }

    //修改员工人事档案的状态
    @RequestMapping(value = "/updateEmpRecord")
    public Map<String,Object> updateEmpRecord(int UserId, HttpServletResponse response) {
        response.setContentType("html/text;charset=utf-8");
        response.setCharacterEncoding("utf-8");
        Map<String, Object> map = new HashMap<String, Object>();
        int a = ds.updateEmpRecord(UserId);
        if (a > 0) {
            map.put("message", "新建成功");
        } else {
            map.put("message", "新建失败");
        }
        return map;
    }

    //分页查询需要审批的离职申请
    @RequestMapping(value = "/queryLeaveApply")
    public Map<String, Object> queryLeaveApply(
            @RequestParam(required = false, defaultValue = "1") int page,
            @RequestParam(required = false, defaultValue = "15") int limit
    ) {
        List<Map> datas = ds.queryLeaveApply(page, limit);
        int countx = ds.countLeaveApply();
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("code", 0);
        map.put("msg", "");
        map.put("count", countx);
        map.put("data", datas);
        return map;
    }

    //通过用户编号分页查询离职记录
    @RequestMapping(value = "/queryLeaveApplyjl")
    public Map<String, Object> queryLeaveApplyjl(
            @RequestParam(required = false, defaultValue = "1") int page,
            @RequestParam(required = false, defaultValue = "15") int limit,
            int UserId
    ) {
        List<Map> datas = ds.queryLeaveApplyjl(page, limit,UserId);
        int countx = ds.countLeaveApplyjl(UserId);
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("code", 0);
        map.put("msg", "");
        map.put("count", countx);
        map.put("data", datas);
        return map;
    }

    //修改离职申请用到的查询
    @RequestMapping(value = "/updatequeryLeaveApply")
    public Map<String, Object> updatequeryLeaveApply(int Leave_AppLyId) {
        List<Map> datas = ds.updatequeryLeaveApply(Leave_AppLyId);
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("code", 0);
        map.put("msg", "");
        map.put("data", datas);
        System.out.println(map.toString());
        return map;
    }

    //修改离职申请
    @RequestMapping(value = "/updateLeaveApply")
    public Map<String,Object> updateLeaveApply(LeaveApply la, HttpServletResponse response) {
        response.setContentType("html/text;charset=utf-8");
        response.setCharacterEncoding("utf-8");
        Map<String, Object> map = new HashMap<String, Object>();
        int a = ds.updateLeaveApply(la);
        if (a > 0) {
            map.put("message", "修改成功");
        } else {
            map.put("message", "修改失败");
        }
        return map;
    }

    //
    @RequestMapping(value = "/queryapplyjl")
    public Map<String, Object> queryapplyjl(int UserId) {
        List<Map> datas = ds.queryapplyjl(UserId);
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("code", 0);
        map.put("msg", "");
        map.put("data", datas);
        return map;
    }

    //离职申请审核不通过
    @RequestMapping(value = "/updateleaveapplyleavego")
    public Map<String,Object> updateleaveapplyleavego(String spyj, int Leave_AppLyId, HttpServletResponse response) {
        response.setContentType("html/text;charset=utf-8");
        response.setCharacterEncoding("utf-8");
        Map<String, Object> map = new HashMap<String, Object>();
        int a = ds.updateleaveapplyleavego(spyj,Leave_AppLyId);
        if (a > 0) {
            map.put("message", "审批不通过成功");
        } else {
            map.put("message", "审批不通过失败");
        }
        return map;
    }

    //离职申请审核通过
    @RequestMapping(value = "/LeaveApplyshtg")
    public Map<String,Object> LeaveApplyshtg(int Leave_AppLyId,int UserId,String time, HttpServletResponse response) {
        response.setContentType("html/text;charset=utf-8");
        response.setCharacterEncoding("utf-8");
        Map<String, Object> map = new HashMap<String, Object>();
        int a = ds.LeaveApplyshtg(Leave_AppLyId,UserId,time);
        if (a > 0) {
            map.put("message", "审批通过成功");
        } else {
            map.put("message", "审批通过失败");
        }
        return map;
    }

    //
    @RequestMapping(value = "/queryApply2")
    public int queryApply2(int UserId) {
        int a = ds.queryApply2(UserId);
        int result=0;
        Map<String, Object> map = new HashMap<String, Object>();
        if (a>0){
            result=1;
        }
        return result;
    }

}
