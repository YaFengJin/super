package com.example.demo.service.jyf;

import com.example.demo.dao.jyf.ScreenDao;
import com.example.demo.entity.RecruitScreen;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class ScreenServiceImpl implements ScreenService {
    @Autowired
    private ScreenDao dao;
    @Override
    public List<Map<String, Object>> queryTalentsName() {
        return dao.queryTalentsName();
    }

    @Override
    public List<Map<String, Object>> queryTalents(int id) {
        return dao.queryTalents(id);
    }

    @Override
    public int saveScreen(RecruitScreen screen) {
        return dao.saveScreen(screen);
    }

    @Override
    public List<Map<String, Object>> queryScreen() {
        return dao.queryScreen();
    }

    @Override
    public int updateScreen(RecruitScreen screen) {
        return dao.updateScreen(screen);
    }

    @Override
    public int deleteScreen(int id) {
        return dao.deleteScreen(id);
    }

    @Override
    public int updateScreenStateSuccess(int id) {
        return dao.updateScreenStateSuccess(id);
    }

    @Override
    public int updateScreenStateFile(int id) {
        return dao.updateScreenStateFile(id);
    }
}
