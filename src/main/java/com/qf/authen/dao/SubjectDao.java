package com.qf.authen.dao;

import com.qf.authen.entity.Subject;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface SubjectDao {
    //查询所有subject
    List<Subject>findAll();

    //三表联查
    Subject  queryAllInfo(Integer id);
    //查询所有


    //

}
