package com.example.demo.service.xx;

import com.example.demo.dao.xx.XxDao;
import com.example.demo.entity.Arrangemanage;
import com.example.demo.entity.Schedulingmanage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class XxServiceImp implements XxService {

    @Autowired
    private XxDao xdao;

    /*班次分页模糊条件查询*/
    public List<Map<String,Object>> select(int page, int limit, String schedulingName){
        /*page =(page-1)*limit;*/
        return xdao.select(page,limit,schedulingName);
    }
    /*班次添加数据*/
    public int xxinsert(Schedulingmanage s){
        return xdao.xxinsert(s);
    }
    /*更改班次*/
    @Override
    public int xxupdate(Schedulingmanage s) {
        return xdao.xxupdate(s);
    }
    /*删除班次*/
    @Override
    public int xxdelete(int schedulingManagId) {
        return xdao.xxdelete(schedulingManagId);
    }

    /**
     * 查询班次
     * @return
     */
    @Override
    public List<Map<String, Object>> xxArrangemanageselect() {
        return xdao.xxArrangemanageselect();
    }
    /**
     * 根据id查询班次
     * @return
     */
    @Override
    public List<Map<String, Object>> xxArrangemanageselect1(int id) {
        return xdao.xxArrangemanageselect1(id);
    }

    /**
     * 更改排班状态
     * @param a
     * @return
     */
    @Override
    public int xxArrangemanageupdate(Arrangemanage a) {
        return xdao.xxArrangemanageupdate(a);
    }
    /*根据班次类型id查班次类型数据*/
    @Override
    public List<Map<String, Object>> xxSchedulingmanageselect(int sid) {
        return xdao.xxSchedulingmanageselect(sid);
    }
    /*添加排班表数据*/
    @Override
    public int xxArrangemanageinsert(Arrangemanage a) {
        return xdao.xxArrangemanageinsert(a);
    }
    /*删除排班*/
    @Override
    public int xxArrangemanagedelete(Arrangemanage a) {
        return xdao.xxArrangemanagedelete(a);
    }
    /*编辑排班*/
    @Override
    public int xxArrangemanageupdate1(Arrangemanage a) {
        return xdao.xxArrangemanageupdate1(a);
    }


}
