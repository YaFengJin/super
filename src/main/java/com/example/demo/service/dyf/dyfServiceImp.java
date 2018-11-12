package com.example.demo.service.dyf;

import com.example.demo.dao.dyf.dyfDao;
import com.example.demo.entity.Contract;
import com.example.demo.entity.EmpRecord;
import com.example.demo.entity.LeaveApply;
import com.example.demo.entity.Maintain;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

@Service
public class dyfServiceImp implements dyfService{
    @Autowired
    private dyfDao dao;

    @Override
    public List<Map> query(int page, int limit, String keyword) {
        page=(page-1)*limit;
        return dao.query(page,limit,keyword);
    }

    @Override
    public int queryAllCount(String keyWord) {
        return dao.queryAllCount(keyWord);
    }

    @Override
    public int savebank(String b_bankname, String deptid, String userid, int bstate) {
        return dao.savebank(b_bankname,deptid,userid,bstate);
    }

    @Override
    public int deletebank(int b_id) {
        return dao.deletebank(b_id);
    }

    @Override
    public List<Map> updatequerybank(int b_id) {
        return dao.updatequerybank(b_id);
    }

    @Override
    public int updatebank(int b_id,String b_bankname, String deptid, String userid) {
        return dao.updatebank(b_id,b_bankname,deptid,userid);
    }

    @Override
    public List<Map> querysort(int b_id) {
        return dao.querysort(b_id);
    }

    @Override
    public List<Map> querybankname(int b_id) {
        return dao.querybankname(b_id);
    }

    @Override
    public int savesort(int b_id, String sort_number, String sort_style) {
        return dao.savesort(b_id,sort_number,sort_style);
    }

    @Override
    public int deletesort(int sort_id) {
        return dao.deletesort(sort_id);
    }

    @Override
    public List<Map> querysort1(int sort_id) {
        return dao.querysort1(sort_id);
    }

    @Override
    public int updatesort(int sort_id, String sort_number, String sort_style) {
        return dao.updatesort(sort_id,sort_number,sort_style);
    }

    @Override
    public List<Map> quueryworksurface(int page, int limit, String keyword) {
        page=(page-1)*limit;
        return dao.quueryworksurface(page,limit,keyword);
    }

    @Override
    public int queryAllworksurface(String keyWord) {
        return dao.queryAllworksurface(keyWord);
    }

    @Override
    public int deleteworksurface(int work_id) {
        return dao.deleteworksurface(work_id);
    }

    @Override
    public List<Map> queryworkjin() {
        return dao.queryworkjin();
    }

    @Override
    public List<Map> queryregisterjin() {
        return dao.queryregisterjin();
    }

    @Override
    public List<Map> querybankjin() {
        return dao.querybankjin();
    }

    @Override
    public List<Map> querysortji() {
        return dao.querysortji();
    }

    @Override
    public List<Map> querysortjin(int b_id) {
        return dao.querysortjin(b_id);
    }

    @Override
    public int saveworksurface(String work_name, int b_id, int sort_id, String UserId, String work_specification, int wj_id, String work_unit, String work_sprice, String work_supplier, String setid, int work_repertory, int work_dline, int work_gline) {
        return dao.saveworksurface(work_name,b_id,sort_id,UserId,work_specification,wj_id,work_unit,work_sprice,work_supplier,setid,work_repertory,work_dline,work_gline);
    }

    @Override
    public List<Map> queryworksurfaceup(int work_id) {
        return dao.queryworksurfaceup(work_id);
    }

    @Override
    public int updateworksurface(int work_id, String work_name, int b_id, int sort_id, String UserId, String work_specification, int wj_id, String work_unit, String work_sprice, String work_supplier, String setid, int work_repertory, int work_dline, int work_gline) {
        return dao.updateworksurface(work_id,work_name,b_id,sort_id,UserId,work_specification,wj_id,work_unit,work_sprice,work_supplier,setid,work_repertory,work_dline,work_gline);
    }

    @Override
    public List<Map> queryworksurfacejin(int sort_id) {
        return dao.queryworksurfacejin(sort_id);
    }

    @Override
    public List<Map> queryworksurface(int work_id) {
        return dao.queryworksurface(work_id);
    }

    @Override
    public int saveApply(int wj_id, int b_id, int sort_id, int work_id, Double apply_price, int apply_number, String useid,String UserId ,String apply_comment, int apply_state,String apply_date) {
        return dao.saveApply(wj_id,b_id,sort_id,work_id,apply_price,apply_number,useid,UserId,apply_comment,apply_state,apply_date);
    }

    @Override
    public List<Map> queryApply(int page, int limit,int UserId) {
        page=(page-1)*limit;
        return dao.queryApply(page,limit,UserId);
    }

    @Override
    public int countApply(int UserId) {
        return dao.countApply(UserId);
    }

    @Override
    public int deleteApply(int apply_id) {
        return dao.deleteApply(apply_id);
    }

    @Override
    public List<Map> queryApplyup(int apply_id) {
        return dao.queryApplyup(apply_id);
    }

    @Override
    public int updateApply(int apply_id, int wj_id, int b_id, int sort_id, Double apply_price, int apply_number, String apply_comment, String apply_date) {
        return dao.updateApply(apply_id,wj_id,b_id,sort_id,apply_price,apply_number,apply_comment,apply_date);
    }

    @Override
    public List<Map> queryApply1() {
        return dao.queryApply1();
    }

    @Override
    public List<Map> queryApplyid(int apply_id) {
        return dao.queryApplyid(apply_id);
    }

    @Override
    public int updateApplyState(int apply_id) {
        return dao.updateApplyState(apply_id);
    }

    @Override
    @Transactional
    public int updateApplyState1(String spyj,int apply_id) {
        int a = dao.updateApplyspyj(spyj,apply_id);
        int b = dao.updateApplyState1(apply_id);
        int result=0;
        if (a>0 && b>0){
            result=1;
        }else{
            result=0;
        }
        return result;
    }

    @Override
    @Transactional
    public int ApplyFF(int apply_id, int work_id, int apply_number) {
        int a=dao.Applyff1(apply_id);
        int b=dao.Applyff2(work_id,apply_number);
        int result=0;
        if(a>0&&b>0){
          result=1;
        }else{
            result=0;
        }
        return result;
    }

    @Override
    public int ApplyGHSQ(int apply_id) {
        return dao.ApplyGHSQ(apply_id);
    }

    @Override
    @Transactional
    public int ApplyGH(int apply_id, int work_id, int apply_number) {
        int a=dao.ApplyGH1(apply_id);
        int b=dao.ApplyGH2(work_id,apply_number);
        int result=0;
        if(a>0&&b>0){
            result=1;
        }else{
            result=0;
        }
        return result;
    }

    @Override
    @Transactional
    public int ApplyGHBTG(int apply_id, String spyj) {
        int a = dao.ApplyGHBTG1(apply_id);
        int b = dao.ApplyGHBTG2(spyj, apply_id);
        int result = 0;
        if (a>0 && b>0){
            result=1;
        }else{
            result=0;
        }
        return result;
    }

    @Override
    @Transactional
    public int ApplyGHTG(int apply_id, int work_id, int apply_number) {
        int a = dao.ApplyGHTG1(apply_id);
        int b = dao.ApplyGHTG2(work_id, apply_number);
        int result = 0;
        if (a>0 && b>0){
            result=1;
        }else{
            result=0;
        }
        return result;
    }

    @Override
    @Transactional
    public int MaintainCG(Maintain m, int work_id, int mt_number) {
        int a = dao.saveMaintain1(m);
        int b = dao.updateMaintain(work_id,mt_number);
        int result=0;
        if(a>0&&b>0){
            result=1;
        }else{
            result=0;
        }
        return result;
    }

    @Override
    @Transactional
    public int MaintainWH(Maintain m, int work_id, int mt_number) {
        int a = dao.saveMaintain2(m);
        int b = dao.updateMaintain(work_id,mt_number);
        int result=0;
        if(a>0&&b>0){
            result=1;
        }else{
            result=0;
        }
        return result;
    }

    @Override
    public List<Map> queryPost() {
        return dao.queryPost();
    }

    @Override
    public List<Map> queryEmpState() {
        return dao.queryEmpState();
    }

    @Override
    public List<Map> queryEmpType() {
        return dao.queryEmpType();
    }

    @Override
    public List<Map> queryDictionaries() {
        return dao.queryDictionaries();
    }

    @Override
    public List<Map> queryUserSurFace(int userId) {
        return dao.queryUserSurFace(userId);
    }

    @Override
    public int saveEmpRecord(EmpRecord er) {
        return dao.saveEmpRecord(er);
    }

    @Override
    public List<Map> queryEmpRecord(int page, int limit) {
        page=(page-1)*limit;
        return dao.queryEmpRecord(page,limit);
    }

    @Override
    public int countEmpRecord() {
        return dao.countEmpRecord();
    }

    @Override
    public List<Map> queryEmpRecordid(int Emp_InfoId) {
        return dao.queryEmpRecordid(Emp_InfoId);
    }

    @Override
    public int queryUserAccount(String userAccount) {
        return dao.queryUserAccount(userAccount);
    }

    @Override
    public List<Map> queryContractCom() {
        return dao.queryContractCom();
    }

    @Override
    public List<Map> queryContractType() {
        return dao.queryContractType();
    }

    @Override
    public List<Map> queryuser(String userName) {
        return dao.queryuser(userName);
    }

    @Override
    public List<Map> queryContract(int page, int limit) {
        page=(page-1)*limit;
        return dao.queryContract(page,limit);
    }

    @Override
    public int countContract() {
        return dao.countContract();
    }

    @Override
    public int savecontract(Contract c) {
        return dao.savecontract(c);
    }

    @Override
    public List<Map> updatequeryContract(int ContractId) {
        return dao.updatequeryContract(ContractId);
    }

    @Override
    public int updateContract(Contract c) {
        return dao.updateContract(c);
    }

    @Override
    public List<Map> queryidcontract(int ContractId) {
        return dao.queryidcontract(ContractId);
    }

    @Override
    public List<Map> querycontractmoney(int UserId) {
        return dao.querycontractmoney(UserId);
    }

    @Override
    public int saveLeaveApply(LeaveApply la) {
        return dao.saveLeaveApply(la);
    }

    @Override
    public int updateEmpRecord(int UserId) {
        return dao.updateEmpRecord(UserId);
    }

    @Override
    public List<Map> queryLeaveApply(int page, int limit) {
        page=(page-1)*limit;
        return dao.queryLeaveApply(page,limit);
    }

    @Override
    public int countLeaveApply() {
        return dao.countLeaveApply();
    }

    @Override
    public List<Map> queryLeaveApplyjl(int page, int limit, int UserId) {
        page=(page-1)*limit;
        return dao.queryLeaveApplyjl(page,limit,UserId);
    }

    @Override
    public int countLeaveApplyjl(int UserId) {
        return dao.countLeaveApplyjl(UserId);
    }

    @Override
    public List<Map> updatequeryLeaveApply(int Leave_AppLyId) {
        return dao.updatequeryLeaveApply(Leave_AppLyId);
    }

    @Override
    public int updateLeaveApply(LeaveApply la) {
        return dao.updateLeaveApply(la);
    }

    @Override
    public List<Map> queryapplyjl(int UserId) {
        return dao.queryapplyjl(UserId);
    }

    @Override
    public int updateleaveapplyleavego(String spyj, int Leave_AppLyId) {
        return dao.updateleaveapplyleavego(spyj,Leave_AppLyId);
    }

    @Override
    @Transactional
    public int LeaveApplyshtg(int Leave_AppLyId, int UserId,String time) {
        int a = dao.updateleaveapplytg1(Leave_AppLyId,time);
        int b = dao.updateleaveapplytg2(UserId);
        int result = 0;
        if(a>0&&b>0){
            result=1;
        }else{
            result=0;
        }
        return result;
    }

    @Override
    public int queryApply2(int UserId) {
        return dao.queryApply2(UserId);
    }


}
