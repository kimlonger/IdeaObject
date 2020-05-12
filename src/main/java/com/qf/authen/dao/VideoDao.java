package com.qf.authen.dao;

import com.qf.authen.entity.QueryVo;
import com.qf.authen.entity.Video;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface VideoDao {
    //三表联查  条件查询  模糊查询  显示分页
    List<Video> queryVideoByQueryVo(QueryVo queryVo);
    //查询总记录数
    Integer queryCountByQueryVo(QueryVo queryVo);

    //添加
    public void saveCount(Video video);
    //根据id删除用户
    void deleteVideoById(Long id);
    //修改
   void  updateVideoById(Video video);
   //根据id查询
   Video  queryVideoById(Long id);
   //根据id  三表联查
    Video findById(Integer id);

    //根据id  增加播放字数
    void addVideoNum(Integer id);
    //



}
