package com.example.demo.service.xx;

import com.example.demo.dao.xx.CheckDao;
import com.example.demo.dao.xx.WageProjectDao;
import com.example.demo.entity.Compantpersonage;
import com.example.demo.entity.Wagelevel;
import com.example.demo.entity.Wageproject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class WageProjetServiceImp implements WageProjetService {
    @Autowired
    private WageProjectDao dao;
    @Autowired
    private CheckDao checkDao;

    /*查询薪酬项目*/
    @Override
    public List<Map> xxWageprojectSelect() {
        return dao.xxWageprojectSelect();
    }
    /*查询薪酬项目类型*/
    @Override
    public List<Map> xxProjecttypeSelect() {
        return dao.xxProjecttypeSelect();
    }
    /*添加薪酬项目*/
    /*编辑薪酬项目*/
    @Override
    @Transactional
    public int xxWageprojectInsert(Wageproject wageproject,int wid,Integer id) {
        //1为添加 2为编辑
        int a = 0;
        if (wid == 1){
            a = dao.xxWageprojectInsert(wageproject);
        }else if (wid == 2){
            wageproject.setWageProjectId(id);//赋值
            a = dao.xxWageprojectUpdate(wageproject);
        }
        return a;
    }
    /*删除薪酬项目*/
    @Override
    public int xxWageprojectDelete(Wageproject wageproject) {
        return dao.xxWageprojectDelete(wageproject);
    }
    /*保险系数查询*/
    @Override
    public List<Map> xxCompantpersonageSelect() {
        return dao.xxCompantpersonageSelect();
    }
    /*更改保险基数*/
    @Override
    public int xxCompantpersonageUpdate(Compantpersonage compantpersonage) {
        return dao.xxCompantpersonageUpdate(compantpersonage);
    }
    /*查询工资基础*/
    @Override
    public List<Map> xxWagelevelSelect(Integer userid,String name) {
        return dao.xxWagelevelSelect(userid,name);
    }
    /*添加工资基础*/
    @Override
    @Transactional
    public int xxWagelevelInsert(Wagelevel wagelevel,Integer userIds,int money) {
        /*第一次签到；第一次签退*/

        wagelevel.setSubsidy(money);//把原先赋值的总钱数清空为原来的
        int go12 = checkDao.CheckGoOne2(userIds,null,null,wagelevel.getTime());int dow12 = checkDao.CheckDownOne2(userIds,null,null,wagelevel.getTime());//缺勤
        int go13 = checkDao.CheckGoOne3(userIds,null,null,wagelevel.getTime());int dow13 = checkDao.CheckDownOne3(userIds,null,null,wagelevel.getTime());//早退
        int go14 = checkDao.CheckGoOne4(userIds,null,null,wagelevel.getTime());int dow14 = checkDao.CheckDownOne4(userIds,null,null,wagelevel.getTime());//请假
        /*第二次签到；第二次签退*/
        int go22 = checkDao.CheckGoTwo2(userIds,null,null,wagelevel.getTime());int dow22 = checkDao.CheckDownTwo2(userIds,null,null,wagelevel.getTime()) ;
        int go23 = checkDao.CheckGoTwo3(userIds,null,null,wagelevel.getTime());int dow23 = checkDao.CheckDownTwo3(userIds,null,null,wagelevel.getTime());
        int go24 = checkDao.CheckGoTwo4(userIds,null,null,wagelevel.getTime());int dow24 = checkDao.CheckDownTwo4(userIds,null,null,wagelevel.getTime());
        int queqin = (go12+dow12+go22+dow22)*50;//计算出缺勤
        int zaotui = (go13+dow13+go23+dow23)*40;//计算出早退
        int qingjia = (go14+dow14+go24+dow24)*40;//计算出请假
        int p = (int) wagelevel.getSubsidy();
        int dzong = p-queqin-zaotui-qingjia;//计算出工资去除缺勤和早退和请假的总工资
        wagelevel.setSubsidy(dzong);
        return dao.xxWagelevelInsert(wagelevel);
    }
    /*查询薪资计算结果明细*/
    @Override
    @Transactional
    public Map xxWageLeavelS(Integer userId, String time) {
        Map map = new HashMap();
        int go12 = checkDao.CheckGoOne2(userId,null,null,time);int dow12 = checkDao.CheckDownOne2(userId,null,null,time);//缺勤
        int go13 = checkDao.CheckGoOne3(userId,null,null,time);int dow13 = checkDao.CheckDownOne3(userId,null,null,time);//早退
        int go14 = checkDao.CheckGoOne4(userId,null,null,time);int dow14 = checkDao.CheckDownOne4(userId,null,null,time);//请假
        /*第二次签到；第二次签退*/
        int go22 = checkDao.CheckGoTwo2(userId,null,null,time);int dow22 = checkDao.CheckDownTwo2(userId,null,null,time) ;
        int go23 = checkDao.CheckGoTwo3(userId,null,null,time);int dow23 = checkDao.CheckDownTwo3(userId,null,null,time);
        int go24 = checkDao.CheckGoTwo4(userId,null,null,time);int dow24 = checkDao.CheckDownTwo4(userId,null,null,time);
        int queqin = (go12+dow12+go22+dow22);int zaotui = (go13+dow13+go23+dow23);int qingjia = (go14+dow14+go24+dow24);//计算出缺勤//计算出早退//计算出请假
        map.put("queqin",queqin);
        map.put("zaotui",zaotui);
        map.put("qingjia",qingjia);
        return map;
    }


}
