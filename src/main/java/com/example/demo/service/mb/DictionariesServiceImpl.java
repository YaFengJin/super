package com.example.demo.service.mb;

import com.example.demo.dao.mb.DictionariesDao;
import com.example.demo.entity.Dictionaries;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DictionariesServiceImpl implements DictionariesService {
    @Autowired
    private DictionariesDao dao;
    @Override
    public int savedicti(Dictionaries dicti) {
        return dao.savedicti(dicti);
    }
}
