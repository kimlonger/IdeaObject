package com.qf.authen.dao;

import com.qf.authen.entity.Datas;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface DatasDao {
    //根据type id 查询列表
    List<Datas> findAll(Integer type_id);

}
