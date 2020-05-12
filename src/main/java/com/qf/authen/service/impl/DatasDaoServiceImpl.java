package com.qf.authen.service.impl;

import com.qf.authen.dao.DatasDao;
import com.qf.authen.entity.Datas;
import com.qf.authen.service.DatasDaoService;
import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import java.util.List;
@Service("datasDaoService")
public class DatasDaoServiceImpl implements DatasDaoService {
    @Resource(name = "datasDao")
    private DatasDao datasDao;
    @Override
    public List<Datas> findAll(Integer type_id)
    {
        return datasDao.findAll(type_id);
    }
}
