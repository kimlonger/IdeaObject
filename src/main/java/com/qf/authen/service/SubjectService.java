package com.qf.authen.service;

import com.qf.authen.entity.Subject;

import java.util.List;

public interface SubjectService {
    //查询所有subject

    //三表联查
    Subject  queryAllInfo(Integer id);
    //查询所有
    //
    List<Subject>findAll();
}
