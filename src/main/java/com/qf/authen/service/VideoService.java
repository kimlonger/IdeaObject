package com.qf.authen.service;

import com.qf.authen.entity.QueryVo;
import com.qf.authen.entity.Video;
import com.qf.authen.utils.Page;

public interface VideoService {
    /**
     * 分页查询
     */
    public Page<Video> queryVideoByQueryVo(QueryVo queryVo);

    //添加
    public void saveCount(Video video);
    /**
     * 根据id删除客户
     */
    void deleteVideoById(Long id);
    /**
     * 根据id编辑客户数据
     */
    void  updateVideoById(Video video);
    /**
     * 根据id添加客户
     */
    Video  queryVideoById(Long id);


    Video findById(Integer id);

    void addVideoNum(Integer id);
}
