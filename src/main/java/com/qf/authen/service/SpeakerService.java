package com.qf.authen.service;
import com.qf.authen.entity.QueryVo;
import com.qf.authen.entity.Speaker;
import com.qf.authen.utils.Page;

import java.util.List;
public interface SpeakerService {
   public Page<Speaker> querySpeakerByQueryVo(QueryVo queryVo);
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
