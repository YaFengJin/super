package com.example.demo.service.mk;

import com.example.demo.entity.Facility;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface NewFacilityService {
    /**
     * 新建设备
     * @param f
     * @return
     */
    int isNewFacility(Facility f);

    /**
     * 查询会议室类型
     * @return
     */
    List<Map<String,Object>> isQueryMeetType();

    /**
     * 设备管理
     * @param fName
     * @return
     */
    List<Map<String,Object>> isQueryFacility(@Param("fName") String fName);

    /**
     * 删除会议设备
     * @param f
     * @return
     */
    int isDeleteFacility(Facility f);

    /**
     * 更新会议设备
     * @param f
     * @return
     */
    int isUpdateFacility(Facility f);

}
