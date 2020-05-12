package com.qf.authen.service;

import com.qf.authen.entity.Datas;

import java.util.List;

public interface DatasDaoService {
    List<Datas> findAll(Integer type_id);
}
