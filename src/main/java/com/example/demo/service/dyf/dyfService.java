package com.example.demo.service.dyf;

import com.example.demo.entity.Contract;
import com.example.demo.entity.EmpRecord;
import com.example.demo.entity.LeaveApply;
import com.example.demo.entity.Maintain;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface dyfService {
    List<Map> query(int page, int limit, String keyword);
    int queryAllCount(String keyWord);
    int savebank(String b_bankname, String deptid, String userid, int bstate);
    int deletebank(int b_id);
    List<Map> updatequerybank(int b_id);
    int updatebank(int b_id, String b_bankname, String deptid, String userid);
    List<Map> querysort(int b_id);
    List<Map> querybankname(int b_id);
    int savesort(int b_id, String sort_number, String sort_style);
    int deletesort(int sort_id);
    List<Map> querysort1(int sort_id);
    int updatesort(int sort_id, String sort_number, String sort_style);
    List<Map> quueryworksurface(int page, int limit, String keyword);
    int queryAllworksurface(String keyWord);
    int deleteworksurface(int work_id);


    List<Map> queryworkjin();
    List<Map> queryregisterjin();
    List<Map> querybankjin();
    List<Map> querysortji();
    List<Map> querysortjin(int b_id);

    int saveworksurface(String work_name, int b_id, int sort_id, String UserId, String work_specification, int wj_id, String work_unit, String work_sprice, String work_supplier, String setid, int work_repertory, int work_dline, int work_gline);
    List<Map> queryworksurfaceup(int work_id);
    int updateworksurface(int work_id, String work_name, int b_id, int sort_id, String UserId, String work_specification, int wj_id, String work_unit, String work_sprice, String work_supplier, String setid, int work_repertory, int work_dline, int work_gline);
    List<Map> queryworksurfacejin(int sort_id);
    List<Map> queryworksurface(int work_id);
    int saveApply(int wj_id, int b_id, int sort_id, int work_id, Double apply_price, int apply_number, String useid, String UserId, String apply_comment, int apply_state, String apply_date);

    List<Map> queryApply(int page, int limit);
    int countApply();
    int deleteApply(int apply_id);
    List<Map> queryApplyup(int apply_id);
    int updateApply(int apply_id, int wj_id, int b_id, int sort_id, Double apply_price, int apply_number, String apply_comment, String apply_date);
    List<Map> queryApply1();
    List<Map> queryApplyid(int apply_id);
    int updateApplyState(int apply_id);
    int updateApplyState1(String spyj, int apply_id);
    int ApplyFF(int apply_id, int work_id, int apply_number);
    int ApplyGHSQ(int apply_id);
    int ApplyGH(int apply_id, int work_id, int apply_number);
    int ApplyGHBTG(int apply_id, String spyj);
    int ApplyGHTG(int apply_id, int work_id, int apply_number);

    int MaintainCG(Maintain m, int work_id, int mt_number);
    int MaintainWH(Maintain m, int work_id, int mt_number);

    List<Map> queryPost();
    List<Map> queryEmpState();
    List<Map> queryEmpType();
    List<Map> queryDictionaries();
    List<Map> queryUserSurFace(int userId);
    int saveEmpRecord(EmpRecord er);
    List<Map> queryEmpRecord(int page, int limit);
    int countEmpRecord();
    List<Map> queryEmpRecordid(int Emp_InfoId);
    int queryUserAccount(String userAccount);

    List<Map> queryContractCom();
    List<Map> queryContractType();
    List<Map> queryuser(String userName);
    List<Map> queryContract(int page, int limit);
    int countContract();
    int savecontract(Contract c);
    List<Map> updatequeryContract(int ContractId);
    int updateContract(Contract c);
    List<Map> queryidcontract(int ContractId);
    List<Map> querycontractmoney(int UserId);

    int saveLeaveApply(LeaveApply la);
    int updateEmpRecord(int UserId);
    List<Map> queryLeaveApply(int page, int limit);
    int countLeaveApply();
    List<Map> queryLeaveApplyjl(int page, int limit, int UserId);
    int countLeaveApplyjl(int UserId);
    List<Map> updatequeryLeaveApply(int Leave_AppLyId);
    int updateLeaveApply(LeaveApply la);
    List<Map> queryapplyjl(int UserId);
    int updateleaveapplyleavego(String spyj, int Leave_AppLyId);
    int LeaveApplyshtg(int Leave_AppLyId, int UserId);
}
