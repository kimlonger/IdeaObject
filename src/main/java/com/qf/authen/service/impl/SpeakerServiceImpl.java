package com.qf.authen.service.impl;

import com.qf.authen.dao.SpeakerDao;
import com.qf.authen.entity.QueryVo;
import com.qf.authen.entity.Speaker;
import com.qf.authen.service.SpeakerService;
import com.qf.authen.utils.Page;
import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import java.util.List;
@Service("speakerService")
public class SpeakerServiceImpl implements SpeakerService {
   @Resource(name = "speakerDao")
    private SpeakerDao speakerDao;
    @Override
    public Page<Speaker> querySpeakerByQueryVo(QueryVo queryVo) {
        // 设置查询条件,从哪一条数据开始查
        queryVo.setStart((queryVo.getPage() - 1) * queryVo.getRows());
        // 查询数据结果集
        List<Speaker> list =speakerDao.querySpeakerByQueryVo(queryVo);
        // 查询到的数据总条数
        Integer total=speakerDao.queryCountByQueryVo(queryVo);
        // 封装返回的page对象
        Page<Speaker> speakerPage=new Page<Speaker>();
        //查询数据
        speakerPage.setRows(list);
        //当前页
        speakerPage.setPage(queryVo.getPage());
        //每页数据
        speakerPage.setSize(queryVo.getRows());
        //总记录数
        speakerPage.setTotal(total);
        System.out.println(speakerPage.toString());
        return  speakerPage;

    }
    @Override
    public void saveSpeaker(Speaker speaker) {
        speakerDao.saveSpeaker(speaker);
    }

    @Override
    public void deleteSpeakerById(Long id) {
        speakerDao.deleteSpeakerById(id);

    }

    @Override
    public void updateSpeakerById(Speaker speaker) {
        speakerDao.updateSpeakerById(speaker);
    }

    @Override
    public List<Speaker> speakerList() {
        return speakerDao.speakerList();
    }

    @Override
    public Speaker querySpeakerById(Long id) {
        return speakerDao.querySpeakerById(id);
    }
}
