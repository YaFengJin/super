package com.example.demo.dao.dyf;

import com.example.demo.entity.Contract;
import com.example.demo.entity.EmpRecord;
import com.example.demo.entity.LeaveApply;
import com.example.demo.entity.Maintain;
import org.apache.ibatis.annotations.*;

import java.util.List;
import java.util.Map;

@Mapper
public interface dyfDao {
    @Select("<script>" +
            "SELECT ta.b_id,ta.b_bankname,ta.UserName,ta.userid,GROUP_CONCAT(ta.DeptName)as DeptName FROM(select u.UserName,b.b_bankname,b.b_id,b.userid,d.DeptName,FIND_IN_SET(d.DeptId,b.deptid)as tt from bank b,dept d,usersurface u where b.UserId=u.UserId)as ta where ta.tt>0"
            +"<if test='keyword!=null'>"
            +"and b_bankname LIKE '%${keyword}%'"
            +"</if>"
            +"GROUP BY ta.b_id limit #{page},#{limit}"
            +"</script>")
    List<Map> query(@Param("page") int page, @Param("limit") int limit, @Param("keyword") String keyword);

    @Select("<script>"
            +"select count(*) from bank b,userSurFace u,Dept d where b.bstate=0 and b.userid=u.UserId and b.deptid=d.DeptId"
            +"<if test='_parameter!=null'>"
            +"and b_bankname LIKE '%${_parameter}%'"
            +"</if>"
            +"</script>")
    int queryAllCount(String keyWord);

    @Insert("<script>"
            +"insert into Bank(b_bankname,deptid,userid,bstate) values(#{b_bankname},#{deptid},#{userid},#{bstate})"
            +"</script>")
    int savebank(@Param("b_bankname") String b_bankname, @Param("deptid") String deptid, @Param("userid") String userid, @Param("bstate") int bstate);

    @Update("<script> "
            +"update Bank set bstate=1 where b_id=#{b_id}"
            + "</script>")
    int deletebank(@Param("b_id") int b_id);

    @Select("<script>"
            +"SELECT ta.b_id,ta.deptid,ta.b_bankname,ta.UserName,ta.userid,GROUP_CONCAT(ta.DeptName)as DeptName FROM(select u.UserName,b.b_bankname,b.b_id,b.userid,b.deptid,d.DeptName,FIND_IN_SET(d.DeptId,b.deptid)as tt from bank b,dept d,usersurface u where b.UserId=u.UserId)as ta where ta.tt>0 and b_id=#{b_id}"
            +"</script>")
    List<Map> updatequerybank(@Param("b_id") int b_id);

    @Update("<script> "
            +"update Bank set b_bankname=#{b_bankname},deptid=#{deptid},userid=#{userid} where b_id=#{b_id}"
            + "</script>")
    int updatebank(@Param("b_id") int b_id, @Param("b_bankname") String b_bankname, @Param("deptid") String deptid, @Param("userid") String userid);

    @Select("<script> "
            +"select * from Sort where b_id=#{b_id}"
            + "</script>")
    List<Map> querysort(@Param("b_id") int b_id);

    @Select("<script> "
            +"select * from Bank where b_id=#{b_id} and bstate=0"
            + "</script>")
    List<Map> querybankname(@Param("b_id") int b_id);

    @Insert("<script>"
            +"insert into Sort(b_id,sort_number,sort_style) values(#{b_id},#{sort_number},#{sort_style})"
            +"</script>")
    int savesort(@Param("b_id") int b_id, @Param("sort_number") String sort_number, @Param("sort_style") String sort_style);

    @Delete("<script>"
            +"delete from Sort where sort_id = #{sort_id}"
            +"</script>")
    int deletesort(@Param("sort_id") int sort_id);

    @Select("<script> "
            +"select * from Sort where sort_id=#{sort_id}"
            + "</script>")
    List<Map> querysort1(@Param("sort_id") int sort_id);

    @Update("<script> "
            +"update Sort set sort_number=#{sort_number},sort_style=#{sort_style} where sort_id=#{sort_id}"
            + "</script>")
    int updatesort(@Param("sort_id") int sort_id, @Param("sort_number") String sort_number, @Param("sort_style") String sort_style);

    @Select("<script>"
            +"SELECT ta.work_id,ta.work_name,ta.work_specification,ta.work_unit,ta.work_sprice,ta.work_supplier,ta.work_repertory,ta.work_dline,ta.work_gline,ta.UserName,ta.b_bankname,ta.sort_style,ta.wj_name,GROUP_CONCAT(ta.UserName)as name FROM(select b.b_bankname,s.sort_style,wj.wj_name,u.UserName,w.*,FIND_IN_SET(u.UserId,w.UserId)as tt from userSurFace u,WorkSurFace w,workjin wj,bank b,sort s where wj.wj_id=w.wj_id and w.b_id=b.b_id and w.sort_id=s.sort_id)as ta where ta.tt>0"
            +"<if test='keyword!=null'>"
            +"and ta.work_name LIKE '%${keyword}%'"
            +"</if>"
            +"GROUP BY ta.work_id limit #{page},#{limit}"
            +"</script>")
    List<Map> quueryworksurface(@Param("page") int page, @Param("limit") int limit, @Param("keyword") String keyword);

    @Select("<script>"
            +"select count(*) from WorkSurFace w,WorkJin ww,Bank b,Sort s where w.b_id=b.b_id and w.sort_id=s.sort_id and w.wj_id=ww.wj_id"
            +"<if test='_parameter!=null'>"
            +"and work_name LIKE '%${_parameter}%'"
            +"</if>"
            +"</script>")
    int queryAllworksurface(String keyWord);

    @Delete("<script>"
            +"delete from WorkSurFace where work_id = #{work_id}"
            +"</script>")
    int deleteworksurface(@Param("work_id") int work_id);

    @Select("<script>"
            +"select * from WorkJin"
            +"</script>")
    List<Map> queryworkjin();

    @Select("<script>"
            +"select * from Register"
            +"</script>")
    List<Map> queryregisterjin();

    @Select("<script>"
            +"select * from Bank where bstate=0"
            +"</script>")
    List<Map> querybankjin();

    @Select("<script>"
            +"select * from Sort"
            +"</script>")
    List<Map> querysortji();

    @Select("<script>"
            +"select * from Sort where b_id=#{b_id}"
            +"</script>")
    List<Map> querysortjin(@Param("b_id") int b_id);

    @Insert("<script>"
            +"insert into WorkSurFace(work_name,b_id,sort_id,UserId,work_specification,wj_id,work_unit,work_sprice,work_supplier,setid,work_repertory,work_dline,work_gline) values (#{work_name},#{b_id},#{sort_id},#{UserId},#{work_specification},#{wj_id},#{work_unit},#{work_sprice},#{work_supplier},#{setid},#{work_repertory},#{work_dline},#{work_gline})"
            +"</script>")
    int saveworksurface(@Param("work_name") String work_name, @Param("b_id") int b_id, @Param("sort_id") int sort_id, @Param("UserId") String UserId, @Param("work_specification") String work_specification, @Param("wj_id") int wj_id, @Param("work_unit") String work_unit, @Param("work_sprice") String work_sprice, @Param("work_supplier") String work_supplier, @Param("setid") String setid, @Param("work_repertory") int work_repertory, @Param("work_dline") int work_dline, @Param("work_gline") int work_gline);

    @Select("<script>"
            +"SELECT ta.UserId,ta.b_id,ta.sort_id,ta.wj_id,ta.work_id,ta.work_name,ta.work_specification,ta.work_unit,ta.work_sprice,ta.work_supplier,ta.work_repertory,ta.work_dline,ta.work_gline,ta.UserName,ta.b_bankname,ta.sort_style,ta.wj_name,GROUP_CONCAT(ta.UserName)as name FROM(select b.b_bankname,s.sort_style,wj.wj_name,u.UserName,w.*,FIND_IN_SET(u.UserId,w.UserId)as tt from userSurFace u,WorkSurFace w,workjin wj,bank b,sort s where wj.wj_id=w.wj_id and w.b_id=b.b_id and w.sort_id=s.sort_id)as ta where ta.tt>0 and work_id=#{work_id}"
            +"</script>")
    List<Map> queryworksurfaceup(@Param("work_id") int work_id);

    @Update("<script>"
            +"update WorkSurFace set work_name=#{work_name},b_id=#{b_id},sort_id=#{sort_id},UserId=#{UserId},work_specification=#{work_specification},wj_id=#{wj_id},work_unit=#{work_unit},work_sprice=#{work_sprice},work_supplier=#{work_supplier},setid=#{setid},work_repertory=#{work_repertory},work_dline=#{work_dline},work_gline=#{work_gline} where work_id=#{work_id}"
            +"</script>")
    int updateworksurface(@Param("work_id") int work_id, @Param("work_name") String work_name, @Param("b_id") int b_id, @Param("sort_id") int sort_id, @Param("UserId") String UserId, @Param("work_specification") String work_specification, @Param("wj_id") int wj_id, @Param("work_unit") String work_unit, @Param("work_sprice") String work_sprice, @Param("work_supplier") String work_supplier, @Param("setid") String setid, @Param("work_repertory") int work_repertory, @Param("work_dline") int work_dline, @Param("work_gline") int work_gline);

    @Select("<script>"
            +"select * from WorkSurFace where sort_id=#{sort_id}"
            +"</script>")
    List<Map> queryworksurfacejin(@Param("sort_id") int sort_id);

    @Select("<script>"
            +"select * from WorkSurFace where work_id=#{work_id}"
            +"</script>")
    List<Map> queryworksurface(@Param("work_id") int work_id);

    @Insert("<script>"
            +"insert into Apply(wj_id,b_id,sort_id,work_id,apply_price,apply_number,useid,UserId,apply_comment,apply_state,apply_date) values (#{wj_id},#{b_id},#{sort_id},#{work_id},#{apply_price},#{apply_number},#{useid},#{UserId},#{apply_comment},#{apply_state},#{apply_date})"
            +"</script>")
    int saveApply(@Param("wj_id") int wj_id, @Param("b_id") int b_id, @Param("sort_id") int sort_id, @Param("work_id") int work_id, @Param("apply_price") Double apply_price, @Param("apply_number") int apply_number, @Param("useid") String useid, @Param("UserId") String UserId, @Param("apply_comment") String apply_comment, @Param("apply_state") int apply_state, @Param("apply_date") String apply_date);

    @Select("<script>"
            +"SELECT ta.spyj,ta.work_name,ta.work_id,ta.apply_id,ta.apply_number,ta.apply_date,ta.UserName,ta.apply_comment,ta.apply_state,ta.b_bankname,ta.sort_style,ta.wj_name,GROUP_CONCAT(ta.UserName)as name FROM(select b.b_bankname,s.sort_style,wj.wj_name,w.work_name,u.UserName,a.*,FIND_IN_SET(u.UserId,a.useid)as tt from userSurFace u,Apply a,workjin wj,bank b,sort s,WorkSurFace w where wj.wj_id=w.wj_id and w.b_id=b.b_id and w.sort_id=s.sort_id and a.work_id=w.work_id)as ta where ta.tt>0 and ta.UserId=#{UserId} GROUP BY ta.apply_id"
            +" limit #{page},#{limit}"
            +"</script>")
    List<Map> queryApply(@Param("page") int page, @Param("limit") int limit, @Param("UserId") int UserId);

    @Select("<script>"
            +"select count(*) from Apply a,Bank b,WorkJin wj,Sort s,WorkSurFace w,userSurFace u where u.UserId=a.UserId and a.b_id=b.b_id and a.sort_id=s.sort_id and a.work_id=w.work_id and a.wj_id=wj.wj_id and a.UserId=#{UserId}"
            +"</script>")
    int countApply(@Param("UserId") int UserId);

    @Delete("<script>"
            +"delete from Apply where apply_id = #{apply_id}"
            +"</script>")
    int deleteApply(@Param("apply_id") int apply_id);

    @Select("<script>"
            +"select * from Apply a,Bank b,WorkJin wj,Sort s,WorkSurFace w,userSurFace u where u.UserId=a.UserId and a.b_id=b.b_id and a.sort_id=s.sort_id and a.work_id=w.work_id and a.wj_id=wj.wj_id and a.apply_state=0 and apply_id=#{apply_id}"
            +"</script>")
    List<Map> queryApplyup(@Param("apply_id") int apply_id);

    @Update("<script>"
            +"update Apply set wj_id=#{wj_id},b_id=#{b_id},sort_id=#{sort_id},apply_price=#{apply_price},apply_number=#{apply_number},apply_comment=#{apply_comment},apply_date=#{apply_date} where apply_id=#{apply_id}"
            +"</script>")
    int updateApply(@Param("apply_id") int apply_id, @Param("wj_id") int wj_id, @Param("b_id") int b_id, @Param("sort_id") int sort_id, @Param("apply_price") Double apply_price, @Param("apply_number") int apply_number, @Param("apply_comment") String apply_comment, @Param("apply_date") String apply_date);

    @Select("<script>"
            +"select * from Apply a,Bank b,WorkJin wj,Sort s,WorkSurFace w,userSurFace u where u.UserId=a.UserId and a.b_id=b.b_id and a.sort_id=s.sort_id and a.work_id=w.work_id and a.wj_id=wj.wj_id and a.apply_state IN (0,1,4)"
            +"</script>")
    List<Map> queryApply1();

    @Select("<script>"
            +"select * from Apply a,Bank b,WorkJin wj,Sort s,WorkSurFace w,userSurFace u where u.UserId=a.UserId and a.b_id=b.b_id and a.sort_id=s.sort_id and a.work_id=w.work_id and a.wj_id=wj.wj_id and a.apply_id=#{apply_id}"
            +"</script>")
    List<Map> queryApplyid(@Param("apply_id") int apply_id);

    @Update("<script> "
            +"update Apply set apply_state=1 where apply_id=#{apply_id}"
            + "</script>")
    int updateApplyState(@Param("apply_id") int apply_id);

    @Insert("<script> "
            +"update Apply set spyj=#{spyj} where apply_id=#{apply_id}"
            + "</script>")
    int updateApplyspyj(@Param("spyj") String spyj, @Param("apply_id") int apply_id);

    @Update("<script> "
            +"update Apply set apply_state=2 where apply_id=#{apply_id}"
            + "</script>")
    int updateApplyState1(@Param("apply_id") int apply_id);

    @Update("<script> "
            +"update Apply set apply_state=5 where apply_id=#{apply_id}"
            + "</script>")
    int updateApplyState2(@Param("apply_id") int apply_id);

    @Update("<script> "
            +"update Apply set apply_state=3 where apply_id=#{apply_id}"
            + "</script>")
    int Applyff1(@Param("apply_id") int apply_id);

    @Update("<script> "
            +"update WorkSurFace set work_repertory=work_repertory-#{apply_number} where work_id=#{work_id}"
            + "</script>")
    int Applyff2(@Param("work_id") int work_id, @Param("apply_number") int apply_number);

    @Update("<script> "
            +"update Apply set apply_state=4 where apply_id=#{apply_id}"
            + "</script>")
    int ApplyGHSQ(@Param("apply_id") int apply_id);

    @Update("<script> "
            +"update Apply set apply_state=5 where apply_id=#{apply_id}"
            + "</script>")
    int ApplyGH1(@Param("apply_id") int apply_id);

    @Update("<script> "
            +"update WorkSurFace set work_repertory=work_repertory+#{apply_number} where work_id=#{work_id}"
            + "</script>")
    int ApplyGH2(@Param("work_id") int work_id, @Param("apply_number") int apply_number);

    @Update("<script> "
            +"update Apply set apply_state=5 where apply_id=#{apply_id}"
            + "</script>")
    int ApplyGHBTG1(@Param("apply_id") int apply_id);

    @Update("<script> "
            +"update Apply set spyj=#{spyj} where apply_id=#{apply_id}"
            + "</script>")
    int ApplyGHBTG2(@Param("spyj") String spyj, @Param("apply_id") int apply_id);

    @Update("<script> "
            +"update Apply set apply_state=6 where apply_id=#{apply_id}"
            + "</script>")
    int ApplyGHTG1(@Param("apply_id") int apply_id);

    @Update("<script> "
            +"update WorkSurFace set work_repertory=work_repertory+#{apply_number} where work_id=#{work_id}"
            + "</script>")
    int ApplyGHTG2(@Param("work_id") int work_id, @Param("apply_number") int apply_number);

    @Insert("<script>"
            +"insert into Maintain(rg_id,b_id,sort_id,work_id,mt_price,mt_number,mt_comment) values(#{rgId},#{bId},#{sortId},#{workId},#{mtPrice},#{mtNumber},#{mtComment})"
            +"</script>")
    int saveMaintain1(Maintain m);

    @Update("<script> "
            +"update WorkSurFace set work_repertory=work_repertory+#{mt_number} where work_id=#{work_id}"
            + "</script>")
    int updateMaintain(@Param("work_id") int work_id, @Param("mt_number") int mt_number);

    @Insert("<script>"
            +"insert into Maintain(rg_id,b_id,sort_id,work_id,mt_price,mt_number,mt_start,mt_end,mt_comment) values(#{rgId},#{bId},#{sortId},#{workId},#{mtPrice},#{mtNumber},#{mtStart},#{mtEnd},#{mtComment})"
            +"</script>")
    int saveMaintain2(Maintain m);

    @Select("<script>"
            +"select * from Post"
            +"</script>")
    List<Map> queryPost();

    @Select("<script>"
            +"select * from emp_state"
            +"</script>")
    List<Map> queryEmpState();

    @Select("<script>"
            +"select * from emp_type"
            +"</script>")
    List<Map> queryEmpType();

    @Select("<script>"
            +"select * from dictionaries"
            +"</script>")
    List<Map> queryDictionaries();

    @Select("<script>"
            +"select d.DeptId,d.DeptName from UserSurFace u,Dept d where u.DeptId=d.DeptId and u.UserId=#{userId}"
            +"</script>")
    List<Map> queryUserSurFace(@Param("userId") int userId);

    @Insert("<script>"+
            "insert into emp_record(DeptId,PostId,Emp_StateId,Emp_TypeId,UserId,DictionariesId,Dic_DictionariesId,JobNumber,Emp_InfoName,Emp_InfoGender,Emp_InfoBrith,Emp_InfoAge,Emp_InfoAny,Emp_InfoBlood,Emp_InfoPhoto,Emp_InfoPhone,Emp_InfoEmail,Emp_InfoQQ,Emp_InfoSet,EntryTime,BecomeTime,QuiteTime,IdNumber,AccountType,AccountHome,Democrats,Native,EnglishName,Nationality,MaritalStatus,WorkTime,GmOffice,Station,PositionLeval,Position,HighestEduction,GraduateSchool,GraduateTime,HighestDegree,AmateureHobby,HealthState,Height,Weight,Bank,BankAccount,UrgentPhoto,Urgentphone,Emp_RecordRemake,Emp_RecordFile,Emp_RecResume,UserAccount) values(#{deptId},#{postId},#{empStateId},#{empTypeId},#{userId},#{dictionariesId},#{dicDictionariesId},#{jobNumber},#{empInfoName},#{empInfoGender},#{empInfoBrith},#{empInfoAge},#{empInfoAny},#{empInfoBlood},#{empInfoPhoto},#{empInfoPhone},#{empInfoEmail},#{empInfoQq},#{empInfoSet},#{entryTime},#{becomeTime},#{quiteTime},#{idNumber},#{accountType},#{accountHome},#{democrats},#{ernative},#{englishName},#{nationality},#{maritalStatus},#{workTime},#{gmOffice},#{station},#{positionLeval},#{position},#{highestEduction},#{graduateSchool},#{graduateTime},#{highestDegree},#{amateureHobby},#{healthState},#{height},#{weight},#{bank},#{bankAccount},#{urgentPhoto},#{urgentphone},#{empRecordRemake},#{empRecordFile},#{empRecResume},#{userAccount})"
            +"</script>")
    int saveEmpRecord(EmpRecord er);

    @Select("<script>"
            +"SELECT * FROM (SELECT * FROM dictionaries) AS d right join emp_record er ON er.DictionariesId = d.DictionariesId left join dictionaries t ON er.Dic_DictionariesId = t.DictionariesId LEFT JOIN  post as p on er.PostId=p.PostId LEFT JOIN emp_state es on er.Emp_StateId=es.Emp_StateId"
            +" limit #{page},#{limit}"
            +"</script>")
    List<Map> queryEmpRecord(@Param("page") int page, @Param("limit") int limit);

    @Select("<script>"
            +"SELECT count(*) FROM (SELECT * FROM dictionaries) AS d right join emp_record er ON er.DictionariesId = d.DictionariesId left join dictionaries t ON er.Dic_DictionariesId = t.DictionariesId LEFT JOIN  post as p on er.PostId=p.PostId"
            +"</script>")
    int countEmpRecord();

    @Select("<script>"
            +"SELECT * FROM (SELECT * FROM dictionaries) AS d right join emp_record er ON er.DictionariesId = d.DictionariesId left join dictionaries t ON er.Dic_DictionariesId = t.DictionariesId LEFT JOIN  post as p on er.PostId=p.PostId LEFT JOIN emp_state es on er.Emp_StateId=es.Emp_StateId left join Dept dd on er.DeptId=dd.DeptId where er.Emp_InfoId=#{Emp_InfoId}"
            +"</script>")
    List<Map> queryEmpRecordid(@Param("Emp_InfoId") int Emp_InfoId);

    @Select("<script>"
            +"select count(*) from usersurface where UserAccount=#{userAccount}"
            +"</script>")
    int queryUserAccount(@Param("userAccount") String userAccount);

    @Select("<script>"
            +"select * from contract_com"
            +"</script>")
    List<Map> queryContractCom();

    @Select("<script>"
            +"select * from contract_type"
            +"</script>")
    List<Map> queryContractType();

    @Select("<script>"
            +"select UserId from usersurface where UserName=#{userName}"
            +"</script>")
    List<Map> queryuser(@Param("userName") String userName);

    @Select("<script>"
            +"SELECT * FROM contract_com AS cc right join contract c ON c.Contract_ComId=cc.Contract_ComId LEFT JOIN contract_type ct on c.Contract_TypeId=ct.Contract_TypeId LEFT JOIN usersurface u on c.UserId=u.UserId LEFT JOIN dept d on u.DeptId=d.DeptId"
            +" limit #{page},#{limit}"
            +"</script>")
    List<Map> queryContract(@Param("page") int page, @Param("limit") int limit);

    @Select("<script>"
            +"SELECT count(*) FROM contract_com AS cc right join contract c ON c.Contract_ComId=cc.Contract_ComId LEFT JOIN contract_type ct on c.Contract_TypeId=ct.Contract_TypeId LEFT JOIN usersurface u on c.UserId=u.UserId"
            +"</script>")
    int countContract();

    @Insert("<script>"+
            "insert into contract(UserId,Contract_ComId,Contract_TypeId,ContractName,Contract_Time,ContractSignTime,ContractTakeTime,ContractTermTime,Probation,ContractTouch,ContractAdd,ContractRemark,RemindPhoto,ContractMoney) " +
            "values(#{userId},#{contractComId},#{contractTypeId},#{contractName},#{contractTime},#{contractSignTime},#{contractTakeTime},#{contractTermTime},#{probation},#{contractTouch},#{contractAdd},#{contractRemark},#{remindPhoto},#{contractMoney})"
            +"</script>")
    int savecontract(Contract c);

    @Select("<script>"
            +"SELECT ta.ContractId,\n" +
            "ta.UserId,ta.UserName,ta.Contract_ComId,ta.Contract_TypeId,\n" +
            "ta.ContractName,Contract_Time,\n" +
            "ta.ContractSignTime,ta.ContractTakeTime,ta.ContractTermTime,ta.Probation,\n" +
            "ta.ContractTouch,ta.ContractAdd,ta.ContractContent,ta.ContractRemark,\n" +
            "ta.ContractMoney,ta.RemindPhoto,Contract_ComName,ta.Contract_TypeName,GROUP_CONCAT(ta.UserName)as name \n" +
            "FROM(select cc.Contract_ComName,ct.Contract_TypeName,u.UserName,c.*,FIND_IN_SET(u.UserId,c.RemindPhoto)as tt \n" +
            "from contract c,usersurface u,contract_com cc,contract_type ct \n" +
            "where c.Contract_ComId=cc.Contract_ComId and \n" +
            "c.Contract_TypeId=ct.Contract_TypeId)as ta \n" +
            "where ta.tt>0 \n" +
            "and ContractId=#{ContractId}\n"+
            "GROUP BY ta.ContractId"
            +"</script>")
    List<Map> updatequeryContract(@Param("ContractId") int ContractId);

    @Update("<script>"
            +"update contract set UserId=#{userId},Contract_ComId=#{contractComId},Contract_TypeId=#{contractTypeId}," +
            "ContractName=#{contractName},Contract_Time=#{contractTime},ContractSignTime=#{contractSignTime}," +
            "ContractTakeTime=#{contractTakeTime},ContractTermTime=#{contractTermTime},Probation=#{probation}," +
            "ContractTouch=#{contractTouch},ContractAdd=#{contractAdd},ContractRemark=#{contractRemark}," +
            "RemindPhoto=#{remindPhoto},ContractMoney=#{contractMoney} where ContractId=#{contractId}"
            + "</script>")
    int updateContract(Contract c);

    @Select("<script>"
            +"SELECT * FROM contract_com AS cc right join contract c ON c.Contract_ComId=cc.Contract_ComId LEFT JOIN contract_type ct on c.Contract_TypeId=ct.Contract_TypeId LEFT JOIN usersurface u on c.UserId=u.UserId LEFT JOIN dept d on u.DeptId=d.DeptId Left join user_post up on u.UserId=up.UserId \n" +
            "left join post p on up.PostId=p.PostId where c.ContractId=#{ContractId}"
            +"</script>")
    List<Map> queryidcontract(@Param("ContractId") int ContractId);

    @Select("<script>"
            +"SELECT ContractMoney FROM contract where UserId=#{UserId}"
            +"</script>")
    List<Map> querycontractmoney(@Param("UserId") int UserId);

    @Insert("<script>"+
            "insert into leave_apply(UserId,LeaveDept,AppLyTime,YLeaveTime,SleaveTime,WageUpTime,LeaveGo,Leave_AppLyRemak,Leave_AppLyAccess,LeaveCause,leaveAtWage) values(#{userId},#{leaveDept},#{appLyTime},#{yLeaveTime},#{sleaveTime},#{wageUpTime},#{leaveGo},#{leaveAppLyRemak},#{leaveAppLyAccess},#{leaveCause},#{leaveAtWage})"
            +"</script>")
    int saveLeaveApply(LeaveApply la);

    @Update("<script> "
            +"update emp_record set Emp_StateId=2 where UserId=#{UserId}"
            + "</script>")
    int updateEmpRecord(@Param("UserId") int UserId);

    @Select("<script>"
            +"SELECT * FROM leave_apply AS la left join usersurface u on la.UserId=u.UserId LEFT JOIN dept d on u.DeptId=d.DeptId where la.LeaveGo='待审核'"
            +" limit #{page},#{limit}"
            +"</script>")
    List<Map> queryLeaveApply(@Param("page") int page, @Param("limit") int limit);

    @Select("<script>"
            +"SELECT count(*) FROM leave_apply AS la left join usersurface u on la.UserId=u.UserId LEFT JOIN dept d on u.DeptId=d.DeptId where la.LeaveGo='待审核'"
            +"</script>")
    int countLeaveApply();

    @Select("<script>"
            +"SELECT * FROM leave_apply AS la left join usersurface u on la.UserId=u.UserId LEFT JOIN dept d on u.DeptId=d.DeptId where la.UserId=#{UserId}"
            +" limit #{page},#{limit}"
            +"</script>")
    List<Map> queryLeaveApplyjl(@Param("page") int page, @Param("limit") int limit, @Param("UserId") int UserId);

    @Select("<script>"
            +"SELECT count(*) FROM leave_apply AS la left join usersurface u on la.UserId=u.UserId LEFT JOIN dept d on u.DeptId=d.DeptId where la.UserId=#{UserId}"
            +"</script>")
    int countLeaveApplyjl(int UserId);

    @Select("<script>"
            +"SELECT * FROM leave_apply AS la left join usersurface u on la.UserId=u.UserId LEFT JOIN dept d on u.DeptId=d.DeptId where la.Leave_AppLyId=#{Leave_AppLyId}"
            +"</script>")
    List<Map> updatequeryLeaveApply(@Param("Leave_AppLyId") int Leave_AppLyId);

    @Update("<script>"
            +"update leave_apply set UserId=#{userId},LeaveDept=#{leaveDept},AppLyTime=#{appLyTime}," +
            "YLeaveTime=#{yLeaveTime},LeaveAtWage=#{leaveAtWage},LeaveGo=#{leaveGo}," +
            "Leave_AppLyRemak=#{leaveAppLyRemak},LeaveCause=#{leaveCause} " +
            "where Leave_AppLyId=#{leaveAppLyId}"
            + "</script>")
    int updateLeaveApply(LeaveApply la);

    @Select("<script>"
            +"SELECT * FROM apply a left join bank b on a.b_id=b.b_id left join sort s on a.sort_id=s.sort_id "
            +"left join worksurface w on a.work_id=w.work_id where apply_state=3 and a.UserId=#{UserId}"
            +"</script>")
    List<Map> queryapplyjl(@Param("UserId") int UserId);

    @Update("<script> "
            +"update leave_apply set LeaveGo='审核未通过',Leave_AppLyRemak=#{spyj} where Leave_AppLyId=#{Leave_AppLyId}"
            + "</script>")
    int updateleaveapplyleavego(@Param("spyj") String spyj, @Param("Leave_AppLyId") int Leave_AppLyId);

    @Update("<script> "
            +"update leave_apply set LeaveGo='审核已通过',SleaveTime=#{time},WageUpTime=#{time} where Leave_AppLyId=#{Leave_AppLyId}"
            + "</script>")
    int updateleaveapplytg1(@Param("Leave_AppLyId") int Leave_AppLyId, @Param("time") String time);

    @Update("<script> "
            +"update emp_record set Emp_StateId=2 where UserId=#{UserId}"
            + "</script>")
    int updateleaveapplytg2(@Param("UserId") int UserId);

    @Select("<script>"
            +"SELECT count(*) FROM apply a where UserId=#{UserId} and a.apply_state=3"
            +"</script>")
    int queryApply2(@Param("UserId") int UserId);
}