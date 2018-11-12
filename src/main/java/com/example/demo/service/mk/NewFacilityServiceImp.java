package com.example.demo.service.mk;

import com.example.demo.entity.Facility;
import com.example.demo.dao.mk.NewFacility;
import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service
public class NewFacilityServiceImp implements NewFacilityService {
    @Resource
    private NewFacility facility;

    /**
     * 新建设备
     * @param f
     * @return
     */
    @Override
    public int isNewFacility(Facility f) {
        return facility.isNewFacility(f);
    }

    /**
     * 查询会议室类型
     * @return
     */
    @Override
    public List<Map<String, Object>> isQueryMeetType() {
        return facility.isQueryMeetType();
    }

    /**
     * 设备管理
     * @param fName
     * @return
     */
    @Override
    public List<Map<String, Object>> isQueryFacility(String fName) {
        return facility.isQueryFacility(fName);
    }

    /**
     * 删除会议设备
     * @param f
     * @return
     */
    @Override
    public int isDeleteFacility(Facility f) {
        return facility.isDeleteFacility(f);
    }

    /**
     * 更新会议设备
     * @param f
     * @return
     */
    @Override
    public int isUpdateFacility(Facility f) {
        return facility.isUpdateFacility(f);
    }
}
