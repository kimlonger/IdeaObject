package com.qf.authen.service.impl;
import com.qf.authen.dao.VideoDao;
import com.qf.authen.entity.QueryVo;
import com.qf.authen.entity.Video;
import com.qf.authen.service.VideoService;
import com.qf.authen.utils.Page;
import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import java.util.List;

@Service("videoService")
public class VideoServiceImpl implements VideoService {
    @Resource(name = "videoDao")
    private VideoDao videoDao;
    @Override
    public Page<Video> queryVideoByQueryVo(QueryVo queryVo) {
        // 设置查询条件,从哪一条数据开始查
        queryVo.setStart((queryVo.getPage() - 1) * queryVo.getRows());
        // 查询数据结果集
        List<Video> list=videoDao.queryVideoByQueryVo(queryVo);
        System.out.println("结果集方法调用了");
        System.out.println(list.toString()+"结果显示");
        // 查询到的数据总条数
        Integer total=videoDao.queryCountByQueryVo(queryVo);
        // 封装返回的page对象
        Page<Video> videoPage=new Page<Video>();
        //查询数据
        videoPage.setRows(list);
        videoPage.setPage(queryVo.getPage());
        videoPage.setSize(queryVo.getRows());
        videoPage.setTotal(total);
        return videoPage;
    }

    @Override
    public void saveCount(Video video) {
        videoDao.saveCount(video);

    }
    @Override
    public void deleteVideoById(Long id) {
        videoDao.deleteVideoById(id);

    }
    @Override
    public void updateVideoById(Video video) {
        videoDao.updateVideoById(video);

    }

    @Override
    public Video queryVideoById(Long id) {
        return videoDao.queryVideoById(id);
    }

    @Override
    public Video findById(Integer id) {
        return videoDao.findById(id);
    }

    @Override
    public void addVideoNum(Integer id) {
        videoDao.addVideoNum(id);
    }
}
