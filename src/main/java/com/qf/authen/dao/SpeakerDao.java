package com.qf.authen.dao;
import com.qf.authen.entity.QueryVo;
import com.qf.authen.entity.Speaker;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface SpeakerDao {
    //分页查询
    List<Speaker> querySpeakerByQueryVo(QueryVo queryVo);
    //查询总条数
    Integer queryCountByQueryVo (QueryVo queryVo);
    //添加
    public void saveSpeaker(Speaker speaker);
    //根据id删除用户
    void deleteSpeakerById(Long id);
    //修改
    void  updateSpeakerById(Speaker speaker);
    //根据id查询
   Speaker  querySpeakerById(Long id);

    //查询所有
    List<Speaker> speakerList();



}
